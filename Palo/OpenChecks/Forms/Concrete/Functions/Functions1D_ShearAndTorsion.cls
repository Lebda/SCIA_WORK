<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="cbb109a2-e905-4e52-a85c-1b7b55293e63">
  <CodeEditor>
    <SourceCode Collapsed="1|129|169|204|247|276|300|449|460|465|479|563|581|686|695|696|719|750|771|789" BreakPoints="">→VAL316_048335BLOCK("Function for width of cross-section for shear") { 
    object Function_bw(double CssID, double ForcesID, double Type) { 
        object Results →VAL316_015424= ReadResults(ResultType.Combi); 
        
        bool recalculate_bw →KRS010_000020= true; 
        string objectID →VAL316_015448= "CssID" &amp; CssID &amp; "_bw" &amp; Type; 
        IF(Results.Contains(objectID)) { 
            object bw_results →KRS010_000019= ReadResults(ResultType.Combi, objectID); 
            IF((Type == 0 &amp;&amp; bw_results.Contains("bw")) || (Type == 1 &amp;&amp; bw_results.Contains("bw1"))) { 
                recalculate_bw →KRS010_000021= false; 
            } 
        } 
        
        IF(recalculate_bw) { 
            double b↓w← →VAL316_048336= 0; 
            IF(Type == 0 || Type == 1) { 
                object Posbw →VAL316_048337= CONCRETE.Shear.PositionWidthCssForShear(CssID, ForcesID, Type); 
                double y↓bw← →VAL316_048338= Posbw.X; 
                double z↓bw← →VAL316_048339= Posbw.Y; 
                b↓w← →VAL316_048340= CONCRETE.Shear.WidthCssForShear(CssID, ForcesID, Type); 
                //new development
                //                Forces →VAL316_048360= Concrete.GetForces(ForcesID); 
                //                double α↓V← →VAL316_048361= CONCRETE.Shear.AngleShearForceResultant(Forces.Vy, Forces.Vz); 
                //                IF(α↓V← &lt; 0) { 
                //                    α↓V← →VAL316_048362= α↓V←+180; 
                //                } 
                //                object ReinfTensionCssChar →VAL316_048369= CONCRETE.Characteristics(CssID, ForcesID, CONCRETE.CharType.TensionCharReinf, CONCRETE.StiffnessType.Linear); 
                //                double b↓w,cog← →VAL316_048370= CONCRETE.Shear.CssDimension(CssID, ReinfTensionCssChar.CenterY, ReinfTensionCssChar.CenterZ, α↓V←); 
            } 
            //new development
            //            IF(Type == 0 &amp;&amp; b↓w← &lt; b↓w,cog←) { 
            //                Forces →VAL316_048354= Concrete.GetForces(ForcesID); 
            //                double α↓V← →VAL316_048355= CONCRETE.Shear.AngleShearForceResultant(Forces.Vy, Forces.Vz); 
            //                IF(α↓V← &lt; 0) { 
            //                    α↓V← →VAL316_048356= α↓V←+180; 
            //                } 
            //                //            double IDFibreCC →VAL316_048341= CONCRETE.StressStrain.GetFibreExtremeStrainMin(CssID, ForcesID); 
            //                //            object CoordFibreCC →VAL316_048342= CONCRETE.StressStrain.GetFibrePositionReinf(CssID, IDFibreCC); 
            //                object[] TensionArea →VAL316_048343= Concrete.POD.TensilePartOfCss(CssID, ForcesID); 
            //                double CreatePartCss →INI400_001732= CONCRETE.CreateRegionOfCrossSection(1001, CssID, TensionArea); 
            //                double SetZeroForcesID →VAL316_048367= 666; 
            //                →VAL316_048345Concrete.SetForcesId(SetZeroForcesID, 0, 0, 0, 0, 0, 0); 
            //                double A↓ct← →VAL316_048347= CONCRETE.Characteristics(1001, SetZeroForcesID, CONCRETE.CharType.WholeCharConcrete, CONCRETE.StiffnessType.Linear).A; 
            //                double x↓ct← →VAL316_048353= CONCRETE.Shear.CssDimension(1001, 0, 0, α↓V←); 
            //                
            //                IF(x↓ct← &gt; 0) { 
            //                    b↓w← →VAL316_048351= A↓ct←/x↓ct←; 
            //                    object CoordCT →VAL316_048368= Concrete.General.CentreOfPolygon(TensionArea); 
            //                    y↓bw← →VAL316_048364= CoordCT.X; 
            //                    z↓bw← →VAL316_048365= CoordCT.Y; 
            //                } 
            //        } 
            
            IF(IO.CS.Geometry.FormCode == 2002) { 
                IF(Type == 0) { 
                    //KRS: bw is calculated in the center of gravity of tensiled reinf, in direction parallel with neutral axis
                    Forces →VAL316_048341= Concrete.GetForces(ForcesID); 
                    double α↓V← →VAL316_048342= CONCRETE.Shear.AngleShearForceResultant(Forces.Vy, Forces.Vz)+90; 
                    IF(α↓V← &lt; 0) { 
                        α↓V← →VAL316_048343= α↓V←+180; 
                    } 
                    object ReinfTensionCssChar →VAL316_048344= CONCRETE.Characteristics(CssID, ForcesID, CONCRETE.CharType.TensionCharReinf, CONCRETE.StiffnessType.Linear); 
                    double b↓w,cog← →VAL316_048345= CONCRETE.Shear.CssDimension(CssID, ReinfTensionCssChar.CenterY, ReinfTensionCssChar.CenterZ, α↓V←); 
                    
                    double Bar↓st,max← →VAL316_048346= CONCRETE.StressStrain.GetReinfExtremeStrainMax(CssID, ForcesID); 
                    object BarPosition →VAL316_048347= CONCRETE.StressStrain.GetFibrePositionReinf(CssID, Bar↓st,max←); 
                    double b↓w,tens← →VAL316_048348= CONCRETE.Shear.CssDimension(CssID, BarPosition.Y, BarPosition.Z, α↓V←); 
                    double b↓w← →VAL316_048349= MIN(MAX(b↓w,cog←, b↓w,tens←), 0.6*IO.CS.Geometry.D); 
                    
                    IF(b↓w,cog← &gt; b↓w,tens←) { 
                        double y↓bw← →VAL316_048350= ReinfTensionCssChar.CenterY; 
                        double z↓bw← →VAL316_048351= ReinfTensionCssChar.CenterZ; 
                    } ELSE { 
                        double y↓bw← →VAL316_048352= BarPosition.Y; 
                        double z↓bw← →VAL316_048353= BarPosition.Z; 
                    } 
                } 
                IF(Type == 1) { 
                    double α↓NA← →VAL316_048354= CONCRETE.POD.AngleOfNeutralAxis(CssID, ForcesID); 
                    double α↓dz← →VAL316_048355= 90+α↓NA←; 
                    double d →VAL316_048356= CONCRETE.Shear.EffectiveHeigthProjection(CssID, ForcesID, α↓dz←, 0.9); 
                    double z →VAL316_048357= CONCRETE.Shear.InnerleverArmProjection(CssID, ForcesID, α↓dz←, 0.9, 1); 
                    double c_pom →VAL316_048358= d-z; 
                    double D →VAL316_048359= IO.CS.Geometry.D; 
                    //                double r↓sv← →VAL316_048335= D-c_pom; 
                    //                double e →VAL316_048337= 0.5*(D+2*r↓sv←)-d; 
                    double b↓w,c← →VAL316_048360= 2*POWER(c_pom*(2*D/2-c_pom), 0.5); 
                    //                double b↓w,t← →VAL316_048336= 2*POWER(e*(2*r↓sv←/2-e), 0.5); 
                    
                    object COG_TensReinf →VAL316_048361= CONCRETE.CenterOfGravity.TensionReinf(CssID, ForcesID); 
                    double b↓w,t← →VAL316_048362= CONCRETE.Shear.CssDimension(CssID, COG_TensReinf.X, COG_TensReinf.Y, 0); 
                    double y↓bw← →VAL316_048363= COG_TensReinf.X; 
                    double z↓bw← →VAL316_048364= COG_TensReinf.Y; 
                    double b↓w← →VAL316_048365= MIN(b↓w,c←, b↓w,t←); 
                } 
            } 
            IF(b↓w← == 0) { 
                object ExtFunct →VAL316_048366= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\Functions1D_Geometrics.CLC"); 
                object Forces →VAL316_048367= Concrete.GetForces(ForcesID); 
                double Angle →VAL316_048368= CONCRETE.Shear.AngleShearForceResultant(Forces.Vy, Forces.Vz); 
                IF(Angle &lt; 0) { Angle →VAL316_048369= Angle+180; } 
                object pom →VAL316_048370= ExtFunct.MinWidthCss(CssID, Angle+90, 0); 
                b↓w← →VAL316_048376= pom.bw; 
                y↓bw← →VAL316_048377= pom.ybw; 
                z↓bw← →VAL316_048378= pom.zbw; 
            } 
            
            IF(Type == 0) { //KRS: can be simplified - not necessary to save bw and bw1 independently
                →KRS010_000009SaveResults(ResultType.Combi, objectID, new Structure("ybw", y↓bw←, "zbw", z↓bw←, "bw", b↓w←)); 
            } ELSE { 
                →KRS010_000018SaveResults(ResultType.Combi, objectID, new Structure("ybw1", y↓bw←, "zbw1", z↓bw←, "bw1", b↓w←)); 
            } 
            
        } ELSE { 
            IF(Type == 0) { 
                b↓w← →VAL316_048379= bw_results.bw; 
                y↓bw← →VAL316_048380= bw_results.ybw; 
                z↓bw← →VAL316_048381= bw_results.zbw; 
            } ELSE { 
                b↓w← →VAL316_048385= bw_results.bw1; 
                y↓bw← →VAL316_048386= bw_results.ybw1; 
                z↓bw← →VAL316_048387= bw_results.zbw1; 
            } 
        } 
        return new Structure("ybw", y↓bw←, "zbw", z↓bw←, "bw", b↓w←); 
    } 
} 

→INI400_006974BLOCK("Function for creating thin-walled cross-section from stirrups") { 
    bool CssForTorsionFromStirrup(double CssID, double t↓ef←, double StirrupIDTor, out object ParamTorsion) { 
        
        bool bCssForTorsion →INI400_007024= False; 
        object Results →VAL316_048454= ReadResults(ResultType.Combi); 
        IF(!Results.Contains("ParamTorsion1")) { 
            double&lt;mm↑2←,2&gt; A↓k← →INI400_006975= 0; 
            double&lt;mm,2&gt; u↓k← →INI400_006976= 0; 
            
            
            IF(StirrupIDTor &gt;= 0) { 
                object[] OuterPol →INI400_006966= CONCRETE.Torsion.PolygonCssForTorsion(CssID, t↓ef←, 0, StirrupIDTor); 
                object[] CentreLinePol →INI400_005247= CONCRETE.Torsion.PolygonCssForTorsion(CssID, t↓ef←, 1, StirrupIDTor); 
                object[] InnerPol →INI400_006967= CONCRETE.Torsion.PolygonCssForTorsion(CssID, t↓ef←, 2, StirrupIDTor); 
                IF(CentreLinePol.Count &gt; 2) { 
                    →INI400_005238TEXT("Perimeter of area and area enclosed by the centre line of effective cross-section"); 
                    u↓k← →INI400_005239= CONCRETE.Torsion.ParameterUkFromPolygon(CentreLinePol); 
                    A↓k← →INI400_005241= CONCRETE.Torsion.ParameterAkFromPolygon(CentreLinePol); 
                    bCssForTorsion →INI400_007025= True; 
                } 
            } 
            →INI400_007492ParamTorsion.Set("Type", 1); 
            →INI400_007493ParamTorsion.Set("tef", t↓ef←); 
            →INI400_007494ParamTorsion.Set("uk", u↓k←); 
            →INI400_007495ParamTorsion.Set("Ak", A↓k←); 
            →INI400_007496ParamTorsion.Set("OuterPolygon", OuterPol); 
            →INI400_007497ParamTorsion.Set("CentreLinePolygon", CentreLinePol); 
            →INI400_007498ParamTorsion.Set("InnerPolygon", InnerPol); 
            →VAL316_048455SaveResults(ResultType.Combi, "ParamTorsion1", ParamTorsion); 
            →VAL316_048456SaveResults(ResultType.Combi, "bCssForTorsion1", bCssForTorsion); 
        } ELSE { 
            ParamTorsion →VAL316_048457= Results.ParamTorsion1; 
            bCssForTorsion →VAL316_048458= Results.bCssForTorsion1; 
            
        } 
        
        return bCssForTorsion; 
    } 
} 

→INI400_006977BLOCK("Function for creating thin-walled cross-section from cross-section") { 
    bool CssForTorsionFromCss(double CssID, double t↓ef←, out object ParamTorsion) { 
        object Results →VAL316_048459= ReadResults(ResultType.Combi); 
        bool bCssForTorsion →VAL316_048460= False; 
        IF(!Results.Contains("ParamTorsion2")) { 
            double&lt;mm↑2←,2&gt; A↓k← →INI400_008780= 0; 
            double&lt;mm,2&gt; u↓k← →INI400_008781= 0; 
            object[] OuterPol →INI400_006992= CONCRETE.Torsion.PolygonCssForTorsion(CssID, t↓ef←, 0, -1); 
            object[] CentreLinePol →INI400_006993= CONCRETE.Torsion.PolygonCssForTorsion(CssID, t↓ef←, 1, -1); 
            object[] InnerPol →INI400_006994= CONCRETE.Torsion.PolygonCssForTorsion(CssID, t↓ef←, 2, -1); 
            
            IF(CentreLinePol.Count &gt; 2) { 
                →INI400_005305TEXT("Perimeter of area and area enclosed by the centre line of effective cross-section"); 
                u↓k← →INI400_005263= CONCRETE.Torsion.ParameterUkFromPolygon(CentreLinePol); 
                A↓k← →INI400_005265= CONCRETE.Torsion.ParameterAkFromPolygon(CentreLinePol); 
                bCssForTorsion →INI400_007028= True; 
            } 
            →INI400_007485ParamTorsion.Set("Type", 2); 
            →INI400_007486ParamTorsion.Set("tef", t↓ef←); 
            →INI400_007487ParamTorsion.Set("uk", u↓k←); 
            →INI400_007488ParamTorsion.Set("Ak", A↓k←); 
            →INI400_007489ParamTorsion.Set("OuterPolygon", OuterPol); 
            →INI400_007490ParamTorsion.Set("CentreLinePolygon", CentreLinePol); 
            →INI400_007491ParamTorsion.Set("InnerPolygon", InnerPol); 
            →VAL316_048461SaveResults(ResultType.Combi, "ParamTorsion2", ParamTorsion); 
            →VAL316_048462SaveResults(ResultType.Combi, "bCssForTorsion2", bCssForTorsion); 
        } ELSE { 
            ParamTorsion →VAL316_048463= Results.ParamTorsion2; 
            bCssForTorsion →VAL316_048464= Results.bCssForTorsion2; 
            
        } 
        return bCssForTorsion; 
    } 
} 

→INI400_007000BLOCK("Function for creating thin-walled cross-section from effective rectengular CSS") { 
    bool CssForTorsionFromRectCss(double CssID, double A↓c←, double u↓c←, double t↓ef←, out object ParamTorsion) { 
        object Results →VAL316_048465= ReadResults(ResultType.Combi); 
        bool bCssForTorsion →VAL316_048466= False; 
        IF(!Results.Contains("ParamTorsion3")) { 
            
            double&lt;mm↑2←,2&gt; A↓k← →INI400_008782= 0; 
            double&lt;mm,2&gt; u↓k← →INI400_008783= 0; 
            
            double CssIDTor →INI400_005229= CONCRETE.Torsion.CreateEffRectCssForTorsion(999, CssID); 
            object[] OuterPol →INI400_006997= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 0, -1); 
            object[] CentreLinePol →INI400_006998= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 1, -1); 
            object[] InnerPol →INI400_006999= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 2, -1); 
            Diskr →INI400_005775= 16*A↓c←-u↓c←↑2←; 
            
            IF(CssIDTor == 999 &amp;&amp; Diskr &lt;= 0) { 
                →INI400_005221TEXT("Calculation dimensions of effective rectangular cross-section"); 
                double&lt;mm,2&gt; h↓ef← →INI400_005219= [u↓c←+SQRT(u↓c←↑2←-16*A↓c←)]/4; 
                double&lt;mm,2&gt; b↓ef← →INI400_005220= A↓c←/h↓ef←; 
                →INI400_005296TEXT("Perimeter of area and area enclosed by the centre line of effective cross-section"); 
                u↓k← →INI400_005222= 2*[h↓ef←+b↓ef←]-4*t↓ef←; 
                A↓k← →INI400_005223= [h↓ef←-t↓ef←]*[b↓ef←-t↓ef←]; 
                bCssForTorsion →INI400_007030= True; 
            } 
            
            →INI400_007471ParamTorsion.Set("Type", 3); 
            →INI400_007472ParamTorsion.Set("tef", t↓ef←); 
            →INI400_007473ParamTorsion.Set("uk", u↓k←); 
            →INI400_007474ParamTorsion.Set("Ak", A↓k←); 
            →INI400_007475ParamTorsion.Set("OuterPolygon", OuterPol); 
            →INI400_007476ParamTorsion.Set("CentreLinePolygon", CentreLinePol); 
            →INI400_007477ParamTorsion.Set("InnerPolygon", InnerPol); 
            →VAL316_048467SaveResults(ResultType.Combi, "ParamTorsion3", ParamTorsion); 
            →VAL316_048468SaveResults(ResultType.Combi, "bCssForTorsion3", bCssForTorsion); 
        } ELSE { 
            ParamTorsion →VAL316_048469= Results.ParamTorsion3; 
            bCssForTorsion →VAL316_048470= Results.bCssForTorsion3; 
            
        } 
        return bCssForTorsion; 
    } 
} 

→INI400_007405BLOCK("Function for creating thin-walled cross-section from input parameters") { 
    bool CssForTorsionFromUserInput(double t↓ef.inp←, double A↓k.inp←, double u↓k.inp←, out object ParamTorsion) { 
        double&lt;mm↑2←,2&gt; A↓k← →INI400_007406= 0; 
        double&lt;mm,2&gt; u↓k← →INI400_007407= 0; 
        double&lt;mm,2&gt; t↓ef← →INI400_007444= 0; 
        bool Test →INI400_007408= False; 
        object[] OuterPol →INI400_007411= null; 
        object[] CentreLinePol →INI400_007412= null; 
        object[] InnerPol →INI400_007413= null; 
        
        →INI400_007430TEXT("Effective wall thickness"); 
        t↓ef← →INI400_007431= t↓ef.inp←; 
        →INI400_007432TEXT("Perimeter of area and area enclosed by the centre line of effective cross-section"); 
        u↓k← →INI400_007433= u↓k.inp←; 
        A↓k← →INI400_007434= A↓k.inp←; 
        IF(u↓k← &gt; 0 &amp;&amp; A↓k← &gt; 0) { 
            Test →INI400_007435= True; 
        } 
        
        →INI400_007478ParamTorsion.Set("Type", 4); 
        →INI400_007479ParamTorsion.Set("tef", t↓ef←); 
        →INI400_007480ParamTorsion.Set("uk", u↓k←); 
        →INI400_007481ParamTorsion.Set("Ak", A↓k←); 
        →INI400_007482ParamTorsion.Set("OuterPolygon", OuterPol); 
        →INI400_007483ParamTorsion.Set("CentreLinePolygon", CentreLinePol); 
        →INI400_007484ParamTorsion.Set("InnerPolygon", InnerPol); 
        return Test; 
    } 
} 
→VAL316_048472BLOCK("Function for creating thin-walled cross-section automatically") { 
    bool CssForTorsionAuto(double CssID, double A↓c←, double u↓c←, double t↓ef←, double StirrupIDTor, out object ParamTorsion) { 
        object ParamTorsion →VAL316_048482= new Structure(); 
        IF(StirrupIDTor &gt;= 0) { 
            IF(CssForTorsionFromStirrup(CssID, t↓ef←, StirrupIDTor, out ParamTorsion)) { 
                →VAL316_048473CssForTorsionFromStirrup(CssID, t↓ef←, StirrupIDTor, out ParamTorsion); 
                double test →VAL316_048479= ParamTorsion.uk; 
                return True; 
            } 
        } 
        IF(CssForTorsionFromCss(CssID, t↓ef←, out ParamTorsion)) { 
            →VAL316_048474CssForTorsionFromCss(CssID, t↓ef←, out ParamTorsion); 
            return True; 
        } 
        IF(CssForTorsionFromRectCss(CssID, A↓c←, u↓c←, t↓ef←, out ParamTorsion)) { 
            →VAL316_048475CssForTorsionFromRectCss(CssID, A↓c←, u↓c←, t↓ef←, out ParamTorsion); 
            return True; 
        } 
        return False; 
        
    } 
} 


→INI400_007394BLOCK("Function for calculation torsion parameter according to selected method") { 
    bool CssForTorsion(double Type, double CssID, double StirrupIDTor, double A↓c←, double u↓c←, double t↓ef←, double t↓ef.inp←, double A↓k.inp←, double u↓k.inp←, out object ParamTorsion, object[] obEWN, object[] NumberEWN) { 
        double IndexEWN →INI400_007457= 5; 
        bool Test →INI400_007395= False; 
        double Number↓N← →INI400_007397= 0; 
        double Number↓W← →INI400_007398= 0; 
        →INI400_008772string sType; 
        object ExtFunct →INI400_013586= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\Functions1D_EWN.CLC"); 
        
        SWITCH(Type) { 
            CASE 0 :  { 
                →INI400_007393CssForTorsionAuto(CssID, A↓c←, u↓c←, t↓ef←, StirrupIDTor, out ParamTorsion); 
                IF(ParamTorsion.uk &gt; 0 &amp;&amp; ParamTorsion.Ak &gt; 0) { 
                    SWITCH(ParamTorsion.Type) { 
                        CASE 1 :  { 
                            sType →INI400_008773= TR("Method = From torsional stirrup"); 
                        } 
                        CASE 2 :  { 
                            sType →INI400_008774= TR("Method = Inputted cross-section"); 
                        } 
                        CASE 3 :  { 
                            sType →INI400_008775= TR("Method = Effective rectangular cross-section"); 
                        } 
                        DEFAULT :  { 
                            sType →INI400_008776= TR("None"); 
                        } 
                    } 
                    →INI400_008779TEXT("Perimeter of area and area enclosed by the centre line of effective cross-section"); 
                    →INI400_008778TEXT("u↓k← = " &amp; Val(ParamTorsion.uk*1000, 2) &amp; " mm"); 
                    →INI400_008777TEXT("A↓k← = " &amp; Val(ParamTorsion.Ak*1000000, 2) &amp; " mm↑2←"); 
                    Test →INI400_007499= True; 
                    string DescriptionN →INI400_007374= TR("Parameters for torsion [value A↓k← and u↓k←] are calculated by automatic method") &amp; " [" &amp; sType &amp; "]."; 
                    string SolutionN →INI400_007375= TR(""); 
                    string TypeN →INI400_007376= TR("Note"); 
                    →INI400_013587ExtFunct.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_007378= Number↓N←+1; 
                    →INI400_007379obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } ELSE { 
                    string DescriptionN →INI400_007380= TR("Parameters for torsion value [A↓k← and u↓k←] is not possible to calculate by automatic method."); 
                    string SolutionN →INI400_007381= TR("To use method based on user input value of parameters for torsion."); 
                    string TypeN →INI400_007382= TR("Warning"); 
                    →INI400_013588ExtFunct.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓W← →INI400_007384= Number↓W←+1; 
                    →INI400_007385obEWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
            } 
            CASE 1 :  { 
                →INI400_007445CssForTorsionFromStirrup(CssID, t↓ef←, StirrupIDTor, out ParamTorsion); 
                IF(ParamTorsion.uk &gt; 0 &amp;&amp; ParamTorsion.Ak &gt; 0) { 
                    Test →INI400_007400= True; 
                    string DescriptionN →INI400_007032= TR("Parameters for torsion [value A↓k← and u↓k←] are calculated for equivalent thin walled section, which is created around selected stirrup for torsion."); 
                    string SolutionN →INI400_007033= TR(""); 
                    string TypeN →INI400_007034= TR("Note"); 
                    →INI400_013589ExtFunct.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_003881= Number↓N←+1; 
                    →INI400_007036obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } ELSE { 
                    →INI400_009965CssForTorsionFromCss(CssID, t↓ef←, out ParamTorsion); 
                    string DescriptionN →INI400_007340= TR("Parameters for torsion [value A↓k← and u↓k←] is not possible to calculate around selected stirrup for torsion. Parameters was calculated from inputts-section."); 
                    string SolutionN →INI400_007341= TR("To change geometry of selected stirrup or to select different method for calculation parameters for torsion."); 
                    string TypeN →INI400_007342= TR("Warning"); 
                    →INI400_013590ExtFunct.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓W← →INI400_007344= Number↓W←+1; 
                    →INI400_007345obEWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
            } 
            CASE 2 :  { 
                →INI400_007403CssForTorsionFromCss(CssID, t↓ef←, out ParamTorsion); 
                IF(ParamTorsion.uk &gt; 0 &amp;&amp; ParamTorsion.Ak &gt; 0) { 
                    Test →INI400_007401= True; 
                    string DescriptionN →INI400_007347= TR("Parameters for torsion [value A↓k← and u↓k←] are calculated for equivalent thin walled section which is created from input cross-section."); 
                    string SolutionN →INI400_007348= TR(""); 
                    string TypeN →INI400_007349= TR("Note"); 
                    →INI400_013591ExtFunct.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_007351= Number↓N←+1; 
                    →INI400_007352obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } ELSE { 
                    string DescriptionN →INI400_007353= TR("Parameters for torsion [value A↓k← and u↓k←] is not possible to calculate from input cross-section."); 
                    string SolutionN →INI400_007354= TR("To select different method for calculation parameters for torsion."); 
                    string TypeN →INI400_007355= TR("Warning"); 
                    →INI400_013592ExtFunct.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓W← →INI400_007357= Number↓W←+1; 
                    →INI400_007358obEWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
            } 
            CASE 3 :  { 
                →INI400_007404CssForTorsionFromRectCss(CssID, A↓c←, u↓c←, t↓ef←, out ParamTorsion); 
                IF(ParamTorsion.uk &gt; 0 &amp;&amp; ParamTorsion.Ak &gt; 0) { 
                    Test →INI400_007402= True; 
                    string DescriptionN →INI400_007360= TR("Parameters for torsion [value A↓k← and u↓k←] are calculated for effective rectangular Css, which is created from input Css to area and perimeter of effective cross-section were same as area and perimeter of input Css."); 
                    string SolutionN →INI400_007361= TR(""); 
                    string TypeN →INI400_007362= TR("Note"); 
                    →INI400_013593ExtFunct.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_007364= Number↓N←+1; 
                    →INI400_007365obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } ELSE { 
                    string DescriptionN →INI400_007366= TR("Parameters for torsion [value A↓k← and u↓k←] is not possible to calculate for effective rectangular cross-section."); 
                    string SolutionN →INI400_007367= TR("To select different method for calculation parameters for torsion."); 
                    string TypeN →INI400_007368= TR("Warning"); 
                    →INI400_013594ExtFunct.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓W← →INI400_007370= Number↓W←+1; 
                    →INI400_007371obEWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
            } 
            CASE 4 :  { 
                →INI400_007443CssForTorsionFromUserInput(t↓ef.inp←, A↓k.inp←, u↓k.inp←, out ParamTorsion); 
                
                IF(ParamTorsion.uk &gt; 0 &amp;&amp; ParamTorsion.Ak &gt; 0) { 
                    Test →INI400_007436= True; 
                    string DescriptionN →INI400_007386= TR("Parameters for torsion [value t↓ef←, A↓k← and u↓k←] are taken into account from input parameters."); 
                    string SolutionN →INI400_007387= TR(""); 
                    string TypeN →INI400_007388= TR("Note"); 
                    →INI400_013595ExtFunct.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_007390= Number↓N←+1; 
                    →INI400_007391obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } ELSE { 
                    string DescriptionN →INI400_007437= TR("Some input parameters for torsion [value A↓k← or u↓k←] are zero."); 
                    string SolutionN →INI400_007438= TR("To define non-zero parameters for torsion."); 
                    string TypeN →INI400_007439= TR("Warning"); 
                    →INI400_013596ExtFunct.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓W← →INI400_007441= Number↓W←+1; 
                    →INI400_007442obEWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
            } 
        } 
        
        NumberEWN[0] →INI400_007458= 0; 
        NumberEWN[1] →INI400_007459= Number↓W←; 
        NumberEWN[2] →INI400_007460= Number↓N←; 
        return Test; 
    } 
    
} 
→INI400_008709BLOCK("Class for calculation basic parametres for torsion asl, Asl and tef") { 
    class TorsionCssParameters { 
        // inputs
        →INI400_008710double CssID; 
        →INI400_008711double StirrupID; 
        →INI400_008712double StripeWidth; 
        
        //private variables
        →INI400_008750double a↓sl_pom←; 
        →INI400_008717bool IsLongReinfAreaTor; 
        →INI400_008718bool IsMinDistanceLongReinfAreaTor; 
        
        //outputs
        →INI400_008721double a↓sl←; 
        →INI400_008722double A↓sl←; 
        
        //methods
        void Init(double _CssID, double _StirrupID, double _StripeWidth) { 
            IF(CssID != _CssID || StirrupID != _StirrupID || COMPARE(StripeWidth, _StripeWidth, 6) != 0) { 
                CssID →INI400_008726= _CssID; 
                StirrupID →INI400_008727= _StirrupID; 
                StripeWidth →INI400_008728= _StripeWidth; 
                IsLongReinfAreaTor →INI400_008732= False; 
                IsMinDistanceLongReinfAreaTor →INI400_008733= False; 
                IsEffectiveWallThickness →INI400_008734= False; 
            } 
        } 
        
        double GetLongReinfAreaTor() { 
            A↓sl← →INI400_008738= CONCRETE.Torsion.LongReinAreaForTorsion(CssID, StirrupID, StripeWidth); 
            return A↓sl←; 
        } 
        
        double GetMinDistanceLongReinfAreaTor() { 
            double a↓sl_pom← →INI400_008751= CONCRETE.Torsion.MinDistReinfInsideStirrup(CssID, StirrupID, StripeWidth); 
            IF(a↓sl_pom← &lt; 999) { 
                a↓sl← →INI400_005197= a↓sl_pom←; 
            } ELSE { 
                a↓sl← →INI400_008000= 0; 
            } 
            return a↓sl←; 
        } 
    } 
} 

// function for creating table of stirrups around sesction
→VAL316_048316BLOCK("Function for creating table of stirrups around section") { 
    void GetTableStirrupAroundSection(object ShearReinf, object FontsAndColors, double dx, bool AvgValues) { 
        object StirrupArroundSections →VAL316_048319= Sort(ShearReinf.StirrupsAroundSection, "stirrupPos"); 
        double Ncol →VAL316_048281= 8; 
        double Nrow →VAL316_048282= StirrupArroundSections.Count+1; 
        IF(AvgValues) { 
            Nrow →VAL316_048329= Nrow+1; 
        } 
        
        object T →VAL316_048283= new Table(Ncol); 
        T[0][0].Value →VAL316_048284= "ID"; 
        T[0][1].Value →VAL316_048285= "Zone"; 
        T[0][2].Value →VAL316_048286= "x↓s←&lt;BR&gt;[mm]"; 
        T[0][3].Value →VAL316_048287= "ϕ↓s←&lt;BR&gt;[mm]"; 
        T[0][4].Value →VAL316_048288= "s↓s←&lt;BR&gt;[mm]"; 
        T[0][5].Value →VAL316_048289= "n↓s←&lt;BR&gt;[]"; 
        T[0][6].Value →VAL316_048290= "α↓s←&lt;BR&gt;[↑o←]"; 
        T[0][7].Value →VAL316_048291= "f↓ywk←&lt;BR&gt;[MPa]"; 
        
        FOR(i, 0, StirrupArroundSections.Count-1) { 
            IF(StirrupArroundSections[i].NumberOfStirrupLinks &gt; 0) { 
                T[i+1][0].Value →VAL316_048292= i+1; 
                T[i+1][1].Value →VAL316_048293= StirrupArroundSections[i].zoneID; 
                T[i+1][2].Value →VAL316_048294= Val((StirrupArroundSections[i].stirrupPos-dx)*1000, 2); 
                T[i+1][3].Value →VAL316_048295= Val(StirrupArroundSections[i].stirrupDiam*1000, 2); 
                T[i+1][4].Value →VAL316_048296= Val(StirrupArroundSections[i].stirrupDistanceSs*1000, 2); 
                T[i+1][5].Value →VAL316_048297= StirrupArroundSections[i].NumberOfStirrupLinks; 
                T[i+1][6].Value →VAL316_048298= Val(StirrupArroundSections[i].angleOfStirrupFromAxisX, 2); 
                T[i+1][7].Value →VAL316_048299= Val(StirrupArroundSections[i].fywk/1000000, 2); 
            } 
        } 
        T.Padding.All →VAL316_048305= Convert.ToSingle(→VAL316_048306FontsAndColors.PaddingTableOverall()); 
        T.Padding.Left →VAL316_048307= 5; 
        T.Font →VAL316_048308= FontsAndColors.TableCellsFont(); 
        T.BorderPen →VAL316_048309= FontsAndColors.TableBorderPen(); 
        T.GridPen →VAL316_048310= FontsAndColors.TableGridPen(); 
        T[0].Font →VAL316_048311= FontsAndColors.TableHeaderFont(); 
        T[0].BorderPen →VAL316_048312= FontsAndColors.TableBorderPen(); 
        T.Rows[0].BackColor →VAL316_048313= →VAL316_048314FontsAndColors.ColorTableHeader(); 
        
        
        IF(AvgValues) { 
            T[StirrupArroundSections.Count+1][0].Value →VAL316_048320= "Avg."; 
            T[StirrupArroundSections.Count+1][1].Value →VAL316_048321= "-"; 
            T[StirrupArroundSections.Count+1][2].Value →VAL316_048322= "-"; 
            T[StirrupArroundSections.Count+1][3].Value →VAL316_048323= Val(ShearReinf.D*1000, 2); 
            T[StirrupArroundSections.Count+1][4].Value →VAL316_048324= Val(ShearReinf.ss*1000, 2); 
            T[StirrupArroundSections.Count+1][5].Value →VAL316_048325= ShearReinf.Ns; 
            T[StirrupArroundSections.Count+1][6].Value →VAL316_048326= Val(ShearReinf.Angle, 2); 
            T[StirrupArroundSections.Count+1][7].Value →VAL316_048327= Val(ShearReinf.fyk/1000000, 2); 
            T[StirrupArroundSections.Count+1].BorderPen →VAL316_048328= FontsAndColors.TableBorderPen(); 
        } 
        //    FOR(i, 0, Ncol-1) { 
        //        T.Columns[i].Alignment →VAL316_048300= ContentAlignment.MiddleCenter; 
        //        T.Columns[i].Width →VAL316_048301= Convert.ToSingle(→VAL316_048302FontsAndColors.TableWidth()/Ncol); 
        //    } 
        
        →VAL316_048315T.Draw(); 
        
        
        
        
    } 
} 
////InputParameter InputCalcTheta
//    object InputCalcTheta →VAL316_048398= new Structure(
//    "binteraction", False, // input parameters
//    "Auto_θ", Auto↓θ←, 
//    "Calc_sigma_swd", bReductionFywd, 
//    "θ_int", 999, 
//    "θ_inp", θ↓inp←, 
//    "ForcesID", ForcesID, 
//    "CssID", CssID, 
//    "AccidentalCombi", True, //TODO
//    "Coeff_d", Coeff↓d←, 
//    "Coeff_z", Coeff↓z←, 
//    "TypeMethod", TypeTorCss, 
//    "t_ef_inp", t↓ef.inp←, 
//    "A_k_inp", A↓k.inp←, 
//    "u_k_inp", u↓k.inp←, 
//    "bSimpleCalc", False
//    ); 

→VAL316_048397BLOCK("Function for calculation angle Theta") { 
    
    object CalculateAngleTheta(object InputCalcTheta, bool SaveResult) { 
        object Results →VAL316_048399= ReadResults(ResultType.Combi); 
        IF(!Results.Contains("CalcTheta") &amp;&amp; SaveResult) { 
            object CalcTheta →VAL316_048488= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\EC_Angle_Theta_new.clc"); 
            //Clearing of input/output structure
            object OutputCalcTheta →INI400_012061= new Structure(); 
            →INI400_007337CalcTheta.Calculate(InputCalcTheta, OutputCalcTheta); 
            →VAL316_048408SaveResults(ResultType.Combi, "CalcTheta", OutputCalcTheta); 
            
        } ELSE { 
            OutputCalcTheta →VAL316_048410= Results.CalcTheta; 
            
        } 
        return OutputCalcTheta; 
        
    } 
} 
→VAL316_048430BLOCK("Function for presentation angle Theta") { 
    object PresentAngleTheta(object InputCalcTheta, bool SaveResult, object[] obEWN, object[] NumberEWN, double IndexEWN) { 
        object OutputCalcTheta →VAL316_048432= CalculateAngleTheta(InputCalcTheta, SaveResult); 
        object Functions1D_EWN →INI400_013882= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\Functions1D_EWN.clc"); 
        double V↓Ed← →VAL316_048439= OutputCalcTheta.V_Ed; 
        double T↓Ed← →VAL316_048440= OutputCalcTheta.T_Ed; 
        →VAL316_048445bool bShear →VAL316_048500= OutputCalcTheta.bShear; 
        →VAL316_048446bool bTorsion →VAL316_048501= OutputCalcTheta.bTorsion; 
        double cotθ↓min← →VAL316_048502= COTG(OutputCalcTheta.θ_min); 
        double cotθ↓max← →VAL316_048503= COTG(OutputCalcTheta.θ_max); 
        →INI400_008074TEXT("- minimum value:"); 
        →KRS116_000026DrawThetaMinForCSN(InputCalcTheta.N_Ed, InputCalcTheta.Coeff_com, InputCalcTheta.A_c, InputCalcTheta.f_cd); 
        →INI400_008075TEXT("θ↓min← = " &amp; OutputCalcTheta.θ_min &amp; "° =&gt; cot(θ↓min←) = " &amp; cotθ↓min←) @REF("(§6.2.3(2))"); 
        →INI400_008076TEXT("- maximum value:"); 
        →INI400_008077TEXT("θ↓max← = " &amp; OutputCalcTheta.θ_max &amp; "° =&gt; cot(θ↓max←) = " &amp; cotθ↓max←) @REF("(§6.2.3(2))"); 
        →INI400_013950TEXT("- input/calculated value:"); 
        IF(InputCalcTheta.Auto_θ) { 
            IF(!InputCalcTheta.binteraction) { 
                double θ →VAL316_048434= OutputCalcTheta.θ; 
                double cotθ →INI400_007468= COTG(θ); 
                IF(bShear &amp;&amp; bTorsion) { 
                    sTheta →INI400_007708= "θ = " &amp; ROUND(θ, 3) &amp; "°, cot(θ)= " &amp; ROUND(cotθ, 3) &amp; ", "; //String cutted into three due translation of "and"
                    sTheta →INI400_007718= sTheta &amp; TR("and"); 
                    sTheta →INI400_007719= sTheta &amp; " (V↓Ed←/V↓Rd.max←)+(T↓Ed←/T↓Rd.max←) = " &amp; ROUND(V↓Ed←/10↑3←, 1) &amp; "/" &amp; ROUND(OutputCalcTheta.V_Rdmax_it/10↑3←, 1) &amp; "+" &amp; ROUND(ABS(T↓Ed←/10↑3←), 1) &amp; "/" &amp; ROUND(OutputCalcTheta.T_Rdmax_it/10↑3←, 1) &amp; " = " &amp; ROUND(OutputCalcTheta.Formula, 2); 
                    →VAL316_048435TEXT(sTheta); 
                    string DescriptionN →INI400_006529= TR("The value θ is calculated automatically by iterative calculation until condition [(V↓Ed←/V↓Rd.max←)+(T↓Ed←/T↓Rd.max←)] &lt;1 is fullfilled."); 
                    string SolutionN →INI400_006530= TR(""); 
                    string TypeN →INI400_006531= TR("Note"); 
                    →INI400_013883Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_006533= Number↓N←+1; 
                    →INI400_006534obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
                IF(bShear &amp;&amp; !bTorsion) { 
                    sTheta →INI400_007714= "θ = " &amp; ROUND(θ, 3) &amp; "°, cot(θ)= " &amp; ROUND(cotθ, 3) &amp; ", "; 
                    sTheta →INI400_007720= sTheta &amp; TR("and"); 
                    sTheta →INI400_007721= sTheta &amp; " V↓Ed←/V↓Rd.max← = " &amp; ROUND(V↓Ed←, 2) &amp; "/" &amp; ROUND(OutputCalcTheta.V_Rdmax_it, 2) &amp; " =" &amp; ROUND(OutputCalcTheta.Formula, 2); 
                    →INI400_007715TEXT(sTheta); 
                    string DescriptionN →INI400_006535= TR("The value θ is calculated automatically by iterative calculation until condition (V↓Ed←/V↓Rd.max←) &lt;1 is fullfilled."); 
                    string SolutionN →INI400_006536= TR(""); 
                    string TypeN →INI400_006537= TR("Note"); 
                    →INI400_013884Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_006539= Number↓N←+1; 
                    →INI400_006540obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
                IF(!bShear &amp;&amp; bTorsion) { 
                    sTheta →INI400_007716= "θ = " &amp; ROUND(θ, 3) &amp; "°, cot(θ)= " &amp; ROUND(cotθ, 3) &amp; ", "; 
                    sTheta →INI400_007722= sTheta &amp; TR("and"); 
                    sTheta →INI400_007723= sTheta &amp; " T↓Ed←/T↓Rd.max← = " &amp; ROUND(ABS(T↓Ed←), 2) &amp; "/" &amp; ROUND(OutputCalcTheta.T_Rdmax_it, 2) &amp; " =" &amp; ROUND(OutputCalcTheta.Formula, 2); 
                    →INI400_007717TEXT(sTheta); 
                    string DescriptionN →INI400_006542= TR("The value θ is calculated automatically by iterative calculation until condition (T↓Ed←/T↓Rd.max←) &lt;1  is fullfilled."); 
                    string SolutionN →INI400_006543= TR(""); 
                    string TypeN →INI400_006544= TR("Note"); 
                    →INI400_013885Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓N← →INI400_006546= Number↓N←+1; 
                    →INI400_006547obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
            } ELSE { 
                sTheta →INI400_007709= "θ = θ↓int← = " &amp; ROUND(θ, 3) &amp; "°, cot(θ) = " &amp; ROUND(cotθ, 3); 
                →VAL316_048437TEXT(sTheta); 
                string DescriptionN →INI400_006480= TR("Automatic calculation of angle is switched on, the calculated value from interaction V+T is taken into account."); 
                string SolutionN →INI400_006481= TR(""); 
                string TypeN →INI400_006482= TR("Note"); 
                →INI400_013886Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                Number↓N← →INI400_006484= Number↓N←+1; 
                →INI400_006485obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                
                
            } 
        } ELSE { 
            string DescriptionN →INI400_006486= TR("Automatic calculation of angle is switched off, user value is taken into account."); 
            string SolutionN →INI400_006487= TR(""); 
            string TypeN →INI400_006488= TR("Note"); 
            →INI400_013887Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
            Number↓N← →INI400_006490= Number↓N←+1; 
            →INI400_006491obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            IF(OutputCalcTheta.θ_inp &gt;= OutputCalcTheta.θ_min &amp;&amp; OutputCalcTheta.θ_inp &lt;= OutputCalcTheta.θ_max) { 
                sTheta →INI400_007710= "θ = θ↓inp← = " &amp; ROUND(θ, 3) &amp; "°, cot(θ) = " &amp; ROUND(cotθ, 3); 
                →INI400_001197TEXT(sTheta); 
            } ELSE { 
                IF(OutputCalcTheta.θ_inp &lt; OutputCalcTheta.θ_min) { 
                    θ →INI400_001198= OutputCalcTheta.θ_min; 
                    cotθ →INI400_003085= COTG(θ); 
                    sTheta →INI400_007711= "θ = θ↓inp← = " &amp; ROUND(θ, 3) &amp; " °&lt; θ↓min← = " &amp; ROUND(OutputCalcTheta.θ_min, 3) &amp; " ° =&gt; θ = θ↓min← = " &amp; ROUND(OutputCalcTheta.θ_min, 3) &amp; "°, cot(θ) = " &amp; ROUND(cotθ, 3); 
                    →INI400_001200TEXT(sTheta); 
                    string DescriptionN →INI400_006492= TR("The angle between the concrete compression strut and axis member is lesser than minimal value, therefore the recommended minimal value will be taken into account."); 
                    string SolutionN →INI400_006493= TR("To increase angle between concrete compression strut and longitudinal member axis or to change recommended minimal angle in setting of national annexes."); 
                    string TypeN →INI400_006494= TR("Warning"); 
                    →INI400_013888Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓W← →INI400_006603= Number↓W←+1; 
                    →INI400_006497obEWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
                IF(OutputCalcTheta.θ_inp &gt; OutputCalcTheta.θ_max) { 
                    sTheta →INI400_007712= "θ = θ↓inp← = " &amp; ROUND(θ, 3) &amp; " °&gt; θ↓max← = " &amp; ROUND(OutputCalcTheta.θ_max, 3) &amp; "° =  &gt; θ = θ↓max← = " &amp; ROUND(OutputCalcTheta.θ_max, 3) &amp; "°, cot(θ) = " &amp; ROUND(cotθ, 3); 
                    →INI400_001205TEXT(sTheta); 
                    string DescriptionN →INI400_006498= TR("The angle between the concrete compression strut and axis member is bigger than maximal value, therefore the recommended maximal value will be taken into account."); 
                    string SolutionN →INI400_006499= TR("To decrease angle between concrete compression strut and longitudinal member axis or to change recommended maximal angle in setting of national annexes."); 
                    string TypeN →INI400_006500= TR("Warning"); 
                    →INI400_013889Functions1D_EWN.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN); 
                    Number↓W← →INI400_006502= Number↓W←+1; 
                    →INI400_006503obEWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
            } 
        } 
    } 
} 
→VAL316_048490BLOCK("Basic function for calculation crack shear projection") { 
    void CalculateShearCrackProjectionBasic(double z, double θ, out double δ) { 
        IF(COMPARE(θ, 0, 6) == 0) { 
            δ →VAL316_048491= z; 
        } ELSE { 
            δ →VAL316_048497= z*COTG(θ); 
        } 
    } 
} 

→VAL316_048318BLOCK("Function for calculation crack shear projection") { 
    void CalculateShearCrackProjection(double CssID, double ForcesID, out double δ) { 
        double Coeff_d →INI400_012932= IO.Setup.Concrete.Solver.General.Coeffd; 
        double Coeff_z →INI400_012933= IO.Setup.Concrete.Solver.General.Coeffz; 
        object Forces →INI400_010996= Concrete.GetForces(ForcesID); 
        double α↓V← →INI400_012934= CONCRETE.Shear.AngleShearForceResultant(Forces.Vy, Forces.Vz); 
        IF(α↓V← &lt; 0) { 
            α↓V← →INI400_012935= α↓V←+180; 
        } 
        double α↓M← →INI400_012937= CONCRETE.POD.AngleOfNeutralAxis(CssID, ForcesID)+90; 
        double α↓MV← →INI400_012939= ABS(α↓M←-α↓V←); 
        object Functions1D_General →INI400_012930= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\Functions1D_General.clc"); 
        object ConcreteParam →INI400_012931= new Functions1D_General.ConCssParameters(); 
        →VAL316_000002ConcreteParam.Init(CssID, ForcesID, α↓V←, Coeff_d, Coeff_z, 1, True); 
        double&lt;mm,1&gt; h →VAL316_048330= ConcreteParam.GetHeigthCss(); 
        double θ →INI400_012929= IO.MemberData.Concrete.Solver.Shear.θ*180/Math.PI; 
        ////new development 
        //        double z →VAL316_000008= ConcreteParam.GetInnerArmForShear(0, 0.45); 
        double&lt;mm,1&gt; z →VAL316_048331= Coeff_d*Coeff_z*h; 
        →VAL316_048493CalculateShearCrackProjectionBasic(z, θ, out δ); 
    } 
} 

→VAL316_048411BLOCK("Function for calculation crack shear projection") { 
    void CalculateShearCrackProjectionNew(object InputCalcTheta, double θ↓inp←, out double δ) { 
        double Coeff_d →VAL316_048412= InputCalcTheta.Coeff_d; 
        double Coeff_z →VAL316_048413= InputCalcTheta.Coeff_z; 
        object Forces →VAL316_048414= Concrete.GetForces(InputCalcTheta.ForcesID); 
        double α↓V← →VAL316_048415= CONCRETE.Shear.AngleShearForceResultant(Forces.Vy, Forces.Vz); 
        IF(α↓V← &lt; 0) { 
            α↓V← →VAL316_048416= α↓V←+180; 
        } 
        double α↓M← →VAL316_048417= CONCRETE.POD.AngleOfNeutralAxis(InputCalcTheta.CssID, InputCalcTheta.ForcesID)+90; 
        double α↓MV← →VAL316_048418= ABS(α↓M←-α↓V←); 
        object Functions1D_General →VAL316_048419= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\Functions1D_General.clc"); 
        object ConcreteParam →VAL316_048420= new Functions1D_General.ConCssParameters(); 
        //                →VAL316_048421ConcreteParam.Init(CssID, ForcesID, α↓V←, Coeff_d, Coeff_z, 1, False); 
        //                double z →VAL316_048422= ConcreteParam.GetInnerArmForShear(α↓MV←, 0.45);
        →VAL316_048423ConcreteParam.Init(InputCalcTheta.CssID, InputCalcTheta.ForcesID, α↓V←, Coeff_d, Coeff_z, 1, False); 
        //        double z →VAL316_048424= ConcreteParam.GetInnerArmForShear(0, 0.45); 
        double&lt;mm,1&gt; h →VAL316_048425= ConcreteParam.GetHeigthCss(); 
        
        double θ →VAL316_048489= θ↓inp←; 
        IF(θ↓inp← == 0) { 
            object obAngleTheta →VAL316_048429= CalculateAngleTheta(InputCalcTheta, True); 
            double θ →VAL316_048426= obAngleTheta.θ; 
        } 
        
        double&lt;mm,1&gt; z →VAL316_048427= Coeff_d*Coeff_z*h; 
        // double&lt;mm,1&gt; z →VAL106_000001= ConcreteParam.GetInnerArmForShear(0, 0.45); 
        →VAL316_048494CalculateShearCrackProjectionBasic(z, θ, out δ); 
    } 
} 

→VAL316_048333BLOCK("Function for presentation stirrups inside projection of shear crack") { 
    void GetInfoAboutShearCrackprojection(object ShearReinf, object InputCalcTheta, double Theta, object FontsAndColors) { 
        IF(IO.IsExternCLC &amp;&amp; IO.IsDrawing &amp;&amp; ShearReinf.StirrupsAroundSection != null) { 
            double L →INI400_006055= IO.Beam.Member.Length; 
            string ShearCrackProjection →KRS106_000001= TR("Stirrups on the length of shear crack projection"); 
            IF(COMPARE(L, ShearReinf.CrackShearParam.L, 3) == 0) { 
                string ThetaFormula →KRS106_000005= " δ = L = " &amp; Val(ShearReinf.CrackShearParam.L*1000, 2) &amp; " mm, "; 
            } ELSE { 
                string ThetaFormula →KRS106_000003= " δ = z*cot(Θ) = " &amp; Val(ShearReinf.CrackShearParam.L*1000, 2) &amp; " mm, "; 
            } 
            string Interval →KRS106_000002= TR("interval") &amp; " (" &amp; Val(ShearReinf.CrackShearParam.deltaL*1000, 2) &amp; "; " &amp; Val(ShearReinf.CrackShearParam.deltaP*1000, 2) &amp; ")"; 
            →VAL316_048332TEXT(ShearCrackProjection &amp; ThetaFormula &amp; Interval); 
            →VAL316_000003double&lt;mm,1&gt; δ; 
            →VAL316_048499CalculateShearCrackProjectionNew(InputCalcTheta, Theta, out δ); 
            IF(ShearReinf.ExistShearReinf) { 
                →VAL316_048334GetTableStirrupAroundSection(ShearReinf, FontsAndColors, IO.Section.Dx, True); 
            } 
        } 
    } 
} 

→VAL316_048453BLOCK("Function for loading user input torsion parameter") { 
    object LoadUserInputTorsionparam(double Mx) { 
        double t↓ef.inp← →INI400_007678= 0; 
        double A↓k.inp← →INI400_007679= 0; 
        double u↓k.inp← →INI400_007680= 0; 
        double TypeMethod →INI400_010904= 0; 
        IF(COMPARE(ABS(Mx), 0, 6) &gt; 0) { 
            double TypeMethod →VAL316_048450= IO.MemberData.Concrete.Solver.Torsion.EquivThinWalledCSS; 
            IF(TypeMethod == 4) { 
                t↓ef.inp← →INI400_007389= IO.Section.SectionMemberData.Torsion.Tef; 
                A↓k.inp← →VAL316_048451= IO.Section.SectionMemberData.Torsion.Ak; 
                u↓k.inp← →VAL316_048452= IO.Section.SectionMemberData.Torsion.Uk; 
            } 
        } 
        return new Structure("TypeMethod", TypeMethod, "t_ef_inp", t↓ef.inp←, "A_k_inp", A↓k.inp←, "u_k_inp", u↓k.inp←); 
    } 
} 

→KRS116_000001BLOCK("Function for draw how Theta_min is calculated for ČSN") { 
    void DrawThetaMinForCSN(double N↓Ed←, double Coeff↓com←, double A↓c←, double f↓cd←) { 
        IF(IO.SetupNA.EC_NA.Code == "CSN") { 
            →KRS116_000023double&lt;MPa,0&gt; f↓cd←; 
            →KRS116_000021double&lt;kN,0&gt; N↓Ed←; 
            double&lt;kN,2&gt; N↓lim← →KRS116_000011= Coeff↓com←*A↓c←*f↓cd←; 
            IF(COMPARE(N↓Ed←, N↓lim←, 3) == 1) { //For bending and significant tensile force
                →KRS116_000025TEXT("N↓Ed← &gt; N↓lim← = " &amp; N↓Ed← &amp; " &gt; " &amp; N↓lim← &amp; " ... "); 
                →INI400_006825TEXT("member is considered as in bending with significant tension"); 
            } ELSE { 
                IF(COMPARE(ABS(N↓Ed←), N↓lim←, 3) == 1) { //For bending and significant compression force
                    →KRS116_000024TEXT("N↓Ed← &gt; N↓lim← = " &amp; N↓Ed← &amp; " &gt; -" &amp; N↓lim← &amp; " ... "); 
                    →KRS116_000018TEXT("member is considered as in bending with significant compression"); 
                } ELSE { //For bending only 
                    →KRS116_000019TEXT("N↓Ed← &lt; N↓lim← = " &amp; N↓Ed← &amp; " &lt; ±" &amp; N↓lim← &amp; " ... "); 
                    →KRS116_000020TEXT("member is considered as in bending"); 
                } 
            } 
        } 
    } 
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10200" Autor="" Autor2="" Version="1" EWNSource="" Icon="/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCABkAGQDASIAAhEBAxEB/8QAHQAAAgMAAwEBAAAAAAAAAAAAAAoICQsEBgcFA//EADQQAAICAgEEAgECAgkFAQAAAAMEAgUBBgcACBMUCRIVChEWJBchJjEzNlNjcSIlQkSDI//EAB0BAAICAwEBAQAAAAAAAAAAAAAIBgkFBwoDBAH/xAAvEQACAgIBAwMDAwQCAwAAAAABAgMEBQYRAAcSCBMhCRQiFRYxIzJRcRhCJEFS/9oADAMBAAIRAxEAPwB/jo6Ojo6Ojo68b575/wCJe2XjHYOXuadxrNL0nXgzyRx4w/euLPK7LKWua3W/eLd/s1tFQ8KqkroGdbyIxcDgsuycKd3ed+oB7j+Y2LnTO2tYPb9x5kxVB7VWMSt+U79UZEZQcHsTiSYNRCcyrJABo6pW5Gi967VvIkZRjDds3vXtOiU5Wyz3JUL18bUUTXZl5ID+BZI4IiwIE1iSJGKssZd1K9Mp6fvSh3i9SN+VNCwkNbXKNlauY3XYJpMdrGMm4R3rC0kNi1k8gkUkcjY7EVL1qJJYZbaVa8qz9OEcz9yfAfbvTM33N3Luh8apLV8bTwbNsCSt07XzeFWxZqNbGQ2w3cJPmGpiNPVvT82cw+n7wn9azt9+e/46dItW6qv3vfuQ5KGTF7+hcd2rVUyNtAb0mVHtmY1cZwpzJGvcjjEWIPxIMS5gDIzFDC5u7nY7R282G3s766sjZZsbi5fatLSwYliMZMO2DxTttGzGMY5KcxCZxGOMy/bGOubVantV8vNyj1nYLlQZpLEaqqaxsVxsQgMs15nTWMKJoiMEkhSlgkYFHPMcRnHOdD5Hv1sNqUphcJj6kfPKiybOSssq+XJJianGoYFCVET+BBHuMCCLYNP+kz2fwFBLPc/uht2w2yoWV8IuF0rDRTSCApGoyEOyXZzG62I1la/W+5SWNvtYHiId4lb9RB8fR2FwFDzumIxhCI4zxtVzXVGQkYTZYinuTTcggjnJSxVVZYzCMsAXMXMRylPxP8wXx28wTqk6LuO1zWbu2sIVa9DyNU7Hx+6N01gvXqCM/stSlrsoOzcUOBha7YWisYsmTLlQtBI5/dvwrzJr/r/nuJeTaT2/N6n5fQ9prfa9fxef1/dqg+bw+YPm8f28flF9/r5Ifv5yyswmwwm4uZVtUxVmlWREAwswAkhHXYAWMChMEsZDKIkYkGSMoTjiWM4x8kXfHdacqm/i8TLETwY5KV2o5/g/hILZCtx/9RuPy58T8cSG99LP0xbFSkTUd87gUryKXjuU9n1fYayf3oDZpnX0eSL3OORFdqMWj8BKvLc6tFPdU+w1y9xQW1ZeVLnm9S0p31bOua9c5VT+u6kU6x/AyAy5vEWXjOEoZ/Ug5xx9LrMz7Ze+Puf7RbQbnCPKuxa9SzsEbGz0Zt92x0K9NXslbXjbaxNoak4SOcuWppSSYdCUyjZzJsMLlb5+PX5weGu7GwQ4z5uU13gXmhyDMKgbF03nj3djKQYbPCmvbhUK+sWEkYD9Gjv7tti0bA4sg8ZqVeo7t3UO7uu7NJDRthsJlZSqR1rcqvVsyseBHVuhY0Z2JASKwkEjsfCJZWAJrs9RX07O8vY6nkNowDRd0dBoLNZt5rX6UtbO4ahEvm1vPaw01uzFXhRZXs3sTay9GrBEbV+ajGxSO9Po6OjrbHVfvR0dHR0dHR1HLuq7oOMe0HhnYuauVn5q0NRMdbVV4Pt7ux7M6s2xU67XywMsRtPxRaJkkoEyNZZiYAONYXSZkb0hz82vfXd9y/cVZ8TavYWaHEXDZia8lXgesBVO33fkhYG2xuqfRr2wOTiwFXImABHEaKAPWOWqDcWMH7gbfFpuAmvjxfIWGNXFwOpZZLbqW9yQAj+lXQGWTlh5cKg5ZwC0fpE9Ot71J93cZqDmerqWIiXP7zk4JFhlqa9WnijarVkZZPHIZaw8ePpFYpDE0slp1WGtK6Qc75O+Tlrvl5asOQOQLAyWtpGMto2jLGJGm1amiQuFQhVwUgpOyEScjnlMxMEMxKTDLLLzz0QdcrE7vYaGmsLlLXULe6q6x7YLKJZ11Em+8BVm5fgDEjTSrAlm61EMclkABMDxmecY6kl2jdnvL/eZyFa6FxPTON51zWbPbNpvY1b9hW0NUgAklhs5THmM7O5bh6VJU4MN+4PBkVUB5pf1CeKcn8Ybpw7ultoO/VP4jY6j1iGCNld1NtN1cbaFhXvqEKs4k4sWBITHPBQFwZJ0Ktiq2ouleRGbyA/c2VitW4MjdlRshOH9mzYiKtLAJFI8AqkIip4KqqyRfMTBOnHTZO2Gosex2gZDA6/lNN1qjYh1DFvX/UcJiL6yxUMo9OZXFmSWVDasS2PuJpZZobWQBW/BJYeN7Ofhi+PfQNA1jdMVY+6C2vlkNgrOUdysGo1JvrJ+SrOr6rQvqVVGMMW4COtZyubhOzrAEM6tYpeMFxGq6Ho2iLkT0jTNU01QwUljK6rrtPry5V62BRVy5AVCaYphQEcw0hSjkasDFgCI4knjKMHxR/LNs3Zhs0OM+Y7a82jttvprwnX4Fm0d42dHk/lv9bXAsS0ZGyEgF3qnB2FjrV6SayqmcCfr3qNS23Wd81mk3LTbuv2PV9jrwWlJd1Z8MJWCTGP3gUU8ftKE4SxMLC5oDZUZGZVoIWQlFBwe2ma1PNYaNtfxtDEW6qJHkMbDFEtqvJ+SrK8oBntQTEOYrUru7gskpEodeucX1t9tPUF2z7k24e8G6bV3DwOfs2reobrkbt+bB5imDBNLRr49mXGYPJ4wGrHkcFRr16tZkgnoJJQkqzN+1/rGt7WmKu2nXqPZK8LMHQo39ShcJicGIwBtiVsV2QDZGBlgMDxhgsRHMOM8QLPEoa8//HT2pdw1Y8DbOLdZRuT+sVO5r6lWQkT1ybK9aEVMTGK9KsGwx7lgvrsdesbKUnRyuAYt7abk5ujqf3MfRyETw3ada1FIPF0nhSQEcEf9lJB4JAIII5PB6UfXtu2nUr1fJaxsOZwN6pJ7lezisjapPG/krkgQSorBnRGZXVkcopZT4jhI/vp+Cnk/gutt+QuDnIbpo9bOZWKxh0hX4K5hhSsWT+683g3liwmVppW1zjXht3dXR1e1O2eV0nF/P+401j/7tVbVTv8Avo2NbYon/wDkym6myL/bOucf/gSH9WrU6knZJt11ios/XvrHSeRdAJpN1NoUwNKNqngQDKzICTCcBoTEYU5jJCUJZxlVn5mPi2cfUrObOFFUjnSM7W5oyZFG9txnWlYrakZ45cM2x6lass2dKsD5OwZMljr18zh4FJZ3C6dxu0VepXmzmqxSRiEe7axUY8wR5rzJT/JWj8FJb2VDliAIwGPzcz6MPqJ5bPZjGdrO/mQqW/1NxRwe/XWFd0b2JvClsh9qWO4bUwihGSmev7IkeS5JJGpKd8+FD5Y7XlRnWOz3uIvDWvIGQ2CnE/INqZBc2xJVyjtqHTLckYIgK7XVas0NdzGBbNqCqiGM2eWMfiGc+spKkubTXLmo2GjdNW3VDZoXNPYrZxFivtKtoT1e6vKUZRwZVsATizKMsYIOOcxzj+rrRj+MfvTB3y9q+qcoW5qkPJ9AyzpfLtNVDAkujuVTEZI2ilVCxsWUKnZ6k6F3X4YkGHmYfTWHgaEsRkPZvfps5XfWsvO02Tx8AloWpW8pLlCPwjeKVmPlJZqEqfcYs80D+TflA7vp76kvpIxnazMVe9fbrGQ4/R9uyjUNrwVGARU9a2u4Z7Ve9QghUQ1MJn0SdBUjjirYzKV/ZhPs5SpWrWFdHR0db26ql6hF8inOQO3ztG5a32c2Rskom6NCQK4FmIp3kHm2691Y5wSitdVFdZUcGFyDOs5ZKGi1WDgS3r82mysHLexftbA3sP2brVg8x4xC87jpyMsm8QICCLymLOfjCMYofb6jhCGMRw6z+or2pxLtX1bVa+88QLfZlWdj18TYp+wmK81w+v2D9dmU5i+r9ZaDqbLIhFz4LpJRjIS2gCJmccap/HfIeh6P5vW/jLc9X1T2PJ4fB/EV4jUeby+s54vF7n38nqNfT6/b1j/t4pKX3yv2L214/DpyYqdGExL5cK9i/K3kSOfHkCONPI/kPyX4AHPQl9K3UsTq3YDcu49kIt3Y9qya35vZBmr4fU8fC0KLIVEhWV7lywYUPtMFgkBZ2IR8z4R+1Wu7buyXTNndRZByF3BDT5X3Q1hXWNU+tXPrTFo2vTTsS+TC1RrhI2AmIKpwbcvrBgcTrEWYJ+vyWfGhofdhpVvstBQBDvqAbe0XlWpELaKXbycxH2zWlE2q8tjZFLBZva9Km2Kt3+KKrwoB3RBFq1tqpaeu16nqaCnX9Opo6xCnq1PMdj1a6sVEkiv52inZP4FgCF5mDGOT6/cxSElKefpdMdFqmI/bNXV7FWGbH16MNQoUHBeNB52F8uSJZJvOdn/uMjlieST1S7d7/wDcM97s931xGdyGM3DMbRkNhWzHYYNHWtWH+2w8ntlUfH08aIMVFWC+ylKCOBUEahest/mvg3kHgHcS6ZyDXBA3IOG6u4rSMNa/sCGc4jl+ksGFUyshGXOQsBYVVdUNjxtqAlIf3tW+KP5Ztm7MNmhxnzHbXm0dtt9NeE6/As2jvGzo8n8t/ra4FiWjI2QkAu9U4OwsdavSTWVUzgT9ezD8jvxxaN3S6NfXFPQ/2l/mbh5GnWH+YxceOWZ7hp8MR/zL/fLYNfjj1d2V8pBi/iX7R2BE7nTgvee3/eXNK3VP/Uaob5UZPw+zU/kzANpVmnj/AIG6kTPtVzX2XYj/AIZCq3sWu7D2qz8OZw08poiQmtZIZ4mjc8NTvxqVWWGQELwxH5ePysyxSvfD2c7y9nvX52kyXbXuZi6CbSaajMYVWhr5CG3XXzh2XUrc0c0lDJVGUykwK/8AS97mOfGzX6NfT41LbdZ3zWaTctNu6/Y9X2OvBaUl3VnwwlYJMY/eBRTx+0oThLEwsLmgNlRkZlWghZCUUOxdIOfFH8rmzdjGzQ4z5Lnebf20bfeLmt6gLGXXeLHXcnhZblptbMBDsjZORNnY9cWcWWsFlnHkUzbAaE2Hu9J3bUeSdR13fdC2Kp23TNtqU73W9konBP1NxUviwZV1NoOcwmOcM/WcJfUoCxIA4xHEQcWT0fecZuuNFisVrZKuqjJYxn8pazkkCSMkKZqspHMUyr8c+3KElVl6pQ9UvpY3j0xbo2HzSTZnTMvNNJpe8Q1vZo52rGqSSU7cSSTrjM9QVxHkMZNL5N4i7SaxQminPaOutbjqdPvWrX2oX4fPU7DWM1rf1GqQ6/nh/wDg+l7qziwbOsZiGxq2irH9KxVVbgPJAQ67L0dTVlV1ZHAZXUqykchlYEEEf+wQSCP8dLFDNLWmisQSNFPBLHNDKh8XilicPHIjD5DI6hlI/ggHrN6+STt1J26dz27Ui34/8Ls1rd3Sg6wkpoo3al29U7fXKQKJQ8a+OwqNWlRjKCa4aa2rkAjwZBoYbKf05PP9to/dNvvb+XHsazzpoxLuECHLj8dt3FYLS4rm1QxSaj/Pa7cbMq/jLVYI/grSHO2dCvUl7T+pG4/TQ23ije1QMnPYlFGxdO2LxIOX1O9UQr0kx+Ccln6/i1FyZTieKu4o3+zqwHgpypS+NTZltQ7+e0u+duK+gRX5t0xN+1tGUk69avuX8Ur0WWrHMVF4NKWBlImJOExzPCS5BsYFOKb2Iv2Z3driofbgTO1CoDBB9nlSkNtD5AoiGOzYUKOVRPFQyleV6TcLf/5LfTszDbGpt5Wx2rzyyySRNZk/cOhJPk9ftKIZUsWLKWsJiJpJW9uW1YEsjwzRzeM2lB0dHR05XXNb0tD+oqp7EHE9DflX+tTZi02nSb8wJeexo9q2B20X8ES5ZH6q2w05fMYIwH9z6LlMRdqAFNuA7BOo514WtbA3roVnLPHNg8x4yl8CaW4UzLJvECBTF8QRTn4wjIWf1+o4TnnEcu9/OlxTYckdoVg6mlCylrQ7w6iS2ITu83Ifwu5InqRGUOKcMVuh3aVjABg2jS78aysEwawJkCGKzLCbC7ibBlW1TCZVaWKQDCzACRKBhc4pQKEwSxiQRRyiQZIxnCWJYxnCf954no71XulCYnqUp4yf+7QTPJKgPAHwzqP55AYc/wCT0Z/TQv1dq9KuZ1lbEceQg2LZsXcWM/NaDJ4unRx87qWdwZIa0jklfF3jcoOOUTV66Oox9mnP9Z3PdsfDXNKL3u2G36NQm2yBFk69pLdVa5dba1WqtFlsFX97kbLyCuC/UlO5Wugj6ra8pSc6bmrZhu1q9yu4eC1BFYhcccNFMiyRt8Ej5Vgfgn/fXPDncLkdbzeX17L12qZXB5O9iMlWcMGgvY6zLUtREOqt+E8LqCVUkAHgc9HVS3yO/HFo3dLo19cU9D/aX+ZuHkadYf5jFx45ZnuGnwxH/Mv98tg1+OPV3ZXykGL+JftHYLaejr5criqOZoz4/IQJPWnRkdHUNx5AjyXkHgjn/RHweQes5oe+bP222fF7dqOUs4rM4mzFZr2K8rxeZikWQRye2ylkYqD/ACGVgHQhgD1lv838JbrwLvlro25omxJU0pU1+JJwFJtNXIYDgtaNtoIxOBwJkIXxrkPmrsos1bc8Nqljizf4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbRoD5Hfji0bul0a+uKeh/tL/M3DyNOsP8xi48csz3DT4Yj/AJl/vlsGvxx6u7K+UgxfxL9o7AidzpwXvPb/ALy5pW6p/wCo1Q3yoyfh9mp/JmAbSrNPH/A3UiZ9qua+y7Ef8MhVD2TWtg7W5+HM4aeUUxMzVLaqzRiJ2/KjdQkiWCReI2Dn8zxyVlEUjdE/ZTvb2h9efaPJds+5WLpPskmPijz+AmkihuPdrQf0tp1eysaNQylOb3LcRqoTXUyFUnx736kGnlpO7ajyTqOu77oWxVO26ZttSne63slE4J+puKl8WDKuptBzmExzhn6zhL6lAWJAHGI4iDj2jpBb4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbR8HSd21HknUdd33Qtiqdt0zbalO91vZKJwT9TcVL4sGVdTaDnMJjnDP1nCX1KAsSAOMRxEHFldG3nG7tjRYrla2SrKi5LGs/MleQ/AliJ4MtSUgmKUDkHmKULIpBpM9VHpX3X0w7q2Iy6zZnSszNYl0rdYq5jqZinGfNqF9U8o8fsOPjZFyGPZ/F18btJpqUyOqvv6ky4XVqOKKbJA+9bs6myIBUhsEkhVf0uZdYWaKuWKBgtvVYpFXOq6ddphUciolsRZXH7KNIY5I7wO2HSFXw1Zdi544sTlYsBIzBJeG5VDTjMVhyHJowlFzyWVyZYbLGBAK2oIk2RWt/qDee/6Q+66v4prLb8lR8WUohHh+I9H07hkcVG6j3WALNv/ibdfZGPPAU1S/m/2FZWSoUAVMcPhI4XuOXfkM4bsVE2SUfEkrnlbZbGNJ+Yrq4Gu1jK9HCwJNlUFWSx2awqEqyxlI51bGYGFkzzBKQlx20psHd2OnWVrEZzeLx7hSOGWCaH7sqyuQEjHvEuCpARm4BHJuj9PQsdovp3W9kzUsOJsjtjvW3V3njZjFNk8dkF15J4JKys1m4642OOBknEjWIY/NlbwTQW6Ojo6cbrm368v5q44X5c4r3bjpmQcR2ammsvFvI8IFsE2AWdWva4IjZYnTM2SSi9yKCLBzVRHBLxieYyQzS+5zhO47e+bd64uuE2UfwdswSsA6D1HIVDJiySE2gSws3UGU/oVA6lozi0GVScnQhLPMMagnS4fze/Hj/S5q+eeuOae2a22iHZuM19HWU+FZWLuKgR6976HrjzW3A60nlnmYmnX7hGwlJ153d1amWnu8Wny7FhI8lRiMuSw/nIqKOXmpv8zxKP55BAkUKCWdVB8U8mFjv04PUbS7N90bembTfWlpXcj7anPZmYJWxuw1+UxWRmY8KI2V3pTPJIiRV55pFEs4hhkgr8BvyKV/E2zOdnHMew19Pxzu1hY7DxDfPpzgOg5CeyqS51i1u4HivXa7siKh7NFixVwohsC7EC2Kw7nEYuTdZRn/caax/92qtqp3/fRsa2xRP/APJlN1NkX+2dc4//AAJD+pvn4tfnK1/cavTO3rvQ2INLvoTKatqPPFwwaNXumD5WU15Lkc8U5qU2wQlgyNlvlk+nV2spVTd5ANgW8vjQ7tF3JrQVodT2G0tZoCIsNesMViMZbgY2xK7cRPEx4ps/jEYv/GLI0cKysj9RL0T5zKZvI+oHs9hJczDlY2v9ydWw8AmvxXI4vOXdMPRrRed+tehT3djgg966l3nNJHZgt5GSgz10dcZJ1OyTUsa5tZ+vfWA6i8kcTSbqbQoHVbUaBMgGVmQEgYBwzmIwpwIOcoSxnPJ6ZIEEcg8g/II/gj/PVKTKysVYFWUlWVgQysDwQQfkEH4IPyD8Ho6qW+R344tG7pdGvrinof7S/wAzcPI06w/zGLjxyzPcNPhiP+Zf75bBr8ceruyvlIMX8S/aOwW09HWOyuKo5mjPj8hAk9adGR0dQ3HkCPJeQeCOf9EfB5B6mGh75s/bbZ8Xt2o5SziszibMVmvYryvF5mKRZBHJ7bKWRioP8hlYB0IYA9ZcvOnBe89v+8uaVuqf+o1Q3yoyfh9mp/JmAbSrNPH/AAN1ImfarmvsuxH/AAyFnl8fHyvc39idPtfHaXk3jiLaFnmq7VrI0Ttce7c1+0pbXo+XczSXk9+0429A8MtE89Ja7MmVtV1W4Yr+a3hvtDW4iud35W3PUNH22znl2o1TLeI7nsO1P+ytX7XodLVpWt2OwM8CYtyLmpnq9tWjdtbhlK3UaLeI+dJntGKv9stqVsJlljlKSS1mgmVrMNaU+LV7sPLH2pAeIxMOZAhYcvEsrdK/YnfdS9cnYOev3R7fyW6SWamPzaZTGz18NkszRX3osxrWR8IVW/TkXyttjJPCobKROVq5CTHx9z5E3i45K3nat8vp+S22q6ct2/8ApVj4/YJnwL/ySiC0/VWiFbyjTX8/i80xRISfTj/6eTtHPxVwbuHctttJ6m2c5/jqzT2242IHlONagxXY4WAYUKxms2eznX3I7VFhubOUQVrA0GKg8GlyfjU+Pveu/jm4GtKrO03D+l+vcctb/ILQ0KmuJLOK/W6xoYJBd2zYzRlivpsNJHlVKXFnl1MVfk+NEvXNeptS16i1TXK8NTr2s01Xr1DVLZJlespqVEFbV16+SzIXIU0VgLCyQhCZGOP3nKX7yzP+yepWbuRsbplI3MUTTx4x5l/K3dseaXLq+QHKwqzwrIOVeaaUKQ8DcKP9T71BYPWtMw/pk0W1WS3dixVzeKuNmAi1/WsOKs+s6vMImYRzZKaCtkpqblJq+Nx2PeVWr5WPy+z0dHR0z3VF/R1xnUk7JNuusVFn699Y6TyLoBNJuptCmBpRtU8CAZWZASYTgNCYjCnMZIShLOM8no6CAQQRyD8EH+CP8Hr9VmVgykqykMrKSGVgeQQR8gg/II+QfkdKq/Kv8Mrmy3rvN3bagBc7/uO7PTni+RQYk02HmJ3TCSlgyvlZZUn47b3A5TOsPFZur6jyyOyXipOz6psul3LmvbZR2evXSBmF2q61UMmxAirTCJ5QiWOInDFtVkEWQSKuUgCYEWeI5z1qwdVzd1nxd9qnddVkhsuj1mq7IMOA12ya3XjUnXY+yMI+qmiesOgEIVTFHX0FnR1dhaNkstlR2HMcrE0RvfZuvmp58rrskNHITFpJ6UvKU7Mp45ZGUN7EjnlmIXwJJJBJ56tb9KX1J8z2wxmK0HvJTyO16fj44aWM2Sj42djwlKMyBYbEU0kX6tUroY44Y2lFmONEiikWNApSI7Xfkr7ye0FOdJw7y7Zw06f7ZxoO5Kr7ppS0vLXSISrpb3DGKExl60KJTUDFWXKZTwjOBZwMO7Hjj9TXtC8GQ8u9qtBbFyGMk7DjjkWx12EWIsG+4mafZ6DaJECVQgMRYFeDIBhQ0srMisYRq/Fuev07fcFrjthZ8K7RrO1U8U3reVVYvHyOsHF9ksKdOwgrDaLpxWohjAllNKdYeYGmJZt1uzYWqa49m+JP5DNbhM8O2PkTYlBhCUrGs1ZLEkCGYyvhaFYfCd0yYecjMaSdYwuJcuDSYxELXr6wrt3h0zipVjzv2sQ4jhWqMzSEalgPYSSG2IY/yJIjWEj4LAEDh6sxF9OD1MFtizlrtYM7kCXuZCfOSdtNmNyX2WYZWxUyOvNkrv8ATREkuS5JX5kSvJIJZPO9Fn9TlosF2JJ9oW2nbiEslQM8w06q5mMQlkAmGhcfOFWCQuIwKwNNogYZkSCx5RwKUDebf1EfeLyRRP0XGur8e8Ge+s0jK910DW17IBV5MQDmVf2iB007ZU8CmqbNGsU9ATR4GWddEhYpV1UXxm9/my/jp0vaZzO2tbLQdrrImqHSp20zK5dA2K6eItU5WaW+pVDydiJvyBgtMpDhhOY/DHwG9/3KX4t3a9Y0zhSjsPd8znI+1qkuEPU/KiH7OsaoPYbeHtN16wg+aC/2VtUbAflVwzkHu2y96c/xThjzyCRSpNTCpjAQ5QFmurTrmLjyX8/uIwqsW5CknrFQ9k/pk9pS2xZK92mtSU5VmSPP9zLO7uJK6TSCKHV32PLpkC3syn7c4a480qLEEd/bj6qI5D5I33lnbLPe+S9tvN33C6nAlrsexPmsbR4kMft92GTZzKc5yzMxZf1SMyU7RszYOYpLCOwH4ruf++baat0NZbcY8ICZwTY+YNh12zzXHQECDB1NGWZGgltt4X2EACXFaLJrQfjYHYIuk2LDJPa5+ny7U+IC0ex86Wtt3D7Ygsuw1UWgja1x1i4MnML4568g+V69qU2JCLTBtXxfYo2GLdZ8LStfVX4JJJ1qaldXKLIV6CwEkUUgCVTSTVFACqiioIDAsssAcAgAGEBBFCAxwjCOMYk2qdkb1m0Mnutn8TKszYyCw1izbdiXk/ULytxGGbgOK0k0svLH34SAW0f3/wDqh6vhcG+j+mHBkSRUpcZBu+Uw8OIwmArxIteodQ1aaLyttDCGNeTNUsdRpGOFRichG7CHxft07dOJe1XiXWeF+F9ZDrWma0HMs5lkbFzsVywMUbXatqtYiCW62a6KEZbGxKMY4DGtXVyyFPX1tan7j0dHTKQQQVYIq1aKOCvBGkMEEKLHFFFGoVI40UBURFAVVUAAAADqk7LZbJ57J5DNZrIXMtl8tcsZDJ5PI2Jbd7IXrcrT2rly1OzzWLFiZ3lmmldnd2LMST0dHR0devWP6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6//Z">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English " />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://designforms.net</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Calculation</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Equation" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables />
    <DrawingGroups />
    <ResultTables />
    <ResultGroups />
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
      <Layout Active="True">
        <Names TranslateID="LAYOUT_2">
          <ENU>Layout 2</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_3">
          <ENU>Layout 3</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_4">
          <ENU>Layout 4</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
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
      <VC ID="INI400_001197">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_001198">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1599" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1599" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1599" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1599" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1599" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1599" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_001200">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_001205">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_003085">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_003881">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005197">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1601" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2188" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="768" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
      </VC>
      <VC ID="INI400_005219">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_005220">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_005221">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_005222">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_005223">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_005229">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005238">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_005239">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
      </VC>
      <VC ID="INI400_005241">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
      </VC>
      <VC ID="INI400_005247">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005263">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
      </VC>
      <VC ID="INI400_005265">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
      </VC>
      <VC ID="INI400_005296">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_005305">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_005775">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1849" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1849" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1849" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1849" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1849" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1849" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006055">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006480">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006481">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006482">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006484">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006485">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006486">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006487">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006488">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006490">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006491">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006492">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006493">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006494">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006497">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006498">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006499">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006500">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006502">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006503">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006529">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006530">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006531">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006533">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006534">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006535">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006536">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006537">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006539">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006540">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006542">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006543">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006544">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006546">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006547">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006603">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006825">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_006966">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006967">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006974">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006975">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006976">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006977">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006992">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006993">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006994">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006997">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006998">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006999">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007000">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007024">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007025">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007028">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007030">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007032">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007033">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007034">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007036">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007337">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="853" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3883" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007340">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007341">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007342">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007344">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007345">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007347">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007348">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007349">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007351">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007352">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007353">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007354">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007355">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007357">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007358">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007360">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007361">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007362">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007364">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007365">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007366">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007367">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007368">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007370">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007371">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007374">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007375">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007376">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007378">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007379">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007380">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007381">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007382">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007384">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007385">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007386">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007387">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007388">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007389">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007390">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007391">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007393">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007394">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007395">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007397">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007398">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007400">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007401">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007402">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007403">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007404">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007405">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007406">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007407">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007408">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007411">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007412">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007413">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007430">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_007431">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
      </VC>
      <VC ID="INI400_007432">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_007433">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
      </VC>
      <VC ID="INI400_007434">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
      </VC>
      <VC ID="INI400_007435">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007436">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007437">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007438">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007439">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007441">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007442">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007443">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007444">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007445">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007457">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007458">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007459">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007460">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007468">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="22" />
      </VC>
      <VC ID="INI400_007471">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007472">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007473">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007474">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007475">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007476">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007477">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007478">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007479">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007480">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007481">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007482">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007483">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007484">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007485">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007486">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007487">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007488">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007489">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007490">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007491">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007492">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007493">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007494">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007495">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007496">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007497">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007498">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007499">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007678">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007679">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007680">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007708">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007709">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007710">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007711">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007712">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007714">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007715">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_007716">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007717">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_007718">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007719">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007720">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007721">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007722">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007723">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008000">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008074">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="428" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="304" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="682" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008075">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="443" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="323" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="697" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008076">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="458" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="343" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="712" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008077">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="473" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="361" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="727" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008709">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008726">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008727">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008728">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008732">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008733">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008734">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008738">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="994" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="740" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="110" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="483" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="53.4" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="278" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008751">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008773">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008774">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008775">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008776">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008777">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_008778">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_008779">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_008780">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008781">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008782">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008783">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_009965">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010904">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010996">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012061">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012929">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_012930">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="231" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.6" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_012931">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012932">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012933">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012934">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="994" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="740" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="110" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="483" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="53.4" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="278" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_012935">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="181" Y="80.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="506" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="506" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012937">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="51.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Equation" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Equation" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="907" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_012939">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="793" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="152" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_013586">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013587">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013588">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013589">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013590">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013591">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013592">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013593">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013594">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013595">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013596">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013882">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_013883">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013884">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013885">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013886">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013887">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013888">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013889">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_013950">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="428" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="304" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="682" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="KRS010_000009">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS010_000018">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS010_000019">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS010_000020">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS010_000021">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS106_000001">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS106_000002">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS106_000003">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS106_000005">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000011">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000018">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000019">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000020">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000024">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000025">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="KRS116_000026">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="VAL316_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_015424">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_015448">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048281">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048282">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048283">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048284">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="53.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="53.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048285">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="53.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="53.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048286">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="202" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="202" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048287">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="53.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="53.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048288">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="103" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="103" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048289">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048290">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048291">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048292">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048293">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048294">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048295">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048296">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048297">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048298">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048299">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048305">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048307">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048308">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048309">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048310">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048311">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048312">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048313">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048315">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048316">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048318">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048319">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048320">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048321">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048322">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048323">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048324">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048325">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048326">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048327">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="58.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048328">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048329">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048330">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="VAL316_048331">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048332">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048333">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048334">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048335">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048336">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048337">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048338">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048339">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048340">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1874" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1874" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1874" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1874" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1874" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1874" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048341">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048342">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="740" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="110" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Equation" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Equation" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="994" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048343">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="181" Y="80.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="506" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="506" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048344">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048345">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048346">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048347">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048348">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048349">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048350">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048351">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048352">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048353">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048354">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048355">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048356">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048357">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048358">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048359">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048360">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048361">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048362">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048363">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048364">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048365">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048366">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048367">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048368">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="994" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="994" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="994" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="994" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="994" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="994" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048369">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048370">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048376">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048377">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048378">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048379">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048380">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048381">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048385">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048386">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048387">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048397">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048399">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048408">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048410">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048411">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048412">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048413">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048414">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048415">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="994" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="740" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="110" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="483" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="53.4" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="278" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048416">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="181" Y="80.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="506" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="506" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048417">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="51.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Equation" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Equation" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="907" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048418">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="793" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="152" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048419">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="231" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.6" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048420">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048423">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048425">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="VAL316_048426">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="VAL316_048427">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048429">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048430">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048432">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048434">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048435">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048437">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048439">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048440">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048450">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048451">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048452">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048453">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048454">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048455">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048456">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048457">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048458">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048459">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048460">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048461">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048462">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048463">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048464">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048465">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048466">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048467">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048468">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048469">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048470">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048472">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="47" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048473">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048474">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048475">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048479">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048482">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="VAL316_048488">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="231" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.6" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048489">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048490">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048491">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048493">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048494">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048497">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048499">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048500">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048501">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048502">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="VAL316_048503">
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
    <Main Width="500" />
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item ID="BLOCK_INI400_006974">
      <ENU>"Function for creating thin-walled cross-section from stirrups"</ENU>
    </Item>
    <Item ID="BLOCK_INI400_006977">
      <ENU>"Function for creating thin-walled cross-section from cross-section"</ENU>
    </Item>
    <Item ID="BLOCK_INI400_007000">
      <ENU>"Function for creating thin-walled cross-section from effective rectengular CSS"</ENU>
    </Item>
    <Item ID="BLOCK_INI400_007394">
      <ENU>"Function for calculation torsion parameter according to selected method"</ENU>
    </Item>
    <Item ID="BLOCK_INI400_007405">
      <ENU>"Function for creating thin-walled cross-section from input parameters"</ENU>
    </Item>
    <Item ID="BLOCK_INI400_008709">
      <ENU>"Class for calculation basic parametres for torsion asl, Asl and tef"</ENU>
    </Item>
    <Item ID="BLOCK_KRS116_000001">
      <ENU>"Function for draw how Theta_min is calculated for ČSN"</ENU>
    </Item>
    <Item ID="BLOCK_VAL316_048316">
      <ENU>"Function for creating table of stirrups around section"</ENU>
    </Item>
    <Item ID="BLOCK_VAL316_048318">
      <ENU>"Function for calculation crack shear projection"</ENU>
    </Item>
    <Item ID="BLOCK_VAL316_048333">
      <ENU>"Function for presentation stirrups inside projection of shear crack"</ENU>
    </Item>
    <Item ID="BLOCK_VAL316_048335">
      <ENU>"Function for width of cross-section for shear"</ENU>
    </Item>
    <Item ID="BLOCK_VAL316_048397">
      <ENU>"Function for calculation angle Theta"</ENU>
    </Item>
    <Item ID="BLOCK_VAL316_048411">
      <ENU>"Function for calculation crack shear projection"</ENU>
    </Item>
    <Item ID="BLOCK_VAL316_048430">
      <ENU>"Function for presentation angle Theta"</ENU>
    </Item>
    <Item ID="BLOCK_VAL316_048453">
      <ENU>"Function for loading user input torsion parameter"</ENU>
    </Item>
    <Item ID="BLOCK_VAL316_048472">
      <ENU>"Function for creating thin-walled cross-section automatically"</ENU>
    </Item>
    <Item ID="BLOCK_VAL316_048490">
      <ENU>"Basic function for calculation crack shear projection"</ENU>
    </Item>
    <Item TranslateID="STRING_0307D0CA">
      <ENU>"To use method based on user input value of parameters for torsion."</ENU>
    </Item>
    <Item TranslateID="STRING_1CADC1E3">
      <ENU>"Parameters for torsion [value A↓k← and u↓k←] are calculated for effective rectangular Css, which is created from input Css to area and perimeter of effective cross-section were same as area and perimeter of input Css."</ENU>
    </Item>
    <Item TranslateID="STRING_1DEA87EE">
      <ENU>"Parameters for torsion [value A↓k← and u↓k←] are calculated by automatic method"</ENU>
    </Item>
    <Item TranslateID="STRING_3B6A158A">
      <ENU>"and"</ENU>
    </Item>
    <Item TranslateID="STRING_41E0EFEF">
      <ENU>"To select different method for calculation parameters for torsion."</ENU>
    </Item>
    <Item TranslateID="STRING_49914AA0">
      <ENU>"Parameters for torsion [value A↓k← and u↓k←] is not possible to calculate around selected stirrup for torsion. Parameters was calculated from inputts-section."</ENU>
    </Item>
    <Item TranslateID="STRING_4E9028DD">
      <ENU>"The value θ is calculated automatically by iterative calculation until condition [(V↓Ed←/V↓Rd.max←)+(T↓Ed←/T↓Rd.max←)] &lt;1 is fullfilled."</ENU>
    </Item>
    <Item TranslateID="STRING_62342108">
      <ENU>"The value θ is calculated automatically by iterative calculation until condition (V↓Ed←/V↓Rd.max←) &lt;1 is fullfilled."</ENU>
    </Item>
    <Item TranslateID="STRING_65A9DE32">
      <ENU>"Parameters for torsion [value A↓k← and u↓k←] is not possible to calculate for effective rectangular cross-section."</ENU>
    </Item>
    <Item TranslateID="STRING_7EB6D7DE">
      <ENU>"To increase angle between concrete compression strut and longitudinal member axis or to change recommended minimal angle in setting of national annexes."</ENU>
    </Item>
    <Item TranslateID="STRING_7EBC7E2A">
      <ENU>"Method = From torsional stirrup"</ENU>
    </Item>
    <Item TranslateID="STRING_878734FD">
      <ENU>"The angle between the concrete compression strut and axis member is lesser than minimal value, therefore the recommended minimal value will be taken into account."</ENU>
    </Item>
    <Item TranslateID="STRING_8A1A8A08">
      <ENU>""</ENU>
    </Item>
    <Item TranslateID="STRING_8FA329B1">
      <ENU>"To define non-zero parameters for torsion."</ENU>
    </Item>
    <Item TranslateID="STRING_95A23FD6">
      <ENU>"Some input parameters for torsion [value A↓k← or u↓k←] are zero."</ENU>
    </Item>
    <Item TranslateID="STRING_9619EBED">
      <ENU>"Warning"</ENU>
    </Item>
    <Item TranslateID="STRING_9E609ED5">
      <ENU>"Parameters for torsion [value A↓k← and u↓k←] is not possible to calculate from input cross-section."</ENU>
    </Item>
    <Item TranslateID="STRING_AA51915F">
      <ENU>"The value θ is calculated automatically by iterative calculation until condition (T↓Ed←/T↓Rd.max←) &lt;1  is fullfilled."</ENU>
    </Item>
    <Item TranslateID="STRING_AB8D0946">
      <ENU>"Automatic calculation of angle is switched on, the calculated value from interaction V+T is taken into account."</ENU>
    </Item>
    <Item TranslateID="STRING_AE7097EB">
      <ENU>"Parameters for torsion [value A↓k← and u↓k←] are calculated for equivalent thin walled section which is created from input cross-section."</ENU>
    </Item>
    <Item TranslateID="STRING_B623CF15">
      <ENU>"Parameters for torsion [value A↓k← and u↓k←] are calculated for equivalent thin walled section, which is created around selected stirrup for torsion."</ENU>
    </Item>
    <Item TranslateID="STRING_B8A33321">
      <ENU>"interval"</ENU>
    </Item>
    <Item TranslateID="STRING_C03C4CF8">
      <ENU>"To decrease angle between concrete compression strut and longitudinal member axis or to change recommended maximal angle in setting of national annexes."</ENU>
    </Item>
    <Item TranslateID="STRING_C2EAB73C">
      <ENU>"None"</ENU>
    </Item>
    <Item TranslateID="STRING_C2EAB742">
      <ENU>"Note"</ENU>
    </Item>
    <Item TranslateID="STRING_C861A3C8">
      <ENU>"The angle between the concrete compression strut and axis member is bigger than maximal value, therefore the recommended maximal value will be taken into account."</ENU>
    </Item>
    <Item TranslateID="STRING_CE683D2D">
      <ENU>"Stirrups on the length of shear crack projection"</ENU>
    </Item>
    <Item TranslateID="STRING_CEC33E61">
      <ENU>"Parameters for torsion [value t↓ef←, A↓k← and u↓k←] are taken into account from input parameters."</ENU>
    </Item>
    <Item TranslateID="STRING_D48AB802">
      <ENU>"To change geometry of selected stirrup or to select different method for calculation parameters for torsion."</ENU>
    </Item>
    <Item TranslateID="STRING_E598B61F">
      <ENU>"Parameters for torsion value [A↓k← and u↓k←] is not possible to calculate by automatic method."</ENU>
    </Item>
    <Item TranslateID="STRING_E7CEA972">
      <ENU>"Automatic calculation of angle is switched off, user value is taken into account."</ENU>
    </Item>
    <Item TranslateID="STRING_EB098810">
      <ENU>"Method = Inputted cross-section"</ENU>
    </Item>
    <Item TranslateID="STRING_F6F08825">
      <ENU>"Method = Effective rectangular cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005221">
      <ENU>"Calculation dimensions of effective rectangular cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005238">
      <ENU>"Perimeter of area and area enclosed by the centre line of effective cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005296">
      <ENU>"Perimeter of area and area enclosed by the centre line of effective cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005305">
      <ENU>"Perimeter of area and area enclosed by the centre line of effective cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006825">
      <ENU>"member is considered as in bending with significant tension"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007430">
      <ENU>"Effective wall thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007432">
      <ENU>"Perimeter of area and area enclosed by the centre line of effective cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008074">
      <ENU>"- minimum value:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_008075">
      <ENU>"θ↓min← = " &amp; OutputCalcTheta.θ_min &amp; "° =&gt; cot(θ↓min←) = " &amp; cotθ↓min←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008076">
      <ENU>"- maximum value:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_008077">
      <ENU>"θ↓max← = " &amp; OutputCalcTheta.θ_max &amp; "° =&gt; cot(θ↓max←) = " &amp; cotθ↓max←</ENU>
    </Item>
    <Item ID="TEXT_INI400_008777">
      <ENU>"A↓k← = " &amp; Val(ParamTorsion.Ak*1000000, 2) &amp; " mm↑2←"</ENU>
    </Item>
    <Item ID="TEXT_INI400_008778">
      <ENU>"u↓k← = " &amp; Val(ParamTorsion.uk*1000, 2) &amp; " mm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008779">
      <ENU>"Perimeter of area and area enclosed by the centre line of effective cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013950">
      <ENU>"- input/calculated value:"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS116_000018">
      <ENU>"member is considered as in bending with significant compression"</ENU>
    </Item>
    <Item ID="TEXT_KRS116_000019">
      <ENU>"N↓Ed← &lt; N↓lim← = " &amp; N↓Ed← &amp; " &lt; ±" &amp; N↓lim← &amp; " ... "</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS116_000020">
      <ENU>"member is considered as in bending"</ENU>
    </Item>
    <Item ID="TEXT_KRS116_000024">
      <ENU>"N↓Ed← &gt; N↓lim← = " &amp; N↓Ed← &amp; " &gt; -" &amp; N↓lim← &amp; " ... "</ENU>
    </Item>
    <Item ID="TEXT_KRS116_000025">
      <ENU>"N↓Ed← &gt; N↓lim← = " &amp; N↓Ed← &amp; " &gt; " &amp; N↓lim← &amp; " ... "</ENU>
    </Item>
  </Texts>
</Root>