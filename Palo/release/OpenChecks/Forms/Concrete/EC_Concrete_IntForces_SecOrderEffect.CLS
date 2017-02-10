<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="81a76008-631d-4593-9e06-af3dad5626f3">
  <CodeEditor>
    <SourceCode Collapsed="5|56|76|735" BreakPoints="">

//------------------------------------------------------------
//@FUNCTIONS

bool ValidateInput(object Input) { //Validate inputs from master to this form
    //Css
    CssID →INI400_011034= Input.Get("CssID"); //ID of Css
    ForcesID →KRS116_000004= Input.Get("ForcesID"); //ID of Forces
    
    //defualts
    c↓nom← →INI400_011614= Input.Get("c_nom"); //Concrete cover of longitudinal reinforcement 
    ϕ →INI400_011615= Input.Get("ϕ"); //Diameter of longitudinal reinforcement

    //seeting of calculation
    PrintCaption →INI400_011616= Input.Get("PrintCaption"); //True - Print caption
    AccidentalULS →INI400_011617= Input.Get("AccidentalULS"); //True - combiantion is accidental
    IndexEWN →INI400_011618= Input.Get("IndexEWN"); //Index of EWN
    Design →INI400_011619= Input.Get("Design"); //True - Reinforcement characteristics are calculated for inputted ratio of reinf.
    μ↓s← →INI400_011632= Input.Get("μ_s"); //Estimation ratio of reinforcement for calculation second order effect
    TypeDir →INI400_011620= Input.Get("TypeDir"); //Method for setting unfavourable direction
    φ↓ef← →INI400_011622= Input.Get("φ_ef"); //Effective creep ratio
    Coeff↓d← →INI400_011623= Input.Get("Coeff_d"); //Coefficient for calculation effective height of cross-section
    Coeff↓com← →INI400_011624= Input.Get("CoefNlim"); //Coefficient for determination if member is pressed
    CombiULS →INI400_011625= Input.Get("CombiULS"); //True - ULS combination
    IsoCol →INI400_011626= Input.Get("IsoCol"); //True - Isolated member
    CalcImp →INI400_011627= Input.Get("CalcImp"); //True - Calculation of imperfections
    EquivMoment →INI400_011628= Input.Get("EquivMoment"); //True - Use in calculation equivalent first order moment
    CalSecOrder →INI400_011629= Input.Get("CalSecOrder"); //True - Calculation of second order eccentricity
    CalMinEcc →INI400_011630= Input.Get("CalMinEcc"); //True - Calculation minimum value of eccentricity

    // Forces 
    M↓beg,y← →INI400_011637= Input.Get("M_beg_y"); //Bending moment around y axis at the begin of member
    M↓beg,z← →INI400_011638= Input.Get("M_beg_z"); //Bending moment around z axis at the begin of member
    M↓end,y← →INI400_011639= Input.Get("M_end_y"); //Bending moment around y axis at the end of member
    M↓end,z← →INI400_011640= Input.Get("M_end_z"); //Bending moment around z axis at the end of member
    Combikey →INI400_011641= Input.Get("Combikey"); //string with content of combination
    ZeroSign_y →INI400_011642= Input.Get("ZeroSign_y"); //Determines how to work with result when moment y is zero
    ZeroSign_z →INI400_011643= Input.Get("ZeroSign_z"); //Determines how to work with result when moment z is zero
    
    // Buckling data 
    H →INI400_011645= Input.Get("H"); //Height of the building
    m↓y← →INI400_011646= Input.Get("m_y"); //Number of vertical members around y-axis contributing to total effect
    m↓z← →INI400_011648= Input.Get("m_z"); //Number of vertical members around z-axis contributing to total effect
    L↓y← →INI400_011649= Input.Get("L_y"); //Length of the member/span of the member around y-axis
    L↓z← →INI400_011650= Input.Get("L_z"); //Length of the member/span of the member around z-axis
    β↓yy← →INI400_011651= Input.Get("β_yy"); //Coefficient of effective length around y-axis
    β↓zz← →INI400_011652= Input.Get("β_zz"); //Coefficient of effective length around z-axis
    BraceMemberY →INI400_011653= Input.Get("BraceMemberY"); //True - Braced member around y-axis
    BraceMemberZ →INI400_011654= Input.Get("BraceMemberZ"); //True - Braced member around z-axis
    
    bool Result →INI400_000020= true; 
    //Add some limits for inputs?
    return Result; 
} 

object GetOutput() { //Outputs from this form to master
    object Output →INI400_011033= new Structure(); 
    →INI400_011657Output.Add("N_Ed_out", N↓Ed,out←); //Design value of the axial force (compressive force is negative)
    →INI400_011658Output.Add("M_y_out", M↓y,out←); //First order bending moment around y-axis
    →INI400_011659Output.Add("M_z_out", M↓z,out←); //First order bending moment around z-axis
    →INI400_011660Output.Add("M_iy", M↓iy←); //Bending moment around y-axis caused by imperfection
    →INI400_011661Output.Add("M_iz", M↓iz←); //Bending moment around z-axis caused by imperfection
    →INI400_011662Output.Add("M_oEdy", M↓0Edy←); //First order bending moment around y-axis including effect of imperfection
    →INI400_011663Output.Add("M_oEdz", M↓0Edz←); //First order bending moment around z-axis including effect of imperfection
    →INI400_011664Output.Add("M_2y", M↓2y←); //Second order bending moment around y-axis
    →INI400_011665Output.Add("M_2z", M↓2z←); //Second order bending moment around z-axis
    →INI400_011666Output.Add("M_Edy", M↓Edy←); //Final value of  bending moment  around y-axis
    →INI400_011667Output.Add("M_Edz", M↓Edz←); //Final value of bending moment  around z-axis
    →KRS116_000005Output.Add("sListEWN", sListEWN); 
    return Output; 
} 

//------------------------------------------------------------
//@SCRIPT

IF(PrintCaption) { 
    →INI400_001093TEXT(sCaption); 
} 

//load external forms
object Functions1D_EWN →INI400_013602= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\Functions1D_EWN.clc"); 
object Functions1D_General →INI400_013604= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\Functions1D_General.clc"); 
object Functions1D_Geometrics →INI400_013607= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\Functions1D_Geometrics.clc"); 
object DataFromSEN →INI400_006916= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\FunctionsDataFromSEN.CLC"); 

IF(!IO.IsExternCLC) { 
    bool AccidentalULS →INI400_013598= False; 
    double ForcesID →INI400_013606= 0; 
    →INI400_013599CONCRETE.SetForcesId(ForcesID, N↓Ed←, 0, 0, 0, M↓y←, M↓z←); 
    double CssID →INI400_011703= 0; 
    ZeroSign_y →INI400_007756= -1; 
    ZeroSign_z →INI400_007757= -1; 
    
} 

→KRS116_000002BLOCK { //preparation of CSS and internal Forces
    object Forces →INI400_010996= Concrete.GetForces(ForcesID); 
    
    N↓Ed← →INI400_013705= Forces.N; 
    M↓y← →INI400_013706= Forces.My; 
    M↓z← →INI400_013707= Forces.Mz; 
    
    object ExternCreateCS →INI400_011701= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\CreateCs.clc"); 
    object CrossSection →INI400_012786= ExternCreateCS.CreateCS_ULS(CssID, Forces, AccidentalULS); 
    
    //NA coeffs
    →KRS116_000010CrossSection.SetFormCode(IO.CS.Geometry.FormCode); 
    
    double FormCode →INI400_004123= CrossSection.GetFormCode(); 
    object ShapeCss →INI400_001729= CrossSection.GetCompleteShape(); 
    object ConMat →INI400_013701= CrossSection.GetMaterialForComponent(0); 
    
    IF(!IO.IsExternCLC) { 
        IF(Design) { 
            object ReinfMat →KRS116_000006= IO.REINF; 
            NameReinf →KRS116_000009= ReinfMat.EC.Item; 
        } ELSE { 
            object ReinfMat →KRS116_000013= IO.REINF.EC; 
            NameReinf →KRS116_000014= ReinfMat.Item; 
        } 
    } ELSE { 
        IF(Design) { 
            object ReinfMat →KRS116_000003= DataFromSEN.MaterialReqReinf(CMemberType); 
        } ELSE { 
            object ReinfMat →INI400_013713= CrossSection.GetMaterialForBar(0); 
        } 
        IF(ReinfMat != null) { //KRS: because if internal forces runs for check and beam is without reinforcement
            NameReinf →KRS116_000008= ReinfMat.Name; 
        } ELSE { 
            NameReinf →INI400_007023= TR("Not defined"); 
        } 
    } 
    IF(Design) { 
        f↓yk← →INI400_006542= ReinfMat.EC.fyk; 
    } ELSE { 
        IF(ReinfMat != null) { 
            f↓yk← →KRS116_000012= ReinfMat.fyk; 
        } ELSE { 
            f↓yk← →KRS116_000017= 0; 
        } 
    } 
    NameConcrete →INI400_006322= ConMat.Name; 
    f↓ck← →INI400_006325= ConMat.fck; 
    
    object clauseObjects →INI400_010359= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\ClauseNAObjects.clc"); 
    IF(ReinfMat != null) { 
        object Clause3xxClass →INI400_010087= clauseObjects.GetClause3xxCoeffs(); 
        double α↓cc← →INI400_010088= Clause3xxClass.GetAlfa_cc(Forces, false); 
    } ELSE { 
        object Clause12xxClass →INI400_013051= clauseObjects.GetClause12xxCoeffs(); 
        double α↓cc,pl← →INI400_013052= Clause12xxClass.GetAlfa_cc_plain(); 
    } 
    object Clause2xxClass →INI400_010092= clauseObjects.GetClause2xxCoeffs(); 
    object gamaCoeffs →INI400_010090= Clause2xxClass.GetGamas(AccidentalULS); 
    double γ↓C← →INI400_011706= gamaCoeffs.γ_C; 
    double γ↓S← →INI400_011707= gamaCoeffs.γ_S; 
    
} 

IF(IO.IsDrawing) { 
    object fontsColors →INI400_012730= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\FontsAndColors.CLC"); 
    object FontsAndColors →INI400_012732= fontsColors.GetFontsAndColors(); 
} 

→INI400_000544TEXT("Set output value before calculation"); 
N↓Ed,out← →INI400_000543= N↓Ed←; 
M↓y,out← →INI400_000542= M↓y←; 
M↓z,out← →INI400_000541= M↓z←; 
M↓Edy← →INI400_000540= M↓y←; 
M↓Edz← →INI400_000539= M↓z←; 
M↓0Edy← →INI400_000579= M↓y←; 
M↓0Edz← →INI400_000578= M↓z←; 
M↓iy← →INI400_000538= 0; 
M↓iz← →INI400_000537= 0; 
M↓2y← →INI400_000536= 0; 
M↓2z← →INI400_000535= 0; 
D →INI400_006353= 0; i →INI400_006354= 0; η↓y← →INI400_006355= 0; η↓z← →INI400_006356= 0; 
double Number↓E← →INI400_001772= 0; 
double Number↓W← →INI400_001773= 0; 
double Number↓N← →INI400_001774= 0; 
object[] obEWN →INI400_001776= new object[]; 
object[] Number↓EWN← →INI400_001783= new object[]; 
K↓r.lim← →KRS116_000001= 1; 
bPrint_Img →KRS116_000024= true; 

→INI400_003031PAGEBREAK(); 

→INI400_006821BLOCK { 
    →INI400_013024BLOCK { 
        →INI400_002917BLOCK("Material") { 
            →INI400_006818BLOCK { 
                →INI400_001173TEXT("Concrete"); 
                →INI400_001172TEXT("Long reinforcement"); 
            } 
            →INI400_006819BLOCK { 
                →INI400_001693TEXT(NameConcrete); 
                →INI400_001694TEXT(NameReinf); 
            } 
        } 
        →INI400_006365BLOCK("Material characteristic") { 
            IF(ReinfMat != null) { 
                →INI400_000262TEXT(Description("f↓yd←") &amp; ":"); 
                f↓yd← →INI400_000026= f↓yk←/γ↓S←; 
                
                →INI400_006326TEXT("Modulus of elasticity:"); 
                IF(ReinfMat != null &amp;&amp; ReinfMat.Contains("Es")) { 
                    E↓s← →INI400_006545= ReinfMat.Es; 
                } ELSE { 
                    E↓s← →INI400_006546= 200000000000; 
                } 
                →INI400_006329TEXT("E↓s← = " &amp; E↓s←); 
                →INI400_000263TEXT("Strain of the reinforcement at the peak yield strength f↓yd←:"); 
                ε↓yd← →INI400_000025= f↓yd←/E↓s←; 
            } ELSE { 
                f↓yd← →KRS116_000019= 0; 
                E↓s← →KRS116_000021= 200000000000; 
                ε↓yd← →KRS116_000022= 0; 
            } 
            
            →INI400_000264TEXT(Description("f↓cd←") &amp; ":"); 
            IF(ReinfMat != null) { 
                f↓cd← →INI400_000024= α↓cc←*f↓ck←/γ↓C← @REF("(3.15)"); 
            } ELSE { 
                f↓cd← →KRS116_000018= α↓cc,pl←*f↓ck←/γ↓C← @REF("(§12.3.1(1))"); 
            } 
            →INI400_005448TEXT(Description("ε↓cu←") &amp; ":"); 
            ε↓cu← →INI400_005451= ABS(CONCRETE.StressStrain.GetLimitStrainOfConcrete(CssID, 0)); 
            →INI400_005450TEXT("ε↓cu← = " &amp; ε↓cu←); 
        } 
    } 
} 

→INI400_006760PAGEBREAK(); 

double ZeroForcesID →INI400_009520= 535; 
→INI400_009519CONCRETE.SetForcesId(ZeroForcesID, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0); 

→INI400_006366BLOCK("Concrete cross-sections characteristics:") { 
    object ConcreteCssCharacteristics →INI400_000473= CONCRETE.Characteristics(CssID, ZeroForcesID, CONCRETE.CharType.WholeCharConcrete, CONCRETE.StiffnessType.Linear); 
    
    b →INI400_013025= CONCRETE.General.GetCssHeight(CssID, 0); 
    h →INI400_013026= CONCRETE.General.GetCssHeight(CssID, 90); 
    A↓c← →INI400_001310= ConcreteCssCharacteristics.A; 
    I↓cy← →INI400_004058= ConcreteCssCharacteristics.Iy; 
    I↓cz← →INI400_004059= ConcreteCssCharacteristics.Iz; 
    t↓cy← →INI400_005420= ConcreteCssCharacteristics.CenterY; 
    t↓cz← →INI400_005421= ConcreteCssCharacteristics.CenterZ; 
    
    →INI400_006813BLOCK { 
        →INI400_000266TEXT(Description("b") &amp; ":"); 
        →INI400_000265TEXT(Description("h") &amp; ":"); 
        →INI400_000267TEXT(Description("A↓c←") &amp; ":"); 
        →INI400_000272TEXT(Description("I↓cy←") &amp; ":"); 
        →INI400_000271TEXT(Description("I↓cz←") &amp; ":"); 
    } 
    →INI400_006814BLOCK { 
        →INI400_000200TEXT("b = " &amp; b); 
        →INI400_000201TEXT("h = " &amp; h); 
        →INI400_000202TEXT("A↓c← = " &amp; A↓c←); 
        →INI400_000203TEXT("I↓cy← = " &amp; I↓cy←); 
        →INI400_000207TEXT("I↓cz← = " &amp; I↓cz←); 
    } 
    
    bool SymCssAroundY →INI400_005414= Functions1D_Geometrics.SymetricCSS(ShapeCss, 0); 
    bool SymCssAroundZ →INI400_005415= Functions1D_Geometrics.SymetricCSS(ShapeCss, 1); 
} 
→INI400_006367BLOCK("Reinforcement cross-sections characteristics") { 
    IF(!(Design)) { //calculation reinforcement characteristics for check
        string DescriptionN →INI400_006443= TR("The reinforcement characteristics are calculated for defined user reinforcement"); 
        string SolutionN →INI400_006444= TR(""); 
        string TypeN →INI400_006445= TR("Note"); 
        →INI400_006446Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
        Number↓N← →INI400_006447= Number↓N←+1; 
        →INI400_006448obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        CssReinfChar →INI400_000494= CONCRETE.Characteristics(CssID, ZeroForcesID, CONCRETE.CharType.WholeCharReinf, CONCRETE.StiffnessType.No); 
        
        →INI400_000270TEXT(Description("A↓s←") &amp; ":"); 
        A↓s← →INI400_000007= (CssReinfChar.A); 
        →INI400_000206TEXT("A↓s← = " &amp; A↓s←); 
        →INI400_000269TEXT(Description("I↓sy←") &amp; ":"); 
        I↓sy← →INI400_000496= (CssReinfChar.Iy); 
        →INI400_000205TEXT("I↓sy← = " &amp; I↓sy←); 
        →INI400_000268TEXT(Description("I↓sz←") &amp; ":"); 
        I↓sz← →INI400_000495= (CssReinfChar.Iz); 
        →INI400_000204TEXT("I↓sz← = " &amp; I↓sz←); 
        →INI400_000502TEXT("The distances from the edge to centre of reinforcement"); 
        IF(ABS(CssReinfChar.CenterZ-t↓cz←) &lt; 0.005) { 
            bool SymReinfAroundY →INI400_005422= True; 
        } ELSE { 
            bool SymReinfAroundY →INI400_005423= False; 
        } 
        IF(ABS(CssReinfChar.CenterY-t↓cy←) &lt; 0.005) { 
            bool SymReinfAroundZ →INI400_005424= True; 
        } ELSE { 
            bool SymReinfAroundZ →INI400_005425= False; 
        } 
        
        →INI400_000691CONCRETE.SetForcesId(0, N↓Ed←, 0, 0, 0, M↓y←, 0); 
        object PODY →INI400_005310= CONCRETE.POD.EquilibriumPlane(CssID, 0); 
        IF(COMPARE(PODY.X, 0, 6) == 0 &amp;&amp; COMPARE(PODY.Y, 0, 6) == 0 &amp;&amp; COMPARE(PODY.Z, 0, 6) == 0) { 
            bool EqFindY →INI400_005313= False; 
        } ELSE { 
            bool EqFindY →INI400_005312= True; 
        } 
        IF((COMPARE(M↓y←, 0, 6) == 0) || !EqFindY) { 
            a↓sz← →INI400_000591= h-Coeff↓d←*h; 
        } ELSE { 
            a↓sz← →INI400_005178= h-CONCRETE.Shear.EffectiveHeigthProjection(CssID, 0, 90, Coeff↓d←); 
        } 
        
        →INI400_000692CONCRETE.SetForcesId(1, N↓Ed←, 0, 0, 0, 0, M↓z←); 
        object PODZ →INI400_005309= CONCRETE.POD.EquilibriumPlane(CssID, 1); 
        IF(COMPARE(PODZ.X, 0, 6) == 0 &amp;&amp; COMPARE(PODZ.Y, 0, 6) == 0 &amp;&amp; COMPARE(PODZ.Z, 0, 6) == 0) { 
            bool EqFindZ →INI400_005314= False; 
        } ELSE { 
            bool EqFindZ →INI400_005315= True; 
        } 
        IF(COMPARE(M↓z←, 0, 6) == 0 || !EqFindZ) { 
            a↓sy← →INI400_000590= b-Coeff↓d←*b; 
        } ELSE { 
            a↓sy← →INI400_000500= b-CONCRETE.Shear.EffectiveHeigthProjection(CssID, 1, 0, Coeff↓d←); 
        } 
    } ELSE { //calculation reinforcement characteristics for design
        
        IF(FormCode == 2003) { // for rectengular cross-section
            string DescriptionN →INI400_006548= TR("The reinforcement characteristics are calculated for rectangle cross-section and for inputted ratio of reinforcement"); 
            string SolutionN →INI400_006549= TR(""); 
            string TypeN →INI400_006550= TR("Note"); 
            →INI400_006551Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006552= Number↓N←+1; 
            →INI400_006553obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            X2 →INI400_000506= LoadExternCLC("Concrete_IntForces_ReinfChar_Rectangle_Design.clc"); 
            X2.b →INI400_005204= b; 
            X2.h →INI400_005205= h; 
            X2.A↓c← →INI400_006858= A↓c←; 
            X2.I↓cy← →INI400_005216= I↓cy←; 
            X2.I↓cz← →INI400_005217= I↓cz←; 
            X2.μ↓s← →INI400_000505= μ↓s←; 
            X2.c↓nom← →INI400_005206= c↓nom←; 
            X2.ϕ →INI400_005207= ϕ; 
            X2.M↓y← →INI400_000504= M↓y←; 
            X2.M↓z← →INI400_000503= M↓z←; 
            IF(IO.IsDrawing) { 
                →INI400_000693X2.DRAW(False, 0); 
            } ELSE { 
                →INI400_006859X2.Calculate(False); 
            } 
            A↓s← →INI400_005209= X2.A↓s←; 
            a↓sy← →INI400_005210= X2.a↓sy←; 
            a↓sz← →INI400_005211= X2.a↓sz←; 
            I↓sy← →INI400_005212= X2.I↓sy←; 
            I↓sz← →INI400_005213= X2.I↓sz←; 
            bool SymReinfAroundY →INI400_005416= True; 
            bool SymReinfAroundZ →INI400_005417= True; 
        } 
        
        IF(FormCode == 2002) { //for circular cross-section
            string DescriptionN →INI400_006554= TR("The reinforcement characteristics are calculated for circular cross-section and for inputted ratio of reinforcement"); 
            string SolutionN →INI400_006555= TR(""); 
            string TypeN →INI400_006556= TR("Note"); 
            →INI400_006557Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006558= Number↓N←+1; 
            →INI400_006559obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            X3 →INI400_000512= LoadExternCLC("Concrete_IntForces_ReinfChar_Circle_Design.clc"); 
            D →INI400_006352= IO.CS.Geometry.D; 
            X3.D →INI400_005224= D; 
            X3.A↓c← →INI400_000530= A↓c←; 
            X3.μ↓s← →INI400_000511= μ↓s←; 
            X3.c↓nom← →INI400_005225= c↓nom←; 
            X3.ϕ →INI400_005226= ϕ; 
            IF(IO.IsDrawing) { 
                →INI400_006860X3.DRAW(False, 0); 
            } ELSE { 
                →INI400_006862X3.Calculate(False); 
            } 
            A↓s← →INI400_005218= X3.A↓s←; 
            a↓sy← →INI400_005220= X3.a↓sy←; 
            a↓sz← →INI400_005221= X3.a↓sz←; 
            I↓sy← →INI400_005222= X3.I↓sy←; 
            I↓sz← →INI400_005223= X3.I↓sz←; 
            bool SymReinfAroundY →INI400_005418= True; 
            bool SymReinfAroundZ →INI400_005419= True; 
        } 
        IF(!(FormCode == 2002 || FormCode == 2003)) { //for general cross-section
            string DescriptionN →INI400_006560= TR("The reinforcement characteristics are calculated for general cross-section and for inputted ratio of reinforcement"); 
            string SolutionN →INI400_006561= TR(""); 
            string TypeN →INI400_006562= TR("Note"); 
            →INI400_006563Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006564= Number↓N←+1; 
            →INI400_006565obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            X1 →INI400_000529= LoadExternCLC("Concrete_IntForces_ReinfChar_General_Design.clc"); 
            X1.A↓c← →INI400_000534= A↓c←; 
            X1.ShapeCss →INI400_003035= ShapeCss; 
            X1.μ↓s← →INI400_000527= μ↓s←; 
            X1.c↓nom← →INI400_005233= c↓nom←; 
            X1.ϕ →INI400_005234= ϕ; 
            →INI400_007754X1.DRAW(False, 0); 
            A↓s← →INI400_005227= X1.A↓s←; 
            a↓sy← →INI400_005229= X1.a↓sy←; 
            a↓sz← →INI400_005230= X1.a↓sz←; 
            I↓sy← →INI400_005231= X1.I↓sy←; 
            I↓sz← →INI400_005232= X1.I↓sz←; 
            bool SymReinfAroundY →INI400_006868= True; 
            bool SymReinfAroundZ →INI400_006869= True; 
        } 
    } 
} 


//determination if member is in compression
→INI400_000696PAGEBREAK(); 

→PAI127_000097TEXT("Compression member"); 
→INI400_000328TEXT("Limit axial force to consider member as compression:"); 
N↓com← →INI400_000326= -Coeff↓com←*[f↓cd←*A↓c←]; 
→PAI127_000098TEXT("Check condition:"); 
IF(N↓Ed← &gt;= N↓com←) { 
    CompressMember →INI400_004071= false; 
    →INI400_000325TEXT("N↓Ed← ≥ N↓com← = " &amp; N↓Ed← &amp; " ≥ " &amp; N↓com← &amp; " ... "); 
    →INI400_006825TEXT("not compression member"); 
    string DescriptionN →INI400_006566= TR("Type of member is determined automatically as member not in compression (beam), because N↓Ed← ≥ N↓com← (imperfections will not be taken into account.)"); 
    string SolutionN →INI400_006567= TR(""); 
    string TypeN →INI400_006568= TR("Note"); 
    →INI400_006569Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
    Number↓N← →INI400_006570= Number↓N←+1; 
    →INI400_006571obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
} ELSE { 
    CompressMember →INI400_004072= true; 
    →INI400_000331TEXT("N↓Ed← &lt; N↓com ←= " &amp; N↓Ed← &amp; " &lt; " &amp; N↓com← &amp; " ... "); 
    →INI400_006826TEXT("compression member"); 
    string DescriptionN →INI400_006572= TR("Type of member is determined automatically as member in compression (column), because N↓Ed← &lt; N↓com← (imperfections will be taken into account)."); 
    string SolutionN →INI400_006573= TR(""); 
    string TypeN →INI400_006574= TR("Note"); 
    →INI400_006575Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
    Number↓N← →INI400_006576= Number↓N←+1; 
    →INI400_006577obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
} 

→PAI127_000095PAGEBREAK(); 

//calculation for memebr in compression
IF(CompressMember) { 
    
    →PAI127_000096BLOCK { //NOT PRINT
        IF(ABS(M↓beg,y←) &gt;= ABS(M↓end,y←)) { 
            M↓01y← →INI400_000034= M↓end,y←; 
            M↓02y← →INI400_000033= M↓beg,y←; 
        } ELSE { 
            M↓01y← →INI400_000032= M↓beg,y←; 
            M↓02y← →INI400_000031= M↓end,y←; 
        } 
        IF(ABS(M↓beg,z←) &gt;= ABS(M↓end,z←)) { 
            M↓01z← →INI400_000038= M↓end,z←; 
            M↓02z← →INI400_000037= M↓beg,z←; 
        } ELSE { 
            M↓01z← →INI400_000036= M↓beg,z←; 
            M↓02z← →INI400_000035= M↓end,z←; 
        } 
        ω →INI400_000029= (A↓s←*f↓yd←)/(A↓c←*f↓cd←); 
        n →INI400_000045= (-N↓Ed←)/(A↓c←*f↓cd←); 
        string DescriptionN →INI400_006449= TR("The effective creep ratio is taken into account as creep ratio"); 
        string SolutionN →INI400_006450= TR(""); 
        string TypeN →INI400_006451= TR("Note"); 
        →INI400_006452Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
        Number↓N← →INI400_006453= Number↓N←+1; 
        →INI400_006454obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        l↓0y← →INI400_000583= β↓yy←*L↓y←; 
        l↓0z← →INI400_000582= β↓zz←*L↓z←; 
    } 
    
    →INI400_000697PAGEBREAK(); 
    
    object Slenderness →INI400_004096= LoadExternCLC("EC_Concrete_Slenderness.clc"); 
    //Clearing of input/output structure
    object InputSlenderness →INI400_011568= new Structure(); 
    object OutputSlenderness →INI400_011569= new Structure(); 
    
    //Css
    →INI400_011578InputSlenderness.Add("CssID", CssID); 
    →INI400_011581InputSlenderness.Add("PrintEWN", False); //Never print EWN table
    →INI400_013732InputSlenderness.Set("AccidentalCombi", AccidentalULS); 
    
    //General setting
    →INI400_011582InputSlenderness.Add("Design", Design); 
    →INI400_011583InputSlenderness.Add("μ_s", μ↓s←); 
    →INI400_011584InputSlenderness.Add("φ_ef", φ↓ef←); 
    →INI400_011585InputSlenderness.Add("α_cc", α↓cc←); 
    →INI400_011586InputSlenderness.Add("γ_C", γ↓C←); 
    →INI400_011587InputSlenderness.Add("γ_S", γ↓S←); 
    
    //buckling
    →INI400_011588InputSlenderness.Add("BraceMemberY", BraceMemberY); 
    →INI400_011589InputSlenderness.Add("BraceMemberZ", BraceMemberZ); 
    →INI400_013721InputSlenderness.Set("bTransverseY", False); 
    →INI400_013722InputSlenderness.Set("bTransverseZ", False); 
    →INI400_011590InputSlenderness.Add("β_yy_inp", β↓yy←); 
    →INI400_011591InputSlenderness.Add("β_zz_inp", β↓zz←); 
    →INI400_011592InputSlenderness.Add("L_y_inp", L↓y←); 
    →INI400_011593InputSlenderness.Add("L_z_inp", L↓z←); 
    
    //Load
    →INI400_013021InputSlenderness.Set("Combikey", Combikey); 
    →INI400_014433InputSlenderness.Add("ForcesID", 91); 
    →INI400_014428CONCRETE.SetForcesId(91, N↓Ed←, 0, 0, 0, M↓y←, M↓z←); 
    →INI400_011597InputSlenderness.Add("M_beg_y", M↓beg,y←); 
    →INI400_011598InputSlenderness.Add("M_beg_z", M↓beg,z←); 
    →INI400_011599InputSlenderness.Add("M_end_y", M↓end,y←); 
    →INI400_011600InputSlenderness.Add("M_end_z", M↓end,z←); 
    
    //other parameters
    →INI400_011601InputSlenderness.Add("PrintCaption", False); //Never print caption
    
    IF(IO.IsDrawing) { 
        →INI400_011603Slenderness.Draw(InputSlenderness, OutputSlenderness); 
    } ELSE { 
        →INI400_007745Slenderness.Calculate(InputSlenderness, OutputSlenderness); 
    } 
    λ↓y← →INI400_004119= OutputSlenderness.λ_y; 
    λ↓z← →INI400_004120= OutputSlenderness.λ_z; 
    λ↓limy← →INI400_004137= OutputSlenderness.λ_limy; 
    λ↓limz← →INI400_004138= OutputSlenderness.λ_limz; 
    i↓cy← →INI400_005376= OutputSlenderness.i_cy; 
    i↓cz← →INI400_005377= OutputSlenderness.i_cz; 
    
    →INI400_000700PAGEBREAK(); 
    
    →PAI127_000006TEXT("First order eccentricity"); 
    →PAI127_000017TEXT("First order moment eccentricity"); 
    →PAI127_000036TEXT("First order moment and eccentricity:"); 
    e↓0z← →INI400_000082= M↓y←/N↓Ed←; 
    IF(COMPARE(e↓0z←, 0, 6) == 0) { 
        sign↓z← →INI400_006766= ZeroSign_z; 
    } ELSE { 
        IF(e↓0z← &gt; 0) { 
            sign↓z← →INI400_006767= 1; 
        } ELSE { 
            sign↓z← →INI400_006768= -1; 
        } 
    } 
    →PAI127_000016TEXT("(" &amp; 'sign↓z←' &amp; "=" &amp; sign↓z← &amp; ")"); 
    e↓0y← →INI400_000083= M↓z←/N↓Ed←; 
    IF(COMPARE(e↓0y←, 0, 6) == 0) { 
        sign↓y← →INI400_006763= ZeroSign_y; 
    } ELSE { 
        IF(e↓0y← &gt; 0) { 
            sign↓y← →INI400_006764= 1; 
        } ELSE { 
            sign↓y← →INI400_006765= -1; 
        } 
    } 
    →PAI127_000015TEXT("(" &amp; 'sign↓y←' &amp; "=" &amp; sign↓y← &amp; ")"); 
    
    →PAI127_000025PAGEBREAK(); 
    
    IF(EquivMoment &amp;&amp; CombiULS) { 
        →PAI127_000026TEXT("Equivalent first order moment and eccentricity:"); 
        M↓0ey← →INI400_000687= sign↓z←*MAX(ABS(0.6*M↓02y←+0.4*M↓01y←), ABS(0.4*M↓02y←)) @REF("(5.32)"); 
        M↓0ez← →INI400_000688= sign↓y←*MAX(ABS(0.6*M↓02z←+0.4*M↓01z←), ABS(0.4*M↓02z←)) @REF("(5.32)"); 
        e↓0z← →INI400_000081= ABS(M↓0ey←/N↓Ed←)*sign↓z←; 
        e↓0y← →INI400_000080= ABS(M↓0ez←/N↓Ed←)*sign↓y←; 
        e↓0ez← →PAI127_000052= e↓0z←; 
        e↓0ey← →PAI127_000053= e↓0y←; 
        string DescriptionN →PAI127_000019= TR("Equivalent first order moment is considered, see §5.8.8.2(2)."); 
        string SolutionN →PAI127_000020= TR(""); 
        string TypeN →PAI127_000021= TR("Note"); 
        →PAI127_000022Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
        Number↓N← →PAI127_000023= Number↓N←+1; 
        →PAI127_000024obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
    } 
    
    →INI400_000698PAGEBREAK(); 
    
    →PAI127_000005TEXT("Geometric imperfection"); 
    IF(!CalcImp) { 
        e↓iy← →INI400_000100= 0; 
        e↓iz← →INI400_000099= 0; 
        string DescriptionN →INI400_006590= TR("The calculation of imperfection is switched off by the user (e↓i← = 0)."); 
        string SolutionN →INI400_006591= TR(""); 
        string TypeN →INI400_006592= TR("Note"); 
        →INI400_006593Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
        Number↓N← →INI400_006594= Number↓N←+1; 
        →INI400_006595obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        InfoGeoImp →INI400_000686= TR("The geometrical imperfection is switched off by the user."); 
    } ELSE { 
        →INI400_000584TEXT("Length of the member for calculation geometric imperfection:"); 
        IF(IsoCol) { 
            l →INI400_000581= MAX(L↓y←, L↓z←); 
            string DescriptionN →INI400_006597= TR("Length of the member is calculated according to formula MAX(L↓y←, L↓z←), because member is isolated."); 
            string SolutionN →INI400_006599= TR(""); 
            string TypeN →INI400_006600= TR("Note"); 
            →INI400_006601Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006602= Number↓N←+1; 
            →INI400_006603obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        } ELSE { 
            l →INI400_000580= H; 
            string DescriptionN →INI400_006604= TR("Length of the member is calculated as height of the building, because member is not isolated."); 
            string SolutionN →INI400_006606= TR(""); 
            string TypeN →INI400_006607= TR("Note"); 
            →INI400_006608Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006609= Number↓N←+1; 
            →INI400_006610obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        } 
        →INI400_000288TEXT(Description("α↓h←") &amp; ":"); 
        IF(2/SQRT(l) &gt;= 1) { 
            α↓h← →INI400_000064= 1; 
        } 
        IF((2/SQRT(l) &gt; 2/3) &amp;&amp; (2/SQRT(l)) &lt; 1) { 
            α↓h← →INI400_000063= 2/SQRT(l); 
        } 
        IF(2/SQRT(l) &lt;= 2/3) { 
            α↓h← →INI400_000062= 2/3; 
        } 
        →PAI127_000033TEXT("Reduction factor for number of vertical members:"); 
        IF(IsoCol) { 
            α↓my← →INI400_000065= 1; 
            string DescriptionN →INI400_006611= TR("Member is considered as isolated member in y-y┴ direction."); 
            string SolutionN →INI400_006613= TR(""); 
            string TypeN →INI400_006614= TR("Note"); 
            →INI400_006615Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006616= Number↓N←+1; 
            →INI400_006617obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        } ELSE { 
            α↓my← →INI400_000070= SQRT(0.5*(1+1/m↓y←)); 
        } 
        IF(IsoCol) { 
            α↓mz← →INI400_000072= 1; 
            string DescriptionN →PAI127_000034= TR("Member is considered as isolated member in z-z┴ direction."); 
            string SolutionN →INI400_006620= TR(""); 
            string TypeN →INI400_006621= TR("Note"); 
            →INI400_006622Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006623= Number↓N←+1; 
            →INI400_006624obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        } ELSE { 
            α↓mz← →INI400_000071= SQRT(0.5*(1+1/m↓z←)); 
        } 
        →INI400_005319BLOCK { //National annexes, hidden block
            →INI400_005320BLOCK { //NA.2.28 Clause 5.2 Geometric imperfections, Paragraph(5)
                object Clause5_2 →INI400_005321= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_5.2(5).CLC"); 
                Clause5_2.l →PAI127_000037= l; 
                Clause5_2.α↓h← →PAI127_000038= α↓h←; 
                →PAI127_000039Clause5_2.Calculate(false); 
                θ↓0← →INI400_005323= Clause5_2.θ↓0←; 
            } 
        } 
        →INI400_000068TEXT("Inclination to express geometric imperfection:") @REF("(§5.2(5))"); 
        θ↓iy← →INI400_000067= θ↓0←*α↓h←*α↓my← @REF("(5.1)"); 
        θ↓iz← →INI400_000069= θ↓0←*α↓h←*α↓mz← @REF("(5.1)"); 
        →INI400_000073TEXT("Eccentricity caused by geometric imperfection:") @REF("(§5.2(7))"); 
        e↓iz← →INI400_000075= sign↓z←*[(θ↓iy←*l↓0y←)/2] @REF("(5.2)"); 
        e↓iy← →INI400_000074= sign↓y←*[(θ↓iz←*l↓0z←)/2] @REF("(5.2)"); 
    } 
    
    →PAI127_000035PAGEBREAK(); 
    
    →INI400_000091TEXT("Minimum eccentricity") @REF("(§6.1(4))"); 
    IF(!CombiULS) { 
        e↓0min,z← →INI400_000212= 0; 
        e↓0min,y← →INI400_000213= 0; 
        string DescriptionN →INI400_006625= TR("Minimum eccentricity is not taken into account for SLS combination, see §5.2(3)."); 
        string SolutionN →INI400_006627= TR(""); 
        string TypeN →INI400_006628= TR("Note"); 
        →INI400_006629Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
        Number↓N← →INI400_006630= Number↓N←+1; 
        →INI400_006631obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
    } ELSE { 
        IF(CalMinEcc) { 
            e↓0min,z← →INI400_000092= sign↓z←*MAX(h/30, 0.02); 
            e↓0min,y← →INI400_000089= sign↓y←*MAX(b/30, 0.02); 
            
        } ELSE { 
            e↓0min,z← →INI400_006793= 0; 
            e↓0min,y← →INI400_006792= 0; 
            string DescriptionN →INI400_006794= TR("Minimum eccentricity is switched off by the user."); 
            string SolutionN →INI400_006796= TR(""); 
            string TypeN →INI400_006797= TR("Note"); 
            →INI400_006798Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006799= Number↓N←+1; 
            →INI400_006800obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        } 
    } 
    
    →INI400_000699PAGEBREAK(); 
    
    →INI400_000102TEXT("First order eccentricity including imperfection"); 
    e↓0Edz← →INI400_000098= sign↓z←*MAX(ABS(e↓0z←+e↓iz←), ABS(e↓0min,z←)); 
    e↓0Edy← →INI400_000095= sign↓y←*MAX(ABS(e↓0y←+e↓iy←), ABS(e↓0min,y←)); 
    
    →INI400_000701PAGEBREAK(); 
    
    // CALCULATION SECOND ORDER EFFECT
    →PAI127_000003TEXT("Second order eccentricity"); 
    IF(!CombiULS) { 
        e↓2y← →INI400_000210= 0; 
        e↓2z← →INI400_000209= 0; 
        InfoSecEffect →INI400_000664= TR("The second order eccentricity is not calculated because of SLS combination."); 
        string DescriptionN →INI400_006632= TR("Second order effect is not calculated for SLS combination."); 
        string SolutionN →INI400_006634= TR(""); 
        string TypeN →INI400_006635= TR("Note"); 
        →INI400_006636Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
        Number↓N← →INI400_006637= Number↓N←+1; 
        →INI400_006638obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
    } 
    IF(!CalSecOrder &amp;&amp; CombiULS) { 
        e↓2y← →INI400_000140= 0; 
        e↓2z← →INI400_000139= 0; 
        string DescriptionN →INI400_006639= TR("The calculation of second order eccentricity is switched off by the user (e↓2←=0)."); 
        string SolutionN →INI400_006641= TR(""); 
        string TypeN →INI400_006642= TR("Note"); 
        →INI400_006643Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
        Number↓N← →INI400_006644= Number↓N←+1; 
        →INI400_006645obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        InfoSecEffect →INI400_000665= TR("The second order eccentricity is switched off by the user."); 
    } 
    IF(CalSecOrder &amp;&amp; CombiULS) { 
        →PAI127_000027TEXT("Curvature"); 
        IF(SymCssAroundY &amp;&amp; SymCssAroundZ &amp;&amp; SymReinfAroundY &amp;&amp; SymReinfAroundZ) { 
            SymReinfCss →INI400_005436= True; 
            string DescriptionN →INI400_006646= TR("Curvature will be estimated based on assumption of symmetrical cross-section and reinforcement."); 
            string SolutionN →INI400_006647= TR(""); 
            string TypeN →INI400_006648= TR("Note"); 
            →INI400_006649Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006650= Number↓N←+1; 
            →INI400_006651obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        } ELSE { 
            SymReinfCss →INI400_005437= False; 
            string DescriptionN →INI400_006652= TR("Curvature will be estimated based on assumption of non-symmetrical cross-section and reinforcement."); 
            string SolutionN →INI400_006653= TR(""); 
            string TypeN →INI400_006654= TR("Note"); 
            →INI400_006655Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006656= Number↓N←+1; 
            →INI400_006657obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        } 
        IF(SymReinfCss) { 
            →INI400_000299TEXT("Radius of gyration of reinforcement:"); 
            IF(A↓s← &gt; 0) { 
                i↓sy← →INI400_000231= SQRT(I↓sz←/A↓s←); 
                i↓sz← →INI400_000229= SQRT(I↓sy←/A↓s←); 
            } ELSE { 
                i↓sy← →INI400_000230= 0; 
                i↓sz← →INI400_000228= 0; 
            } 
            →INI400_000195TEXT("Effective depth of cross-section:") @REF("(§5.8.8.3(2))"); 
            IF(ABS(i↓sz←-(0.5*h-a↓sz←)) &lt;= 0.001 || i↓sy← == 0) { 
                d↓y← →INI400_000255= b-a↓sy←; 
            } ELSE { 
                d↓y← →INI400_000254= 0.5*b+i↓sy← @REF("(5.35)"); 
            } 
            IF(ABS(i↓sz←-(0.5*h-a↓sz←)) &gt; 0.001) { 
                string DescriptionN →INI400_006658= TR("Reinforcement is distributed also parallel to the plane of bending y-y┴."); 
                string SolutionN →INI400_006659= TR(""); 
                string TypeN →INI400_006660= TR("Note"); 
                →INI400_006661Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                Number↓N← →INI400_006662= Number↓N←+1; 
                →INI400_006663obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            } ELSE { 
                string DescriptionN →INI400_006664= TR("Reinforcement is distributed perpendicular to the plane of bending y-y┴."); 
                string SolutionN →INI400_006665= TR(""); 
                string TypeN →INI400_006666= TR("Note"); 
                →INI400_006667Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                Number↓N← →INI400_006668= Number↓N←+1; 
                →INI400_006669obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            } 
            IF(ABS(i↓sy←-(0.5*b-a↓sy←)) &lt;= 0.001 || i↓sz← == 0) { 
                d↓z← →INI400_000249= h-a↓sz←; 
            } ELSE { 
                d↓z← →INI400_000248= 0.5*h+i↓sz← @REF("(5.35)"); 
            } 
            IF(ABS(i↓sy←-(0.5*b-a↓sy←)) &gt; 0.001) { 
                string DescriptionN →PAI127_000054= TR("Reinforcement is distributed also parallel to the plane of bending z-z┴."); 
                string SolutionN →PAI127_000055= TR(""); 
                string TypeN →PAI127_000056= TR("Note"); 
                →PAI127_000057Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                Number↓N← →PAI127_000058= Number↓N←+1; 
                →PAI127_000059obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            } ELSE { 
                string DescriptionN →PAI127_000060= TR("Reinforcement is distributed perpendicular to the plane of bending z-z┴."); 
                string SolutionN →PAI127_000061= TR(""); 
                string TypeN →PAI127_000062= TR("Note"); 
                →PAI127_000063Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                Number↓N← →PAI127_000064= Number↓N←+1; 
                →PAI127_000065obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            } 
        } ELSE { 
            →INI400_005443TEXT("Effective depth of cross-section:"); 
            d↓y← →INI400_005440= b-a↓sy←; 
            d↓z← →INI400_005442= h-a↓sz←; 
        } 
        →INI400_006841PAGEBREAK(); 
        IF(SymReinfCss) { 
            →INI400_000294TEXT("Balanced axial force:"); 
            n↓bal← →INI400_000112= 0.4; 
            →PAI127_000028TEXT("(relative)"); 
            n↓u← →INI400_000111= 1+ω; 
            →PAI127_000029TEXT("(ultimate)"); 
            →INI400_000296TEXT("Correction factor depending on axial load (K↓r←):") @REF("(§5.8.8.3(3))"); 
            IF((n↓u←-n) &lt; 0) { 
                K↓r← →INI400_004140= MIN((n↓u←-n)/(n↓u←-n↓bal←), 1) @REF("(5.36)"); 
                string DescriptionN →INI400_006670= TR(" K↓r← &lt; 0 , because  n↓u← - n &lt;0,therefore value K↓r← =" &amp; K↓r.lim← &amp; " will be used. "); 
                string SolutionN →INI400_006671= TR("It is necessary to increase amount of reinforcement or to increase dimensions of cross-section or to increase quality of the used materials or used different method for calculation second order eccentricity"); 
                string TypeN →INI400_006672= TR("Error"); 
                →INI400_006673Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                Number↓E← →INI400_006674= Number↓E←+1; 
                →INI400_006675obEWN.Add(new Structure("Index", "E" &amp; IndexEWN &amp; "/" &amp; Number↓E←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                K↓r← →INI400_000622= K↓r.lim←; 
            } ELSE { 
                K↓r← →INI400_000295= MIN((n↓u←-n)/(n↓u←-n↓bal←), 1) @REF("(5.36)"); 
            } 
        } ELSE { 
            →INI400_005445TEXT("Correction factor depending on axial load:"); 
            K↓r← →INI400_005444= 1; 
        } 
        →INI400_000297TEXT("Factor taking account of creep (K↓φ←):") @REF("(§5.8.8.3(4))"); 
        β↓y← →INI400_000113= 0.35+CUnit(f↓ck←, "MPa")/200-λ↓y←/150; 
        β↓z← →INI400_000114= 0.35+CUnit(f↓ck←, "MPa")/200-λ↓z←/150; 
        K↓φy← →INI400_000116= MAX(1+β↓y←*φ↓ef←, 1) @REF("(5.37)"); 
        K↓φz← →INI400_000117= MAX(1+β↓z←*φ↓ef←, 1) @REF("(5.37)"); 
        →INI400_006845PAGEBREAK(); 
        →INI400_000122TEXT("Basic curvature (χ↓0←=1/r↓0←):"); 
        IF(SymReinfCss &amp;&amp; COMPARE(ε↓yd←, 0, 6) != 0) { 
            χ↓0y← →INI400_000118= ε↓yd←/(0.45*d↓z←); 
            χ↓0z← →INI400_000119= ε↓yd←/(0.45*d↓y←); 
        } ELSE { 
            IF(COMPARE(ε↓yd←, 0, 6) == 0) { 
                χ↓0y← →INI400_007746= ε↓cu←/(0.45*d↓z←); 
                χ↓0z← →INI400_007747= ε↓cu←/(0.45*d↓y←); 
                string DescriptionN →INI400_007748= TR("Basic curvature is calculated from strain of concrete because reinforcement is not defined."); 
                string SolutionN →INI400_007749= TR(""); 
                string TypeN →INI400_007750= TR("Note"); 
                →INI400_007751Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                Number↓N← →INI400_007752= Number↓N←+1; 
                →INI400_007753obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            } 
            ELSE { 
                χ↓0y← →INI400_005446= (ε↓yd←+ε↓cu←)/d↓z←; 
                χ↓0z← →INI400_005447= (ε↓yd←+ε↓cu←)/d↓y←; 
            } 
            
        } 
        →INI400_000300TEXT("Curvature with influence of creep and the applied axial load (χ=1/r):") @REF("(§5.8.8.3(1))"); 
        χ↓y← →INI400_000120= K↓r←*K↓φy←*χ↓0y← @REF("(5.34)"); 
        χ↓z← →INI400_000124= K↓r←*K↓φz←*χ↓0z← @REF("(5.34)"); 
        
        
        →INI400_006844PAGEBREAK(); 
        
        →INI400_000301TEXT("Factor depending on the curvature distribution"); 
        IF((COMPARE(M↓01y←, M↓Edy←, 6) == 0 &amp;&amp; COMPARE(M↓02y←, M↓Edy←, 6) == 0) || EquivMoment) { 
            c↓y← →INI400_000126= 8; 
            string DescriptionN →INI400_006682= TR("The first order moment M↓y ←is constant (M↓01y←=M↓y←=M↓02y←) or equivalent first bending moment M↓0ey← is used."); 
            string SolutionN →INI400_006683= TR(""); 
            string TypeN →INI400_006684= TR("Note"); 
            →INI400_006685Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006686= Number↓N←+1; 
            →INI400_006687obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        } ELSE { 
            c↓y← →INI400_000125= 10; 
        } 
        IF((COMPARE(M↓01z←, M↓Edz←, 6) == 0 &amp;&amp; COMPARE(M↓02z←, M↓Edz←, 6) == 0) || EquivMoment) { 
            c↓z← →INI400_000128= 8; 
            string DescriptionN →INI400_006688= TR("The first order moment M↓z← is constant (M↓01z←=M↓z←=M↓02z←) or equivalent first bending moment M↓0ez← is used."); 
            string SolutionN →INI400_006689= TR(""); 
            string TypeN →INI400_006690= TR("Note"); 
            →INI400_006691Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006692= Number↓N←+1; 
            →INI400_006693obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        } ELSE { 
            c↓z← →INI400_000127= 10; 
        } 
        →PAI127_000030TEXT("Second order eccentricity including simplified criteria"); 
        IF(λ↓y← &lt;= λ↓limy←) { 
            →INI400_000138TEXT("λ↓y← ≤ λ↓limy← = " &amp; λ↓y← &amp; " ≤ " &amp; λ↓limy←); 
            →INI400_006829TEXT("... 1↑st← order effect") @REF("(§5.8.3.1(1))"); 
            e↓2z← →INI400_000136= 0; 
        } ELSE { 
            →PAI127_000043TEXT("λ↓y← &gt; λ↓limy← = " &amp; λ↓y← &amp; " &gt; " &amp; λ↓limy←); 
            →PAI127_000032TEXT("... 2↑nd← order effect") @REF("(§5.8.3.1(1))"); 
            e↓2z← →INI400_000135= sign↓z←*[χ↓y←*l↓0y←↑2←/c↓y←] @REF("(5.33)"); 
        } 
        IF(λ↓z← &lt;= λ↓limz←) { 
            →PAI127_000044TEXT("λ↓z← ≤ λ↓limz← = " &amp; λ↓z← &amp; " ≤ " &amp; λ↓limz←); 
            →PAI127_000045TEXT("... 1↑st← order effect") @REF("(§5.8.3.1(1))"); 
            e↓2y← →INI400_000131= 0; 
        } ELSE { 
            →PAI127_000046TEXT("λ↓z← &gt; λ↓limz← = " &amp; λ↓z← &amp; " &gt; " &amp; λ↓limz←); 
            →PAI127_000047TEXT("... 2↑nd← order effect") @REF("(§5.8.3.1(1))"); 
            e↓2y← →INI400_000134= sign↓y←*[χ↓z←*l↓0z←↑2←/c↓z←] @REF("(5.33)"); 
        } 
    } 
    
    →INI400_000702PAGEBREAK(); 
    →PAI127_000040TEXT("Biaxial/uniaxial bending conditions") @REF("(§5.8.9)"); 
    
    →INI400_000304TEXT("Dimension of equivalent rectangular cross-section:"); 
    b↓eq← →INI400_000144= i↓cz←*SQRT(12); 
    h↓eq← →INI400_000145= i↓cy←*SQRT(12); 
    
    SWITCH(TypeDir) { 
        DEFAULT :  { 
            IF(ABS(e↓0Edy←+e↓2y←) &gt; 0 &amp;&amp; ABS(e↓0Edz←+e↓2z←) &gt; 0) { 
                →INI400_000305TEXT("Slenderness ratio condition:"); 
                Ratio↓λyz← →INI400_000234= λ↓y←/λ↓z←; 
                Ratio↓λzy← →INI400_000236= λ↓z←/λ↓y←; 
                IF(Ratio↓λyz← &lt;= 2) { 
                    →INI400_000235TEXT("λ↓y←/λ↓z← = " &amp; λ↓y←/λ↓z← &amp; " = " &amp; Ratio↓λyz← &amp; " ≤ 2 =&gt;"); 
                    →INI400_006847TEXT("condition fulfilled") @REF("(5.38a)"); 
                } ELSE { 
                    →INI400_004152TEXT("λ↓y←/λ↓z← = " &amp; λ↓y←/λ↓z← &amp; " = " &amp; Ratio↓λyz← &amp; " &gt; 2 =&gt;"); 
                    →INI400_006848TEXT("condition not fulfilled") @REF("(5.38a)"); 
                } 
                IF(Ratio↓λzy← &lt;= 2) { 
                    →INI400_004154TEXT("λ↓z←/λ↓y← = " &amp; λ↓z←/λ↓y← &amp; " = " &amp; Ratio↓λzy← &amp; " ≤ 2 =&gt;"); 
                    →INI400_006849TEXT("condition fulfilled") @REF("(5.38a)"); 
                } ELSE { 
                    →INI400_004156TEXT("λ↓z←/λ↓y← = " &amp; λ↓z←/λ↓y← &amp; " = " &amp; Ratio↓λzy← &amp; " &gt; 2 =&gt;"); 
                    →INI400_006850TEXT("condition not fulfilled") @REF("(5.38a)"); 
                } 
                
                →PAI127_000041PAGEBREAK(); 
                
                →INI400_000306TEXT("Relative eccentricity condition:"); 
                Ratio↓eyz← →INI400_000238= [ABS(e↓0Edy←+e↓2y←)/b↓eq←]/[ABS(e↓0Edz←+e↓2z←)/h↓eq←]; 
                Ratio↓ezy← →INI400_000239= [ABS(e↓0Edz←+e↓2z←)/h↓eq←]/[ABS(e↓0Edy←+e↓2y←)/b↓eq←]; 
                →INI400_006855BLOCK { 
                    IF(Ratio↓eyz← &lt;= 0.2) { 
                        →PAI127_000042TEXT('[ABS(e↓0Edy←+e↓2y←)/b↓eq←]/[ABS(e↓0Edz←+e↓2z←)/h↓eq←]' &amp; " = " &amp; [ABS(e↓0Edy←+e↓2y←)/b↓eq←]/[ABS(e↓0Edz←+e↓2z←)/h↓eq←] &amp; " = " &amp; Ratio↓eyz← &amp; " &gt; 0.2 =&gt;"); 
                        →INI400_006851TEXT("condition fulfilled") @REF("(5.38b)"); 
                    } ELSE { 
                        →INI400_004158TEXT('[ABS(e↓0Edy←+e↓2y←)/b↓eq←]/[ABS(e↓0Edz←+e↓2z←)/h↓eq←]' &amp; " = " &amp; [ABS(e↓0Edy←+e↓2y←)/b↓eq←]/[ABS(e↓0Edz←+e↓2z←)/h↓eq←] &amp; " = " &amp; Ratio↓eyz← &amp; " &gt; 0.2 =&gt;"); 
                        →INI400_006852TEXT("condition not fulfilled") @REF("(5.38b)"); 
                    } 
                } 
                →INI400_006856BLOCK { 
                    IF(Ratio↓ezy← &lt;= 0.2) { 
                        →INI400_000242TEXT('[ABS(e↓0Edz←+e↓2z←)/h↓eq←]/[ABS(e↓0Edy←+e↓2y←)/b↓eq←]' &amp; " = " &amp; [ABS(e↓0Edz←+e↓2z←)/h↓eq←]/[ABS(e↓0Edy←+e↓2y←)/b↓eq←] &amp; " = " &amp; Ratio↓ezy← &amp; " ≤ 0.2 =&gt;"); 
                        →INI400_006853TEXT("condition fulfilled") @REF("(5.38b)"); 
                    } ELSE { 
                        →INI400_004159TEXT('[ABS(e↓0Edz←+e↓2z←)/h↓eq←]/[ABS(e↓0Edy←+e↓2y←)/b↓eq←]' &amp; " = " &amp; [ABS(e↓0Edz←+e↓2z←)/h↓eq←]/[ABS(e↓0Edy←+e↓2y←)/b↓eq←] &amp; " = " &amp; Ratio↓ezy← &amp; " &gt; 0.2 =&gt;"); 
                        →INI400_006854TEXT("condition not fulfilled") @REF("(5.38b)"); 
                    } 
                } 
                
                IF((Ratio↓λyz← &lt;= 2 &amp;&amp; Ratio↓λzy← &lt;= 2) &amp;&amp; (Ratio↓eyz← &lt;= 0.2 || Ratio↓ezy← &lt;= 0.2)) { 
                    Cond↓biaxial← →INI400_000605= 0; 
                    string DescriptionN →INI400_006694= TR("Uniaxial bending - imperfections should be taken into account only in the most unfavourable direction."); 
                    string SolutionN →INI400_006695= TR(""); 
                    string TypeN →INI400_006696= TR("Note"); 
                    →INI400_006697Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_006698= Number↓N←+1; 
                    →INI400_006699obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } ELSE { 
                    Cond↓biaxial← →INI400_000604= 1; 
                    string DescriptionN →INI400_006700= TR("Biaxial bending - imperfections should be taken into account in both directions."); 
                    string SolutionN →INI400_006701= TR(""); 
                    string TypeN →INI400_006702= TR("Note"); 
                    →INI400_006703Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_006704= Number↓N←+1; 
                    →INI400_006705obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
            } ELSE { 
                Cond↓biaxial← →INI400_000606= 0; 
                string DescriptionN →INI400_006706= TR("Conditions cannot be calculated (biaxial bending is taken as default). Imperfections should be taken into account in both directions."); 
                string SolutionN →INI400_006707= TR(""); 
                string TypeN →INI400_006708= TR("Note"); 
                →INI400_006709Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                Number↓N← →INI400_006710= Number↓N←+1; 
                →INI400_006711obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            } 
            
        } 
    } 
    
    →INI400_006762PAGEBREAK(); 
    
    /// determination unfavourable direction
    SWITCH(TypeDir) { 
        CASE 0 :  { 
            IF(Cond↓biaxial← == 0) { 
                →PAI127_000066TEXT("Unfavourable direction"); 
                η↓y← →INI400_000147= ABS(0.001*N↓Ed←*e↓0Edz←*λ↓y←/h↓eq←); 
                η↓z← →INI400_000146= ABS(0.001*N↓Ed←*e↓0Edy←*λ↓z←/b↓eq←); 
                IF(ABS(η↓y←-η↓z←) &lt; 1) { 
                    string DescriptionN →INI400_006712= TR("Biaxial bending is considered - most unfavourable direction cannot be recognized (η↓y←=η↓z←). Imperfections will be taken into account in both directions."); 
                    string SolutionN →INI400_006713= TR(""); 
                    string TypeN →INI400_006714= TR("Note"); 
                    →INI400_006715Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_006716= Number↓N←+1; 
                    →INI400_006717obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                    Coef↓y← →INI400_000625= 1; 
                    Coef↓z← →INI400_000626= 1; 
                } ELSE { 
                    IF(η↓y← &gt; η↓z←) { 
                        string DescriptionN →INI400_006718= TR("Most unfavourable direction is determimed as y-y┴ (η↓y←&gt;η↓z←). Imperfections will be taken into account only in this direction."); 
                        string SolutionN →INI400_006719= TR(""); 
                        string TypeN →INI400_006720= TR("Note"); 
                        →INI400_006721Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                        Number↓N← →INI400_006722= Number↓N←+1; 
                        →INI400_006723obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                        Coef↓y← →INI400_000628= 1; 
                        Coef↓z← →INI400_000629= 0; 
                    } 
                    IF(η↓y← &lt; η↓z←) { 
                        string DescriptionN →INI400_006724= TR("Most unfavourable direction is determined as z-z┴ (η↓z&gt;←η↓y←). Imperfections will be taken into account only in this direction."); 
                        string SolutionN →INI400_006725= TR(""); 
                        string TypeN →INI400_006726= TR("Note"); 
                        →INI400_006727Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                        Number↓N← →INI400_006728= Number↓N←+1; 
                        →INI400_006729obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                        Coef↓y← →INI400_000631= 0; 
                        Coef↓z← →INI400_000632= 1; 
                    } 
                } 
            } ELSE { 
                Coef↓y← →INI400_000244= 1; 
                Coef↓z← →INI400_000243= 1; 
            } 
        } 
        CASE 1 :  { 
            →PAI127_000067TEXT("Unfavourable direction"); 
            η↓y← →INI400_005328= ABS(0.001*N↓Ed←*e↓0Edz←*λ↓y←/h↓eq←); 
            η↓z← →INI400_005329= ABS(0.001*N↓Ed←*e↓0Edy←*λ↓z←/b↓eq←); 
            IF(ABS(η↓y←-η↓z←) &lt; 1) { 
                IF(Cond↓biaxial← == 1) { 
                    string DescriptionN →INI400_006736= TR("Uniaxial bending is set by user, but biaxial bending conditions are fulfilled! Default direction y-y┴ is determined, because most unfavourable direction cannot be recognized (η↓y←=η↓z←)."); 
                    string SolutionN →PAI127_000089= TR(""); 
                    string TypeN →INI400_006738= TR("Warning"); 
                    →INI400_006739Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_006740= Number↓N←+1; 
                    →INI400_006741obEWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } ELSE { 
                    string DescriptionN →PAI127_000070= TR("Uniaxial bending is set by user - default direction y-y┴ is considered, because most unfavourable direction cannot be recognized (η↓y←=η↓z←)."); 
                    string SolutionN →PAI127_000071= TR(""); 
                    string TypeN →PAI127_000072= TR("Note"); 
                    →PAI127_000073Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →PAI127_000074= Number↓N←+1; 
                    →PAI127_000075obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
                Coef↓y← →INI400_005335= 1; 
                Coef↓z← →INI400_005336= 0; 
            } ELSE { 
                IF(η↓y← &gt; η↓z←) { 
                    IF(Cond↓biaxial← == 1) { 
                        string DescriptionN →INI400_006742= TR("Uniaxial bending is set by user, but biaxial bending conditions are fulfilled! Most unfavourable direction is determined as y-y┴ (η↓y&gt;←η↓z←). Imperfections will be taken into account only in this direction."); 
                        string SolutionN →INI400_006743= TR(""); 
                        string TypeN →INI400_006744= TR("Warning"); 
                        →INI400_006745Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                        Number↓N← →INI400_006746= Number↓N←+1; 
                        →INI400_006747obEWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                    } 
                    ELSE { 
                        string DescriptionN →PAI127_000076= TR("Uniaxial bending is set by user - most unfavourable direction is determined as y-y┴ (η↓y&gt;←η↓z←). Imperfections will be taken into account only in this direction."); 
                        string SolutionN →PAI127_000077= TR(""); 
                        string TypeN →PAI127_000078= TR("Warning"); 
                        →PAI127_000079Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                        Number↓N← →PAI127_000080= Number↓N←+1; 
                        →PAI127_000081obEWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                    } 
                    Coef↓y← →INI400_005340= 1; 
                    Coef↓z← →INI400_005341= 0; 
                } 
                IF(η↓y← &lt; η↓z←) { 
                    IF(Cond↓biaxial← == 1) { 
                        string DescriptionN →PAI127_000069= TR("Uniaxial bending is set by user, but biaxial bending conditions are fulfilled! Most unfavourable direction is determined as z-z┴ (η↓z&gt;←η↓y←). Imperfections will be taken into account only in this direction."); 
                        string SolutionN →PAI127_000088= TR(""); 
                        string TypeN →INI400_006750= TR("Warning"); 
                        →INI400_006751Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                        Number↓N← →INI400_006752= Number↓N←+1; 
                        →INI400_006753obEWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                    } 
                    ELSE { 
                        string DescriptionN →PAI127_000082= TR("Uniaxial bending is set by user - most unfavourable direction is determined as z-z┴ (η↓z&gt;←η↓y←). Imperfections will be taken into account only in this direction."); 
                        string SolutionN →PAI127_000083= TR(""); 
                        string TypeN →PAI127_000084= TR("Note"); 
                        →PAI127_000085Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                        Number↓N← →PAI127_000086= Number↓N←+1; 
                        →PAI127_000087obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                    } 
                    Coef↓y← →INI400_005345= 0; 
                    Coef↓z← →INI400_005346= 1; 
                } 
            } 
        } 
        CASE 2 :  { 
            string DescriptionN →PAI127_000068= TR("Biaxial bending is set by user. Imperfections will be taken into account in both directions."); 
            string SolutionN →INI400_006755= TR(""); 
            string TypeN →INI400_006756= TR("Note"); 
            →INI400_006757Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006758= Number↓N←+1; 
            →INI400_006759obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            Coef↓y← →INI400_005364= 1; 
            Coef↓z← →INI400_005365= 1; 
        } 
    } 
    
    →INI400_006358PAGEBREAK(); 
    
    →PAI127_000091BLOCK { 
        IF(CalcImp) { 
            e↓iy← →INI400_000154= Coef↓z←*e↓iy←; 
            e↓iz← →INI400_000555= Coef↓y←*e↓iz←; 
            M↓iy← →INI400_000179= N↓Ed←*e↓iz←; 
            M↓iz← →INI400_000181= N↓Ed←*e↓iy←; 
        } 
        e↓0Edy← →INI400_000189= sign↓y←*MAX(ABS(e↓0y←+e↓iy←), ABS(e↓0min,y←)); 
        e↓0Edz← →INI400_000515= sign↓z←*MAX(ABS(e↓0z←+e↓iz←), ABS(e↓0min,z←)); 
        M↓0Edy← →INI400_000182= N↓Ed←*e↓0Edz←; 
        M↓0Edz← →INI400_000183= N↓Ed←*e↓0Edy←; 
        IF((CalSecOrder) &amp;&amp; (CombiULS)) { 
            e↓2y← →INI400_000160= Coef↓z←*e↓2y←; 
            e↓2z← →INI400_000159= Coef↓y←*e↓2z←; 
            M↓2y← →INI400_000184= N↓Ed←*e↓2z←; 
            M↓2z← →INI400_000185= N↓Ed←*e↓2y←; 
        } 
        e↓dy← →INI400_000162= e↓0Edy←+e↓2y←; 
        e↓dz← →INI400_000164= e↓0Edz←+e↓2z←; 
        IF(ABS(N↓Ed←*e↓dz←) &gt;= ABS(M↓y←)) { 
            M↓Edy← →INI400_000187= N↓Ed←*e↓dz←; 
        } ELSE { 
            M↓Edy← →INI400_005325= sign↓z←*N↓Ed←*MAX(ABS(e↓dz←), ABS(M↓y←/N↓Ed←)); 
        } 
        IF(ABS(N↓Ed←*e↓dy←) &gt;= ABS(M↓z←)) { 
            M↓Edz← →INI400_005326= N↓Ed←*e↓dy←; 
        } ELSE { 
            M↓Edz← →INI400_005327= sign↓y←*N↓Ed←*MAX(ABS(e↓dy←), ABS(M↓z←/N↓Ed←)); 
        } 
    } 
} 

IF(IO.IsDrawing) { 
    IF(IO.LayoutIndex == 1) { 
        →PAI127_000001TEXT("Second order effect and imperfections"); 
    } 
    ELSE { 
        →PAI127_000090TEXT("Second order effect and imperfections"); 
    } 
    Ncolumns →INI400_005286= 11; 
    object T_Sum →INI400_002858= new Table(Ncolumns); 
    T_Sum[0][0].Value →INI400_002939= TR("Axis"); 
    T_Sum[1][0].Value →INI400_002862= "y-y┴"; 
    T_Sum[2][0].Value →INI400_005167= "z-z┴"; 
    T_Sum[0][1].Value →INI400_002941= "N↓Ed← &lt;BR&gt; [kN]"; 
    T_Sum[1][1].Value →INI400_002866= Val(N↓Ed←/1000, 2); 
    T_Sum[2][1].Value →PAI127_000002= Val(N↓Ed←/1000, 2); 
    T_Sum[0][2].Value →INI400_005245= "M↓0Edy/z←&lt;BR&gt;[kNm]"; 
    T_Sum[1][2].Value →INI400_005248= Val(M↓0Edy←/1000, 2); 
    T_Sum[2][2].Value →INI400_005249= Val(M↓0Edz←/1000, 2); 
    T_Sum[0][3].Value →INI400_005250= "M↓2y/z←&lt;BR&gt;[kNm]"; 
    T_Sum[1][3].Value →INI400_005253= Val(M↓2y←/1000, 2); 
    T_Sum[2][3].Value →INI400_005254= Val(M↓2z←/1000, 2); 
    T_Sum[0][4].Value →INI400_005255= "M↓Edy/z←&lt;BR&gt;[kNm]"; 
    T_Sum[1][4].Value →INI400_005258= Val(M↓Edy←/1000, 2); 
    T_Sum[2][4].Value →INI400_005259= Val(M↓Edz←/1000, 2); 
    T_Sum[0][5].Value →INI400_005260= "e↓0z/y←&lt;BR&gt;[mm]"; 
    T_Sum[1][5].Value →INI400_005263= Val(e↓0z←*1000, 2); 
    T_Sum[2][5].Value →INI400_005264= Val(e↓0y←*1000, 2); 
    T_Sum[0][6].Value →INI400_005265= "e↓iz/y←&lt;BR&gt;[mm]"; 
    T_Sum[1][6].Value →INI400_005268= Val(e↓iz←*1000, 2); 
    T_Sum[2][6].Value →INI400_005269= Val(e↓iy←*1000, 2); 
    T_Sum[0][7].Value →PAI127_000092= "e↓0min,z/y←&lt;BR&gt;[mm]"; 
    T_Sum[1][7].Value →PAI127_000093= Val(e↓0min,z←*1000, 2); 
    T_Sum[2][7].Value →PAI127_000094= Val(e↓0min,y←*1000, 2); 
    T_Sum[0][8].Value →INI400_005270= "e↓0Edz/y←&lt;BR&gt;[mm]"; 
    T_Sum[1][8].Value →INI400_005273= Val(e↓0Edz←*1000, 2); 
    T_Sum[2][8].Value →INI400_005274= Val(e↓0Edy←*1000, 2); 
    T_Sum[0][9].Value →INI400_005275= "e↓2z/y←&lt;BR&gt;[mm]"; 
    T_Sum[1][9].Value →INI400_005278= Val(e↓2z←*1000, 2); 
    T_Sum[2][9].Value →INI400_005279= Val(e↓2y←*1000, 2); 
    T_Sum[0][10].Value →INI400_005280= "e↓Edz/y←&lt;BR&gt;[mm]"; 
    T_Sum[1][10].Value →INI400_005283= Val(e↓dz←*1000, 2); 
    T_Sum[2][10].Value →INI400_005284= Val(e↓dy←*1000, 2); 
    
    
    
    FOR(i, 0, Ncolumns-1) { 
        T_Sum[0][i].Alignment →INI400_002972= ContentAlignment.MiddleCenter; 
    } 
    FOR(i, 0, Ncolumns-1) { 
        T_Sum[1][i].Alignment →INI400_002973= ContentAlignment.MiddleCenter; 
        T_Sum[2][i].Alignment →INI400_005285= ContentAlignment.MiddleCenter; 
    } 
    FOR(i, 1, Ncolumns-1) { 
        T_Sum.Columns[i].Width →PAI127_000008= Convert.ToSingle((FontsAndColors.TableWidth()-75)/(Ncolumns-1)); 
    } 
    T_Sum.Columns[0].Width →PAI127_000014= 75; 
    FOR(i, 1, 2) { 
        T_Sum[i][0].BackColor →INI400_010903= FontsAndColors.ColorTableRow(); 
    } 
    
    
    T_Sum.Padding.All →INI400_005287= 5; 
    T_Sum.Padding.Top →INI400_005288= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
    T_Sum.Padding.Bottom →INI400_004604= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
    T_Sum.Rows[0].BackColor →INI400_010793= FontsAndColors.ColorTableHeader(); 
    T_Sum.Font →INI400_005290= FontsAndColors.TableCellsFont(); 
    T_Sum[0].Font →INI400_005291= FontsAndColors.TableHeaderFont(); 
    T_Sum.BorderPen →INI400_005292= FontsAndColors.TableBorderPen(); 
    T_Sum.GridPen →INI400_005293= FontsAndColors.TableGridPen(); 
    T_Sum[0].BorderPen →INI400_005294= FontsAndColors.TableBorderPen(); 
    
    →INI400_005295T_Sum.Draw(); 
    
} 
//list of errors, warnigs
string sListEWN →INI400_006341= Functions1D_EWN.FListEWN(obEWN, TR(""), TR("NO")); 
IF(IO.LayoutIndex == 0) { 
    
    →INI400_006350TEXT(Functions1D_EWN.FListEWN(obEWN, TR("List of errors/warnings/notes: "), TR("There is no errors, warnings and notes"))); 
} 
Number↓EWN←[0] →INI400_005583= Number↓E←; 
Number↓EWN←[1] →INI400_005584= Number↓W←; 
Number↓EWN←[2] →INI400_005585= Number↓N←; 
//table of  errors and warnings
IF(obEWN.Count != 0 &amp;&amp; IO.LayoutIndex == 0) { 
    →INI400_006547Functions1D_EWN.TableEWN(Number↓EWN←, obEWN, PrintEWN); 
} 




</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="1000" Material="2" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10200" Autor="Palec-PC\Palec" Autor2="" Version="482" EWNSource="" Icon="/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCABkAGQDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD+/iiiigAorxv49/H/AOEv7Mvwx8QfF740+MdM8F+CfD0LmS8vpo/t2sambe5ubLw54b03et3r/ibVltJ00rRNOSa9uzFNKI0tre5nh/ju/bO/4OAf2j/jHcaz4M/Zrtof2fvh4ZpbSPxVplw2r/FPX7WOSxZLyPxFeWVnB4RhnmtbmSCHQ9KtdZjsb77Pdau0isq/G8Wcd8PcHUovNcTKeMqwc8PluEiq2NrRu0p8jlCnQpOSaVbEVKUJOMo03OcXE/pT6P30UPGL6SOPqw4CySjhuHMDiY4XOONeIK1TLuGMsrWhOeGWKhRxGKzPMIUqlOpLLsowmOxVKFWjVxcMLh6sa5/YR8Z/2k/gH+zvo1zr3xu+LvgP4a2Vtp66p5HibxBZWutXunvfRaatzpHhuOSbxDraNfzR2gXR9Lvn84lNmUfb+Z3j3/gvf/wTp8Eard6Vp/jvx98Q2tJrOL7f4C+Heq3WlXMd3YR3zXNpfeJrjwvHPDZvIun3igLcJfrJHFbzQRyXK/wYazres+I9Uvdc8Q6vqeva1qUxudR1jWb+61TVNQuGCq1xe6hfSz3d1MVVVMs80khCqC2AKu6V4T8Va9bveaH4Z8QazaRzNbSXWlaNqOo28dwiRyvbvPZ200SzLFNDI0TMJFSWNyoV1J/B8x8euIcVVcMlyTL8JTveKxLxOZYmUY8123Slg6cVJODcVSnyNNe0kmmv9YOD/wBkz4P5BgIYnxP8UOLuIcW4qNWeSRyXgrJqVaoqDhTiswo8SY2u6c44inGrLH4b6zCrTl9VoTpNT/uJtv8Ag4g/4J9T3FvBLD8d7OKaaKKS8ufhtpb29rHJIqPc3C2fjK6u2hgUmWVbW1ubgorCC3mlKxt9T/Cf/gsF/wAE7fjA+lWehftHeHPDOt6tqCaXb6D8RtJ8R/D+9jvZtQt9PtIpr/xLpNl4dZL17y0nguLbW7i2W2mla5mt5bDVIrH/AD+9X+Cvxk8P/Z/7e+EvxN0T7X532T+1/AfinTftX2fyvP8As/23SofO8nzofO8vd5fmxb9vmJnzm5trizuLizvLea1u7WaW2urW5ikguLa4gkaKe3uIJVSWGaGVWjlikVZI5FZHUMCByUvHHjXB1YvH5XlNWk3Z06mCxuEm9n7lRYtqMrfzU5r3r8r0t9Djv2Wf0YuIsFUhwjx54gYLHQi508Zg+J+F+IcND44J4nBvh+E6lL2lrqljcJJyp8iqxvK/+rRo+taP4h0631jQNW0zXNJvPO+yapo9/a6np119nnltZ/s97ZSz20/kXME1vN5UreXPDLC+2SN1GlX+Zn+zL+3H+0/+yLqkd58Efir4i8PaK+oWOo6n4Gu7+91HwFrs2n3Mt3brq3hh7qO0dGnnlN09k1lcXsMs1pdzzWdxcW8v9fP/AAT1/wCC4Pwa/ax1Cw+GfxutPDvwF+NF4lymkR3GtXZ+Hvjaa0S4u500bXdYtYbfwxqDWKR/YdD1/W7u41S7gvLawvprptPtL39d4Q8XeHeJqlHA4tSyTNarjCnhsXVjPC4mrJ2VPC41RpwlOTaUKWIhQqTk+SlGrJJv/Oz6RX7Ozxl8DsHmHFGQSpeKPAOAjWxOLzrh/BVcNnuTYClHnli8+4YlWxeJpYejCNWeJx2U4rN8DhaFJ4rH1sDTk4U/3Tooor9YP8/QooooAK+cv2qv2oPhj+yD8GfEXxq+K1+9roOkPHpulafBu+2+I/E17bXdxpPh3T2Ecqx3V+tjdSGRkkMdtbXDwQXl0Leyufo2v4Of+C2v7det/tL/ALRWp/CbwvqGp2Hwi+Dc0nh6y0+C+1CLSfF+t+YmoTeLLvSr+x0+7gvHW4htTFcQQxrHY2EH2aeXSodY1H4fxA4vpcG5BWx65Z5hiJPC5XQnFyjUxc4uXtKiTX7rDwTq1LyXNaMFeU0n/Uf0RPo6476Sfi7lnCE3XwvCWUUo5/xzmdCpGjVwnD2Gr0qcsLhako1OXMM2xE6eX4JxpVHSlVqYqcY0cNVnD4c/bk/bk+LX7cvxa1D4gfEDUJrLw3ZTTW3gbwNbTSLo3hbRlklFrDDaiWSJr1opHaednmkEk1wzXFzc3N9fX3yD4c0yz1vxDoOjahrNl4dsNX1rS9MvvEGpLK+naFZ399Ba3Os36QBpnstMhle9ulhUytBBIIwXIFfSX7I37Hvxf/bM+IWq+AvhPo15dnw54Z1PxZ4p11dLv9Q03QdKsIJGto7k2cZV9T1m7T7FomkiaO/1idLmLSoL66t/skninxP+GHjT4O+NNW8A+PtJ/sjxHpH2aSaGO5t72zu7O9t47uw1DT7+0kltryyvLaVJEeNxLBKJrK9htdRtbu0t/wCK8xWd5gv9Zs1pYrF0MxxtWEswrqfscTiKTjKrQVSLXIoxahCMOSMYxlClrSkof9OPBtTww4Rk/A7gDMMh4fzTg3hrA4ijwhlc8P8A2jkmUY+NWlgM0ng60ZrE1KtWDxWIq4j6xWq1a1HFZgnHH0KmI/uN/Y5/4Ixf8E9/AHgDwx40Glx/tQatr1tYeINM+KPjLULpdJm2tfta3PhfwroN/aaVoccK3aRT22ptrOsWep6ZBJNe22o2XlwfsR4V8B+BvAlvJZ+CPBnhTwbaTQ2VtNa+FfDuj+HreW301JYtOt5INIs7OJ4bCKeaOyiZTHapNKkCxrI4P8MH/BKP/grN4m/Yw8TJ8M/jHq2ueKP2bdee3R9PER1S9+G17GZ/N1/w3bwW0mqXMdzDJBb32kie4tp7bT7KztrW0Iiv9P8A7qPCXi3wz488M6J4y8G63p/iPwv4j0+DVNE1vS5xcWWoWVwMpLE4wyOjB4bi3mSO5tLmOa1uoYbmGWJP7B8NM64TzrJqcuH8twGUYvCwhTzDLaNKlHFYep70Y1Z1UnXxVCs1N0sVVnOc05QqtVVOJ/zi/Tb8NPpBeGfiTi6PjBxpxV4h5Dn+JxWL4Q41zHG4+tkecYNOhWq4HD5fKUcsyPM8sTwtPMciwOHw+Fw0oUK+AhUwFTC1pTa/4Y8N+K7OLTvFPh7Q/Emnw3KXsNjr+k2GsWcV5HFNBHdxWuo29zBHcxwXNxCk6oJVinmjVwkrhvjX4/8A/BOn9lL9obTL6DxZ8LfDNjrM/wBmls9Z0/SbVorGfTrO5t9Nhi0aQDT7LTI7i4+2ahb+HV8PajqTNextrEA1fVnvPuaivv8AGZfgcwpTo43B4bFUqi5Zwr0YVE1Zr7UW07NpNNNXdmfyPw9xdxTwljsPmXDHEOc5DjsJU9ph8TlWY4rBTpz5ozbSoVYRkpThCUozjKE3CLlF8qt/Ef8At0/8EKfif8C9N1f4hfA68Txp4H013luNMuL2SW/S1KC00y2s99u99Drmo3FnLdXVrqpHh6O71vS9D0vxVe6mbeyvP5/P+Jjo2o/8vulatpV7/wBN7HUdN1Gxn/7ZXNne2dzF/wBM57eeP+CROP8AVqvbKz1Kzu9O1G0tr/T7+2nsr6xvYIrqzvbO6ieC6tLu1nSSC5trmCR4Z4JkeKaJ3jkRkYg/ys/8FmP+CW15f2mmfGz4KWtlPPZTXumnQ5DEuu6vHPbNqNt4Smvp5Rc6tPpNtpmp3PgrUJzPcTWcmo+HteuRfQaJqesfzp4jeEWHwmHrZ5wrSqU1RXtcVlVNc6a543qYP3oyp8kW5exipuTSVNKT1/2Z+hh+0TzbPs4yzws8fMwwmL/tOawOR8fY2Sw84S9hW5MFxI/ZVaeMeKrKlRWZVp4f2KqTqYypUpxbh3n/AARQ/wCCseq/FS58Mfse/tEa5NqvxAMOoWnwn+IOqzWFvN4istOtL3VYfBmryKljBLe6dpdq9h4dKpLqd0lraWAOpm4H9kf051/lJaJrOqeHNZ0jxDod7NputaDqdhrOj6jbELcafqml3UV9p97bsysomtbuCGeIsrASRqSpHFf6Mf8AwTH/AG04P25f2V/CnxQ1ebSYfifoFzc+C/i7o2lRwWVvY+MtJWORdUtNKTUdRubDSfE+kz2Gt6eLhoU864v7O2jEdgwX6Hwb4+rZ5h58NZvXlWzPL6Cq4DFVZc1TGYCnyU50qspPmqYnCNxftJOU61CfNL3qE5z/AB79pL9EjLPCzOML41+HWWUcv4H4uzSWA4ryLA0FSwfDXFeMdfFYfHYChRiqOEyTP4QrwWEp06WGyzNMP7Gi/Y5phMNhv0Kooor92P8AKU+Iv+Cinxyg/Z8/ZG+LXj13uY7mTQrvQ7BoNOg1OKWe+sL67u9PvbaeeBltta0jTtS0NLi3kjntrzUrSZbrTI0k1fT/APNp1LULzV9Rv9V1Cb7Rf6ne3WoX1x5cUXn3l7PJc3M3lQJFDF5s0rv5cMccSbtsaIgCj+1n/g4r8VXll+yv4W8K6frnlQav4mtbnxH4fiu4n+0WcWueHJ/D+oX+nFneLbf6Zqkek6kYopT5GtWVpcGGXVIJP4zPhx4U/wCE7+IfgPwP532b/hMvGfhfwp9o8zyfI/4SLXLHSPO837NeeV5X2zf5n2S62bd32afHlN/Jfjlj8RjuK8vyeF3SweBoulHmtGeIx9WXM2r8t0qdOHM/eXvR0SV/+hL9lbwllPC3gBxl4j4lQjjeI+Kszjj63sU62HyfhPL6MqMI1HFVHGrPGYzEOjB+yko0Kicpyah/eZ/wRH/ZV079m79iXwZ4nvbG5g+IX7QUdn8V/Gk2oadqOlX9tp1/bPF4G8PPZ6jL5gttI8OSLqEVwlrZpd3mvahcRrPbSW1xJL/wUs/4JoeA/wBrDwVq/iXQNAhh8e2EOr6pbtptlJLqlprd9ZvFP4s8NWlndafLqOpSypbXfivwU93Fpvj9bG1vokh8aWFjdar+tWi6Pp3h7R9J0DR7f7HpOh6ZYaPpdp509x9l07TLWKysbfz7qWe5n8i2gii864mmnk275pZJGZzpV/R1LhTKP9WcLwviMLRrZfh8DRwjg4KznTgufER5rtValbnryn8TqTcm7ts/xdxvj/4hvxuz7x1yjPcwyzjDOOKMw4hjiaeIkpU8NisRP6tk9T2bjCeX4PLVQyqlhlH2MMFQp0IwVOKif5b/AMa/gb8QfgD4xl8GfEHToYLtoRd6XrGmyXF14f8AEFgSFN/omoXFrZy3MMcpMNxDcWtre2kw8u7tIGaPf+q3/BKP/grN4m/Yw8TJ8M/jHq2ueKP2bdee3R9PER1S9+G17GZ/N1/w3bwW0mqXMdzDJBb32kie4tp7bT7KztrW0Iiv9P8A6Yf+Cjv/AATi8DftS+Bte1jR9B/4qX/SdYvrHR7aP+2BrHlsX8YeD0C/8jL1bxB4fUfZfG1r5skcX/CS7l8QfwnfHT4F+Of2f/HN54K8a2f/AD0utB161jk/sfxNo/mFIdU0uZx9I72ykP2rTrrdb3C/6uSX+W+IuHeIfCrP6Oc5NXqvAqo3hsS1KdKVObtLB4+nFxjVo1E1G0mve5dY1o0qs/8AeHwc8ZfB76fnhJmXhr4mZXgIcUvBxWcZLGVHD5hRxeHjz0eJeEsXWp1qmAzLCSi6rdCM/wB17a9OvltbH4HD/wCnx4S8W+GfHnhnRPGXg3W9P8R+F/Eenwapomt6XOLiy1CyuBlJYnGGR0YPDcW8yR3NpcxzWt1DDcwyxJ0VfwOf8Eo/+Crnib9hjxMnwz+Jb654v/Zo8X65bzavpENwb29+Fl7emdNS8ZeDdNeCSe5juZ5LO58R+HLa8trbULa2vL6xs5vEEyPcf3d+CfG3hH4k+EfDvj3wF4i0nxb4M8W6TZ674b8SaFeRX+k6xpN/EJrW9s7qElHjdDtdG2ywSrJBPHFPFJGv9J8D8c5ZxrlqxGGccNmWHjFZllkp81XDTbaVSm2outharV6VaMdL+zqqFWMon+KH0pfosccfRi40lk+dQrZzwZm9atU4L44o4b2OBz3C04wqVMHi6UKleOWZ9gIzVPMMsrVeaXKsbgpYjAVqVd9RXNeMfCej+OvC2veENfh8/SfEOmXOm3e2O1knt/PT9xf2X222vLaHU9MuVh1HS7qW2n+xaja2t2kZkgSulor7WUYzjKE0pRnFxlFq6lGSaaa6pptNdj+YqNarhq1LEUKkqVehVp1qNWD5Z0qtKanTqQktVKE4qUWtmkz/ADev+Ckn7Osn7On7T3jbRLb+z/7F8TarretWkemSM9jY63aa3faT4v060SWK0nXT18Q2l1qmkA2Fnbw6Nq2nWEMYmsLqOH9Kf+Dcn4/6t4H/AGpvHv7P8o+0eGfjp4Gk1tEknlH9neLvhXBqmsadd2sK2V0v+neHdY8TWt+DdaZFP5GmyTz3c9hp9o3tP/ByN8P7Ow8W/Cjx3awXM8+oyxLqN7PdxeVYXmvaPfaQmn2VnH5DtbX+n/C2xvHlnivpbe8tLvF7bQX0Nm34pf8ABNTxNbeEP2+f2S9evdY0/QLG3+Nvgyzv9V1S5srPT7bT9Zvxot8tzdaiVtLdLq01Ca0WaR0eN50a3kjuBE6/xviKX+pni7h1hH7OhDPcI4pSUF9TzVwo4uD5k4Qg6eJxEVFXjCHLFSi43j/0m5Lj/wDiZb9nZnEuI4vF5riPCvPo1alSlLE1P9YeAoV8z4fxUVRqwxGIxMMVkmUVqlWXs6uKxCq1J0a1Oty1v9KCiiiv7KP+a0/mh/4OKtH1GD4T6Dr8tvt0nU4vBuj2V350DefqOh+KvEF7qlv5Cym5j+y23iHR5fOmhjgn+2bLeWaS3ukg/k2+AeoWekfHX4LarqE32ew0z4s/DnUL648uWXyLOy8YaNc3M3lQJLNL5UMTv5cMckr7dsaO5Cn+3v8A4LpfCnUPiR+yFqF7Z2Sak3hqPXJ7Sytgj62dZh/sXxlYz6TFNaTxOg03wHrdlqKQTQ6pdW9+umaZFcTahIYP4Mba5uLO4t7yzuJrW7tZorm1uraWSC4triCRZYLi3niZJYZoZVWSKWNlkjkVXRgwBH8f+M9KeB46w+NcG6U8Jgq9Nv7cqFadSrBOyWkpxW90pK/d/wDRn+zQx+F4q+irnPDMcRTp5hQ4i4myvGRpvXDUMzyvB4HL684uU5p1KOGqTbceWc6c3BWvCH+r1RXzH+xp8f8ATP2nv2Y/g18abG++26h4v8DaDN4sSS2s9PurLxra6db23iu1utLsbm7g0vfrMdzfWFqJdsmj3mm3sC/Zbu3Zvpyv65wuJo43DYfGYeanQxVCliKM1a0qVaEalOWja1jJPRv1P+eHPclzHhvO834ezfDywma5HmeOyjMsNNSUqGOy7E1cJiqTU4xl7lejOKbjFtJOyuFfkt/wUd/4JxeBv2pfA2vaxo+g/wDFS/6TrF9Y6PbR/wBsDWPLYv4w8HoF/wCRl6t4g8PqPsvja182SOL/AISXcviD9aaK5c1yrA5zga+X5hQhXw1eEoThOKlbmTXNG6dmr+jWjume5wHx5xP4bcT5XxdwjmmJyrOcpxNLE4fEYerOlzulUjUVOp7OUXKEnFPdSjJKcGpJM/y3/jf8EvGvwF8ear4G8Z2Mwa1mZtG1+KyvINE8U6W0cE8Gq6Hd3UMcV5CIrmGG/jt5JzpepLc6XduLu1lUfpv/AMEpP+Crfi79hjxdb/Db4k3GreLf2XfFurCXXtBiMt/q3ww1a/lVbjxv4It2Yu9o7kT+KvCsBWLWYlfUtNSLXomXVP6gP+Cjv/BOLwN+1L4G17WNH0H/AIqX/SdYvrHR7aP+2BrHlsX8YeD0C/8AIy9W8QeH1H2Xxta+bJHF/wAJLuXxB/Cd8dPgX45/Z/8AHN54K8a2f/PS60HXrWOT+x/E2j+YUh1TS5nH0jvbKQ/atOut1vcL/q5Jf5D4k4a4g8Lc/o5zk1eqsGq0pYTFxjKVNUpy97A42DbVWhUjanJTfvu13GqqVSX/AET+Cnjb4Q/Tz8I8y8M/ErK8FPiSpl9Knn+QVqlKjjJ43DUP3XFPC+JjThLAZpg63tMXSeFg3h4uo4wr5fPH4Sh/p5eCfG3hH4k+EfDvj3wF4i0nxb4M8W6TZ674b8SaFeRX+k6xpN/EJrW9s7qElHjdDtdG2ywSrJBPHFPFJGvUV/At/wAEpP8Agq34u/YY8XW/w2+JNxq3i39l3xbqwl17QYjLf6t8MNWv5VW48b+CLdmLvaO5E/irwrAVi1mJX1LTUi16Jl1T+8HwT428I/Enwj4d8e+AvEWk+LfBni3SbPXfDfiTQryK/wBJ1jSb+ITWt7Z3UJKPG6Ha6NtlglWSCeOKeKSNf6V4G45y3jbLViMO44bMsNGEcyy2U71MPUeiq0m7OrhKrTdKqldO9Kqo1ItP/Ez6VH0V+Nfow8ayyjN41s54KzmtiKvBXGtLDunhM4wdN88sBj4w5qeX8Q5fTlCOYZfKfLOPLjcFKtgq0Jx/l9/4OTNYt7XSPhRoxkh+3avc+E7mKCWyjuJGsNK/4W4b24trqW3lWwmhu77S4mlt57W9nt7q4tY2lsZdRiP84/7FHgi4+JH7YH7MPgi1v4dLl8RfHj4WWbajcQyXKWVunjLSLq8uVto2ja6mitLedra1M1tHc3Aiglu7SKR7mL9W/wDg4N+Pf/Cw/wBq7T/hTpmrf2lofws0WKKdP7I+w/Y9YuY1tLvSPttxBbXd/wD2Tq9v4kuPPSJ7WX+28RalqVrDYQaT84f8ESPgvrHxd/4KGfBvUbSzuZND+Ejaz8VvEuoron9sadp0Hh3TLm30NNQke5tYNLk1HxNqGkWWmaizTz2uovBcW1nO8DNF/OPFrhxB4u08HhoyxFN53leXzUWrSjQrUfrbjKM2lCmvbNzTi0oSlZNXf+0f0eliPCL9ndi+JM6q0cpxK8MeOuLsPOvTlJ0q2Z5dmEeHoV6FTDRlLE4ycctp06EoV1UliKNPnlGXJD/QWooor+xj/m3PL/jV8OLf4ufCvxt8OrloQvibRntrdbsxiwl1CzuINT0u31USWOpB9GudSsrS31mJLG4nm0qS8it1Wd45E/zS/wBpz4J6x+z38bfHXwu1izubH+w9WuJNMgvYPsl4mkXM0rWUV3YSahqd7YXNnslsJ7TVLkapHLaO17DDK5Qf6glfzh/8Fvf+CeP/AAtzwufj18OdH1a68W6FHqd5c6foemaOLVtRvRpEU+n32yfTp3tvGE9s19bX1ysz6f4wXUGa9vr3xva6S3494xcH1eIskp5lgaTq5lk/PUjCKvOtg5616UVvdNKpFRTcpxinyw5pL/R39nB9I3BeDfiji+DOKcfHBcFeJH1bB18TWkoYbLeIcPeGVZjWk7RVOUZzwVadSpCFLD161SKq11Ro1PhX/ggb/wAFFNP+E3ia8/Y4+MfiHT9H+HPjbUNR8Q/CHXr+zdI9A+IV8bWTWfDGq62k62+neHfEljaT6nY3Go2otLDxBb3CS6jbR6yFX+yav8oz/iY6NqP/AC+6Vq2lXv8A03sdR03UbGf/ALZXNne2dzF/0znt54/4JE4/r5/4Ja/8FyvD/jHS/Bn7PX7aHiKHRfHsM1p4W8I/HjWLiZdL8aCc21p4esviPOtm9po3iBGE1jqXjzUr+z0vVWbSrvXEh1CXXNem+O8IvEnDUMNR4T4hxUcNKg1SybHYiTjSdNysstxFWcrUp0pO2DlPlpOl/szlCVOjGr/SP7RL6E+eZpneY/SB8Hskq5zRzWnLH+JPC2T0FWx9LGU6XPV40yfA4alz4/DY6jD2vEdCh7bGwxt86hTxNDF5jUwH9PVFVrK9s9Ss7TUdOu7a/wBPv7aC9sb6yniurO9s7qJJ7W7tLqB5ILm2uYJEmgnhd4ponSSN2RgTZr+kk01dO6eqa2a7n+KUoyjJxknGUW4yjJNSjJOzTT1TT0aeqejCvyW/4KO/8E4vA37UvgbXtY0fQf8Aipf9J1i+sdHto/7YGseWxfxh4PQL/wAjL1bxB4fUfZfG1r5skcX/AAku5fEH600V52a5Vgc5wNfL8woQr4avCUJwnFStzJrmjdOzV/RrR3TPsOA+POJ/DbifK+LuEc0xOVZzlOJpYnD4jD1Z0ud0qkaip1PZyi5Qk4p7qUZJTg1JJn+XL8dPgX45/Z/8c3ngrxrZ/wDPS60HXrWOT+x/E2j+YUh1TS5nH0jvbKQ/atOut1vcL/q5JfvL/gnx/wAFXvjf+wno/iv4d2XmeOPhF4otr6607wtqUyz3Xw98XXWGbxX4HN6Xsrdr7Drq+gX0cuhX181trc1nLd2t7a6x/RX/AMFrfg3+yHbfCLWfG/xW8Z+EPA/i3U3N7pHhQ3YXxn4h8VX/ANpttP8AFfgPRdLstV1uPUJr6B4vGUp0l/C+rabHe6rrFzZavaXUuufw+V/GfFGVY/wy4qjLJM2jTquFSrhpUK0ZYmjhqr5ZYfG0byfsqidqarK9RQcledKNWX/Sv4E8e8JfTk8A6+H8UfD+pi8FDE4TL87hmmW18Pk2ZZzgY+2pZxw1mPJRjHH4OpHmxcssqcmEeJhSm44XMKmX0+z+InjjWPiV458VePNefzNW8Va1eavd/Lar5f2iQ+Rb/wChWlhbP9ltlhtvNjs7fz/K854lkkev7H/+DeT9kef4VfA3xh+0t4t0T7J4s+Of9naZ4Pu7tdRgvrT4a6RNLeqLaCaJNMudM8T6m+n6zHqtjcXb3JsYNNuI7C40idLr+cn/AIJqf8E+/HX7fHxug8NWtte6N8H/AAX9n1j4teP2huo7DSdOkYjT/DemXUcDQ3vizxHMrDT9GF1ZTtpVprGpm9s4tPM4/wBEvw54e0bwl4e0Lwp4c0+HSfD3hnRtL8PaDpVsZDb6Zo2i2MGm6Xp9uZXklMNnY20FtEZJJJDHGu92bLH7/wAE+EsTjcxxHGmaU5ulSlXp5ZOtH3sXjcRzwxmNjzJXjRjKdGNRXjOtWqqLU6ErfyP+0++kFkfDXBmT/Rk4FxWGhi8bSyrGccYXLayVLh/hrJ1ha/DPC9ZUpSVOtmVahhsyrYObhWw+W5dl86sZYfNafNs0UUV/Tx/heFVr2ys9Ss7vTtRtLa/0+/tp7K+sb2CK6s72zuongurS7tZ0kguba5gkeGeCZHimid45EZGINmihpNNNXT0aezXZjjKUZKUW4yi1KMotqUZJ3TTWqaeqa1T1R/Kr/wAFV/8AgjLeeJddvfjd+zbYQW89/wDbL3xPo8638lpHFZ2dxfXD61cWVpqFzbm2trWT+zvF95CbOe2jGmeNb+0vrax8Sa5/KT4n8KeJfBes3nh7xZoep+HtasJri3utO1W0ms7hJLW6uLGdkWVQs8K3drcwLcwNLbyyQSCKVwpNf6sFfnN+1Z/wS7/ZU/au0uRPEvgfTPCviSOEQ6d4k8N6fHaPpw3WKL9ls7GfTJ7CGGG1mlj0/QNT0PS9Q1S7k1LxLY+ISptpPwjjvwbw+dV6+a8O1KOBzCs5VK+Cq3hg8TVdryhKKl7CpN3lJqPI222m3c/1b+il+0nznwwyzKuAfGTB5jxXwfl9Ojgss4kwPLieI8kwVN1FGjiKVapS/tbCYeDp06NOVVYmnThClSqRpwUX/ER+y7/wUr/bJ/ZBs30T4O/F3U08HPgjwD4ytbfxp4Ktm83Tmkk0vRddFwNBmmt9NhsZZtAuNLlNnLOiukrpNH+2Pw4/4Oa/FFulzD8Xf2VdA1aUwq1nqHw4+Iuo+HUW4W4m3xXOj+J9A8UNJDLaSQBbiLXI5ILi0mY21zFqKLpfi3x6/wCDdv8AaC8OXuoan8FfFHhnxVo62d9q7aVqN9OY9MjW/uZU0ez1BLVPFGtXlrpCARW1p4Kvbi+uI7OK2u7271O4ttJ/OPxN/wAEk/8AgoZ4bR50/Zj+IniK0jhhlluPDOlyajIkk1wbcWyaZOLPWrmaMmOaZrPTLi3it5RM1wFhuvs/5hh5eMPBlsJhaee/VaStToxwqznBKnFyS9hCpRxao0/ebapxotaOSTSt/dWcUv2cH0mHLiLPMV4WLPcwbnjMwr55U8NOJnjKvsZSWa4jCZjw9LMsb+7hCFTGVcyjO9SGHqVFVqc/7o3P/Bzl4FS3uGs/2QvFs92sMrWsFz8YdHtbea4CMYIri6i+H15LbQyShUluI7O6khQtIltOyiJvg342/wDBxH+2L8SNCv8AQvhr4X+HvwM+3211Ytrvh2C68V+JILW+s4oJ5rW/8UJPZ2erWs6SzaTqdjplp9giup0mtr29isNRsvzq0L/gmb+354l/s59F/ZM+M93batbJe6dqUnhSey0e7s5rU3sF3FrV9JbaSba6ttstpO16sV35kKWzyyTwo/2P8GP+CBv7f3xS/su98V+GPBnwU0PUPtvnXnxH8V2smsWH2T+1Yo/tPhjwpH4h1dPtV3p9tFD5yW+611Wx1CPzbUXJg3lxL405/bB0aefQVSLi3hMlhliam4JyljY4PDulbmj7/wBYpqMZOV1FtnlUfBP9mT4SuXEWZY7wmxVTB1Y1oU8/8TMTxvNVMPCtUVKjwvPiPN4Zg5exqv6u8mxk61WEaShOfs6Z+RHxD+JHj34s+LNT8d/EvxbrnjfxhrTpJqviPxFfzajql9IgxvuLmYlnd2LzStw01zLPdTF7ieaWT9CP2Af+CV3x/wD25vFOl3sOmat8MfghFciTxH8YPEPh3Uzp09hFAlxPaeBra5jsLLxbrkv2iwgit4tUtrO2S/XUJ7iS3sruIf0k/suf8G+X7Kfwgl0PxH8dNV1b9ofxZYW1vcXWkapFN4a+HQ1iazeG/jfw9YX8t9ruk2dw0UujQ6rfxbpY7i41e2v4bq10/Sv3wsrKz02ztNO060trDT7C2gsrGxsoIrWzsrO1iSC1tLS1gSOC2traCNIYIIUSKGJEjjRUUAfTcKeCOOxOKWZ8a4n3XVjWlllDESxGJxc5Nzqf2hjoytTUpWU1hqlarVvJ+3otJy/D/H/9qHwvkuRz4H+jDkbVSlgquWUON80yejlGSZBh6UI4fCPhDhatS5sXKjRUnh6mdYLLsDgnToxWU5hTnJUfF/2dP2dPhL+yr8JfDPwX+C/hmHw14M8NQliWMdxrPiLWbiOJdV8VeKtVWKGXWvE2tSwxy6jqMsccaRx22nadbWGj6fpum2fuNFFf0pQoUMLQpYbDUqdDD0KcKNChRhGnSpUqcVGFOnCKUYQhFKMYxSSSSSP8Ts2zbM8+zPMM6zrMMZm2b5tjMRmGZ5nmOIq4vHZhjsXVlXxWMxmKrynWxGIxFac6tatVnKc5ycpNthRRRWp54UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf/2Q==">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English " />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://www.scia-online.com/</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>
        </ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" />
      <Style Key="Subchapter 1" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|16|0|2" Font2="Segoe UI|16|1|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="A↓c←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_A↓c←">
          <ENU>Cross-sectional area of cross-section</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓s←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_A↓s←">
          <ENU>Cross-sectional area of all reinforcement</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="a↓sy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_a↓sy←">
          <ENU>The distance from the edge to centre of reinforcement in direction of y-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="a↓sz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_a↓sz←">
          <ENU>The distance from the edge to centre of reinforcement in direction of z-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="AccidentalULS" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>Dimension of cross-section in direction of y-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="b↓eq←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_b↓eq←">
          <ENU>Equivalent width of cross-section</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="bPrint_Img" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="BraceMemberY" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_BraceMemberY">
          <ENU>Braced member around y-axis</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="BraceMemberZ" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_BraceMemberZ">
          <ENU>Braced member around z-axis</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="c↓nom←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_c↓nom←">
          <ENU>Concrete cover of longitudinal reinforcement </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_c↓y←">
          <ENU>Factor  around y-axis depending on the curvature distribution</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_c↓z←">
          <ENU>Factor  around z-axis depending on the curvature distribution</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CalcImp" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_CalcImp">
          <ENU>Geometric imperfections</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CalMinEcc" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_CalMinEcc">
          <ENU>Minimum eccentricity</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CalSecOrder" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_CalSecOrder">
          <ENU>Second order eccentricity</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause12xxClass" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause2xxClass" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause3xxClass" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause5_2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="clauseObjects" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CMemberType" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_CMemberType">
          <ENU>Compressive member</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Coef↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Coef↓z←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Coeff↓com←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Coeff↓d←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Coeff↓d←">
          <ENU>Coefficient for calculation effective height of cross-section</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ColorTableHeader" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Combikey" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CombiULS" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_CombiULS">
          <ENU>ULS combination</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CompressMember" ESA_ID="" Type="Boolean">
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
      <Variable Modifier="Public" Name="Cond↓biaxial←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ConMat" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CrossSection" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CssID" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CssReinfChar" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="D" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="d↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_d↓y←">
          <ENU>Effective depth of cross-section in y-direction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="d↓z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_d↓z←">
          <ENU>Effective depth of cross-section in z-direction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="DataFromSEN" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="DescriptionN" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Design" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_Design">
          <ENU>Reinforcement from ratio</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="e↓0Edy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓0Edy←">
          <ENU>First order eccentricity including effect of imperfection in direction of  y-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓0Edz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓0Edz←">
          <ENU>First order eccentricity including effect of imperfection in direction of  z-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓0ey←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓0ey←">
          <ENU>Equivalent first order eccentricity in direction of y-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓0ez←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓0ez←">
          <ENU>Equivalent first order eccentricity in direction of z-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓0min,y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓0min,y←">
          <ENU>Minimum value of eccentricity in direction of y axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓0min,z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓0min,z←">
          <ENU>Minimum value of eccentricity in direction of z axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓0y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓0y←">
          <ENU>First order eccentricity in direction of y-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓0z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓0z←">
          <ENU>First order eccentricity in direction of z-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓2y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓2y←">
          <ENU>Second order eccentricity in direction of y-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓2z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓2z←">
          <ENU>Second order eccentricity in direction of y-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓dy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓dy←">
          <ENU>Final value of eccentricity in y-direction including imperfection and second order effect</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓dz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓dz←">
          <ENU>Final value of eccentricity in y-direction including imperfection and second order effect</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓iy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓iy←">
          <ENU>Eccentricity caused by imperfection in direction of y-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓iz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_e↓iz←">
          <ENU>Eccentricity caused by imperfection in direction of y-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="E↓s←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_E↓s←">
          <ENU>Design value of modulus of elasticity of the reinforcement</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="EqFindY" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="EqFindZ" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="EquivMoment" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_EquivMoment">
          <ENU>Equivalent first order moment</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ExternCreateCS" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="f↓cd←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_f↓cd←">
          <ENU>Design value of concrete compressive strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ck←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_f↓ck←">
          <ENU>Characteristic compressive cylinder strength of concrete</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yd←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_f↓yd←">
          <ENU>Design yield strength of reinforcement</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yk←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_f↓yk←">
          <ENU>Characteristic yield strength of the reinforcement</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="FontsAndColors" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="fontsColors" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Forces" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ForcesID" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="FormCode" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Functions1D_EWN" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Functions1D_General" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Functions1D_Geometrics" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="gamaCoeffs" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Dimension of cross-section in direction of z-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="H" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_H">
          <ENU>Height of the building</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓eq←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_h↓eq←">
          <ENU>Equivalent height of cross-section</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="i↓cy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_i↓cy←">
          <ENU>Radius of gyration of concrete cross-section  in direction of y axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="I↓cy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_I↓cy←">
          <ENU>Second moment of area of concrete section around y-axis</ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-12" Dim="mm↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="i↓cz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_i↓cz←">
          <ENU>Radius of gyration of concrete cross-section  in direction of z axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="I↓cz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_I↓cz←">
          <ENU>Second moment of area of concrete section around z-axis</ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-12" Dim="mm↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="i↓sy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_i↓sy←">
          <ENU>Radius of gyration of reinforcement  in direction of y axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="I↓sy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_I↓sy←">
          <ENU>Second moment of area of reinforcement around y-axis</ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-12" Dim="mm↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="i↓sz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_i↓sz←">
          <ENU>Radius of gyration of reinforcement  in direction of z axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="I↓sz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_I↓sz←">
          <ENU>Second moment of area of reinforcement around z-axis</ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-12" Dim="mm↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="IndexEWN" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="InfoGeoImp" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="InfoSecEffect" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="InputSlenderness" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="IsoCol" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_IsoCol">
          <ENU>Isolated member</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="K↓r.lim←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="K↓r←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_K↓r←">
          <ENU>Correction factor depending on axial load</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="K↓φy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_K↓φy←">
          <ENU>Factor for taking account of creep around y-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="K↓φz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_K↓φz←">
          <ENU>Factor for taking account of creep around z-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="l" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_l">
          <ENU>Length  of the member or height of the building</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="l↓0y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_l↓0y←">
          <ENU>Effective length of the member around y-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="l↓0z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_l↓0z←">
          <ENU>Effective length of the member around z-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_L↓y←">
          <ENU>Length of the member/span of the member around y-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_L↓z←">
          <ENU>Length of the member/span of the member around z-axis</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="M↓01y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓01y←">
          <ENU>Lesser value of first order ends bending moment around y-axis</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓01z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓01z←">
          <ENU>Lesser value of first order ends bending moment around z-axis</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓02y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓02y←">
          <ENU>Bigger value of first order ends bending moment around y-axis</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓02z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓02z←">
          <ENU>Bigger value of first order ends bending moment around z-axis</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓0Edy←" ESA_ID="Result.6" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓0Edy←">
          <ENU>First order bending moment around y-axis including effect of imperfection</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="13" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓0Edz←" ESA_ID="Result.7" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓0Edz←">
          <ENU>First order bending moment around z-axis including effect of imperfection</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="13" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓0ey←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓0ey←">
          <ENU>Equivalent first order moment around y-axis</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓0ez←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓0ez←">
          <ENU>Equivalent first order moment around z-axis</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓2y←" ESA_ID="Result.8" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓2y←">
          <ENU>Second order bending moment around y-axis</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="13" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓2z←" ESA_ID="Result.9" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓2z←">
          <ENU>Second order bending moment around z-axis</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="13" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓beg,y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓beg,y←">
          <ENU>Bending moment around y axis at the begin of member</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓beg,z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓beg,z←">
          <ENU>Bending moment around z axis at the begin of member</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Edy←" ESA_ID="Result.10" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓Edy←">
          <ENU>Final value of  bending moment  around y-axis</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="13" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Edz←" ESA_ID="Result.11" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓Edz←">
          <ENU>Final value of bending moment  around z-axis</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="13" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓end,y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓end,y←">
          <ENU>Bending moment around y axis at the end of member</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓end,z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓end,z←">
          <ENU>Bending moment around z axis at the end of member</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓iy←" ESA_ID="Result.4" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓iy←">
          <ENU>Bending moment around y-axis caused by imperfection</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="13" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓iz←" ESA_ID="Result.5" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓iz←">
          <ENU>Bending moment around z-axis caused by imperfection</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="13" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓y,out←" ESA_ID="Result.2" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="13" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="m↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_m↓y←">
          <ENU>Number of vertical members around y-axis contributing to total effect</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓y←">
          <ENU>Bending moment y-y</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓z,out←" ESA_ID="Result.3" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="13" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="m↓z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_m↓z←">
          <ENU>Number of vertical members around z-axis contributing to total effect</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓z←">
          <ENU>Bending moment  z-z</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="n" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_n">
          <ENU>Relative axial force</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓bal←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_n↓bal←">
          <ENU>Value of relative force at maximum moment resistance</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓com←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="N↓Ed,out←" ESA_ID="Result.1" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="12" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="N↓Ed←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_N↓Ed←">
          <ENU>Design normal force</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="n↓u←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NameConcrete" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="NameReinf" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Ncolumns" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Number↓E←" ESA_ID="" Type="Double" Precision="2">
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
      <Variable Modifier="Public" Name="Number↓N←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Number↓W←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="obEWN" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="OutputSlenderness" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PaddingTableOverall" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="PODY" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PODZ" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintEWN" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Ratio↓eyz←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Ratio↓ezy←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Ratio↓λyz←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Ratio↓λzy←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ReinfMat" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="sCaption" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ShapeCss" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ShapeCss">
          <ENU>Array of point of concrete cross-sections</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="sign↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="sign↓z←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Slenderness" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="sListEWN" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SolutionN" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SymCssAroundY" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SymCssAroundZ" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SymReinfAroundY" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SymReinfAroundZ" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SymReinfCss" ESA_ID="" Type="Boolean">
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
      <Variable Modifier="Public" Name="t↓cy←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="t↓cz←" ESA_ID="" Type="Double" Precision="2">
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
      <Variable Modifier="Public" Name="TableHeaderFont" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableWidth" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TypeDir" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_TypeDir">
          <ENU>Unfavourable direction</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TypeN" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="X1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="X2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="X3" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ZeroForcesID" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZeroSign_y" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZeroSign_z" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓cc,pl←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓cc←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_α↓cc←">
          <ENU>Coefficient taking into account of long term effect on the compressive strength</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓h←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_α↓h←">
          <ENU>Reduction factor for length and height</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓my←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_α↓my←">
          <ENU>Reduction factor for number of vertical members around y-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓mz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_α↓mz←">
          <ENU>Reduction factor for number of vertical members around z-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="β↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_β↓y←">
          <ENU>Coefficient for calculation curvature around y-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="β↓yy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_β↓yy←">
          <ENU>Coefficient of effective length around y-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="β↓z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_β↓z←">
          <ENU>Coefficient for calculation curvature around z-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="β↓zz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_β↓zz←">
          <ENU>Coefficient of effective length around z-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓C←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_γ↓C←">
          <ENU>Partial factor of the concrete</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓S←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_γ↓S←">
          <ENU>Partial factor of the reinforcement</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓cu←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_ε↓cu←">
          <ENU>Ultimate compressive strain in the concrete</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓yd←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_ε↓yd←">
          <ENU>Strain of the reinforcement at the peak yield strength fyd</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="η↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="η↓z←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="θ↓0←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_θ↓0←">
          <ENU>Basic value of inclinations</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="θ↓iy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_θ↓iy←">
          <ENU>Inclination around y-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="θ↓iz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_θ↓iz←">
          <ENU>Inclination around z-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓limy←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_λ↓limy←">
          <ENU>Limit value of slenderness around y-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓limz←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_λ↓limz←">
          <ENU>Limit value of slenderness around z-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓y←" ESA_ID="" Type="Double" Precision="-2">
        <Description TranslateID="VARIABLE_λ↓y←">
          <ENU>Slenderness around y-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓z←" ESA_ID="" Type="Double" Precision="-2">
        <Description TranslateID="VARIABLE_λ↓z←">
          <ENU>Slenderness around z-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓s←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_μ↓s←">
          <ENU>Estimation ratio of reinforcement for calculation second order effect</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_ϕ">
          <ENU>Diameter of longitudinal reinforcement</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="φ↓ef←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_φ↓ef←">
          <ENU>Effective creep ratio</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="χ↓0y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_χ↓0y←">
          <ENU>Basic value of curvature around y-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="χ↓0z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_χ↓0z←">
          <ENU>Basic value of curvature around z-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="χ↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_χ↓y←">
          <ENU>Value of curvature around y-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="χ↓z←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_χ↓z←">
          <ENU>Value of curvature around z-axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ω" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_ω">
          <ENU>Mechanical reinforcement ratio</ENU>
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
          <ENU>Brief</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Standard</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_2">
          <ENU>Detailed</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_3">
          <ENU>SEN Standard</ENU>
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
      <VC ID="INI400_000007">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1401" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000020">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_000024">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="699" Y="1556" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="699" Y="1556" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1264" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000025">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1531" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1531" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1201" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000026">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1505" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1505" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1140" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000029">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="3016" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="3016" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="169" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000031">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="100" Y="949" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="100" Y="949" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="949" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000032">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000033">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2906" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2906" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="156" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000034">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2881" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2881" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="156" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000035">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="791" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="791" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="217" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000036">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="772" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="772" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="202" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000037">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2957" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2957" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="156" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000038">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2931" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2931" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="156" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000045">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="3085" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="3085" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="169" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000062">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000063">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000064">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4586" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4586" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000065">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3043" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3043" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000067">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4741" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4741" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="629" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000068">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4713" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4713" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="606" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000069">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="4741" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="4741" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="652" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000070">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4649" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4649" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000071">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="4681" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="4681" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000072">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3118" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3118" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000073">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4766" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4766" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000074">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4790" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4790" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000075">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4790" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4790" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000080">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4408" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4408" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="480" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000081">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4408" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4408" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="526" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000082">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4207" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4207" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000083">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4182" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4182" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000089">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4870" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4870" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000091">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4845" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4845" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000092">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4870" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4870" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000095">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4919" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4919" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000098">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4919" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4919" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000099">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="506" Y="174" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="506" Y="174" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="2610" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000100">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="432" Y="174" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="432" Y="174" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="2585" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000102">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4895" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4895" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000111">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5297" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5297" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1017" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000112">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5248" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5248" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="979" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000113">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5524" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5524" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="881" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000114">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5565" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5565" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="922" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000116">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5598" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5598" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="951" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000117">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5625" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5625" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="973" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000118">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5686" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5686" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1027" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000119">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5729" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5729" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1069" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000120">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5785" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5785" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1116" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000122">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5651" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5651" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="994" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000124">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5811" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5811" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1136" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000125">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4080" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4080" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000126">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5885" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5885" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="1" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000127">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4107" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4107" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000128">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5935" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5935" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="1" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000131">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="943" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="943" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000134">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6047" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6047" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000135">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6142" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6142" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000136">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4534" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4534" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000138">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4507" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|1|2" Font2="Arial|12.9|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4507" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|1|2" Font2="Arial|12.9|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000139">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="970" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="970" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="1" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="17" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000140">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="970" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="970" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="1" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="17" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000144">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6258" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6258" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1035" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000145">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6290" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6290" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1061" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000146">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5159" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5159" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5194" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000147">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5111" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5111" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5148" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000154">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6992" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6992" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000159">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7264" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7264" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000160">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7264" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7264" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000162">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7387" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7387" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000164">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7387" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7387" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000179">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7041" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7041" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000181">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7041" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7041" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000182">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7165" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7165" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000183">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7165" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7165" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000184">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7313" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7313" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000185">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7313" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7313" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000187">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7437" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7437" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000189">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7115" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="7115" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000195">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5124" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5124" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="873" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000200">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2187" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2187" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="1857" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000201">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="296" Y="2212" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="296" Y="2212" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="1876" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000202">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="236" Y="2236" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="236" Y="2236" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="1894" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000203">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="354" Y="2261" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="354" Y="2261" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="1914" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000204">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2210" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000205">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2144" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000206">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2079" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000207">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="354" Y="2287" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="354" Y="2287" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="1" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="1934" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000209">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="627" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="627" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000210">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="600" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="600" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000212">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="498" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="498" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000213">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="471" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="471" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000228">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3541" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3541" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000229">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5039" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5039" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000230">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3568" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3568" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000231">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5089" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5089" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000234">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="6372" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="6372" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4160" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4160" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000235">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6452" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6452" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1127" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000236">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="6412" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="6412" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4204" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4204" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000238">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="6563" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="6563" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4259" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4259" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000239">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="6631" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="6631" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4311" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4311" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000242">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="1072" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="1072" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4987" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000243">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="6893" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="6893" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1532" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000244">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6893" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6893" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1512" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000248">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5174" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5174" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000249">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3476" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3476" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000254">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5148" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5148" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000255">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3449" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3449" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000262">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="169" Y="1481" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="169" Y="1481" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1109" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000263">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1531" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1531" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1169" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000264">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1556" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1556" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1233" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000265">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2212" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2212" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1876" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000266">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2163" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2163" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1857" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000267">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2236" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2236" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1894" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000268">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="776" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="776" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2164" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000269">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="746" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="746" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2099" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000270">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="716" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="716" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2056" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000271">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2287" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2287" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1934" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000272">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2261" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2261" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1914" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000288">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4561" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4561" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="442" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000294">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5223" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5223" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="960" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000295">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="954" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="954" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000296">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5323" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5323" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1037" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000297">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5489" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5489" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="850" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000299">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4998" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4998" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="753" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000300">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5761" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5761" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1098" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000301">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5860" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5860" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="753" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000304">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="6228" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="6228" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1011" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000305">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="6339" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="6339" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1099" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000306">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="6523" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="6523" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1193" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000325">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="168" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|3|2" Font2="Arial|12.9|3|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="168" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|3|2" Font2="Arial|12.9|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000326">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2712" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2712" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000328">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2685" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2685" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000331">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2757" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|1|2" Font2="Arial|12.9|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2757" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|1|2" Font2="Arial|12.9|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000473">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2023" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2023" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1078" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1724" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="64" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="64" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000494">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="716" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="716" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="996" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2039" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000495">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="213" Y="379" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="213" Y="379" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1092" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2186" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000496">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="112" Y="379" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="112" Y="379" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1050" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2121" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000500">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="500" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="500" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="6" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1054" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000502">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="806" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="806" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2230" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000503">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="871" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="871" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="871" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="871" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000504">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="854" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="854" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="854" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="854" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000505">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000506">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="761" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="761" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="761" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="761" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000511">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000512">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000515">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7115" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="7115" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000527">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2392" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2392" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="797" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="797" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000529">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2357" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2357" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="783" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="783" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000530">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000534">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2377" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2377" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1449" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1345" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000535">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="314" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="314" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="314" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="314" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000536">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="298" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="298" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="298" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="298" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000537">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="283" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="283" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="283" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="283" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000538">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="268" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="268" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="268" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="268" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000539">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="221" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="221" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="221" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="221" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000540">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="206" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="206" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="206" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="206" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000541">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="191" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="191" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="191" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="191" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000542">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="175" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="175" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="175" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="175" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000543">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="160" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="160" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="160" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="160" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000544">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="142" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="142" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="142" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="142" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000555">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="6992" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="6992" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000578">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="252" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="252" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="252" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="252" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000579">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="237" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="237" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="237" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="237" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000580">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4507" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4507" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="413" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000581">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000582">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="3174" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="3174" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="156" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000583">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="3159" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="3159" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="156" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000584">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4492" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4492" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="413" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000590">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="490" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="490" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2270" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000591">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="490" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="490" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1285" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000604">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="6749" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="6749" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000605">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000606">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1036" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1036" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4710" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4710" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000622">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5464" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5464" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5464" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5464" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5464" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5464" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000625">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5280" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000626">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5283" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5283" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5299" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000628">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5311" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000629">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5273" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5273" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5330" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000631">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5311" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000632">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5273" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5273" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5330" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000664">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="970" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="970" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4068" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4068" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000665">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="970" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="970" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4068" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4068" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000686">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="970" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="970" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4068" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="4068" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000687">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4324" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4324" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="340" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000688">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4366" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4366" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="405" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000691">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1547" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2244" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000692">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1569" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2266" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000693">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1198" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000696">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2604" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2604" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1589" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2285" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000697">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="3187" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="3187" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="2105" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="230" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000698">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="2538" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="235" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000699">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="3058" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="451" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000700">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4804" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4804" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="3494" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="730" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000701">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4932" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4932" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="3707" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="942" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000702">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6162" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6162" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="4776" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1259" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_001093">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="13.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|20|0|2" Font2="Segoe UI|20|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="13.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|20|0|2" Font2="Segoe UI|20|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="43.3" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|20|0|2" Font2="Segoe UI|20|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="13.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|20|0|2" Font2="Segoe UI|20|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="43.3" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|20|0|2" Font2="Segoe UI|20|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="43.3" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|20|0|2" Font2="Segoe UI|20|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001172">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1410" Hor="0" Ver="4" SpX="2" SpY="10" Font1="Segoe UI|16|0|2" Font2="Segoe UI|16|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1410" Hor="0" Ver="4" SpX="2" SpY="10" Font1="Segoe UI|16|0|2" Font2="Segoe UI|16|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="259" Hor="0" Ver="4" SpX="2" SpY="10" Font1="Segoe UI|16|0|2" Font2="Segoe UI|16|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="479" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001173">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1360" Hor="0" Ver="4" SpX="2" SpY="10" Font1="Segoe UI|16|0|2" Font2="Segoe UI|16|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1360" Hor="0" Ver="4" SpX="2" SpY="10" Font1="Segoe UI|16|0|2" Font2="Segoe UI|16|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="210" Hor="0" Ver="4" SpX="2" SpY="10" Font1="Segoe UI|16|0|2" Font2="Segoe UI|16|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="461" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001310">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2072" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2072" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1773" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="549" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="2179" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_001693">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1380" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1380" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="230" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="93.5" Y="461" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001694">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1430" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1430" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="279" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="231" Y="479" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001729">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="123" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001772">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="329" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="329" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="329" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="329" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001773">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="345" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="345" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="345" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="345" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001774">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="360" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="360" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="360" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="360" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001776">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="375" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="375" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="375" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="375" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001783">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="390" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="390" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="390" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="390" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002858">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="502" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002862">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="104" Y="109" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="104" Y="109" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-76.2" Y="2130" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-76.2" Y="2130" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="66.9" Y="17197" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="66.9" Y="17197" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002866">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="68.9" Y="71.1" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="68.9" Y="71.1" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1501" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17260" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17260" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002917">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="169" Y="1340" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="169" Y="1340" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="189" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="451" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002939">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="40.3" Y="66.2" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="40.3" Y="66.2" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17154" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17154" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17154" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17154" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002941">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="74.2" Y="73" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="74.2" Y="73" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17217" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-109" Y="1643" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17217" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17217" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002972">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="2617" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="2617" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="769" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="577" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002973">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="910" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="910" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="2835" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="2835" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="769" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="577" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003031">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="981" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="981" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="350" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|16|0|2" Font2="Segoe UI|16|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="684" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|16|0|2" Font2="Segoe UI|16|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003035">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004058">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2090" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2090" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1080" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1792" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="549" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="2179" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_004059">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1080" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1810" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="549" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="2179" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_004071">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1689" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1689" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004072">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2732" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2732" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1689" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1689" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004096">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="3195" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="3195" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="783" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="783" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004119">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4037" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4037" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004120">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4057" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4057" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004123">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="128" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="128" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="128" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="128" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004137">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4078" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4078" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2498" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="578" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004138">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4098" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4098" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2498" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="578" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004140">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5357" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5357" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004152">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1103" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1103" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4782" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004154">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6491" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6491" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1165" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004156">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1103" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1103" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4782" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004158">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6708" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6708" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1245" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004159">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="6708" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="6708" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1332" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004604">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_005167">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="105" Y="128" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="105" Y="128" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-75.2" Y="2149" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-75.2" Y="2149" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="66.9" Y="17197" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="66.9" Y="17197" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005178">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="339" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="339" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="6" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2249" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="65.9" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="65.9" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005204">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1478" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005205">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1497" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005206">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1603" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005207">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1624" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005209">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2393" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005210">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005211">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2434" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005212">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2457" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005213">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2481" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005216">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005217">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005218">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005220">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005221">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005222">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005223">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005224">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005225">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005226">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005227">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2504" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2504" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2723" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="8542" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005229">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2524" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2524" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2743" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="8563" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005230">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2544" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2544" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2764" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="8583" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005231">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2568" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2568" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2787" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="8606" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005232">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2591" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2591" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="2810" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="8630" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005233">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2413" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2413" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1469" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1365" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005234">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2433" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2433" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1490" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1385" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005245">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="61.5" Y="296" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="61.5" Y="296" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-122" Y="1867" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005248">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="100" Y="71.1" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="100" Y="71.1" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005249">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="100" Y="89.7" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="100" Y="89.7" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005250">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="61.5" Y="386" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="61.5" Y="386" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-122" Y="1956" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005253">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="65.4" Y="71.1" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="65.4" Y="71.1" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005254">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="65.4" Y="89.7" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="65.4" Y="89.7" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005255">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="61.5" Y="475" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="61.5" Y="475" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-122" Y="2045" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005258">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="65.4" Y="71.1" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="65.4" Y="71.1" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005259">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="65.4" Y="89.7" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="65.4" Y="89.7" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005260">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="70.4" Y="565" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="70.4" Y="565" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-113" Y="2135" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005263">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="112" Y="652" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="112" Y="652" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005264">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="112" Y="671" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="112" Y="671" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005265">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-113" Y="2224" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005268">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="689" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="689" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005269">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="708" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="708" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005270">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="70.4" Y="728" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="70.4" Y="728" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-113" Y="2314" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005273">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="816" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="816" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005274">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="835" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="835" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005275">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="70.4" Y="855" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="70.4" Y="855" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-113" Y="2403" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005278">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="57.3" Y="943" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="57.3" Y="943" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005279">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="57.3" Y="961" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="57.3" Y="961" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005280">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="66.6" Y="982" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="66.6" Y="982" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-117" Y="2492" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005283">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="1069" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="1069" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005284">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="1088" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="1088" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005285">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="925" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="925" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="2849" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="2849" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="769" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="577" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005286">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="13183" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1644" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005287">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="465" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="465" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="5384" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="5384" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="5384" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="5384" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005288">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="480" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="480" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3119" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3119" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="651" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005290">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="509" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="509" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="81.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="487" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005291">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="523" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="523" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3163" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3163" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="96.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="487" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005292">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="538" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="538" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3177" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3177" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="114" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005293">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="552" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="552" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3192" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3192" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="134" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="54.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005294">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="567" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="53.6" Y="567" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3206" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3206" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="487" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005295">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-117" Y="2571" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1574" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3875" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005309">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="253" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="253" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005310">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="72.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="72.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="255" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="255" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="255" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="255" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005312">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="275" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="275" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="275" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="275" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005313">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="136" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="97.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005314">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="316" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="316" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="316" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="316" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005315">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="149" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005319">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="61.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005320">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="82.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="44" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005321">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="72.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="72.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="95.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005323">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="106" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="106" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="116" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005325">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005326">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005327">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="338" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="338" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005328">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="150" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="150" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005329">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005335">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5280" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005336">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5283" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5283" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5299" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005340">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5311" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005341">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5273" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5273" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5330" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005345">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5311" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005346">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5273" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="5273" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="5330" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005364">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6893" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6893" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1512" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005365">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="6893" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="6893" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1532" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005376">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4078" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4078" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2498" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="578" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005377">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4098" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4098" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2498" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="578" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005414">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005415">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="106" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="106" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="106" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="106" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="106" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="106" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005416">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005417">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005418">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="1254" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005419">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="1254" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005420">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2090" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2090" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1155" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1792" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="549" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="2179" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_005421">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1155" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1810" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="549" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="2179" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_005422">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="213" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="213" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="213" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="213" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="213" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="213" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005423">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005424">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005425">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005436">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="314" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="314" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="985" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005437">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3879" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005440">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3449" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3449" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005442">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3476" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="3476" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005443">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5124" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5124" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="873" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005444">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005445">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5323" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5323" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1037" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005446">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5686" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5686" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1027" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005447">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5729" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5729" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1069" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005448">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1556" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1556" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1233" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005450">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="63.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="63.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="63.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="63.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="63.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005451">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005583">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4519" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005584">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4535" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005585">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4550" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006322">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006325">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006326">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1531" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1531" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1169" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006329">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="63.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="63.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="63.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="63.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="63.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006341">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006350">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="373" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="116" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006352">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006353">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006354">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006355">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006356">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006358">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6162" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6162" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="4776" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1259" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006365">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006366">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006367">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006443">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006444">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006445">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006446">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006447">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006448">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006449">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006450">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006451">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006452">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006453">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006454">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006542">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006545">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006546">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006547">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006548">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006549">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006550">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006551">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006552">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006553">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006554">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006555">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006556">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006557">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006558">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006559">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006560">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006561">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006562">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006563">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006564">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006565">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006566">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006567">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006568">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006569">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006570">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006571">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006572">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006573">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006574">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006575">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006576">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006577">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006590">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006591">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006592">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006593">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006594">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006595">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006597">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006599">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006600">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006601">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006602">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006603">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006604">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006606">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006607">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006608">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006609">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006610">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006611">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006613">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006614">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006615">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006616">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006617">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006620">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006621">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006622">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006623">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006624">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006625">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006627">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006628">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006629">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006630">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006631">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006632">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006634">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006635">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006636">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006637">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006638">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006639">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006641">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006642">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006643">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006644">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006645">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006646">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006647">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006648">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006649">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006650">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006651">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006652">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006653">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006654">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006655">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006656">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006657">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006658">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006659">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006660">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006661">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006662">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006663">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006664">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006665">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006666">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006667">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006668">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006669">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006670">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006671">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006672">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006673">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006674">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006675">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006682">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006683">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006684">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006685">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006686">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006687">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006688">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006689">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006690">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006691">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006692">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006693">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006694">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006695">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006696">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006697">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006698">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006699">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006700">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006701">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006702">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006703">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006704">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006705">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006706">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006707">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006708">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006709">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006710">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006711">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006712">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006713">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006714">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006715">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006716">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006717">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006718">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006719">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006720">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006721">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006722">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006723">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006724">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006725">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006726">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006727">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006728">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006729">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006736">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006738">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006739">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006740">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006741">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006742">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006743">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006744">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006745">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006746">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006747">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006750">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006751">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006752">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006753">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006755">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006756">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006757">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006758">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006759">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006760">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="553" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="553" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="829" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11|0|2" Font2="Arial|11|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="752" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="553" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006762">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4804" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="4804" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="3494" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="730" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006763">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="627" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="627" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="2999" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006764">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="627" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="627" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="2999" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006765">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4257" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4257" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="319" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006766">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="627" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="627" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="2999" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006767">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="627" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="627" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="2999" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006768">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4257" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="4257" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="319" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006792">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="471" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="471" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006793">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="498" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="498" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006794">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006796">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006797">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006798">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006799">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006800">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006813">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006814">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006818">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006819">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006821">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006825">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006826">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006829">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006841">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006844">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006845">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006847">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006848">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006849">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006850">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006851">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006852">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006853">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006854">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006855">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006856">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006858">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1497" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006859">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1198" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006860">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1198" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006862">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1198" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006868">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="1254" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006869">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="1254" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006916">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007023">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007745">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="3615" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="3615" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2077" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007746">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5686" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5686" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1027" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007747">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5729" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="5729" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1069" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007748">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007749">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007750">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007751">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007752">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007753">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007754">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1198" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007756">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007757">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009519">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="380" Y="365" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2208" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_009520">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010087">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010088">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010090">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010092">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010359">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010793">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010903">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010996">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011033">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011034">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011568">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011569">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011578">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011581">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011582">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011583">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011584">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011585">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011586">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011587">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011588">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011589">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011590">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011591">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011592">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011593">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011597">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011598">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011599">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011600">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011601">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011603">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011614">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011615">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011616">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011617">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011618">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011619">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011620">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011622">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011623">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011624">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011625">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011626">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011627">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011628">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011629">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011630">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011632">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011637">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011638">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011639">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011640">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011641">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011642">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011643">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011645">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011646">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011648">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011649">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011650">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011651">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011652">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011653">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011654">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011657">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011658">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011659">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011660">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011661">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011662">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011663">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011664">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011665">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011666">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011667">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011701">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="231" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_011703">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011706">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011707">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
      <VC ID="INI400_012786">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013021">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013024">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013025">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013026">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013051">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013052">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.6" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="22.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_013598">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013599">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="237" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="587" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="587" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="465" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_013602">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013604">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013606">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013607">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013701">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013705">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013706">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013707">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013713">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013721">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013722">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013732">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_014428">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_014433">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000001">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000002">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000006">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000008">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="KRS116_000009">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="KRS116_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000012">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="KRS116_000013">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000014">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="KRS116_000017">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="KRS116_000018">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="699" Y="1556" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="699" Y="1556" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1264" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|16.9|0|2" Font2="Arial|16.9|0|2" EqStyle="7" />
      </VC>
      <VC ID="KRS116_000019">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1505" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1505" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1505" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1505" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1505" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="1505" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
      </VC>
      <VC ID="KRS116_000021">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000022">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1531" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1531" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1531" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1531" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1531" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="377" Y="1531" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="20" />
      </VC>
      <VC ID="KRS116_000024">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000002">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="68.9" Y="71.1" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="68.9" Y="71.1" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1501" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17260" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17260" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000008">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-121" Y="1118" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-121" Y="1118" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3096" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="89.3" Y="3096" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1168" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4667" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000014">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000015">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000016">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000019">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000020">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000021">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000022">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000023">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000024">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000025">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000026">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000027">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000028">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000029">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000030">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000032">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000033">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000034">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000035">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="4461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="3058" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="451" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000036">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000037">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="150" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="150" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000038">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000039">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="338" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="338" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000040">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000041">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000042">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6708" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="6708" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1245" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000043">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4507" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|1|2" Font2="Arial|12.9|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4507" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|1|2" Font2="Arial|12.9|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000044">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4507" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|1|2" Font2="Arial|12.9|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4507" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|1|2" Font2="Arial|12.9|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000045">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000046">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4507" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|1|2" Font2="Arial|12.9|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4507" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|1|2" Font2="Arial|12.9|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000047">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000052">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000053">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000054">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000055">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000056">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000057">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000058">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000059">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000060">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000061">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000062">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000063">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000064">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000065">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000066">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000067">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000068">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000069">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000070">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000071">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000072">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000073">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000074">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000075">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000076">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000077">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000078">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000079">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000080">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000081">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000082">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000083">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000084">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000085">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000086">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000087">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="90.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000088">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000089">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000090">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000091">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000092">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-113" Y="2224" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17280" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000093">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="689" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="689" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000094">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="708" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="708" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1520" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="90" Y="17323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000095">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2604" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2604" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1589" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2285" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="PAI127_000096">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000097">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI127_000098">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2685" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2685" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TDoubleInput Name="TDoubleInput" ID="44" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|0|3" VarName="μ↓s←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="100" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="c↓nom←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="82" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="φ↓ef←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="101" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="ϕ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="76" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Coeff↓d←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TCheckBox Name="TDesign" ID="75" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Design" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000075">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TComboBox Name="DTypeDir" ID="106" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="TypeDir" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1|2" Index="1">
          <Texts>
            <ENU>Auto|One direction|Both directions</ENU>
          </Texts>
        </TComboBox>
        <TCheckBox Name="" ID="80" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="CalSecOrder" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000080">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TCheckBox Name="" ID="81" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="19" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="CalcImp" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000081">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TCheckBox Name="" ID="108" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="CalMinEcc" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000108">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TCheckBox Name="TCheckBox" ID="41" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="EquivMoment" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000041">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TCheckBox Name="TCheckBox" ID="42" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="CombiULS" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000042">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TDoubleInput Name="" ID="90" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="M↓end,z←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="89" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="M↓end,y←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="88" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="M↓beg,z←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="87" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="M↓beg,y←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="86" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="M↓z←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="99" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="M↓y←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="84" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="N↓Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TCheckBox Name="" ID="79" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="IsoCol" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000079">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TComboBox Name="DMemberType" ID="78" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="CMemberType" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1|2" Index="2">
          <Texts>
            <ENU>Member in compression (column)|Member not in compression (beam)|Automatic determination</ENU>
          </Texts>
        </TComboBox>
        <TCheckBox Name="" ID="97" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="BraceMemberY" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000097">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TCheckBox Name="" ID="98" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="BraceMemberZ" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000098">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TDoubleInput Name="" ID="103" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="m↓z←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="102" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="m↓y←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="94" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="H" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="96" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="β↓zz←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="93" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="L↓z←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="95" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="β↓yy←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="92" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="L↓y←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TConcreteSectionLibrary Name="" ID="64" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="59" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="1" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="" SelectedCS="1" Units="0" ReinfTabsVis="True" TabBG="-2894893" SelTab="-1">
          <CS SelReinf="0" H="400e-3" B="401e-3" />
          <Reinf Ver="1" Stirrup="0" Stirrup_D="10e-3" Stirrup_ss="150e-3" Stirrup_α="90" c_upper="40e-3" D_upper="20e-3" N_upper="2" c_lower="40e-3" D_lower="20e-3" N_lower="2" />
        </TConcreteSectionLibrary>
        <TCustomLibrary Name="" ID="68" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="REINF.EC" DataFile="EC_Reinf.xml" Collapsed="True" UseCombo="False" Category="Inclined top branch" Item="B 500 B">
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
                <P>B 500 B</P>
                <P>500</P>
                <P>1.08</P>
                <P>540</P>
                <P>434.78</P>
                <P>0.05</P>
                <P>0.045</P>
                <P>0.002173913</P>
                <P>200000</P>
                <P>B</P>
                <P>true</P>
                <P>-0.05;-470.60;</P>
                <P>-0.0022;-434.78;</P>
                <P>0;0;</P>
                <P>0.0022;434.78;</P>
                <P>0.05;470.60;</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TCustomLibrary Name="" ID="65" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="60" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="CONCRETE.EC" DataFile="EC_Concrete.xml" Collapsed="True" UseCombo="False" Category="Bilinear" Item="C 25/30">
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
                <P>C 25/30</P>
                <P>25</P>
                <P>30</P>
                <P>33</P>
                <P>2.6</P>
                <P>1.8</P>
                <P>3.3</P>
                <P>31</P>
                <P>2.1</P>
                <P>3.5</P>
                <P>2</P>
                <P>3.5</P>
                <P>1.75</P>
                <P>3.5</P>
                <P>2</P>
                <P>0;0;</P>
                <P>-0.00175;-16666670;</P>
                <P>-0.0035;-16666670;</P>
                <P>true</P>
                <P>32</P>
                <P>0.2</P>
                <P>2500</P>
                <P>13.1</P>
                <P>0.2</P>
                <P>4500</P>
                <P>0.0006</P>
                <P>1.00E-05</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TCustomLibrary Name="" ID="105" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Czech CSN-EN">
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
      </TPanel>
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_INI400_002917">
      <ENU>"Material"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006365">
      <ENU>"Material characteristic"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006366">
      <ENU>"Concrete cross-sections characteristics:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006367">
      <ENU>"Reinforcement cross-sections characteristics"</ENU>
    </Item>
    <Item TranslateID="STRING_018D39E8">
      <ENU>"Conditions cannot be calculated (biaxial bending is taken as default). Imperfections should be taken into account in both directions."</ENU>
    </Item>
    <Item TranslateID="STRING_199CE32B">
      <ENU>"The first order moment M↓y ←is constant (M↓01y←=M↓y←=M↓02y←) or equivalent first bending moment M↓0ey← is used."</ENU>
    </Item>
    <Item TranslateID="STRING_2630B566">
      <ENU>"Reinforcement is distributed perpendicular to the plane of bending z-z┴."</ENU>
    </Item>
    <Item TranslateID="STRING_3035448F">
      <ENU>"Minimum eccentricity is not taken into account for SLS combination, see §5.2(3)."</ENU>
    </Item>
    <Item TranslateID="STRING_3422FBFC">
      <ENU>"Error"</ENU>
    </Item>
    <Item TranslateID="STRING_3A0403A0">
      <ENU>"Biaxial bending is considered - most unfavourable direction cannot be recognized (η↓y←=η↓z←). Imperfections will be taken into account in both directions."</ENU>
    </Item>
    <Item TranslateID="STRING_3C457AB8">
      <ENU>"It is necessary to increase amount of reinforcement or to increase dimensions of cross-section or to increase quality of the used materials or used different method for calculation second order eccentricity"</ENU>
    </Item>
    <Item TranslateID="STRING_406A20E3">
      <ENU>"Type of member is determined automatically as member in compression (column), because N↓Ed← &lt; N↓com← (imperfections will be taken into account)."</ENU>
    </Item>
    <Item TranslateID="STRING_42434A4E">
      <ENU>"Curvature will be estimated based on assumption of symmetrical cross-section and reinforcement."</ENU>
    </Item>
    <Item TranslateID="STRING_42D11A70">
      <ENU>"Basic curvature is calculated from strain of concrete because reinforcement is not defined."</ENU>
    </Item>
    <Item TranslateID="STRING_45024405">
      <ENU>"The reinforcement characteristics are calculated for circular cross-section and for inputted ratio of reinforcement"</ENU>
    </Item>
    <Item TranslateID="STRING_4E933991">
      <ENU>"Length of the member is calculated as height of the building, because member is not isolated."</ENU>
    </Item>
    <Item TranslateID="STRING_568AC22C">
      <ENU>"Uniaxial bending is set by user, but biaxial bending conditions are fulfilled! Most unfavourable direction is determined as y-y┴ (η↓y&gt;←η↓z←). Imperfections will be taken into account only in this direction."</ENU>
    </Item>
    <Item TranslateID="STRING_5857C2EF">
      <ENU>"The geometrical imperfection is switched off by the user."</ENU>
    </Item>
    <Item TranslateID="STRING_59513806">
      <ENU>" K↓r← &lt; 0 , because  n↓u← - n &lt;0,therefore value K↓r← =" &amp; K↓r.lim← &amp; " will be used. "</ENU>
    </Item>
    <Item TranslateID="STRING_59CE275E">
      <ENU>"Uniaxial bending is set by user, but biaxial bending conditions are fulfilled! Default direction y-y┴ is determined, because most unfavourable direction cannot be recognized (η↓y←=η↓z←)."</ENU>
    </Item>
    <Item TranslateID="STRING_5C604367">
      <ENU>"Not defined"</ENU>
    </Item>
    <Item TranslateID="STRING_62042395">
      <ENU>"List of errors/warnings/notes: "</ENU>
    </Item>
    <Item TranslateID="STRING_68E19D3A">
      <ENU>"There is no errors, warnings and notes"</ENU>
    </Item>
    <Item TranslateID="STRING_6F24B24E">
      <ENU>"Most unfavourable direction is determined as z-z┴ (η↓z&gt;←η↓y←). Imperfections will be taken into account only in this direction."</ENU>
    </Item>
    <Item TranslateID="STRING_7124E7BE">
      <ENU>"Most unfavourable direction is determimed as y-y┴ (η↓y←&gt;η↓z←). Imperfections will be taken into account only in this direction."</ENU>
    </Item>
    <Item TranslateID="STRING_73DB2630">
      <ENU>"The first order moment M↓z← is constant (M↓01z←=M↓z←=M↓02z←) or equivalent first bending moment M↓0ez← is used."</ENU>
    </Item>
    <Item ID="STRING_8A1A8A08">
      <ENU>""</ENU>
    </Item>
    <Item TranslateID="STRING_8AB4D602">
      <ENU>"Axis"</ENU>
    </Item>
    <Item TranslateID="STRING_91B5E5A2">
      <ENU>"Member is considered as isolated member in z-z┴ direction."</ENU>
    </Item>
    <Item TranslateID="STRING_95B5EF56">
      <ENU>"The second order eccentricity is not calculated because of SLS combination."</ENU>
    </Item>
    <Item TranslateID="STRING_9619EBED">
      <ENU>"Warning"</ENU>
    </Item>
    <Item TranslateID="STRING_96A541FF">
      <ENU>"Equivalent first order moment is considered, see §5.8.8.2(2)."</ENU>
    </Item>
    <Item TranslateID="STRING_B16CC772">
      <ENU>"The second order eccentricity is switched off by the user."</ENU>
    </Item>
    <Item TranslateID="STRING_B2C2AF34">
      <ENU>"NO"</ENU>
    </Item>
    <Item TranslateID="STRING_B4DA459C">
      <ENU>"The effective creep ratio is taken into account as creep ratio"</ENU>
    </Item>
    <Item TranslateID="STRING_B518FC9C">
      <ENU>"Member is considered as isolated member in y-y┴ direction."</ENU>
    </Item>
    <Item TranslateID="STRING_B71FF29D">
      <ENU>"Uniaxial bending is set by user - most unfavourable direction is determined as y-y┴ (η↓y&gt;←η↓z←). Imperfections will be taken into account only in this direction."</ENU>
    </Item>
    <Item TranslateID="STRING_B89FE70A">
      <ENU>"The calculation of imperfection is switched off by the user (e↓i← = 0)."</ENU>
    </Item>
    <Item TranslateID="STRING_BA9D78AD">
      <ENU>"Type of member is determined automatically as member not in compression (beam), because N↓Ed← ≥ N↓com← (imperfections will not be taken into account.)"</ENU>
    </Item>
    <Item TranslateID="STRING_BEB983D7">
      <ENU>"Second order effect is not calculated for SLS combination."</ENU>
    </Item>
    <Item TranslateID="STRING_C2EAB742">
      <ENU>"Note"</ENU>
    </Item>
    <Item TranslateID="STRING_C392D377">
      <ENU>"Curvature will be estimated based on assumption of non-symmetrical cross-section and reinforcement."</ENU>
    </Item>
    <Item TranslateID="STRING_CC9DF75C">
      <ENU>"The reinforcement characteristics are calculated for rectangle cross-section and for inputted ratio of reinforcement"</ENU>
    </Item>
    <Item TranslateID="STRING_D092B566">
      <ENU>"Reinforcement is distributed perpendicular to the plane of bending y-y┴."</ENU>
    </Item>
    <Item TranslateID="STRING_D183F1A4">
      <ENU>"The calculation of second order eccentricity is switched off by the user (e↓2←=0)."</ENU>
    </Item>
    <Item TranslateID="STRING_D8CFC1F3">
      <ENU>"Uniaxial bending is set by user, but biaxial bending conditions are fulfilled! Most unfavourable direction is determined as z-z┴ (η↓z&gt;←η↓y←). Imperfections will be taken into account only in this direction."</ENU>
    </Item>
    <Item TranslateID="STRING_DC380D01">
      <ENU>"The reinforcement characteristics are calculated for general cross-section and for inputted ratio of reinforcement"</ENU>
    </Item>
    <Item TranslateID="STRING_DF7D8A96">
      <ENU>"Reinforcement is distributed also parallel to the plane of bending z-z┴."</ENU>
    </Item>
    <Item TranslateID="STRING_E6DCDD26">
      <ENU>"Length of the member is calculated according to formula MAX(L↓y←, L↓z←), because member is isolated."</ENU>
    </Item>
    <Item TranslateID="STRING_E7D58A96">
      <ENU>"Reinforcement is distributed also parallel to the plane of bending y-y┴."</ENU>
    </Item>
    <Item TranslateID="STRING_E995F4F6">
      <ENU>"Uniaxial bending is set by user - default direction y-y┴ is considered, because most unfavourable direction cannot be recognized (η↓y←=η↓z←)."</ENU>
    </Item>
    <Item TranslateID="STRING_F0046C7C">
      <ENU>"Minimum eccentricity is switched off by the user."</ENU>
    </Item>
    <Item TranslateID="STRING_F3F34151">
      <ENU>"Uniaxial bending is set by user - most unfavourable direction is determined as z-z┴ (η↓z&gt;←η↓y←). Imperfections will be taken into account only in this direction."</ENU>
    </Item>
    <Item TranslateID="STRING_F639C448">
      <ENU>"Uniaxial bending - imperfections should be taken into account only in the most unfavourable direction."</ENU>
    </Item>
    <Item TranslateID="STRING_F78F1EF6">
      <ENU>"Biaxial bending - imperfections should be taken into account in both directions."</ENU>
    </Item>
    <Item TranslateID="STRING_F8B7336D">
      <ENU>"Biaxial bending is set by user. Imperfections will be taken into account in both directions."</ENU>
    </Item>
    <Item TranslateID="STRING_FB3EAD75">
      <ENU>"The reinforcement characteristics are calculated for defined user reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000068">
      <ENU>"Inclination to express geometric imperfection:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000073">
      <ENU>"Eccentricity caused by geometric imperfection:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000091">
      <ENU>"Minimum eccentricity"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000102">
      <ENU>"First order eccentricity including imperfection"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000122">
      <ENU>"Basic curvature (χ↓0←=1/r↓0←):"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000138">
      <ENU>"λ↓y← ≤ λ↓limy← = " &amp; λ↓y← &amp; " ≤ " &amp; λ↓limy←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000195">
      <ENU>"Effective depth of cross-section:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000200">
      <ENU>"b = " &amp; b</ENU>
    </Item>
    <Item ID="TEXT_INI400_000201">
      <ENU>"h = " &amp; h</ENU>
    </Item>
    <Item ID="TEXT_INI400_000202">
      <ENU>"A↓c← = " &amp; A↓c←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000203">
      <ENU>"I↓cy← = " &amp; I↓cy←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000204">
      <ENU>"I↓sz← = " &amp; I↓sz←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000205">
      <ENU>"I↓sy← = " &amp; I↓sy←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000206">
      <ENU>"A↓s← = " &amp; A↓s←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000207">
      <ENU>"I↓cz← = " &amp; I↓cz←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000235">
      <ENU>"λ↓y←/λ↓z← = " &amp; λ↓y←/λ↓z← &amp; " = " &amp; Ratio↓λyz← &amp; " ≤ 2 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000242">
      <ENU>'[ABS(e↓0Edz←+e↓2z←)/h↓eq←]/[ABS(e↓0Edy←+e↓2y←)/b↓eq←]' &amp; " = " &amp; [ABS(e↓0Edz←+e↓2z←)/h↓eq←]/[ABS(e↓0Edy←+e↓2y←)/b↓eq←] &amp; " = " &amp; Ratio↓ezy← &amp; " ≤ 0.2 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000262">
      <ENU>Description("f↓yd←") &amp; ":"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000263">
      <ENU>"Strain of the reinforcement at the peak yield strength f↓yd←:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000264">
      <ENU>Description("f↓cd←") &amp; ":"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000265">
      <ENU>Description("h") &amp; ":"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000266">
      <ENU>Description("b") &amp; ":"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000267">
      <ENU>Description("A↓c←") &amp; ":"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000268">
      <ENU>Description("I↓sz←") &amp; ":"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000269">
      <ENU>Description("I↓sy←") &amp; ":"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000270">
      <ENU>Description("A↓s←") &amp; ":"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000271">
      <ENU>Description("I↓cz←") &amp; ":"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000272">
      <ENU>Description("I↓cy←") &amp; ":"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000288">
      <ENU>Description("α↓h←") &amp; ":"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000294">
      <ENU>"Balanced axial force:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000296">
      <ENU>"Correction factor depending on axial load (K↓r←):"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000297">
      <ENU>"Factor taking account of creep (K↓φ←):"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000299">
      <ENU>"Radius of gyration of reinforcement:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000300">
      <ENU>"Curvature with influence of creep and the applied axial load (χ=1/r):"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000301">
      <ENU>"Factor depending on the curvature distribution"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000304">
      <ENU>"Dimension of equivalent rectangular cross-section:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000305">
      <ENU>"Slenderness ratio condition:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000306">
      <ENU>"Relative eccentricity condition:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000325">
      <ENU>"N↓Ed← ≥ N↓com← = " &amp; N↓Ed← &amp; " ≥ " &amp; N↓com← &amp; " ... "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000328">
      <ENU>"Limit axial force to consider member as compression:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000331">
      <ENU>"N↓Ed← &lt; N↓com ←= " &amp; N↓Ed← &amp; " &lt; " &amp; N↓com← &amp; " ... "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000502">
      <ENU>"The distances from the edge to centre of reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000544">
      <ENU>"Set output value before calculation"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000584">
      <ENU>"Length of the member for calculation geometric imperfection:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001172">
      <ENU>"Long reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001173">
      <ENU>"Concrete"</ENU>
    </Item>
    <Item ID="TEXT_INI400_004152">
      <ENU>"λ↓y←/λ↓z← = " &amp; λ↓y←/λ↓z← &amp; " = " &amp; Ratio↓λyz← &amp; " &gt; 2 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_004154">
      <ENU>"λ↓z←/λ↓y← = " &amp; λ↓z←/λ↓y← &amp; " = " &amp; Ratio↓λzy← &amp; " ≤ 2 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_004156">
      <ENU>"λ↓z←/λ↓y← = " &amp; λ↓z←/λ↓y← &amp; " = " &amp; Ratio↓λzy← &amp; " &gt; 2 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_004158">
      <ENU>'[ABS(e↓0Edy←+e↓2y←)/b↓eq←]/[ABS(e↓0Edz←+e↓2z←)/h↓eq←]' &amp; " = " &amp; [ABS(e↓0Edy←+e↓2y←)/b↓eq←]/[ABS(e↓0Edz←+e↓2z←)/h↓eq←] &amp; " = " &amp; Ratio↓eyz← &amp; " &gt; 0.2 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_004159">
      <ENU>'[ABS(e↓0Edz←+e↓2z←)/h↓eq←]/[ABS(e↓0Edy←+e↓2y←)/b↓eq←]' &amp; " = " &amp; [ABS(e↓0Edz←+e↓2z←)/h↓eq←]/[ABS(e↓0Edy←+e↓2y←)/b↓eq←] &amp; " = " &amp; Ratio↓ezy← &amp; " &gt; 0.2 =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005443">
      <ENU>"Effective depth of cross-section:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005445">
      <ENU>"Correction factor depending on axial load:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_005448">
      <ENU>Description("ε↓cu←") &amp; ":"</ENU>
    </Item>
    <Item ID="TEXT_INI400_005450">
      <ENU>"ε↓cu← = " &amp; ε↓cu←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006326">
      <ENU>"Modulus of elasticity:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006329">
      <ENU>"E↓s← = " &amp; E↓s←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006350">
      <ENU>Functions1D_EWN.FListEWN(obEWN, TR("List of errors/warnings/notes: "), TR("There is no errors, warnings and notes"))</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006825">
      <ENU>"not compression member"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006826">
      <ENU>"compression member"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006829">
      <ENU>"... 1↑st← order effect"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006847">
      <ENU>"condition fulfilled"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006848">
      <ENU>"condition not fulfilled"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006849">
      <ENU>"condition fulfilled"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006850">
      <ENU>"condition not fulfilled"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006851">
      <ENU>"condition fulfilled"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006852">
      <ENU>"condition not fulfilled"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006853">
      <ENU>"condition fulfilled"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006854">
      <ENU>"condition not fulfilled"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000001">
      <ENU>"Second order effect and imperfections"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000003">
      <ENU>"Second order eccentricity"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000005">
      <ENU>"Geometric imperfection"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000006">
      <ENU>"First order eccentricity"</ENU>
    </Item>
    <Item ID="TEXT_PAI127_000015">
      <ENU>"(" &amp; 'sign↓y←' &amp; "=" &amp; sign↓y← &amp; ")"</ENU>
    </Item>
    <Item ID="TEXT_PAI127_000016">
      <ENU>"(" &amp; 'sign↓z←' &amp; "=" &amp; sign↓z← &amp; ")"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000017">
      <ENU>"First order moment eccentricity"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000026">
      <ENU>"Equivalent first order moment and eccentricity:"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000027">
      <ENU>"Curvature"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000028">
      <ENU>"(relative)"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000029">
      <ENU>"(ultimate)"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000030">
      <ENU>"Second order eccentricity including simplified criteria"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000032">
      <ENU>"... 2↑nd← order effect"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000033">
      <ENU>"Reduction factor for number of vertical members:"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000036">
      <ENU>"First order moment and eccentricity:"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000040">
      <ENU>"Biaxial/uniaxial bending conditions"</ENU>
    </Item>
    <Item ID="TEXT_PAI127_000042">
      <ENU>'[ABS(e↓0Edy←+e↓2y←)/b↓eq←]/[ABS(e↓0Edz←+e↓2z←)/h↓eq←]' &amp; " = " &amp; [ABS(e↓0Edy←+e↓2y←)/b↓eq←]/[ABS(e↓0Edz←+e↓2z←)/h↓eq←] &amp; " = " &amp; Ratio↓eyz← &amp; " &gt; 0.2 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_PAI127_000043">
      <ENU>"λ↓y← &gt; λ↓limy← = " &amp; λ↓y← &amp; " &gt; " &amp; λ↓limy←</ENU>
    </Item>
    <Item ID="TEXT_PAI127_000044">
      <ENU>"λ↓z← ≤ λ↓limz← = " &amp; λ↓z← &amp; " ≤ " &amp; λ↓limz←</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000045">
      <ENU>"... 1↑st← order effect"</ENU>
    </Item>
    <Item ID="TEXT_PAI127_000046">
      <ENU>"λ↓z← &gt; λ↓limz← = " &amp; λ↓z← &amp; " &gt; " &amp; λ↓limz←</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000047">
      <ENU>"... 2↑nd← order effect"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000066">
      <ENU>"Unfavourable direction"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000067">
      <ENU>"Unfavourable direction"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000090">
      <ENU>"Second order effect and imperfections"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000097">
      <ENU>"Compression member"</ENU>
    </Item>
    <Item TranslateID="TEXT_PAI127_000098">
      <ENU>"Check condition:"</ENU>
    </Item>
  </Texts>
</Root>