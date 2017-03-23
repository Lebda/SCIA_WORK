<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="f172aae0-a7ac-40b8-876c-ed0db8424130">
  <CodeEditor>
    <SourceCode Collapsed="1|80|90|188|631|653" BreakPoints="">
→GMP011_019685BLOCK { // Checks for composite, wide-flange section, and new member

    // Middle Section
    middle →UNK000_019395= ROUNDDOWN(IO.Beam.Section.Count/2); 
    
    // Check for composite member
    IF(!IO.Beam.Contains("Composite")) { 
        string Designation →GMP011_000076= "XXX RMT"; 
        double midSection →GMP011_000003= 0; 
        double MaxUC →GMP011_000004= 999; 
        string ModificationCmds →GMP011_000005= ""; 
        →GMP011_000006double ModificationCmdsRatio →GMP011_000007= 0; 
        →GMP011_019718TEXT("Warning: Review Member Type"); 
        →GMP011_000073TEXT("(Member is not composite)"); 
        Exit(); 
    } 
    
    // Check for wide flange section
    IF(!IO.Beam.CrossSection.Description.Contains("W")) { 
        string Designation →GMP011_000074= "XXX RMT"; 
        double midSection →GMP011_000010= 0; 
        double MaxUC →GMP011_000011= 999; 
        string ModificationCmds →GMP011_000012= ""; 
        →GMP011_000013double ModificationCmdsRatio →GMP011_000014= 0; 
        string stud_string →GMP001_000002= "Unsupported Cross-Section"; 
        string camber_string →GMP001_000001= "Unsupported Cross-Section"; 
        →GMP011_000015TEXT("Warning: Review Member Type"); 
        →GMP011_019717TEXT("Composite design supports wide flange (W) shapes only "); 
        Exit(); 
    } 
    
    // Check for new member
    IF(!IO.IsNewMember) { 
        
        object myResults →UNK131_019399= ReadResults(ResultType.Member, "CompUS"); 
        IF(IO.Section.ID == middle) { 
            string Designation →UNK000_019065= myResults.Designation; 
            double MaxUC →UNK000_019393= myResults.MaxUC+0.001; 
            double midSection →UNK131_019402= 1; 
        } ELSE { 
            string Designation →UNK131_019400= ""; 
            double midSection →UNK131_019403= 0; 
            double MaxUC →UNK131_019406= myResults.MaxUC; 
        } 
        
        string ModificationCmds →UNK000_019394= ""; 
        →UNK000_018558double ModificationCmdsRatio →UNK000_019392= 0; 
        
        
        Exit(); 
    } ELSE { 
        double midSection →UNK000_019397= 0; 
    } 
    
    // Check that ribs are either parallel or perpendicular (within 5 degrees)
    double rib_dir →GMP011_019707= IO.Beam.Composite.Slab.SheetingAngle; 
    
    IF(ABS(rib_dir) &lt;= 5 || (ABS(rib_dir) &lt;= 185 &amp;&amp; ABS(rib_dir) &gt;= 175) || ABS(rib_dir) &gt;= 355) { 
        // Ribs are parallel, okay to continue
        bool ribsParal →INI400_011120= TRUE; 
    } ELSE { 
        IF((ABS(rib_dir) &lt;= 95 &amp;&amp; ABS(rib_dir) &gt;= 85) || (ABS(rib_dir) &lt;= 275 &amp;&amp; ABS(rib_dir) &gt;= 265)) { 
            // Ribs are perpedincular, okay to continue
            bool ribsParal →GMP011_019754= False; 
        } ELSE { 
            // Ribs are not parallel or perpendicular, stop and give error message (RMO = Review Member Orientation)
            string Designation →GMP011_019708= "XXX RMO"; 
            double midSection →GMP011_019710= 0; 
            double MaxUC →GMP011_019711= 999; 
            string ModificationCmds →GMP011_019712= ""; 
            →GMP011_019713double ModificationCmdsRatio →GMP011_019714= 0; 
            →GMP011_019715TEXT("Warning: Review Member Orientation"); 
            →GMP011_019716TEXT("(Member must be either parallel or perpendicular within 5 degrees to decking)"); 
            Exit(); 
        } 
    } 
    
} 

→UNK000_016573BLOCK { // Import CLS to Variables
    object Ext_FinalULS →UNK000_015165= LoadExternCLC("CompositeBeam_AISC_360_10_ULS_Final.CLC"); 
    object Ext_ConstructionAndFinalSLS →UNK000_015375= LoadExternCLC("CompositeBeam_AISC_360_10_SLS_Construction_And_Final.CLC"); 
    object Ext_ConstructionULS →UNK000_015217= LoadExternCLC("CompositeBeam_AISC_360_10_ULS_Construction.CLC"); 
    object Ext_SSL →UNK000_018279= LoadExternCLC("Segmented_Stud_Layout.CLC"); 
    object Tables →UNK000_018784= LoadExternCLC("Property_Tables.CLC"); 
    object fontsColors →UNK000_019243= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\FontsAndColors.CLC"); 
    object FontsAndColors →UNK000_019244= fontsColors.GetFontsAndColors(); 
} 

→INI400_015472BLOCK { // Functions for autodesign
    
    bool IncreaseSection() { // Increases Section in Auto-Design
        object Stronger →INI400_016594= Linq.FirstOrDefault(MySections, object F=&gt;F.Wely &gt; DataExchange.CS.Wely); 
        IF(Stronger != null) { 
            gSectionIndex →INI400_016561= MySections.IndexOf(Stronger); 
            →INI400_015453DataExchange.Set("CS", Stronger); 
            return true; 
        } ELSE { 
            →INI400_015457TEXT("An error occured in optimisation: Unable to increase section"); 
            return false; // this will not be hit
            
        } 
    } 
    
    bool DecreaseSection() { // Decreases Section in Auto-Design
        object Weaker →INI400_016654= Linq.FirstOrDefault(MySections, object F=&gt;F.Wely &lt; DataExchange.CS.Wely); 
        IF(Weaker != null) { 
            gSectionIndex →INI400_016652= MySections.IndexOf(Weaker); 
            →INI400_016653DataExchange.Set("CS", Weaker); 
            return true; 
        } ELSE { 
            →INI400_015458TEXT("An error occured in optimisation: Unable to decrease section"); 
            return false; // this will not be hit
        } 
    } 
    
    public double GetUC_ULS_Con() { // Gets UC↓ULS,Con← in Auto-Design
        →INI400_015445Ext_ConstructionULS.Calculate(DataExchange, Output); 
        Calc_u↓z,SLS,ConSelf← →INI400_016586= Def_Constant↓SLS,ConSelf←/Output.I↓x←; 
        double UC →INI400_015446= Output.UC↓ULS,Con←; 
        M↓n,s← →INI400_018265= Output.M↓n,s←; 
        →INI400_018266DataExchange.Set("M↓n,s←", M↓n,s←); 
        M↓n← →GMP011_019504= Output.M↓n←; 
        →GMP011_019505DataExchange.Set("M↓n←", M↓n←); 
        return UC; 
    } 
    
    public double GetUC_ULS_Fin() { // Gets UC↓ULS,Fin← in Auto-Design
        →INI400_015448Ext_FinalULS.Calculate(DataExchange, Output); 
        Calc_u↓z,SLS,FinLive← →INI400_016614= Def_Constant↓SLS,FinLive←/Output.I↓LB←; 
        Calc_u↓z,SLS,FinTotal← →INI400_018438= Def_Constant↓SLS,FinTotal←/Output.I↓LB←; 
        double UC →INI400_015449= Output.UC↓ULS,Fin←; 
        return UC; 
    } 
    
    public double GetUC_Spacing() { 
        →INI400_019339Ext_FinalULS.Calculate(DataExchange, Output); 
        double UC →INI400_019342= Output.UC↓Spacing←; 
        return UC; 
    } 
    
    public double GetUC_Camber_Con() { // Gets UC↓Camber← in Auto-Design (to see if section will work with w/ max Camber)
        →INI400_016587DataExchange.Set("IsConStage", True); 
        →INI400_018527DataExchange.Set("IsLiveLoad", False); 
        →INI400_018523DataExchange.Set("InternalForces.u↓z,SLS,ConSelf←", Calc_u↓z,SLS,ConSelf←); 
        →INI400_016588Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
        IF(ABS(Calc_u↓z,SLS,ConSelf←) &gt; Output.u↓z,allow←) { 
            IF(MaxCamber &gt; 0) { 
                double UC →INI400_016592= (Calc_u↓z,SLS,ConSelf←-Output.u↓z,allow←)/MaxCamber; 
            } ELSE { 
                double UC →INI400_016613= 1; 
            } 
        } ELSE { 
            double UC →INI400_016612= 0; 
        } 
        return UC; 
    } 
    
    public double GetUC_Camber_Fin() { // Gets UC↓Camber← in Auto-Design (to see if section will work with w/ max Camber)
        →INI400_018444DataExchange.Set("IsConStage", False); 
        →INI400_018445DataExchange.Set("IsLiveLoad", False); 
        →INI400_018524DataExchange.Set("InternalForces.u↓z,SLS,FinTotal←", Calc_u↓z,SLS,FinTotal←); 
        →INI400_018440Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
        IF(ABS(Calc_u↓z,SLS,FinTotal←) &gt; Output.u↓z,allow←) { 
            IF(MaxCamber &gt; 0) { 
                double UC →INI400_018441= (Calc_u↓z,SLS,FinTotal←-Output.u↓z,allow←)/MaxCamber; 
            } ELSE { 
                double UC →INI400_018442= 1; 
            } 
        } ELSE { 
            double UC →INI400_018443= 0; 
        } 
        return UC; 
    } 
    
    public double GetUC_SLS_Fin_Live() { // Gets UC↓SLS,Fin← in Auto-Design
        →UNK000_019493DataExchange.Set("IsConStage", False); 
        →INI400_018435DataExchange.Set("IsLiveLoad", True); 
        →INI400_016627DataExchange.Set("InternalForces.u↓z,SLS,FinLive←", Calc_u↓z,SLS,FinLive←); 
        →INI400_016616Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
        double UC →INI400_016628= Output.UC↓d←; 
        
        return UC; 
    } 
    
} 

→INI400_016481BLOCK { // Setup Data
    
    CalcApproach →INI400_019270= IO.Beam.MemberData.Composite.Composite.CalcApproach; // 0 = Design and 1 = Check
    DesignApproach →INI400_019271= IO.Beam.MemberData.Composite.Composite.DesignApproach; // 0 = Optimize Beam , 1 = Stud, 2 = Balanced, 3 = User
    TargetDegree →INI400_019272= IO.Beam.MemberData.Composite.Composite.TargetDegree; // Target Degree of CA
    
    BeamDepthRestriction →INI400_019279= IO.Beam.MemberData.Composite.Composite.BeamDepthRestriction; // 1 = Yes , 0 = No
    MaxBeamDepth →INI400_019273= IO.Beam.MemberData.Composite.Composite.MaxBeamDepth; // Max Beam Depth

    CamberType →INI400_019274= IO.Beam.MemberData.Composite.Deflection.CamberType; // 0 = Design, 1 = No Camber, 2 = Abs, 3 = Relative, 4 = Deflection Ratio
    MaxCamber →INI400_019280= IO.Beam.MemberData.Composite.Deflection.CamberMax; // Max Camber Value
    CamberAbs →INI400_019275= IO.Beam.MemberData.Composite.Deflection.CamberAbs; // Camber - Abs Value
    CamberRel →INI400_019277= IO.Beam.MemberData.Composite.Deflection.CamberRel; // Camber - Relative Value
    
    SWITCH(CamberType) { 
        CASE 4 :  { Camber →INI400_019298= PhysConst(0.00, "in"); MaxCamber →INI400_019294= MaxCamber; } // Design Camber        
        CASE 5 :  { Camber →INI400_019332= PhysConst(0.00, "in"); MaxCamber →INI400_019293= Camber; } // No Camber
        CASE 1 :  { Camber →INI400_019299= CamberAbs; MaxCamber →INI400_019295= Camber; } // Abs Camber
        CASE 2 :  { Camber →INI400_019300= CamberRatio*IO.Beam.Member.Length; MaxCamber →INI400_019296= Camber; } //Relative Camber
        
        DEFAULT :  { Camber →INI400_019319= PhysConst(0.00, "in"); MaxCamber →INI400_019320= Camber; } 
    } 
    
    NumberStuds →GMP011_019684= IO.Beam.MemberData.Composite.Connectors.nrows_M; 
    
    
    IF(IO.Beam.MemberData.Composite.Composite.NegativeSteelOnly == 1) { 
        NegCompAction →GMP119_019503= false; 
    } ELSE { 
        NegCompAction →GMP119_019504= TRUE; 
    } 
    
    
} 

→INI400_014980BLOCK { // Max Moments and Deflections from Model

    // Go through all loads and get ones which are combinations (Type 1)
    IF(GetLength(IO.Beam.Load) &lt; 0) { 
        →INI400_018346TEXT("Warning: Composite design form requires multiple load combinations"); 
        →INI400_018347TEXT("Please add the following combinations to a class to procede:"); 
        →INI400_018381TEXT(" 1 - ULS Combination containing only Constuction Stage Loads "); 
        →INI400_018382TEXT(" 2 - ULS Combination containing at least one Final Stage Load"); 
        →INI400_018383TEXT(" 3 - SLS Combination containing only Constuction Stage Loads"); 
        →INI400_018384TEXT(" 4 - SLS Combination containing at least one Final Stage Load "); 
        
        string Designation →GMP000_019505= "XXX RLC"; 
        double MaxUC →GMP000_019507= 999; 
        →GMP000_019512SaveResults(ResultType.Member, "CompUS"); 
        Exit(); 
    } ELSE { 
        object Combo_Loads →INI400_018345= Linq.ToList(Linq.Where(IO.Beam.Load, object L=&gt;L.Type == 1)); 
    } 
    
    // Sort combinations by ULS and SLS
    IF(GetLength(Combo_Loads) &lt; 0) { 
        →INI400_018379TEXT("Warning: Composite design form requires multiple load combinations"); 
        →INI400_018380TEXT("Please add the following combinations to a class to procede:"); 
        →INI400_018354TEXT(" 1 - ULS Combination containing only Constuction Stage Loads "); 
        →INI400_018355TEXT(" 2 - ULS Combination containing at least one Final Stage Load"); 
        →INI400_018356TEXT(" 3 - SLS Combination containing only Constuction Stage Loads"); 
        →INI400_018357TEXT(" 4 - SLS Combination containing at least one Final Stage Load "); 
        string Designation →GMP000_019508= "XXX RLC"; 
        double MaxUC →GMP000_019510= 999; 
        →GMP000_019513SaveResults(ResultType.Member, "CompUS"); 
        Exit(); 
    } ELSE { 
        object ULS_Loads →INI400_015468= Linq.ToList(Linq.Where(Combo_Loads, object L=&gt;L.LimitState == 1)); 
        object SLS_Loads →INI400_015470= Linq.ToList(Linq.Where(Combo_Loads, object L=&gt;L.LimitState == 2)); 
    } 
    
    // Sort combos by Construction or Final stage (look at moment at center of beam
    // and if = to ConstrStage, then that combo is a construction stage load
    // and LongTerm &gt; 0.1 kip-ft, then that combo is a final stage load

    object GetConLoads(object Loads) { 
        object Result →INI400_018342= new object[]; 
        IF(GetLength(Loads) &gt; 0) { 
            FOR(i, 0, Loads.Count-1) { 
                IF(IO.Beam.Section[middle].InternalForces[Loads[i].ID].ConstrStage.My == IO.Beam.Section[middle].InternalForces[Loads[i].ID].My) { 
                    →INI400_018332Result.Add(Loads[i]); 
                } 
            } 
        } 
        return Result; 
    } 
    
    object GetFinLoads(object Loads) { 
        object Result →INI400_018344= new object[]; 
        IF(GetLength(Loads) &gt; 0) { 
            FOR(i, 0, Loads.Count-1) { 
                IF(IO.Beam.Section[middle].InternalForces[Loads[i].ID].ConstrStage.My != IO.Beam.Section[middle].InternalForces[Loads[i].ID].My) { 
                    →INI400_018337Result.Add(Loads[i]); 
                } 
            } 
        } 
        return Result; 
    } 
    
    object SLS_Con_Loads →INI400_018338= GetConLoads(SLS_Loads); 
    object SLS_Fin_Loads →INI400_018339= GetFinLoads(SLS_Loads); 
    object ULS_Con_Loads →INI400_018340= GetConLoads(ULS_Loads); 
    object ULS_Fin_Loads →INI400_018341= GetFinLoads(ULS_Loads); 
    
    // Check to make sure all load combos exist in case
    IF(ULS_Con_Loads.Count &lt;= 0 || ULS_Fin_Loads.Count &lt;= 0 || SLS_Con_Loads.Count &lt;= 0 || SLS_Fin_Loads.Count &lt;= 0) { 
        →INI400_018370TEXT("Warning: Load Class does not contain the following combinations:"); 
        IF(ULS_Con_Loads.Count &lt;= 0) { 
            →INI400_018369TEXT(" - ULS Combination containing only Constuction Stage Loads"); 
        } 
        IF(ULS_Fin_Loads.Count &lt;= 0) { 
            →INI400_018371TEXT(" - ULS Combination containing at least one Final Stage Load"); 
        } 
        IF(SLS_Con_Loads.Count &lt;= 0) { 
            →INI400_018372TEXT(" - SLS Combination containing only Constuction Stage Loads"); 
        } 
        IF(SLS_Fin_Loads.Count &lt;= 0) { 
            →INI400_018373TEXT(" - SLS Combination containing at least one Final Stage Load"); 
        } 
        →INI400_018374TEXT("Please add these combinations to procede"); 
        string Designation →GMP000_000003= "XXX RLC"; 
        double MaxUC →GMP000_000007= 999; 
        →GMP000_019503SaveResults(ResultType.Member, "CompUS"); 
        Exit(); 
    } 
    
    // Check to make sure load combos use a consistent design method (ASD or LRFD)
    void CheckConsisentDM(object Loads) { 
        IF(Loads.Count &gt; 0) { 
            FOR(i, 1, Loads.Count-1) { 
                IF(Loads[i].CombiType != Loads[i-1].CombiType) { 
                    →INI400_018377TEXT("Warning: Load combinations use inconsistent design methods."); 
                    →INI400_018378TEXT("Be sure all combinations use either 1) ASD or 2) LRFD"); 
                    string Designation →GMP000_000005= "XXX RLC"; 
                    double MaxUC →GMP000_000008= 999; 
                    →GMP000_019504SaveResults(ResultType.Member, "CompUS"); 
                    Exit(); 
                } 
            } 
        } 
    } 
    →INI400_018367CheckConsisentDM(ULS_Loads); 
    →INI400_018368CheckConsisentDM(SLS_Loads); 
    
    double ULS_CombiType →INI400_018323= ULS_Loads[0].CombiType; 
    double SLS_CombiType →INI400_018324= SLS_Loads[0].CombiType; 
    
    // Get the design method from the combo types
    IF(ULS_CombiType == 6 &amp;&amp; SLS_CombiType == 7) { 
        DesignMethod →INI400_018325= 1; // ASD
    } ELSE { 
        IF(ULS_CombiType == 4 &amp;&amp; SLS_CombiType == 5) { 
            DesignMethod →INI400_018326= 0; // LRFD
        } ELSE { 
            →INI400_018328TEXT("Warning: Load combinations use inconsistent design methods."); 
            →INI400_018376TEXT("Be sure all combinations use either 1) ASD or 2) LRFD"); 
            string Designation →GMP000_000009= "XXX RLC"; 
            double MaxUC →GMP000_000011= 999; 
            →GMP000_019511SaveResults(ResultType.Member, "CompUS"); 
            Exit(); 
        } 
    } 
    
    // Finds the longest unbraced length of the member (if more than 1)    
    IF(GetLength(IO.Beam.BucklingSystem.lt.Span) &gt; 0) { 
        double L↓b← →INI400_018267= Linq.Max(IO.Beam.BucklingSystem.lt.Span, object Span=&gt;Span.L); 
        double L↓b-bot← →GMP119_019561= Linq.Max(IO.Beam.BucklingSystem.ltBottom.Span, object Span=&gt;Span.L); 
    } ELSE { 
        L↓b← →INI400_018268= IO.Beam.BucklingSystem.lt.Span.L; 
        L↓b-bot← →GMP119_019562= IO.Beam.BucklingSystem.ltBottom.Span.L; 
    } 
    
    // Gets Max and Minumum Moments and Shear
    double V↓u,ULS,Con← →INI400_015139= Linq.Max(IO.Beam.Section, object Section=&gt;Linq.Max(Linq.Select(ULS_Con_Loads, object L=&gt;Section.InternalForces[L.ID]), object Combi=&gt;ABS(Combi.Vz))); 
    double V↓u,ULS,Fin← →INI400_015163= Linq.Max(IO.Beam.Section, object Section=&gt;Linq.Max(Linq.Select(ULS_Fin_Loads, object L=&gt;Section.InternalForces[L.ID]), object Combi=&gt;ABS(Combi.Vz))); 
    
    object FinMys →INI400_018287= →INI400_018286Ext_SSL.getMys(ULS_Fin_Loads); 
    double M↓y+,ULS,Fin← →INI400_018288= Linq.Max(FinMys); 
    double M↓y-,ULS,Fin← →INI400_018289= Linq.Min(FinMys); 
    
    object ConMys →UNK131_019407= →UNK131_019408Ext_SSL.getConMys(ULS_Con_Loads); 
    double M↓y+,ULS,Con← →UNK131_019409= Linq.Max(ConMys); 
    double M↓y-,ULS,Con← →UNK131_019410= Linq.Min(ConMys); 
    
    // Gets Max Deflection (Solves for Relative Deflection)
    object GetMaxDefCombiID(object Loads, string Subcombo) { 
        double CombiID →INI400_016459= -1; double u↓z,max← →INI400_016460= 0; 
        
        FOREACH(object Load in Loads) { 
            
            IF(Subcombo == "Live") { 
                double u↓z← →INI400_018402= Linq.Max(IO.Beam.Section, object Section=&gt;ABS(Section.Deformations[Load.ID].OnlyVariable.uz)); 
            } ELSE { IF(Subcombo == "Self") { 
                    double u↓z← →INI400_018401= Linq.Max(IO.Beam.Section, object Section=&gt;ABS(Section.Deformations[Load.ID].OnlySelfWeight.uz)); 
                } ELSE { 
                    double u↓z← →INI400_018400= Linq.Max(IO.Beam.Section, object Section=&gt;ABS(Section.Deformations[Load.ID].uz)); 
                } 
            } 
            double u↓z← →INI400_016600= Linq.Max(IO.Beam.Section, object Section=&gt;ABS(Section.Deformations[Load.ID].uz)); 
            IF(u↓z← &gt; u↓z,max←) { 
                u↓z,max← →INI400_016462= u↓z←; 
                CombiID →INI400_016463= Load.ID; 
            } 
        } 
        double SectionID →INI400_016464= Linq.First(IO.Beam.Section, object Section=&gt;ABS(Section.Deformations[CombiID].uz) == u↓z,max←).ID; 
        return new Structure("SectionID", SectionID, "CombiID", CombiID); 
    } 
    
    object SLS_Con_Self_Defs →INI400_018277= GetMaxDefCombiID(SLS_Con_Loads, "Self"); 
    object SLS_Fin_Total_Defs →INI400_018278= GetMaxDefCombiID(SLS_Fin_Loads, "Total"); 
    object SLS_Fin_Live_Defs →INI400_018403= GetMaxDefCombiID(SLS_Fin_Loads, "Live"); 
    
    double u↓z,SLS,ConSelf,Beg← →INI400_016465= IO.Beam.Section[0].Deformations[SLS_Con_Self_Defs.CombiID].OnlySelfWeight.uz; 
    double u↓z,SLS,ConSelf,Max← →INI400_016466= IO.Beam.Section[SLS_Con_Self_Defs.SectionID].Deformations[SLS_Con_Self_Defs.CombiID].OnlySelfWeight.uz; 
    double u↓z,SLS,ConSelf,End← →INI400_016467= IO.Beam.Section[IO.Beam.Section.Count-1].Deformations[SLS_Con_Self_Defs.CombiID].OnlySelfWeight.uz; 
    double u↓z,SLS,ConSelf← →INI400_016477= u↓z,SLS,ConSelf,Max←-(u↓z,SLS,ConSelf,Beg←+(u↓z,SLS,ConSelf,End←-u↓z,SLS,ConSelf,Beg←)*(IO.Beam.Section[SLS_Con_Self_Defs.SectionID].Dx)/(IO.Beam.Member.Length)); 
    
    double u↓z,SLS,FinLive,Beg← →INI400_016469= IO.Beam.Section[0].Deformations[SLS_Fin_Live_Defs.CombiID].OnlyVariable.uz; 
    double u↓z,SLS,FinLive,Max← →INI400_016470= IO.Beam.Section[SLS_Fin_Live_Defs.SectionID].Deformations[SLS_Fin_Live_Defs.CombiID].OnlyVariable.uz; 
    double u↓z,SLS,FinLive,End← →INI400_016471= IO.Beam.Section[IO.Beam.Section.Count-1].Deformations[SLS_Fin_Live_Defs.CombiID].OnlyVariable.uz; 
    double u↓z,SLS,FinLive← →INI400_016476= u↓z,SLS,FinLive,Max←-(u↓z,SLS,FinLive,Beg←+(u↓z,SLS,FinLive,End←-u↓z,SLS,FinLive,Beg←)*(IO.Beam.Section[SLS_Fin_Live_Defs.SectionID].Dx)/(IO.Beam.Member.Length)); 
    
    double u↓z,SLS,FinTotal,Beg← →INI400_018404= IO.Beam.Section[0].Deformations[SLS_Fin_Total_Defs.CombiID].uz; 
    double u↓z,SLS,FinTotal,Max← →INI400_018405= IO.Beam.Section[SLS_Fin_Total_Defs.SectionID].Deformations[SLS_Fin_Total_Defs.CombiID].uz; 
    double u↓z,SLS,FinTotal,End← →INI400_018406= IO.Beam.Section[IO.Beam.Section.Count-1].Deformations[SLS_Fin_Total_Defs.CombiID].uz; 
    double u↓z,SLS,FinTotal← →INI400_018407= u↓z,SLS,FinTotal,Max←-(u↓z,SLS,FinTotal,Beg←+(u↓z,SLS,FinTotal,End←-u↓z,SLS,FinTotal,Beg←)*(IO.Beam.Section[SLS_Fin_Total_Defs.SectionID].Dx)/(IO.Beam.Member.Length)); 
    
    
    IF(WO) { // Moment and Shear at opening

        double V↓uo,ULS,Con← →GMP011_019567= 0; 
        double V↓uos,ULS,Con← →GMP011_019571= 0; 
        double V↓uoe,ULS,Con← →GMP011_019573= 0; 
        double V↓uo,ULS,Fin← →GMP011_019568= 0; 
        double V↓uos,ULS,Fin← →GMP011_019572= 0; 
        double V↓uoe,ULS,Fin← →GMP011_019574= 0; 
        
        object d2d↓o← →GMP011_019631= new object[]; 
        object d2d↓os← →GMP011_019632= new object[]; 
        object d2d↓oe← →GMP011_019633= new object[]; 
        
        FOR(i, 0, IO.Beam.Section.Count-1) { 
            d2d↓o←[i] →GMP011_019634= IO.Beam.Section[i].Dx-d↓o←; 
            d2d↓os←[i] →GMP011_019635= IO.Beam.Section[i].Dx-d↓os←; 
            d2d↓oe←[i] →GMP011_019636= IO.Beam.Section[i].Dx-d↓oe←; 
        } 
        
        →GMP011_019647double i_d2d↓ol←; 
        →GMP011_019648double i_d2d↓or←; 
        double d2d↓ol← →GMP011_019642= -99999999; 
        double d2d↓or← →GMP011_019643= 99999999; 
        →GMP011_019651double i_d2d↓osl←; 
        →GMP011_019652double i_d2d↓osr←; 
        double d2d↓osl← →GMP011_019653= -99999999; 
        double d2d↓osr← →GMP011_019654= 99999999; 
        →GMP011_019655double i_d2d↓oel←; 
        →GMP011_019656double i_d2d↓oer←; 
        double d2d↓oel← →GMP011_019657= -99999999; 
        double d2d↓oer← →GMP011_019658= 99999999; 
        
        FOR(i, 1, IO.Beam.Section.Count-1) { 
            IF(COMPARE(d2d↓o←[i], 0, 3) &lt;= 0 &amp;&amp; d2d↓o←[i] &gt;= d2d↓ol←) { 
                d2d↓ol← →GMP011_019644= d2d↓o←[i]; 
                double i_d2d↓ol← →GMP011_019646= i; 
            } 
            IF(COMPARE(d2d↓o←[i], 0, 3) &gt;= 0 &amp;&amp; d2d↓o←[i] &lt;= d2d↓or←) { 
                d2d↓or← →GMP011_019645= d2d↓o←[i]; 
                double i_d2d↓or← →GMP011_019649= i; 
            } 
            IF(COMPARE(d2d↓os←[i], 0, 3) &lt;= 0 &amp;&amp; d2d↓os←[i] &gt;= d2d↓osl←) { 
                d2d↓osl← →GMP011_019659= d2d↓os←[i]; 
                double i_d2d↓osl← →GMP011_019660= i; 
            } 
            IF(COMPARE(d2d↓os←[i], 0, 3) &gt;= 0 &amp;&amp; d2d↓os←[i] &lt;= d2d↓osr←) { 
                d2d↓osr← →GMP011_019661= d2d↓os←[i]; 
                double i_d2d↓osr← →GMP011_019662= i; 
            } 
            IF(COMPARE(d2d↓oe←[i], 0, 3) &lt;= 0 &amp;&amp; d2d↓oe←[i] &gt;= d2d↓oel←) { 
                d2d↓oel← →GMP011_019663= d2d↓oe←[i]; 
                double i_d2d↓oel← →GMP011_019664= i; 
            } 
            IF(COMPARE(d2d↓oe←[i], 0, 3) &gt;= 0 &amp;&amp; d2d↓oe←[i] &lt;= d2d↓oer←) { 
                d2d↓oer← →GMP011_019665= d2d↓oe←[i]; 
                double i_d2d↓oer← →GMP011_019666= i; 
            } 
            
        } 
        
        FOREACH(object Load in ULS_Fin_Loads) { 
            double FV↓o← →GMP011_019569= (ABS(d2d↓ol←)/(ABS(d2d↓ol←)+ABS(d2d↓or←)+0.00001))*(IO.Beam.Section[i_d2d↓or←].InternalForces[Load.ID].Vz-IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].Vz)+IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].Vz; 
            IF(ABS(FV↓o←) &gt; V↓uo,ULS,Fin←) { 
                V↓uo,ULS,Fin← →GMP011_019570= FV↓o←; 
            } 
            double FV↓os← →GMP011_019667= (ABS(d2d↓osl←)/(ABS(d2d↓osl←)+ABS(d2d↓osr←)+0.00001))*(IO.Beam.Section[i_d2d↓osr←].InternalForces[Load.ID].Vz-IO.Beam.Section[i_d2d↓osl←].InternalForces[Load.ID].Vz)+IO.Beam.Section[i_d2d↓osl←].InternalForces[Load.ID].Vz; 
            IF(ABS(FV↓os←) &gt; V↓uos,ULS,Fin←) { 
                V↓uos,ULS,Fin← →GMP011_019668= FV↓os←; 
            } 
            double FV↓oe← →GMP011_019669= (ABS(d2d↓oel←)/(ABS(d2d↓oel←)+ABS(d2d↓oer←)+0.00001))*(IO.Beam.Section[i_d2d↓oer←].InternalForces[Load.ID].Vz-IO.Beam.Section[i_d2d↓oel←].InternalForces[Load.ID].Vz)+IO.Beam.Section[i_d2d↓oel←].InternalForces[Load.ID].Vz; 
            IF(ABS(FV↓oe←) &gt; V↓uoe,ULS,Fin←) { 
                V↓uoe,ULS,Fin← →GMP011_019670= FV↓oe←; 
            } 
        } 
        FOREACH(object Load in ULS_Con_Loads) { 
            double CV↓o← →GMP011_019671= (ABS(d2d↓ol←)/(ABS(d2d↓ol←)+ABS(d2d↓or←)+0.00001))*(IO.Beam.Section[i_d2d↓or←].InternalForces[Load.ID].Vz-IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].Vz)+IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].Vz; 
            IF(ABS(CV↓o←) &gt; V↓uo,ULS,Con←) { 
                V↓uo,ULS,Con← →GMP011_019672= CV↓o←; 
            } 
            double CV↓os← →GMP011_019673= (ABS(d2d↓osl←)/(ABS(d2d↓osl←)+ABS(d2d↓osr←)+0.00001))*(IO.Beam.Section[i_d2d↓osr←].InternalForces[Load.ID].Vz-IO.Beam.Section[i_d2d↓osl←].InternalForces[Load.ID].Vz)+IO.Beam.Section[i_d2d↓osl←].InternalForces[Load.ID].Vz; 
            IF(ABS(CV↓os←) &gt; V↓uos,ULS,Con←) { 
                V↓uos,ULS,Con← →GMP011_019674= CV↓os←; 
            } 
            double CV↓oe← →GMP011_019675= (ABS(d2d↓oel←)/(ABS(d2d↓oel←)+ABS(d2d↓oer←)+0.00001))*(IO.Beam.Section[i_d2d↓oer←].InternalForces[Load.ID].Vz-IO.Beam.Section[i_d2d↓oel←].InternalForces[Load.ID].Vz)+IO.Beam.Section[i_d2d↓oel←].InternalForces[Load.ID].Vz; 
            IF(ABS(CV↓oe←) &gt; V↓uoe,ULS,Con←) { 
                V↓uoe,ULS,Con← →GMP011_019676= CV↓oe←; 
            } 
        } 
        M↓yo,ULS,Fin← →GMP011_019677= (ABS(d2d↓ol←)/(ABS(d2d↓ol←)+ABS(d2d↓or←)+0.00001))*(FinMys[i_d2d↓or←]-FinMys[i_d2d↓ol←])+FinMys[i_d2d↓ol←]; 
        M↓yos,ULS,Fin← →GMP011_019678= (ABS(d2d↓osl←)/(ABS(d2d↓osl←)+ABS(d2d↓osr←)+0.00001))*(FinMys[i_d2d↓osr←]-FinMys[i_d2d↓osl←])+FinMys[i_d2d↓osl←]; 
        M↓yoe,ULS,Fin← →GMP011_019679= (ABS(d2d↓oel←)/(ABS(d2d↓oel←)+ABS(d2d↓oer←)+0.00001))*(FinMys[i_d2d↓oer←]-FinMys[i_d2d↓oel←])+FinMys[i_d2d↓oel←]; 
        M↓yo,ULS,Con← →GMP011_019680= (ABS(d2d↓ol←)/(ABS(d2d↓ol←)+ABS(d2d↓or←)+0.00001))*(ConMys[i_d2d↓or←]-ConMys[i_d2d↓ol←])+ConMys[i_d2d↓ol←]; 
        M↓yos,ULS,Con← →GMP011_019681= (ABS(d2d↓osl←)/(ABS(d2d↓osl←)+ABS(d2d↓osr←)+0.00001))*(ConMys[i_d2d↓osr←]-ConMys[i_d2d↓osl←])+ConMys[i_d2d↓osl←]; 
        M↓yoe,ULS,Con← →GMP011_019682= (ABS(d2d↓oel←)/(ABS(d2d↓oel←)+ABS(d2d↓oer←)+0.00001))*(ConMys[i_d2d↓oer←]-ConMys[i_d2d↓oel←])+ConMys[i_d2d↓oel←]; 
        
        
    } 
    
    // Beginning and End Moments and Shears (Final ULS)
    double V↓z0,ULS,Fin← →GMP009_019503= 0; 
    double V↓z1,ULS,Fin← →GMP009_019506= 0; 
    double M↓y0,ULS,Fin← →GMP009_019509= 0; 
    double M↓y1,ULS,Fin← →GMP009_019510= 0; 
    
    FOREACH(object Load in ULS_Fin_Loads) { 
        double FV↓z0,ULS,Fin← →GMP009_019504= IO.Beam.Section[0].InternalForces[Load.ID].Vz; 
        IF(ABS(FV↓z0,ULS,Fin←) &gt; ABS(V↓z0,ULS,Fin←)) { V↓z0,ULS,Fin← →GMP009_019505= FV↓z0,ULS,Fin←; } 
        double FV↓z1,ULS,Fin← →GMP009_019507= IO.Beam.Section[IO.Beam.Section.Count-1].InternalForces[Load.ID].Vz; 
        IF(ABS(FV↓z1,ULS,Fin←) &gt; ABS(V↓z1,ULS,Fin←)) { V↓z1,ULS,Fin← →GMP009_019508= FV↓z1,ULS,Fin←; } 
        double FM↓y0,ULS,Fin← →GMP009_019511= FinMys[0]; 
        IF(ABS(FM↓y0,ULS,Fin←) &gt; ABS(M↓y0,ULS,Fin←)) { M↓y0,ULS,Fin← →GMP009_019512= FM↓y0,ULS,Fin←; } 
        double FM↓y1,ULS,Fin← →GMP009_019513= FinMys[IO.Beam.Section.Count-1]; 
        IF(ABS(FM↓y1,ULS,Fin←) &gt; ABS(M↓y1,ULS,Fin←)) { M↓y1,ULS,Fin← →GMP009_019514= FM↓y1,ULS,Fin←; } 
    } 
    
    
    // Table with Max Forces and Deflections
    IF(IO.IsDrawing) { 
        
        SWITCH(CalcApproach) { 
            CASE 0 :  { // Design
                →INI400_018565TEXT("Design of Composite Member " &amp; IO.Beam.Member.Name); 
            } 
            CASE 1 :  { // Check only
                →INI400_018564TEXT("Check of Composite Member " &amp; IO.Beam.Member.Name); 
            } 
            DEFAULT :  { } 
        } 
        
        
        →INI400_016204TEXT("Design Forces"); 
        double Ncolumns →INI400_016144= 4; 
        double n →INI400_016145= 9; 
        object T →INI400_016146= new Table(Ncolumns); 
        
        T[0][0].Value →INI400_016483= "Item"; 
        T[0][1].Value →INI400_016147= "Stage"; 
        T[0][2].Value →INI400_016148= "Value"; 
        T[0][3].Value →INI400_016149= "Units"; 
        
        T[1][0].Value →INI400_016201= "Max Positive Moment"; 
        T[1][1].Value →INI400_016202= "Construction (Pre-Composite)"; 
        T[1][2].Value →INI400_016203= CUnit(M↓y+,ULS,Con←, "kip*ft"); 
        T[1][3].Value →INI400_016484= "kip-ft"; 
        
        T[2][0].Value →INI400_016486= "Max Negative Moment"; 
        T[2][1].Value →INI400_016487= "Construction (Pre-Composite)"; 
        IF(COMPARE(CUnit(M↓y-,ULS,Con←, "kip*ft"), PhysConst(0, "kip*ft"), 2) == -1) { 
            T[2][2].Value →INI400_016488= CUnit(M↓y-,ULS,Con←, "kip*ft"); 
        } ELSE { 
            T[2][2].Value →INI400_016490= 0; 
        } 
        T[2][3].Value →INI400_016489= "kip-ft"; 
        
        T[3][0].Value →INI400_016491= "Max Positive Moment"; 
        T[3][1].Value →INI400_016492= "Final (Post-Composite)"; 
        T[3][2].Value →INI400_016493= CUnit(M↓y+,ULS,Fin←, "kip*ft"); 
        T[3][3].Value →INI400_016494= "kip-ft"; 
        
        T[4][0].Value →INI400_016495= "Max Negative Moment"; 
        T[4][1].Value →INI400_016496= "Final (Post-Composite)"; 
        IF(COMPARE(M↓y-,ULS,Fin←, PhysConst(-0.5, "kip*ft"), 3) &lt; 0) { 
            T[4][2].Value →INI400_016497= CUnit(M↓y-,ULS,Fin←, "kip*ft"); 
        } ELSE { T[4][2].Value →GMP311_000003= CUnit(0, "kip*ft"); } 
        T[4][3].Value →INI400_016499= "kip-ft"; 
        
        T[5][0].Value →INI400_016504= "Max Shear"; 
        T[5][1].Value →INI400_016505= "Construction (Pre-Composite)"; 
        T[5][2].Value →INI400_016506= CUnit(V↓u,ULS,Con←, "kip"); 
        T[5][3].Value →INI400_016507= "kip"; 
        
        T[6][0].Value →INI400_016500= "Max Shear"; 
        T[6][1].Value →INI400_016501= "Final (Post-Composite)"; 
        T[6][2].Value →INI400_016502= CUnit(V↓u,ULS,Fin←, "kip"); 
        T[6][3].Value →INI400_016503= "kip"; 
        
        T[7][0].Value →INI400_016508= "Max Deformation (Due to Self Weight)"; 
        T[7][1].Value →INI400_016509= "Construction (Pre-Composite)"; 
        T[7][2].Value →INI400_016510= CUnit(u↓z,SLS,ConSelf←, "in"); 
        T[7][3].Value →INI400_016511= "in"; 
        
        T[8][0].Value →INI400_016512= "Max Deformation (Due to Live Load)"; 
        T[8][1].Value →INI400_016513= "Final (Post-Composite)"; 
        T[8][2].Value →INI400_016514= CUnit(u↓z,SLS,FinLive←, "in"); 
        T[8][3].Value →INI400_016515= "in"; 
        
        T[9][0].Value →INI400_018408= "Max Deformation (Due to Total Load)"; 
        T[9][1].Value →INI400_018409= "Final (Post-Composite)"; 
        T[9][2].Value →INI400_018410= CUnit(u↓z,SLS,FinTotal←, "in"); 
        T[9][3].Value →INI400_018411= "in"; 
        
        T.BorderPen →INI400_016175= FontsAndColors.TableBorderPen(); 
        T[0].BorderPen →INI400_016176= FontsAndColors.TableBorderPen(); 
        T.GridPen →INI400_016177= FontsAndColors.TableGridPen(); 
        T.Rows[0].Font →INI400_016178= FontsAndColors.TableHeaderFont(); 
        T.Font →INI400_016179= FontsAndColors.TableCellsFont(); 
        T.Padding.All →INI400_016180= 5; 
        T.Padding.Top →INI400_016181= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
        T.Padding.Bottom →INI400_016182= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
        T.Rows[0].BackColor →INI400_016183= FontsAndColors.ColorTableHeader(); 
        
        FOR(i, 1, n) { 
            T[i][0].BackColor →INI400_016184= FontsAndColors.ColorTableRow(); 
        } 
        →INI400_016185T.Draw(); 
        
        IF(COMPARE(u↓z,SLS,ConSelf,Max←, 0, 4) == 0) { 
            →GMP011_019746TEXT("Warning: Construction Self Weight Deflection is 0 inches. "); 
            →GMP011_019747TEXT("Please ensure 'Load type' for self-weight load cases are set to 'Self weight'"); 
        } 
        →GMP011_000072PAGEBREAK(); 
        
    } 
} 

→GMP011_019585BLOCK { // Web opening dialog


    
    void UpdateMemberDataDialog() { 
        
        Dialog.GetComponentByName("WOS").Visible →GMP119_019560= (WO); 
        
        Dialog.GetComponentByName("WO_Box").Visible →GMP119_019508= (WOS == 1 &amp;&amp; WO); 
        Dialog.GetComponentByName("CWO_Box").Visible →GMP119_019506= (WOS == 2 &amp;&amp; WO); 
        Dialog.GetComponentByName("RWO").Visible →GMP119_019510= (WO); 
        Dialog.GetComponentByName("RWO_Box").Visible →GMP119_019509= (RWO &amp;&amp; WO); 
        
    } 
    
    
    IF(WOS == 2) { CWO →GMP119_019563= true; } ELSE { CWO →GMP119_019564= false; } 
    
    A↓ro← →GMP011_019749= b↓ro←*t↓ro←; 
    
} 

→INI400_012925BLOCK { // Import Current Member Data from Model and Put In Data Exchange Structure

    // Current section info
    object gSectionInfo →INI400_015450= SteelSections.GetSectionInfo(IO.CS.Description); 
    
    // All sections sorted by area
    object MySections →INI400_015451= Linq.ToList(Linq.OrderBy(gSectionInfo.Group.Sections, object S=&gt;S.A)); 
    double gSectionIndex →INI400_015452= MySections.IndexOf(gSectionInfo.Section); 
    
    object DataExchange →INI400_015142= new Structure(
    "Ext_SSL", Ext_SSL, 
    "DesignMethod", DesignMethod, 
    "CalcApproach", CalcApproach, 
    "NumberStuds", NumberStuds, 
    "Steel", IO.Material, 
    "Slab", IO.Beam.Composite.Slab, 
    "Section", IO.Section, 
    "CS", IO.Beam.CrossSection, 
    "Connectors", IO.MemberData.Composite.Connectors, 
    "Connection", IO.Beam.Composite.Connection, 
    "CompAction", IO.Beam.Composite.Connection.Degree, 
    "Reinf2D", IO.MemberData.Composite.Reinf2D, 
    "Neighbour", IO.Section.Neighbour, 
    "BucklingData", IO.Section.BucklingData, 
    "Camber", new Structure(
    "Max", 0, 
    "ConLimit", IO.Setup.Composite.Deflection.LimitCS, 
    "FinLiveLimit", IO.Setup.Composite.Deflection.LimitAdd, 
    "FinTotalLimit", IO.Setup.Composite.Deflection.LimitTotal), 
    "NegCompAction", NegCompAction, 
    "PlateRib", IO.Beam.PlateRib, 
    "StudRows", 0, 
    "M↓n,s←", 0, 
    "M↓n←", 0, 
    "M↓n,c←", 0, 
    "L↓b←", L↓b←, 
    "L↓b-bot←", L↓b-bot←, 
    "InternalForces", new Structure(
    "M↓y+,ULS,Con←", M↓y+,ULS,Con←, 
    "M↓y-,ULS,Con←", M↓y-,ULS,Con←, 
    "M↓y+,ULS,Fin←", M↓y+,ULS,Fin←, 
    "M↓y-,ULS,Fin←", M↓y-,ULS,Fin←, 
    "V↓u,ULS,Con←", V↓u,ULS,Con←, 
    "V↓u,ULS,Fin←", V↓u,ULS,Fin←, 
    "u↓z,SLS,ConSelf←", u↓z,SLS,ConSelf←, 
    "u↓z,SLS,FinTotal←", u↓z,SLS,FinTotal←, 
    "u↓z,SLS,FinLive←", u↓z,SLS,FinLive←), 
    "WebOpenings", new Structure(
    "WO", WO, 
    "a↓wo←", a↓wo←, 
    "h↓wo←", h↓wo←, 
    "e↓wo←", e↓wo←, 
    "A↓ro←", A↓ro←, 
    "d↓rto←", d↓rto←, 
    "d↓rbo←", d↓rbo←, 
    "d↓o←", d↓o←, 
    "D↓wo←", D↓wo←, 
    "l↓1←", l↓1←, 
    "b↓ro←", b↓ro←, 
    "t↓ro←", t↓ro←, 
    "CWO", CWO, 
    "RWO", RWO, 
    "RWOBS", RWOBS, 
    "M↓yo,ULS,Fin←", M↓yo,ULS,Fin←, 
    "M↓yos,ULS,Fin←", M↓yos,ULS,Fin←, 
    "M↓yoe,ULS,Fin←", M↓yoe,ULS,Fin←, 
    "M↓yo,ULS,Con←", M↓yo,ULS,Con←, 
    "M↓yos,ULS,Con←", M↓yos,ULS,Con←, 
    "M↓yoe,ULS,Con←", M↓yoe,ULS,Con←, 
    "V↓uo,ULS,Fin←", V↓uo,ULS,Fin←, 
    "V↓uos,ULS,Fin←", V↓uos,ULS,Fin←, 
    "V↓uoe,ULS,Fin←", V↓uoe,ULS,Fin←, 
    "V↓uo,ULS,Con←", V↓uo,ULS,Con←, 
    "V↓uos,ULS,Con←", V↓uos,ULS,Con←, 
    "V↓uoe,ULS,Con←", V↓uoe,ULS,Con←), 
    "ULS_Fin_Loads", ULS_Fin_Loads, 
    "ULS_Con_Loads", ULS_Con_Loads); 
} 


→INI400_015214BLOCK { // Current Model Calculations (Draw Results)

    // Set current cross-section in data exchange
    →INI400_016676DataExchange.Set("CS", MySections[gSectionIndex]); 
    
    →INI400_019199Ext_ConstructionULS.Calculate(DataExchange, Output); 
    M↓n,s← →INI400_019203= Output.M↓n,s←; 
    →INI400_019205DataExchange.Set("M↓n,s←", M↓n,s←); 
    M↓n← →GMP011_019507= Output.M↓n←; 
    →GMP011_019508DataExchange.Set("M↓n←", M↓n←); 
    
    double InitialCA →INI400_019179= DataExchange.CompAction; 
    
    // Calculate Final ULS to get Stud Rows, MaxCA, and gInput (needed to display SSL)
    // Set the number of stud rows and recalculate (Number of studs needed for diagram may change)
    →INI400_019178DataExchange.Set("StudRows", 1); 
    →INI400_019001Ext_FinalULS.Calculate(DataExchange, Output); 
    MaxCA →INI400_019207= Output.MaxCA; 
    MinCA →GMP011_019693= Output.MinCA; 
    StudRows →INI400_019002= Output.StudRows; 
    gInput →INI400_019003= Output.gInput; 
    
    →INI400_019004DataExchange.Set("StudRows", StudRows); 
    →INI400_019214Ext_FinalULS.Calculate(DataExchange, Output); 
    UC↓Spacing← →INI400_019380= Output.UC↓Spacing←; 
    I↓LB← →GMP311_000004= Output.I↓LB←; 
    Q↓n← →GMP311_000005= Output.Q↓n←; 
    M↓n,c← →GMP311_000010= Output.M↓n,c←; 
    actualCA →GMP011_019689= Output.posCRatio; 
    MinSpacing →GMP311_011424= Output.MinSpacing; 
    MaxSpacing →GMP311_011425= Output.MaxSpacing; 
    
    
    →GMP311_000006DataExchange.Set("Q↓n←", Q↓n←); 
    →GMP311_000007DataExchange.Set("I↓LB←", I↓LB←); 
    →GMP311_000008DataExchange.Set("M↓n,c←", M↓n,c←); 
    
    // Display Tables of Data
    IF(IO.IsDrawing) { 
        →INI400_019005Tables.Draw(DataExchange, Output, 0); 
    } 
    →INI400_011352PAGEBREAK(); 
    
    // Display Moment Diagram and Stud Layouts
    //IF(IO.IsDrawing &amp;&amp; CalcApproach == 0) { 
    IF(CalcApproach == 0) { 
        →INI400_018993TEXT("Moment Diagram and Stud Layout"); 
        
        →INI400_019006Ext_SSL.Draw(gInput, Output, 0); 
    } ELSE { 
        →GMP011_019688TEXT("Stud Layout Not Available for 'Check' Approach"); 
    } 
    IF(UC↓Spacing← &gt;= 1.0) { 
        →INI400_017441TEXT("Warning: Number of studs needed on member exceeds number of studs allowed by spacing requirements"); 
    } 
    →INI400_019017PAGEBREAK(); 
    
    
    →GMP311_000011TEXT("Detailing Checks"); 
    
    →GMP311_011423BLOCK { // Detailing Checks Table    
        Ncolumns →GMP311_000012= 4; 
        n →GMP311_000013= 11; 
        object T →GMP311_000014= new Table(Ncolumns); 
        
        T[0][0].Value →GMP311_000015= TR("Check Description"); 
        T[0][1].Value →GMP311_000016= TR("Value"); 
        T[0][2].Value →GMP311_000053= TR("Reference"); 
        T[0][3].Value →GMP311_000017= TR("Pass/Fail"); 
        bool DetailChecksPass →GMP311_011472= true; 
        T[1][0].Value →GMP311_000018= TR("Concrete compressive strength is between 3000 psi ≤ F↓c ←≤ 10000 psi"); 
        T[1][1].Value →GMP311_000019= CUnit(DataExchange.Slab.Material.IBC.fc, "psi") &amp; " psi"; 
        T[1][2].Value →GMP311_000054= "AISC I.1.1.3.1"; 
        IF(COMPARE(DataExchange.Slab.Material.IBC.fc, PhysConst(10000, "psi"), 3) == 1 || COMPARE(DataExchange.Slab.Material.IBC.fc, PhysConst(3000, "psi"), 3) == -1) { 
            T[1][3].BackColor →GMP311_011440= FontsAndColors.ColorForCheckStatus(0); 
            T[1][3].Value →GMP311_000020= TR("Fail"); 
            bool DetailChecksPass →GMP011_019537= false; 
        } ELSE { 
            T[1][3].BackColor →GMP311_011438= FontsAndColors.ColorForCheckStatus(1); 
            T[1][3].Value →GMP311_000021= TR("Pass"); 
        } 
        
        T[2][0].Value →GMP311_000022= TR("Maximum reinforcement steel yield strength is 75 ksi"); 
        T[2][1].Value →GMP311_000023= CUnit(DataExchange.Reinf2D.Material.IBC.fy, "ksi") &amp; " ksi"; 
        T[2][2].Value →GMP311_000055= "AISC I1.1.3.2"; 
        IF(COMPARE(DataExchange.Reinf2D.Material.IBC.fy, PhysConst(75, "ksi"), 3) != -1) { 
            T[2][3].BackColor →GMP311_011442= FontsAndColors.ColorForCheckStatus(0); 
            T[2][3].Value →GMP311_000024= TR("Fail"); 
            bool DetailChecksPass →GMP311_011473= false; 
        } ELSE { 
            T[2][3].BackColor →GMP311_011443= FontsAndColors.ColorForCheckStatus(1); 
            T[2][3].Value →GMP311_000025= TR("Pass"); 
        } 
        
        T[3][0].Value →GMP311_000026= TR("Deck nominal rib height does not exceed 3''"); 
        T[3][1].Value →GMP311_000027= CUnit(DataExchange.Slab.Sheeting.Geometry.hp, "in") &amp; " in"; 
        T[3][2].Value →GMP311_011376= "AISC I3.2c.1.1"; 
        IF(COMPARE(DataExchange.Slab.Sheeting.Geometry.hp, PhysConst(3.00, "in"), 2) == 1) { 
            T[3][3].BackColor →GMP311_011445= FontsAndColors.ColorForCheckStatus(0); 
            T[3][3].Value →GMP311_000028= TR("Fail"); 
            bool DetailChecksPass →GMP011_019538= false; 
        } ELSE { 
            T[3][3].BackColor →GMP311_011444= FontsAndColors.ColorForCheckStatus(1); 
            T[3][3].Value →GMP311_000029= TR("Pass"); 
            
        } 
        
        T[4][0].Value →GMP311_000030= TR("Shear stud diameter does not exceed 0.75''"); 
        T[4][1].Value →GMP311_000031= CUnit(DataExchange.Connectors.Connector.ds, "in") &amp; " in"; 
        T[4][2].Value →GMP311_011378= "AISC I3.2c.1.2"; 
        IF(COMPARE(DataExchange.Connectors.Connector.ds, PhysConst(0.75, "in"), 2) &gt; 0) { 
            T[4][3].BackColor →GMP311_011446= FontsAndColors.ColorForCheckStatus(0); 
            T[4][3].Value →GMP311_000032= TR("Fail"); 
            bool DetailChecksPass →GMP011_019539= false; 
        } ELSE { 
            T[4][3].BackColor →GMP311_011447= FontsAndColors.ColorForCheckStatus(1); 
            T[4][3].Value →GMP311_000033= TR("Pass"); 
        } 
        
        
        T[5][0].Value →GMP311_000038= TR("Studs extend not less than 1.5'' above top of steel deck"); 
        T[5][1].Value →GMP311_011400= ROUND(CUnit(DataExchange.Connectors.Connector.hsc-DataExchange.Slab.Sheeting.Geometry.hp, "in"), 2) &amp; " in"; 
        T[5][2].Value →GMP311_011401= "AISC I3.2c.1.2"; 
        IF(COMPARE(DataExchange.Connectors.Connector.hsc-DataExchange.Slab.Sheeting.Geometry.hp, PhysConst(1.5, "in"), 2) == -1) { 
            T[5][3].BackColor →GMP311_011448= FontsAndColors.ColorForCheckStatus(0); 
            T[5][3].Value →GMP311_011402= TR("Fail"); 
            bool DetailChecksPass →GMP011_019540= false; 
        } ELSE { 
            T[5][3].BackColor →GMP311_011449= FontsAndColors.ColorForCheckStatus(1); 
            T[5][3].Value →GMP311_011405= TR("Pass"); 
        } 
        
        T[6][0].Value →GMP311_011407= TR("Concrete cover c↓c← is minimum 0.5'' above top of studs"); 
        T[6][1].Value →GMP311_011408= ROUND(CUnit(DataExchange.Slab.Thickness-DataExchange.Connectors.Connector.hsc, "in"), 2) &amp; TR(" in"); 
        T[6][2].Value →GMP311_011409= "AISC I3.2c.1.2"; 
        IF(COMPARE(DataExchange.Slab.Thickness-DataExchange.Connectors.Connector.hsc, PhysConst(0.5, "in"), 2) == -1) { 
            T[6][3].BackColor →GMP311_011450= FontsAndColors.ColorForCheckStatus(0); 
            T[6][3].Value →GMP311_011410= TR("Fail"); 
            bool DetailChecksPass →GMP011_019541= false; 
        } ELSE { 
            T[6][3].BackColor →GMP311_011451= FontsAndColors.ColorForCheckStatus(1); 
            T[6][3].Value →GMP311_011413= TR("Pass"); 
        } 
        
        T[7][0].Value →GMP311_011415= TR("Concrete slab thickness is at least 2'' above steel deck"); 
        T[7][1].Value →GMP311_011416= ROUND(CUnit(DataExchange.Slab.Thickness-DataExchange.Slab.Sheeting.Geometry.hp, "in"), 2) &amp; " in"; 
        T[7][2].Value →GMP311_011417= "AISC I3.2c.1.3"; 
        IF(COMPARE(DataExchange.Slab.Thickness-DataExchange.Slab.Sheeting.Geometry.hp, PhysConst(2, "in"), 2) == -1) { 
            T[7][3].BackColor →GMP311_011452= FontsAndColors.ColorForCheckStatus(0); 
            T[7][3].Value →GMP311_011418= TR("Fail"); 
            bool DetailChecksPass →GMP011_019542= false; 
        } ELSE { 
            T[7][3].BackColor →GMP311_011453= FontsAndColors.ColorForCheckStatus(1); 
            T[7][3].Value →GMP311_011421= TR("Pass"); 
        } 
        
        T[8][0].Value →GMP311_011488= TR("Stud diameter not greater than 2.5x thickness of metal to which it is welded (t↓f←)"); 
        T[8][1].Value →GMP311_011489= ROUND(CUnit(DataExchange.Connectors.Connector.ds, "in"), 2) &amp; " in"; 
        T[8][2].Value →GMP311_011490= "AISC I8.1"; 
        IF(COMPARE(DataExchange.Connectors.Connector.ds, 2.5*DataExchange.CS.Geometry.t, 2) == 1) { 
            T[8][3].BackColor →GMP311_011491= FontsAndColors.ColorForCheckStatus(0); 
            T[8][3].Value →GMP311_011492= TR("Fail"); 
            bool DetailChecksPass →GMP011_019543= false; 
        } ELSE { 
            T[8][3].BackColor →GMP311_011494= FontsAndColors.ColorForCheckStatus(1); 
            T[8][3].Value →GMP311_011495= TR("Pass"); 
        } 
        
        T[9][0].Value →GMP311_000034= TR("The height of steel studs is ≥ 4d↓s← after installation"); 
        T[9][1].Value →GMP311_000035= ROUND(CUnit(DataExchange.Connectors.Connector.hsc, "in"), 2) &amp; " in"; 
        T[9][2].Value →GMP311_011393= "AISC I8.2"; 
        IF(COMPARE(DataExchange.Connectors.Connector.hsc, 4*DataExchange.Connectors.Connector.ds, 2) == -1) { 
            T[9][3].BackColor →GMP311_011454= FontsAndColors.ColorForCheckStatus(0); 
            T[9][3].Value →GMP311_000036= TR("Fail"); 
            bool DetailChecksPass →GMP011_019544= false; 
        } ELSE { 
            T[9][3].BackColor →GMP311_011455= FontsAndColors.ColorForCheckStatus(1); 
            T[9][3].Value →GMP311_000037= TR("Pass"); 
        } 
        
        IF(ribsParal) { 
            T[10][0].Value →GMP311_011426= TR("Minimum Spacing Requirements (6d↓s←)"); 
        } ELSE { 
            T[10][0].Value →GMP011_019755= TR("Minimum Spacing Requirements (Minimum of 4d↓s← and rib spacing)"); 
        } 
        
        T[10][1].Value →GMP311_011427= ROUND(CUnit(MinSpacing, "in"), 2) &amp; " in"; 
        T[10][2].Value →GMP311_011428= "AISC I8.2d"; 
        IF(COMPARE(UC↓Spacing←, 1.0, 3) &gt;= 0) { 
            T[10][3].BackColor →GMP311_011456= FontsAndColors.ColorForCheckStatus(0); 
            T[10][3].Value →GMP311_011429= TR("Fail"); 
            bool DetailChecksPass →GMP011_019545= false; 
        } ELSE { 
            T[10][3].BackColor →GMP311_011457= FontsAndColors.ColorForCheckStatus(1); 
            T[10][3].Value →GMP311_011430= TR("Pass"); 
        } 
        
        T[11][0].Value →GMP311_011431= TR("Maximum Spacing Requirements (8 x Total Slab Thickness or 36 inches)"); 
        T[11][1].Value →GMP311_011432= ROUND(CUnit(MaxSpacing, "in"), 2) &amp; " in"; 
        T[11][2].Value →GMP311_011433= "AISC I8.2d"; 
        IF(MaxSpacing &gt; (MAX(8*(DataExchange.Slab.Thickness), PhysConst(36, "in")))) { 
            T[11][3].BackColor →GMP311_011458= FontsAndColors.ColorForCheckStatus(0); 
            T[11][3].Value →GMP311_011434= TR("Fail"); 
            bool DetailChecksPass →GMP011_019546= false; 
        } ELSE { 
            T[11][3].BackColor →GMP311_011459= FontsAndColors.ColorForCheckStatus(1); 
            T[11][3].Value →GMP311_011435= TR("Pass"); 
        } 
        
        
        T.BorderPen →GMP311_000042= FontsAndColors.TableBorderPen(); 
        T[0].BorderPen →GMP311_000043= FontsAndColors.TableBorderPen(); 
        T.GridPen →GMP311_000044= FontsAndColors.TableGridPen(); 
        T.Rows[0].Font →GMP311_000045= FontsAndColors.TableHeaderFont(); 
        T.Font →GMP311_000046= FontsAndColors.TableCellsFont(); 
        T.Padding.All →GMP311_000047= 5; 
        T.Padding.Top →GMP311_000048= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
        T.Padding.Bottom →GMP311_000049= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
        T.Rows[0].BackColor →GMP311_000050= FontsAndColors.ColorTableHeader(); 
        
        FOR(i, 1, n) { 
            T[i][0].BackColor →GMP311_000051= FontsAndColors.ColorTableRow(); 
        } 
        →GMP311_000052T.Draw(); 
        →GMP000_019514PAGEBREAK(); 
        
    } 
    
    
    // Construction ULS Check
    IF(IO.IsDrawing) { 
        →INI400_016683Ext_ConstructionULS.Draw(DataExchange, Output, 0); 
    } ELSE { 
        →INI400_019245Ext_ConstructionULS.Calculate(DataExchange, Output); 
    } 
    double UC↓ULS,Con← →INI400_016685= Output.UC↓ULS,Con←; 
    double I↓x← →INI400_016686= Output.I↓x←; 
    double M↓n,s← →INI400_018263= Output.M↓n,s←; 
    double Def_Constant↓SLS,ConSelf← →INI400_018513= u↓z,SLS,ConSelf←*I↓x←; 
    →INI400_018264DataExchange.Set("M↓n,s←", M↓n,s←); 
    M↓n← →GMP011_019509= Output.M↓n←; 
    →GMP011_019510DataExchange.Set("M↓n←", M↓n←); 
    →INI400_019018PAGEBREAK(); 
    
    // Final ULS Check
    IF(IO.IsDrawing) { 
        →INI400_016677Ext_FinalULS.Draw(DataExchange, Output, 0); 
    } ELSE { 
        →INI400_019252Ext_FinalULS.Calculate(DataExchange, Output); 
    } 
    double UC↓ULS,Fin← →INI400_016679= Output.UC↓ULS,Fin←; 
    double UC↓Spacing← →INI400_019337= Output.UC↓Spacing←; 
    double I↓LB← →INI400_016681= Output.I↓LB←; 
    string UniNumStuds →INI400_019007= Output.UniNumStuds; 
    string SegStudPattern →INI400_019008= Output.SegStudPattern; 
    double Def_Constant↓SLS,FinTotal← →INI400_018514= u↓z,SLS,FinTotal←*I↓LB←; 
    double Def_Constant↓SLS,FinLive← →INI400_018515= u↓z,SLS,FinLive←*I↓LB←; 
    →INI400_019019PAGEBREAK(); 
    
    SWITCH(CamberType) { // Calculate Camber (As Needed)
        CASE 4 :  { 
            Counter →INI400_019023= 0; 
            Camber →INI400_019024= 0; 
            →INI400_019067DataExchange.Set("Camber.Max", Camber); 
            Calc_u↓z,SLS,FinTotal← →INI400_019026= Def_Constant↓SLS,FinTotal←/I↓LB←; 
            Calc_u↓z,SLS,ConSelf← →INI400_019027= Def_Constant↓SLS,ConSelf←/DataExchange.CS.Iy; 
            
            →INI400_019028DataExchange.Set("IsConStage", True); 
            →INI400_019029DataExchange.Set("IsLiveLoad", False); 
            →INI400_019030DataExchange.Set("InternalForces.u↓z,SLS,ConSelf←", Calc_u↓z,SLS,ConSelf←); 
            →INI400_019031Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
            UC↓d,ConSelf← →INI400_019032= Output.UC↓d←; 
            
            →INI400_019033DataExchange.Set("IsConStage", False); 
            →INI400_019034DataExchange.Set("IsLiveLoad", False); 
            →INI400_019035DataExchange.Set("InternalForces.u↓z,SLS,FinTotal←", Calc_u↓z,SLS,FinTotal←); 
            →INI400_019036Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
            UC↓d,FinTotal← →INI400_019037= Output.UC↓d←; 
            
            IF(UC↓d,ConSelf← &gt;= 1 || UC↓d,FinTotal← &gt;= 1) { 
                double Camber →INI400_019038= PhysConst(0.75, "in"); 
                →INI400_019039DataExchange.Set("Camber.Max", Camber); 
                →INI400_019040DataExchange.Set("IsConStage", True); 
                →INI400_019041DataExchange.Set("IsLiveLoad", False); 
                →INI400_019042DataExchange.Set("InternalForces.u↓z,SLS,ConSelf←", Calc_u↓z,SLS,ConSelf←); 
                →INI400_019043Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
                UC↓d,ConSelf← →INI400_019044= Output.UC↓d←; 
                
                →INI400_019045DataExchange.Set("IsConStage", False); 
                →INI400_019046DataExchange.Set("IsLiveLoad", False); 
                →INI400_019047DataExchange.Set("InternalForces.u↓z,SLS,FinTotal←", Calc_u↓z,SLS,FinTotal←); 
                →INI400_019048Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
                UC↓d,FinTotal← →INI400_019049= Output.UC↓d←; 
                
                WHILE(Counter &lt; (CUnit(MaxCamber, "in")/0.25) &amp;&amp; (UC↓d,ConSelf← &gt; 1 || UC↓d,FinTotal← &gt; 1) &amp;&amp; Camber &lt; MaxCamber) { 
                    Camber →INI400_019050= Camber+PhysConst(0.25, "in"); 
                    →INI400_019051DataExchange.Set("Camber.Max", Camber); 
                    
                    →INI400_019052DataExchange.Set("IsConStage", True); 
                    →INI400_019053DataExchange.Set("IsLiveLoad", False); 
                    →INI400_019054DataExchange.Set("InternalForces.u↓z,SLS,ConSelf←", Calc_u↓z,SLS,ConSelf←); 
                    →INI400_019055Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
                    UC↓d,ConSelf← →INI400_019056= Output.UC↓d←; 
                    
                    →INI400_019057DataExchange.Set("IsConStage", False); 
                    →INI400_019058DataExchange.Set("IsLiveLoad", False); 
                    →INI400_019059DataExchange.Set("InternalForces.u↓z,SLS,FinTotal←", Calc_u↓z,SLS,FinTotal←); 
                    →INI400_019060Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
                    UC↓d,FinTotal← →INI400_019061= Output.UC↓d←; 
                    
                    Counter →INI400_019062= Counter+1; 
                } 
            } 
        } 
        
        CASE 5 :  { Camber →INI400_019307= PhysConst(0.00, "in"); MaxCamber →INI400_019308= Camber; } 
        CASE 1 :  { Camber →INI400_019309= CamberAbs; MaxCamber →INI400_019310= Camber; } 
        CASE 2 :  { Camber →INI400_019311= CamberRatio*IO.Beam.Member.Length; MaxCamber →INI400_019312= Camber; } 
        
        DEFAULT :  { Camber →INI400_019315= PhysConst(0.00, "in"); MaxCamber →INI400_019316= Camber; } 
        
    } 
    →UNK000_019398DataExchange.Set("Camber.Max", Camber); 
    
    // Construction SLS (Self Weight) Check
    →INI400_016688DataExchange.Set("IsConStage", True); 
    →INI400_018526DataExchange.Set("IsLiveLoad", False); 
    IF(IO.IsDrawing) { 
        →INI400_019246Ext_ConstructionAndFinalSLS.Draw(DataExchange, Output, 0); 
    } ELSE { 
        →INI400_019247Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
    } 
    double UC↓d,ConSelf← →INI400_018419= Output.UC↓d←; 
    →INI400_019020PAGEBREAK(); 
    
    // Final SLS (Live Load) Check
    →INI400_016693DataExchange.Set("IsConStage", False); 
    →INI400_018422DataExchange.Set("IsLiveLoad", True); 
    IF(IO.IsDrawing) { 
        →INI400_019248Ext_ConstructionAndFinalSLS.Draw(DataExchange, Output, 0); 
    } ELSE { 
        →INI400_019249Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
    } 
    double UC↓d,FinLive← →INI400_018421= Output.UC↓d←; 
    →INI400_019021PAGEBREAK(); 
    
    // Final SLS (Total Load) Check
    →INI400_018423DataExchange.Set("IsConStage", False); 
    →INI400_018424DataExchange.Set("IsLiveLoad", False); 
    IF(IO.IsDrawing) { 
        →INI400_019250Ext_ConstructionAndFinalSLS.Draw(DataExchange, Output, 0); 
    } ELSE { 
        →INI400_019251Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
    } 
    double UC↓d,FinTotal← →INI400_018427= Output.UC↓d←; 
    →INI400_019022PAGEBREAK(); 
    
    // Cross Section Name (Cleaned up)
    string InitialCS →INI400_019012= DataExchange.CS.Name.ToString().Remove(1, 5); 
    
    // Unity Checks
    double UC↓ULS-Con← →INI400_018553= UC↓ULS,Con←; 
    double UC↓ULS-Fin← →INI400_018556= UC↓ULS,Fin←; 
    double UC↓SLS-Con,Self← →INI400_018557= UC↓d,ConSelf←; 
    double UC↓SLS-Fin,Live← →INI400_018554= UC↓d,FinLive←; 
    double UC↓SLS-Fin,Total← →INI400_018555= UC↓d,FinTotal←; 
    double UC↓Spac,Req← →INI400_019374= UC↓Spacing←; 
    
    MCR →GMP011_019503= SUM(UC↓ULS,Con←, UC↓ULS,Fin←, UC↓Spac,Req←); 
    
    IF(IO.IsDrawing) { 
        
        →INI400_018625TEXT("Summary of Results"); 
        Ncolumns →INI400_018626= 3; 
        n →INI400_018627= 7; 
        object T →INI400_018628= new Table(Ncolumns); 
        
        T[0][0].Value →INI400_018629= "Check Description"; 
        T[0][1].Value →INI400_018630= "Unity Value"; 
        T[0][2].Value →INI400_018631= "Pass/Fail"; 
        
        T[1][0].Value →INI400_018633= "Construction Stage - Strength (ULS)"; 
        T[1][1].Value →INI400_018634= UC↓ULS-Con←; 
        IF(COMPARE(UC↓ULS-Con←, 1, 3) &lt; 1) { 
            T[1][2].Value →INI400_018635= "Pass"; 
            T[1][2].BackColor →GMP311_011470= FontsAndColors.ColorForCheckStatus(1); 
        } ELSE { 
            T[1][2].Value →INI400_019230= "Fail"; 
            T[1][2].BackColor →GMP311_011471= FontsAndColors.ColorForCheckStatus(0); 
        } 
        
        T[2][0].Value →INI400_018683= "Final Stage - Strength (ULS)"; 
        T[2][1].Value →INI400_018684= UC↓ULS-Fin←; 
        IF(COMPARE(UC↓ULS-Fin←, 1, 3) &lt; 1) { 
            T[2][2].Value →INI400_019231= "Pass"; 
            T[2][2].BackColor →GMP311_011468= FontsAndColors.ColorForCheckStatus(1); 
        } ELSE { 
            T[2][2].Value →INI400_019232= "Fail"; 
            T[2][2].BackColor →GMP311_011469= FontsAndColors.ColorForCheckStatus(0); 
        } 
        
        T[3][0].Value →INI400_018686= "Construction Stage - Serviceability (SLS)"; 
        T[3][1].Value →INI400_018687= UC↓SLS-Con,Self←; 
        IF(COMPARE(UC↓SLS-Con,Self←, 1, 3) &lt; 1) { 
            T[3][2].Value →INI400_019233= "Pass"; 
            T[3][2].BackColor →GMP311_011466= FontsAndColors.ColorForCheckStatus(1); 
        } ELSE { 
            T[3][2].Value →INI400_019234= "Fail"; 
            T[3][2].BackColor →GMP311_011467= FontsAndColors.ColorForCheckStatus(0); 
        } 
        
        T[4][0].Value →INI400_018689= "Final Stage - Live Load Serviceability (SLS) "; 
        T[4][1].Value →INI400_018690= UC↓SLS-Fin,Live←; 
        IF(COMPARE(UC↓SLS-Fin,Live←, 1, 3) &lt; 1) { 
            T[4][2].Value →INI400_019235= "Pass"; 
            T[4][2].BackColor →GMP311_011465= FontsAndColors.ColorForCheckStatus(1); 
        } ELSE { 
            T[4][2].Value →INI400_019236= "Fail"; 
            T[4][2].BackColor →GMP311_011464= FontsAndColors.ColorForCheckStatus(0); 
        } 
        
        T[5][0].Value →INI400_019227= "Final Stage - Total Load Serviceability (SLS)"; 
        T[5][1].Value →INI400_019228= UC↓SLS-Fin,Total←; 
        IF(COMPARE(UC↓SLS-Fin,Total←, 1, 3) &lt; 1) { 
            T[5][2].Value →INI400_019237= "Pass"; 
            T[5][2].BackColor →GMP311_011462= FontsAndColors.ColorForCheckStatus(1); 
        } ELSE { 
            T[5][2].Value →INI400_019238= "Fail"; 
            T[5][2].BackColor →GMP311_011463= FontsAndColors.ColorForCheckStatus(0); 
        } 
        
        T[6][0].Value →INI400_019375= "Minimum Spacing Requirements"; 
        T[6][1].Value →INI400_019376= UC↓Spac,Req←; 
        IF(COMPARE(UC↓Spac,Req←, 1, 3) &lt; 1) { 
            T[6][2].Value →INI400_019377= "Pass"; 
            T[6][2].BackColor →GMP311_011461= FontsAndColors.ColorForCheckStatus(1); 
        } ELSE { 
            T[6][2].Value →INI400_019378= "Fail"; 
            T[6][2].BackColor →GMP311_011460= FontsAndColors.ColorForCheckStatus(0); 
        } 
        
        T[7][0].Value →GMP311_011482= "Detailing Requirements"; 
        T[7][1].Value →GMP311_011483= " - "; 
        IF(DetailChecksPass) { 
            T[7][2].Value →GMP311_011484= "Pass"; 
            T[7][2].BackColor →GMP311_011485= FontsAndColors.ColorForCheckStatus(1); 
        } ELSE { 
            T[7][2].Value →GMP311_011486= "Fail"; 
            T[7][2].BackColor →GMP311_011487= FontsAndColors.ColorForCheckStatus(0); 
        } 
        
        T.BorderPen →INI400_018670= FontsAndColors.TableBorderPen(); 
        T[0].BorderPen →INI400_018671= FontsAndColors.TableBorderPen(); 
        T.GridPen →INI400_018672= FontsAndColors.TableGridPen(); 
        T.Rows[0].Font →INI400_018673= FontsAndColors.TableHeaderFont(); 
        T.Font →INI400_018674= FontsAndColors.TableCellsFont(); 
        T.Padding.All →INI400_018675= 5; 
        T.Padding.Top →INI400_018676= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
        T.Padding.Bottom →INI400_018677= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
        T.Rows[0].BackColor →INI400_018678= FontsAndColors.ColorTableHeader(); 
        
        FOR(i, 1, n) { 
            T[i][0].BackColor →INI400_018679= FontsAndColors.ColorTableRow(); 
        } 
        →INI400_018680T.Draw(); 
    } 
    
    double MaxUC →INI400_019175= MAX(UC↓ULS-Con←, UC↓ULS-Fin←, UC↓SLS-Con,Self←, UC↓SLS-Fin,Live←, UC↓SLS-Fin,Total←, UC↓Spac,Req←); 
    
    // Labels (Segmented and Uniform Studs) -- Include Camber if &gt; 0
    IF(COMPARE(Camber, 0.00, 3) &gt; 0) { 
        string Segmented_Result →INI400_019014= InitialCS &amp; " " &amp; SegStudPattern &amp; " c=" &amp; CUnit(Camber, "in") &amp; " in."; 
        string Uniform_Result →INI400_019015= InitialCS &amp; " " &amp; UniNumStuds &amp; " c=" &amp; CUnit(Camber, "in") &amp; " in."; 
    } ELSE { 
        string Segmented_Result →INI400_019168= InitialCS &amp; " " &amp; SegStudPattern; 
        string Uniform_Result →INI400_019169= InitialCS &amp; " " &amp; UniNumStuds; 
    } 
    
    object InitialDesign →GMP011_000057= new Structure("CrossSection", DataExchange.CS.Name, "CompositeAction", DataExchange.CompAction, "Area", DataExchange.CS.A); 
    
    IF(CalcApproach == 1) { 
        object FinalDesign →UNK000_019502= new Structure("CrossSection", DataExchange.CS.Name, "CompositeAction", actualCA, "Area", DataExchange.CS.A); 
    } 
    
    
} 
→INI400_015164BLOCK { // Auto-Design Section
    // restrict sections so that stud is not greater than 2.5 times the flange thickness
    object gSubSections1 →GMP011_000078= Linq.ToList(Linq.Where(gSectionInfo.Group.Sections, object F=&gt;F.Geometry.t &gt; (DataExchange.Connectors.Connector.ds/2.5))); 
    // If user restricts beam depth, create a subset of sections with depth less than max depth allowed
    IF(BeamDepthRestriction == 1) { 
        object gSubSections2 →INI400_016570= Linq.ToList(Linq.Where(gSubSections1, object F=&gt;F.Geometry.h &lt;= MaxBeamDepth)); 
        object MySections →INI400_016569= Linq.ToList(Linq.OrderBy(gSubSections2, object S=&gt;S.A)); 
    } ELSE { 
        object MySections →GMP011_000079= Linq.ToList(Linq.OrderBy(gSubSections1, object S=&gt;S.A)); 
    } 
    
    IF(CalcApproach == 0) { 
        
        →INI400_019170BLOCK { // 0. Reset %CA (Based on Design Criteria) and Re-calculate Current Member

            // (This prevents endless cycle of decreasing CA lower and lower after
            //  inital run and gives a result based on the users initial design criteria)
            
            SWITCH(DesignApproach) { 
                CASE 0 :  { 
                    double DACA →INI400_019346= MIN(1.0, MaxCA); 
                } 
                CASE 1 :  { 
                    double DACA →INI400_019347= MIN(0.3, MaxCA); 
                } 
                CASE 2 :  { 
                    double DACA →INI400_019348= MIN(0.55, MaxCA); 
                } 
                CASE 3 :  { 
                    double DACA →INI400_019349= MIN(TargetDegree, MaxCA); 
                } 
            } 
            →INI400_019197DataExchange.Set("CompAction", DACA); 
            
            UC↓ULS,Con← →INI400_019084= GetUC_ULS_Con(); // Construction ULS Check
            UC↓ULS,Fin← →INI400_019092= GetUC_ULS_Fin(); // Final ULS Check
            UC↓Spacing← →INI400_019343= GetUC_Spacing(); // Stud Spacing Check
            UC↓d,FinLive← →INI400_019154= GetUC_SLS_Fin_Live(); // Final SLS (Live Load) Check
            UC↓Camber,Fin← →INI400_018540= GetUC_Camber_Fin(); // Camber Checks
            UC↓Camber,Con← →INI400_018541= GetUC_Camber_Con(); // Camber Checks
            
        } 
        
        →INI400_019171BLOCK { // 1. Increase or Decrease Section
            // Decrease Section If Current Section Passes 
            WHILE(UC↓ULS,Con← &lt; 1.0 &amp;&amp; UC↓ULS,Fin← &lt; 1.0 &amp;&amp; UC↓Camber,Fin← &lt; 1.0 &amp;&amp; UC↓Camber,Con← &lt; 1.0 &amp;&amp; UC↓d,FinLive← &lt; 1.0) { 
                →GMP011_000070DataExchange.Set("CompAction", DACA); 
                bool run →INI400_016560= DecreaseSection(); 
                string tmp →INI400_019180= DataExchange.CS.Name; 
                double CA →INI400_019211= DataExchange.CompAction; 
                IF(!run) { Break(); } 
                UC↓ULS,Con← →INI400_016657= GetUC_ULS_Con(); 
                UC↓ULS,Fin← →INI400_016658= GetUC_ULS_Fin(); 
                UC↓d,FinLive← →INI400_016660= GetUC_SLS_Fin_Live()*1.10; 
                UC↓Spacing← →INI400_019344= GetUC_Spacing(); 
                UC↓Camber,Con← →INI400_018446= GetUC_Camber_Con()*1.10; 
                UC↓Camber,Fin← →INI400_016659= GetUC_Camber_Fin()*1.10; 
                
            } 
            
            // Increase Section If Current Section Fails
            WHILE(UC↓ULS,Con← &gt;= 1.0 || UC↓ULS,Fin← &gt;= 1.0 || UC↓Camber,Con← &gt;= 1.0 || UC↓d,FinLive← &gt;= 1.0 || UC↓Camber,Fin← &gt;= 1.0 || UC↓Spacing← &gt;= 1.0) { 
                →GMP011_000055DataExchange.Set("CompAction", DACA); 
                bool run →INI400_016559= IncreaseSection(); 
                
                double CA →INI400_019212= DataExchange.CompAction; 
                string tmp →INI400_019181= DataExchange.CS.Name; 
                
                IF(!run) { Break(); } 
                UC↓ULS,Con← →UNK000_019494= GetUC_ULS_Con(); 
                UC↓ULS,Fin← →UNK000_019495= GetUC_ULS_Fin(); 
                UC↓d,FinLive← →UNK000_019499= GetUC_SLS_Fin_Live()*1.10; 
                UC↓Spacing← →UNK000_019496= GetUC_Spacing(); 
                UC↓Camber,Con← →UNK000_019497= GetUC_Camber_Con()*1.10; 
                UC↓Camber,Fin← →UNK000_019498= GetUC_Camber_Fin()*1.10; 
                
                // If the section passes strength and serviceability checks, but not spacing requirements, attempt to lower % of CA before continuing
                IF(UC↓ULS,Con← &lt; 1.0 &amp;&amp; UC↓ULS,Fin← &lt; 1.0 &amp;&amp; UC↓Camber,Fin← &lt; 1.0 &amp;&amp; UC↓Camber,Con← &lt; 1.0 &amp;&amp; UC↓d,FinLive← &lt; 1.0 &amp;&amp; UC↓Spacing← &gt;= 1.0) { 
                    Counter →GMP011_000017= 0; 
                    IF(!NegCompAction &amp;&amp; (ABS(M↓y-,ULS,Fin←) &gt; ABS(M↓y+,ULS,Fin←))) { 
                        Low →GMP011_019691= MinCA; 
                    } ELSE { 
                        Low →GMP011_019694= 0.25; 
                    } 
                    High →GMP011_000019= 1; 
                    CA →GMP011_000020= DataExchange.CompAction; 
                    
                    WHILE(Counter &lt; 10 &amp;&amp; (UC↓ULS,Fin← &lt; 0.99 || UC↓d,FinLive← &lt; 0.99 || UC↓Camber,Fin← &lt; 0.99 || UC↓Spacing← &gt;= 1.0 || UC↓ULS,Fin← &gt;= 1.0 || UC↓d,FinLive← &gt;= 1.0 || UC↓Camber,Fin← &gt;= 1.0)) { 
                        IF(UC↓ULS,Fin← &gt;= 1.0 || UC↓d,FinLive← &gt;= 1.0 || UC↓Camber,Fin← &gt;= 1.0) { 
                            Low →GMP011_000021= CA; 
                        } ELSE { 
                            High →GMP011_000022= CA; 
                        } 
                        CA →GMP011_000023= (High+Low)/2; 
                        DataExchange.CompAction →GMP011_000024= CA; 
                        →GMP011_000025Ext_FinalULS.Calculate(DataExchange, Output); 
                        UC↓ULS,Fin← →GMP011_000026= Output.UC↓ULS,Fin←; 
                        UC↓Spacing← →GMP011_000056= GetUC_Spacing(); 
                        
                        Calc_u↓z,SLS,FinLive← →GMP011_000027= (Def_Constant↓SLS,FinLive←/Output.I↓LB←)*1.10; 
                        Calc_u↓z,SLS,FinTotal← →GMP011_000028= (Def_Constant↓SLS,FinTotal←/Output.I↓LB←)*1.10; 
                        
                        →GMP011_000029DataExchange.Set("IsConStage", False); 
                        →GMP011_000030DataExchange.Set("IsLiveLoad", True); 
                        →GMP011_000031DataExchange.Set("InternalForces.u↓z,SLS,FinLive←", Calc_u↓z,SLS,FinLive←); 
                        →GMP011_000032Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
                        UC↓d,FinLive← →GMP011_000033= Output.UC↓d←; 
                        
                        →GMP011_000034DataExchange.Set("IsConStage", False); 
                        →GMP011_000035DataExchange.Set("IsLiveLoad", False); 
                        →GMP011_000036DataExchange.Set("InternalForces.u↓z,SLS,FinTotal←", Calc_u↓z,SLS,FinTotal←); 
                        →GMP011_000037Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
                        IF(ABS(Calc_u↓z,SLS,FinTotal←) &gt; Output.u↓z,allow←) { 
                            IF(MaxCamber &gt; 0) { 
                                UC↓Camber,Fin← →GMP011_000038= (Calc_u↓z,SLS,FinTotal←-Output.u↓z,allow←)/MaxCamber; 
                            } ELSE { 
                                UC↓Camber,Fin← →GMP011_000039= 1; 
                            } 
                        } ELSE { 
                            UC↓Camber,Fin← →GMP011_000040= 0; 
                        } 
                        
                        Counter →GMP011_000041= Counter+1; 
                    } 
                } 
            } 
        } 
        
        →INI400_019172BLOCK { // 2. Find optimum CA for section

            Counter →INI400_016704= 0; 
            IF(!NegCompAction &amp;&amp; (ABS(M↓y-,ULS,Fin←) &gt; ABS(M↓y+,ULS,Fin←))) { 
                Low →GMP011_019695= MinCA; 
            } ELSE { 
                Low →INI400_016705= 0.25; 
            } 
            High →INI400_016706= 1; 
            CA →INI400_016707= DataExchange.CompAction; 
            WHILE(Counter &lt; 10 &amp;&amp; (UC↓ULS,Fin← &lt;= 0.99 || UC↓d,FinLive← &lt;= 0.99 || UC↓Camber,Fin← &lt;= 0.99 || UC↓Spacing← &gt;= 1.0 || UC↓ULS,Fin← &gt;= 1.0 || UC↓d,FinLive← &gt;= 1.0 || UC↓Camber,Fin← &gt;= 1.0)) { 
                IF(UC↓ULS,Fin← &gt;= 1.0 || UC↓d,FinLive← &gt;= 1.0 || UC↓Camber,Fin← &gt;= 1.0) { 
                    Low →INI400_016708= CA; 
                } ELSE { 
                    High →INI400_016709= CA; 
                } 
                CA →INI400_016710= (High+Low)/2; 
                DataExchange.CompAction →INI400_016711= CA; 
                →INI400_016712Ext_FinalULS.Calculate(DataExchange, Output); 
                UC↓ULS,Fin← →INI400_016713= Output.UC↓ULS,Fin←; 
                
                Calc_u↓z,SLS,FinLive← →INI400_016714= (Def_Constant↓SLS,FinLive←/Output.I↓LB←)*1.10; 
                Calc_u↓z,SLS,FinTotal← →INI400_018448= (Def_Constant↓SLS,FinTotal←/Output.I↓LB←)*1.10; 
                
                →INI400_016715DataExchange.Set("IsConStage", False); 
                →INI400_018449DataExchange.Set("IsLiveLoad", True); 
                →INI400_016716DataExchange.Set("InternalForces.u↓z,SLS,FinLive←", Calc_u↓z,SLS,FinLive←); 
                →INI400_016717Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
                UC↓d,FinLive← →INI400_016718= Output.UC↓d←; 
                
                →INI400_018450DataExchange.Set("IsConStage", False); 
                →INI400_018451DataExchange.Set("IsLiveLoad", False); 
                →INI400_018452DataExchange.Set("InternalForces.u↓z,SLS,FinTotal←", Calc_u↓z,SLS,FinTotal←); 
                →INI400_018453Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
                IF(ABS(Calc_u↓z,SLS,FinTotal←) &gt; Output.u↓z,allow←) { 
                    IF(MaxCamber &gt; 0) { 
                        UC↓Camber,Fin← →INI400_018455= (Calc_u↓z,SLS,FinTotal←-Output.u↓z,allow←)/MaxCamber; 
                    } ELSE { 
                        UC↓Camber,Fin← →INI400_018456= 1; 
                    } 
                } ELSE { 
                    UC↓Camber,Fin← →INI400_018457= 0; 
                } 
                
                Counter →INI400_016719= Counter+1; 
            } 
            IF(UC↓ULS,Fin← &gt;= 1.0 || UC↓d,FinLive← &gt;= 1.0 || UC↓Camber,Fin← &gt;= 1.0) { 
                DataExchange.CompAction →INI400_016720= High; 
                →INI400_016721Ext_FinalULS.Calculate(DataExchange, Output); 
                
                UC↓ULS,Fin← →INI400_016722= Output.UC↓ULS,Fin←; 
                
                Calc_u↓z,SLS,FinLive← →INI400_018458= ABS(Def_Constant↓SLS,FinLive←/Output.I↓LB←)*1.10; 
                Calc_u↓z,SLS,FinTotal← →INI400_018459= ABS(Def_Constant↓SLS,FinTotal←/Output.I↓LB←)*1.10; 
                
                →INI400_016724DataExchange.Set("IsConStage", False); 
                →INI400_018460DataExchange.Set("IsLiveLoad", True); 
                →INI400_018461DataExchange.Set("InternalForces.u↓z,SLS,FinLive←", Calc_u↓z,SLS,FinLive←); 
                →INI400_018462Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
                UC↓d,FinLive← →INI400_018463= Output.UC↓d←; 
                
                →INI400_018464DataExchange.Set("IsConStage", False); 
                →INI400_018465DataExchange.Set("IsLiveLoad", False); 
                →INI400_018466DataExchange.Set("InternalForces.u↓z,SLS,FinTotal←", Calc_u↓z,SLS,FinTotal←); 
                →INI400_018467Ext_ConstructionAndFinalSLS.Calculate(DataExchange, Output); 
                IF(ABS(Calc_u↓z,SLS,FinTotal←) &gt; Output.u↓z,allow←) { 
                    IF(MaxCamber &gt; 0) { 
                        UC↓Camber,Fin← →INI400_018468= (Calc_u↓z,SLS,FinTotal←-Output.u↓z,allow←)/MaxCamber; 
                    } ELSE { 
                        UC↓Camber,Fin← →INI400_018469= 1; 
                    } 
                } ELSE { 
                    UC↓Camber,Fin← →INI400_018470= 0; 
                } 
            } 
        } 
        
        object FinalDesign →INI400_016740= new Structure("CrossSection", DataExchange.CS.Name, "CompositeAction", DataExchange.CompAction, "Area", DataExchange.CS.A); 
    } 
} 


→GMP011_000071BLOCK { // This prevents endless running by making sure weight is lower for design approach 0 and making sure %CA is at least 5% lower for DA 1
    SWITCH(DesignApproach) { 
        CASE 0 :  { 
            IF(MaxUC &lt; 1.0 &amp;&amp; MaxUC &gt; 0.95) { 
                IF(FinalDesign.Area &lt;= InitialDesign.Area) { 
                    FinalDesign →GMP011_000058= FinalDesign; 
                } ELSE { 
                    FinalDesign →GMP011_000059= InitialDesign; 
                } 
            } 
        } 
        CASE 1 :  { 
            IF(MaxUC &lt; 1.0 &amp;&amp; MaxUC &gt; 0.95) { 
                IF(FinalDesign.CompositeAction &lt; (InitialDesign.CompositeAction-0.05)) { 
                    FinalDesign →GMP011_000060= FinalDesign; 
                } ELSE { 
                    FinalDesign →GMP011_000061= InitialDesign; 
                } 
            } 
        } 
        CASE 2 :  { 
            IF(MaxUC &lt; 1.0 &amp;&amp; MaxUC &gt; 0.95) { 
                IF(FinalDesign.Area != InitialDesign.Area &amp;&amp; ABS(FinalDesign.CompositeAction-0.50) &lt; ABS((InitialDesign.CompositeAction-0.50))) { 
                    FinalDesign →GMP011_000062= FinalDesign; 
                } ELSE { 
                    FinalDesign →GMP011_000063= InitialDesign; 
                } 
            } 
        } 
    } 
} 


→INI400_019176BLOCK { // Final Design

    UC↓ULS,Con← →GMP011_000064= GetUC_ULS_Con(); 
    UC↓ULS,Fin← →GMP011_000065= GetUC_ULS_Fin(); 
    UC↓Spacing← →GMP011_000066= GetUC_Spacing(); 
    UC↓Camber,Con← →GMP011_000067= GetUC_Camber_Con(); 
    UC↓Camber,Fin← →GMP011_000068= GetUC_Camber_Fin(); 
    UC↓d,FinLive← →GMP011_000069= GetUC_SLS_Fin_Live(); 
    
    
    
    IF(CalcApproach == 0 &amp;&amp; (UC↓ULS,Con← &gt;= 1.0 || UC↓ULS,Fin← &gt;= 1.0 || UC↓Camber,Con← &gt;= 1.0 || UC↓d,FinLive← &gt;= 1.0 || UC↓Camber,Fin← &gt;= 1.0 || UC↓Spacing← &gt;= 1.0)) { 
        →INI400_019240TEXT("Warning:"); 
        FinalCA →INI400_019225= 1; 
        →INI400_019226TEXT("No section could be found which meets design req's"); 
        IF(BeamDepthRestriction == 1) { 
            →INI400_019239TEXT("Maximum beam depth is currently restricted to " &amp; CUnit(MaxBeamDepth, "in") &amp; " in."); 
        } 
        FinalCrossSection →INI400_019223= "Warning: No section could be found which meets design req's"; 
        MCR →INI400_019224= 1; 
        
    } ELSE { 
        
        FinalCA →INI400_018538= FinalDesign.CompositeAction; 
        FinalCA →INI400_018549= ROUNDUP(FinalCA, 3); 
        IF(FinalCS.Contains("W(Imp)")) { 
            FinalCS →INI400_018536= FinalDesign.CrossSection.ToString().Remove(1, 5); 
        } 
        FinalCrossSection →INI400_018548= FinalDesign.CrossSection.ToString(); 
        MCR →INI400_019174= MCR; 
        
    } 
    
    
    ModificationCmdsRatio →INI400_000009= MCR; 
    →INI400_018545SenModificator.ChangeCompositeAction(FinalCA); 
    →INI400_018544SenModificator.ChangeCrossSection(FinalCrossSection); 
    ModificationCmds →INI400_000006= SenModificator.GetCommands(); 
    
    
    IF(ribsParal) { 
        string Designation →GMP098_000003= Segmented_Result; 
        string stud_string →GMP098_000005= SegStudPattern.Substring(1, Convert.ToInt32(SegStudPattern.Length-2)); 
    } ELSE { 
        string Designation →GMP098_000004= Uniform_Result; 
        string stud_string →GMP098_000006= UniNumStuds.Substring(1, Convert.ToInt32(UniNumStuds.Length-2)); 
    } 
    
    string camber_string →GMP098_000001= CUnit(Camber, "in").ToString() &amp; " in"; 
    
    
    string DesignInfo_Camber →GMP098_000002= camber_string; 
    string DesignInfo_Studs →GMP098_000007= stud_string; 
    string DesignInfo_MomentBegin →GMP009_019515= ROUND(CUnit(M↓y0,ULS,Fin←, "kip*ft").ToString(), 2) &amp; " k-ft"; 
    string DesignInfo_MomentEnd →GMP009_019516= ROUND(CUnit(M↓y1,ULS,Fin←, "kip*ft").ToString(), 2) &amp; " k-ft"; 
    string DesignInfo_ShearBegin →GMP009_019517= ROUND(CUnit(V↓z0,ULS,Fin←, "kip").ToString(), 2) &amp; " k"; 
    string DesignInfo_ShearEnd →GMP009_019518= ROUND(CUnit(V↓z1,ULS,Fin←, "kip").ToString(), 2) &amp; " k"; 
    IF(ULS_Fin_Loads.Count &gt; 1) { 
        string DesignInfo_Case →GMP009_019520= "Final Stage ULS"; 
    } ELSE { 
        string DesignInfo_Case →GMP009_019521= ULS_Fin_Loads[0].LoadName; 
    } 
    
    
    →UNK131_019398SaveResults(ResultType.Member, "CompUS"); 
    // Clear results for section[0] ; we will return this in the midsection only
    Designation →GMP098_000008= ""; 
    Segmented_Result →UNK131_019404= ""; 
    Uniform_Result →UNK131_019405= ""; 
    
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="3" Member="1000" Material="1" CSType="-1" LimitState="2" IFFilter="31" LicenceID="10000" Autor="" Autor2="" Version="1" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English " />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://designforms.net</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Composite Beam Design</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" />
      <Style Key="SummaryTable" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|1|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Limit State Title" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|15|0|2" Font2="Segoe UI|15|1|2" />
      <Style Key="___" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="-19" Font1="Tahoma|18|0|2" Font2="Tahoma|18|1|2" />
      <Style Key="Pass/Fail" X="0" Y="0" Hor="0" Ver="1" SpX="27" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|2|2" />
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
      <Variable Modifier="Public" Name="A↓ro←" ESA_ID="" Type="Double" Value="12.7e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓ro←">
          <ENU>Area of reinforcement at opening</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="a↓wo←" ESA_ID="MemberData.a↓wo←" Type="Double" Value="508e-3" Precision="2">
        <Description TranslateID="VARIABLE_a↓wo←">
          <ENU>Opening Length</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="actualCA" ESA_ID="" Type="Double" Value="502.7071e-3" Precision="2">
        <Description TranslateID="VARIABLE_actualCA">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="b↓ro←" ESA_ID="MemberData.b↓ro←" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_b↓ro←">
          <ENU>Width of reinforcement</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="BeamDepthRestriction" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_BeamDepthRestriction">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CA" ESA_ID="" Type="Double" Value="250.0007e-3" Precision="2">
        <Description TranslateID="VARIABLE_CA">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Calc_u↓z,SLS,ConSelf←" ESA_ID="" Type="Double" Value="-1.589638e-3" Precision="2">
        <Description TranslateID="VARIABLE_Calc_u↓z,SLS,ConSelf←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Calc_u↓z,SLS,FinLive←" ESA_ID="" Type="Double" Value="-1.853626e-3" Precision="2">
        <Description TranslateID="VARIABLE_Calc_u↓z,SLS,FinLive←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Calc_u↓z,SLS,FinTotal←" ESA_ID="" Type="Double" Value="-54.69884e-3" Precision="2">
        <Description TranslateID="VARIABLE_Calc_u↓z,SLS,FinTotal←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CalcApproach" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_CalcApproach">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Camber" ESA_ID="" Type="Double" Value="107.95e-3" Precision="2">
        <Description TranslateID="VARIABLE_Camber">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="camber_string" ESA_ID="" Type="String" Value="4.25 in">
        <Description TranslateID="VARIABLE_camber_string">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CamberAbs" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_CamberAbs">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="CamberRatio" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_CamberRatio">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CamberRel" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_CamberRel">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CamberType" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description TranslateID="VARIABLE_CamberType">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Combi" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Combi">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Combo_Loads" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Combo_Loads">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ConMys" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ConMys">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Counter" ESA_ID="" Type="Double" Value="10" Precision="2">
        <Description TranslateID="VARIABLE_Counter">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CV↓o←" ESA_ID="" Type="Double" Value="4516.863" Precision="2">
        <Description TranslateID="VARIABLE_CV↓o←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="CV↓oe←" ESA_ID="" Type="Double" Value="7183.88" Precision="2">
        <Description TranslateID="VARIABLE_CV↓oe←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="CV↓os←" ESA_ID="" Type="Double" Value="7741.065" Precision="2">
        <Description TranslateID="VARIABLE_CV↓os←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="CWO" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_CWO">
          <ENU>Web Opening is Circular</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d↓o←" ESA_ID="MemberData.d↓o←" Type="Double" Value="3.048" Precision="2">
        <Description TranslateID="VARIABLE_d↓o←">
          <ENU>Distance from start of member to opening</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="304.8e-3" Dim="ft" />
      </Variable>
      <Variable Modifier="Public" Name="d↓oe←" ESA_ID="" Type="Double" Value="1.7272" Precision="2">
        <Description TranslateID="VARIABLE_d↓oe←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="304.8e-3" Dim="ft" />
      </Variable>
      <Variable Modifier="Public" Name="d↓os←" ESA_ID="" Type="Double" Value="1.3208" Precision="2">
        <Description TranslateID="VARIABLE_d↓os←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="304.8e-3" Dim="ft" />
      </Variable>
      <Variable Modifier="Public" Name="d↓rbo←" ESA_ID="MemberData.d↓rbo←" Type="Double" Value="101.6e-3" Precision="2">
        <Description TranslateID="VARIABLE_d↓rbo←">
          <ENU>Depth from outside edge of flange to centroid of opening reinforcement (bottom)</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="d↓rto←" ESA_ID="MemberData.d↓rto←" Type="Double" Value="101.6e-3" Precision="2">
        <Description TranslateID="VARIABLE_d↓rto←">
          <ENU>Depth from outside edge of flange to centroid of opening reinforcement (top)</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="D↓wo←" ESA_ID="MemberData.D↓wo←" Type="Double" Value="127e-3" Precision="2">
        <Description TranslateID="VARIABLE_D↓wo←">
          <ENU>Circular Web Opening Diameter</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="d2d↓o←" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_d2d↓o←">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d2d↓oe←" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_d2d↓oe←">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d2d↓oel←" ESA_ID="" Type="Double" Value="-480.29e-3" Precision="2">
        <Description TranslateID="VARIABLE_d2d↓oel←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="d2d↓oer←" ESA_ID="" Type="Double" Value="766.62e-3" Precision="2">
        <Description TranslateID="VARIABLE_d2d↓oer←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="d2d↓ol←" ESA_ID="" Type="Double" Value="-1.16378" Precision="2">
        <Description TranslateID="VARIABLE_d2d↓ol←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="d2d↓or←" ESA_ID="" Type="Double" Value="83.13e-3" Precision="2">
        <Description TranslateID="VARIABLE_d2d↓or←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="d2d↓os←" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_d2d↓os←">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d2d↓osl←" ESA_ID="" Type="Double" Value="-73.89e-3" Precision="2">
        <Description TranslateID="VARIABLE_d2d↓osl←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="d2d↓osr←" ESA_ID="" Type="Double" Value="1.17302" Precision="2">
        <Description TranslateID="VARIABLE_d2d↓osr←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="DACA" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_DACA">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DataExchange" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_DataExchange">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Def_Constant↓SLS,ConSelf←" ESA_ID="" Type="Double" Value="-557.7771e-9" Precision="2">
        <Description TranslateID="VARIABLE_Def_Constant↓SLS,ConSelf←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Def_Constant↓SLS,FinLive←" ESA_ID="" Type="Double" Value="-2.032222e-6" Precision="2">
        <Description TranslateID="VARIABLE_Def_Constant↓SLS,FinLive←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Def_Constant↓SLS,FinTotal←" ESA_ID="" Type="Double" Value="-59.96904e-6" Precision="2">
        <Description TranslateID="VARIABLE_Def_Constant↓SLS,FinTotal←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DesignApproach" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_DesignApproach">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Designation" ESA_ID="Result.1" Type="String" Value="XXX RMO">
        <Description TranslateID="VARIABLE_Designation">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="1" Numeric="midSection" SenModif="False" LabOri="1" />
      </Variable>
      <Variable Modifier="Public" Name="DesignInfo_Camber" ESA_ID="Result.8" Type="String" Value="4.25 in">
        <Description TranslateID="VARIABLE_DesignInfo_Camber">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="3" Numeric="midSection" SenModif="False" LabOri="1" />
      </Variable>
      <Variable Modifier="Public" Name="DesignInfo_Case" ESA_ID="Result.10" Type="String" Value="Comp-FS-ULS">
        <Description TranslateID="VARIABLE_DesignInfo_Case">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="3" Numeric="midSection" SenModif="False" LabOri="1" />
      </Variable>
      <Variable Modifier="Public" Name="DesignInfo_MomentBegin" ESA_ID="Result.11" Type="String" Value="0 k-ft">
        <Description TranslateID="VARIABLE_DesignInfo_MomentBegin">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="3" Numeric="midSection" SenModif="False" LabOri="1" />
      </Variable>
      <Variable Modifier="Public" Name="DesignInfo_MomentEnd" ESA_ID="Result.12" Type="String" Value="0 k-ft">
        <Description TranslateID="VARIABLE_DesignInfo_MomentEnd">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="3" Numeric="midSection" SenModif="False" LabOri="1" />
      </Variable>
      <Variable Modifier="Public" Name="DesignInfo_ShearBegin" ESA_ID="Result.13" Type="String" Value="32.9 k">
        <Description TranslateID="VARIABLE_DesignInfo_ShearBegin">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="3" Numeric="midSection" SenModif="False" LabOri="1" />
      </Variable>
      <Variable Modifier="Public" Name="DesignInfo_ShearEnd" ESA_ID="Result.14" Type="String" Value="-32.9 k">
        <Description TranslateID="VARIABLE_DesignInfo_ShearEnd">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="3" Numeric="midSection" SenModif="False" LabOri="1" />
      </Variable>
      <Variable Modifier="Public" Name="DesignInfo_Studs" ESA_ID="Result.9" Type="String" Value="22">
        <Description TranslateID="VARIABLE_DesignInfo_Studs">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="3" Numeric="midSection" SenModif="False" LabOri="1" />
      </Variable>
      <Variable Modifier="Public" Name="DesignMethod" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_DesignMethod">
          <ENU>Design Method</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DetailChecksPass" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_DetailChecksPass">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="e↓wo←" ESA_ID="MemberData.e↓wo←" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_e↓wo←">
          <ENU>Eccentricity of opening</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="Ext_ConstructionAndFinalSLS" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Ext_ConstructionAndFinalSLS">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Ext_ConstructionULS" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Ext_ConstructionULS">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Ext_FinalULS" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Ext_FinalULS">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Ext_SSL" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Ext_SSL">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="F" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_F">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FinalCA" ESA_ID="" Type="Double" Value="251e-3" Precision="2">
        <Description TranslateID="VARIABLE_FinalCA">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="FinalCrossSection" ESA_ID="" Type="String" Value="W(Imp)21X44">
        <Description TranslateID="VARIABLE_FinalCrossSection">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FinalCS" ESA_ID="" Type="String" Value="W40X183">
        <Description TranslateID="VARIABLE_FinalCS">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FinalDesign" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_FinalDesign">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FinMys" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_FinMys">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FM↓y0,ULS,Fin←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_FM↓y0,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="FM↓y1,ULS,Fin←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_FM↓y1,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="FontsAndColors" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_FontsAndColors">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="fontsColors" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_fontsColors">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FV↓o←" ESA_ID="" Type="Double" Value="48009.75" Precision="2">
        <Description TranslateID="VARIABLE_FV↓o←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="FV↓oe←" ESA_ID="" Type="Double" Value="75795.77" Precision="2">
        <Description TranslateID="VARIABLE_FV↓oe←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="FV↓os←" ESA_ID="" Type="Double" Value="81538.99" Precision="2">
        <Description TranslateID="VARIABLE_FV↓os←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="FV↓z0,ULS,Fin←" ESA_ID="" Type="Double" Value="146109" Precision="2">
        <Description TranslateID="VARIABLE_FV↓z0,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="FV↓z1,ULS,Fin←" ESA_ID="" Type="Double" Value="-146109" Precision="2">
        <Description TranslateID="VARIABLE_FV↓z1,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="gInput" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_gInput">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Group" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Group">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="gSectionIndex" ESA_ID="" Type="Double" Value="39" Precision="2">
        <Description TranslateID="VARIABLE_gSectionIndex">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="gSectionInfo" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_gSectionInfo">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="gSubSections1" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_gSubSections1">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="gSubSections2" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_gSubSections2">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h↓wo←" ESA_ID="MemberData.h↓wo←" Type="Double" Value="254e-3" Precision="2">
        <Description TranslateID="VARIABLE_h↓wo←">
          <ENU>Height of opening</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="High" ESA_ID="" Type="Double" Value="250.0014e-3" Precision="2">
        <Description TranslateID="VARIABLE_High">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Value="8" Precision="2">
        <Description TranslateID="VARIABLE_i">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="i_d2d↓oel←" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_i_d2d↓oel←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="i_d2d↓oer←" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description TranslateID="VARIABLE_i_d2d↓oer←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="i_d2d↓ol←" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description TranslateID="VARIABLE_i_d2d↓ol←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="i_d2d↓or←" ESA_ID="" Type="Double" Value="6" Precision="2">
        <Description TranslateID="VARIABLE_i_d2d↓or←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="i_d2d↓osl←" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_i_d2d↓osl←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="i_d2d↓osr←" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description TranslateID="VARIABLE_i_d2d↓osr←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="I↓LB←" ESA_ID="" Type="Double" Value="324.6538e-6" Precision="2">
        <Description TranslateID="VARIABLE_I↓LB←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="416.2314e-9" Dim="in↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="I↓x←" ESA_ID="" Type="Double" Value="52.8614e-6" Precision="2">
        <Description TranslateID="VARIABLE_I↓x←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="416.2314e-9" Dim="in↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="InitialCA" ESA_ID="" Type="Double" Value="500e-3" Precision="2">
        <Description TranslateID="VARIABLE_InitialCA">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="InitialCS" ESA_ID="" Type="String" Value="W8X35">
        <Description TranslateID="VARIABLE_InitialCS">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="InitialDesign" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_InitialDesign">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="InternalForces" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_InternalForces">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="L" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_L">
          <ENU>Length of Beam</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="l↓1←" ESA_ID="" Type="Double" Value="50.8e-3" Precision="2">
        <Description TranslateID="VARIABLE_l↓1←">
          <ENU>Length of extension of reinforcement beyond edge of opening</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="L↓b←" ESA_ID="" Type="Double" Value="10" Precision="2">
        <Description TranslateID="VARIABLE_L↓b←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="304.8e-3" Dim="ft" />
      </Variable>
      <Variable Modifier="Public" Name="L↓b-bot←" ESA_ID="" Type="Double" Value="10" Precision="2">
        <Description TranslateID="VARIABLE_L↓b-bot←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Load" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Load">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Low" ESA_ID="" Type="Double" Value="250e-3" Precision="2">
        <Description TranslateID="VARIABLE_Low">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓n,c←" ESA_ID="" Type="Double" Value="296448.1" Precision="2">
        <Description TranslateID="VARIABLE_M↓n,c←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓n,s←" ESA_ID="" Type="Double" Value="349232.1" Precision="2">
        <Description TranslateID="VARIABLE_M↓n,s←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓n←" ESA_ID="" Type="Double" Value="388035.7" Precision="2">
        <Description TranslateID="VARIABLE_M↓n←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓y-,ULS,Con←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_M↓y-,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓y-,ULS,Fin←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_M↓y-,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓y+,ULS,Con←" ESA_ID="" Type="Double" Value="328466.2" Precision="2">
        <Description TranslateID="VARIABLE_M↓y+,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓y+,ULS,Fin←" ESA_ID="" Type="Double" Value="376127.5" Precision="2">
        <Description TranslateID="VARIABLE_M↓y+,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓y0,ULS,Fin←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_M↓y0,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓y1,ULS,Fin←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_M↓y1,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓yo,ULS,Con←" ESA_ID="" Type="Double" Value="337104.2" Precision="2">
        <Description TranslateID="VARIABLE_M↓yo,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓yo,ULS,Fin←" ESA_ID="" Type="Double" Value="651139.1" Precision="2">
        <Description TranslateID="VARIABLE_M↓yo,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓yoe,ULS,Con←" ESA_ID="" Type="Double" Value="186594.8" Precision="2">
        <Description TranslateID="VARIABLE_M↓yoe,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓yoe,ULS,Fin←" ESA_ID="" Type="Double" Value="353404.2" Precision="2">
        <Description TranslateID="VARIABLE_M↓yoe,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓yos,ULS,Con←" ESA_ID="" Type="Double" Value="149310.8" Precision="2">
        <Description TranslateID="VARIABLE_M↓yos,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓yos,ULS,Fin←" ESA_ID="" Type="Double" Value="280600.8" Precision="2">
        <Description TranslateID="VARIABLE_M↓yos,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="MaxBeamDepth" ESA_ID="" Type="Double" Value="711.2e-3" Precision="2">
        <Description TranslateID="VARIABLE_MaxBeamDepth">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="MaxCA" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_MaxCA">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="MaxCamber" ESA_ID="" Type="Double" Value="101.6e-3" Precision="2">
        <Description TranslateID="VARIABLE_MaxCamber">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="MaxSpacing" ESA_ID="" Type="Double" Value="454.5455e-3" Precision="2">
        <Description TranslateID="VARIABLE_MaxSpacing">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="MaxUC" ESA_ID="Result.7" Type="Double" Value="999" Precision="2">
        <Description TranslateID="VARIABLE_MaxUC">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="1" ESAUnit="66" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="MCR" ESA_ID="" Type="Double" Value="4.34959" Precision="2">
        <Description TranslateID="VARIABLE_MCR">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="middle" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_middle">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="midSection" ESA_ID="Result.4" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_midSection">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="2" ESAStyle="3" ESAUnit="7" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="MinCA" ESA_ID="" Type="Double" Value="274.2039e-3" Precision="2">
        <Description TranslateID="VARIABLE_MinCA">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="MinSpacing" ESA_ID="" Type="Double" Value="454.5455e-3" Precision="2">
        <Description TranslateID="VARIABLE_MinSpacing">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="ModificationCmds" ESA_ID="Result.3" Type="String" Value="">
        <Description TranslateID="VARIABLE_ModificationCmds">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="3" Numeric="ModificationCmdsRatio" SenModif="True" LabOri="0" />
      </Variable>
      <Variable Modifier="Public" Name="ModificationCmdsRatio" ESA_ID="Result.6" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ModificationCmdsRatio">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="2" ESAStyle="3" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="myResults" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_myResults">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="MySections" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_MySections">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="n" ESA_ID="" Type="Double" Value="7" Precision="2">
        <Description TranslateID="VARIABLE_n">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Ncolumns" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_Ncolumns">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NegCompAction" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_NegCompAction">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="NumberStuds" ESA_ID="" Type="Double" Value="10" Precision="2">
        <Description TranslateID="VARIABLE_NumberStuds">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Output" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Output">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Q↓n←" ESA_ID="" Type="Double" Value="75378.62" Precision="2">
        <Description TranslateID="VARIABLE_Q↓n←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="rib_dir" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_rib_dir">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ribsParal" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_ribsParal">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="run" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_run">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="RWO" ESA_ID="MemberData.RWO" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_RWO">
          <ENU>Web Opening is Reinforced</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="RWOBS" ESA_ID="MemberData.RWOBS" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_RWOBS">
          <ENU>Opening Reinforcement on Both Sides of Web</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="S" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_S">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Section" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Section">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Segmented_Result" ESA_ID="" Type="String" Value="">
        <Description TranslateID="VARIABLE_Segmented_Result">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SegStudPattern" ESA_ID="" Type="String" Value="[22]">
        <Description TranslateID="VARIABLE_SegStudPattern">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SLS_CombiType" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description TranslateID="VARIABLE_SLS_CombiType">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="SLS_Con_Loads" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_SLS_Con_Loads">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SLS_Con_Self_Defs" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_SLS_Con_Self_Defs">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SLS_Fin_Live_Defs" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_SLS_Fin_Live_Defs">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SLS_Fin_Loads" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_SLS_Fin_Loads">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SLS_Fin_Total_Defs" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_SLS_Fin_Total_Defs">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SLS_Loads" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_SLS_Loads">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Span" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Span">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SteelSections" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_SteelSections">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="stud_string" ESA_ID="" Type="String" Value="22">
        <Description TranslateID="VARIABLE_stud_string">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="StudRows" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_StudRows">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="T" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_T">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="t↓ro←" ESA_ID="MemberData.t↓ro←" Type="Double" Value="6.35e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓ro←">
          <ENU>Thickness of reinforcement</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="Tables" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Tables">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TargetDegree" ESA_ID="" Type="Double" Value="500e-3" Precision="2">
        <Description TranslateID="VARIABLE_TargetDegree">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="tmp" ESA_ID="" Type="String" Value="W(Imp)21X44">
        <Description TranslateID="VARIABLE_tmp">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,ConSelf,Beg←" ESA_ID="" Type="Double" Value="-1.84231e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,ConSelf,Beg←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,ConSelf,End←" ESA_ID="" Type="Double" Value="-1.84231e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,ConSelf,End←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,ConSelf,Max←" ESA_ID="" Type="Double" Value="-12.394e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,ConSelf,Max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,ConSelf←" ESA_ID="" Type="Double" Value="-10.55169e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,ConSelf←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,FinLive,Beg←" ESA_ID="" Type="Double" Value="-1.57866e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,FinLive,Beg←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,FinLive,End←" ESA_ID="" Type="Double" Value="-1.57866e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,FinLive,End←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,FinLive,Max←" ESA_ID="" Type="Double" Value="-7.83832e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,FinLive,Max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,FinLive←" ESA_ID="" Type="Double" Value="-6.25966e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,FinLive←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,FinTotal,Beg←" ESA_ID="" Type="Double" Value="-27.9511e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,FinTotal,Beg←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,FinTotal,End←" ESA_ID="" Type="Double" Value="-27.9511e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,FinTotal,End←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,FinTotal,Max←" ESA_ID="" Type="Double" Value="-212.668e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,FinTotal,Max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z,SLS,FinTotal←" ESA_ID="" Type="Double" Value="-184.7169e-3" Precision="2">
        <Description TranslateID="VARIABLE_u↓z,SLS,FinTotal←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="u↓z←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_u↓z←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓Camber,Con←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_UC↓Camber,Con←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓Camber,Fin←" ESA_ID="" Type="Double" Value="-948.4797e-3" Precision="2">
        <Description TranslateID="VARIABLE_UC↓Camber,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓d,ConSelf←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_UC↓d,ConSelf←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓d,FinLive←" ESA_ID="" Type="Double" Value="66.7305e-3" Precision="2">
        <Description TranslateID="VARIABLE_UC↓d,FinLive←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓d,FinTotal←" ESA_ID="" Type="Double" Value="1.842404" Precision="2">
        <Description TranslateID="VARIABLE_UC↓d,FinTotal←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓SLS-Con,Self←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_UC↓SLS-Con,Self←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓SLS-Fin,Live←" ESA_ID="" Type="Double" Value="225.3476e-3" Precision="2">
        <Description TranslateID="VARIABLE_UC↓SLS-Fin,Live←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓SLS-Fin,Total←" ESA_ID="" Type="Double" Value="1.842404" Precision="2">
        <Description TranslateID="VARIABLE_UC↓SLS-Fin,Total←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓Spac,Req←" ESA_ID="" Type="Double" Value="495e-3" Precision="2">
        <Description TranslateID="VARIABLE_UC↓Spac,Req←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓Spacing←" ESA_ID="" Type="Double" Value="315e-3" Precision="2">
        <Description TranslateID="VARIABLE_UC↓Spacing←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓ULS,Con←" ESA_ID="" Type="Double" Value="940.5382e-3" Precision="2">
        <Description TranslateID="VARIABLE_UC↓ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓ULS,Fin←" ESA_ID="" Type="Double" Value="710.7131e-3" Precision="2">
        <Description TranslateID="VARIABLE_UC↓ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓ULS-Con←" ESA_ID="" Type="Double" Value="2.58581" Precision="2">
        <Description TranslateID="VARIABLE_UC↓ULS-Con←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓ULS-Fin←" ESA_ID="" Type="Double" Value="1.26878" Precision="2">
        <Description TranslateID="VARIABLE_UC↓ULS-Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ULS_CombiType" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description TranslateID="VARIABLE_ULS_CombiType">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ULS_Con_Loads" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ULS_Con_Loads">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ULS_Fin_Loads" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ULS_Fin_Loads">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ULS_Loads" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ULS_Loads">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Uniform_Result" ESA_ID="" Type="String" Value="">
        <Description TranslateID="VARIABLE_Uniform_Result">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="UniNumStuds" ESA_ID="" Type="String" Value="[22]">
        <Description TranslateID="VARIABLE_UniNumStuds">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="V↓u,ULS,Con←" ESA_ID="" Type="Double" Value="130982" Precision="2">
        <Description TranslateID="VARIABLE_V↓u,ULS,Con←">
          <ENU>Shear (ULS Construction)</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓u,ULS,Fin←" ESA_ID="" Type="Double" Value="146109" Precision="2">
        <Description TranslateID="VARIABLE_V↓u,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓uo,ULS,Con←" ESA_ID="" Type="Double" Value="58973.76" Precision="2">
        <Description TranslateID="VARIABLE_V↓uo,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓uo,ULS,Fin←" ESA_ID="" Type="Double" Value="118561.1" Precision="2">
        <Description TranslateID="VARIABLE_V↓uo,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓uoe,ULS,Con←" ESA_ID="" Type="Double" Value="94183.76" Precision="2">
        <Description TranslateID="VARIABLE_V↓uoe,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓uoe,ULS,Fin←" ESA_ID="" Type="Double" Value="181021.9" Precision="2">
        <Description TranslateID="VARIABLE_V↓uoe,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓uos,ULS,Con←" ESA_ID="" Type="Double" Value="101565.8" Precision="2">
        <Description TranslateID="VARIABLE_V↓uos,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓uos,ULS,Fin←" ESA_ID="" Type="Double" Value="193332.7" Precision="2">
        <Description TranslateID="VARIABLE_V↓uos,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓z0,ULS,Fin←" ESA_ID="" Type="Double" Value="146109" Precision="2">
        <Description TranslateID="VARIABLE_V↓z0,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓z1,ULS,Fin←" ESA_ID="" Type="Double" Value="-146109" Precision="2">
        <Description TranslateID="VARIABLE_V↓z1,ULS,Fin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="WO" ESA_ID="MemberData.WO" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_WO">
          <ENU>Include Web Opening</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="WOS" ESA_ID="MemberData.WOS" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_WOS">
          <ENU>Web Opening Shape</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
    </Variables>
    <DrawingGroups />
    <ResultTables>
      <ResultTable Visible="1" Vars="MaxUC|2|1;Designation|0|1">
        <Names TranslateID="ResultGroup_Composite Beam Design Results">
          <ENU>Composite Beam Design Results</ENU>
        </Names>
      </ResultTable>
    </ResultTables>
    <ResultGroups />
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Summary</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Stud Layout</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_2">
          <ENU>Detailed Check + Stud Layout</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_3">
          <ENU>Design - Detailed</ENU>
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
      <VC ID="GMP000_000003">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_000005">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_000007">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_000008">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_000009">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_000011">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_019503">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_019504">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_019505">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_019507">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_019508">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_019510">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_019511">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_019512">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_019513">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP000_019514">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP001_000001">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP001_000002">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019503">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019504">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019505">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019506">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019507">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019508">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019509">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019510">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019511">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019512">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019513">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019514">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019515">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019516">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019517">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019518">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019520">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP009_019521">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000003">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000004">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000005">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000007">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000010">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000011">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000012">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000014">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000015">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000017">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000019">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000020">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000021">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000022">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000023">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000024">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000025">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000026">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000027">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000028">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000029">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000030">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000031">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000032">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000033">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000034">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000035">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000036">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000037">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000038">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000039">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000040">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000041">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000055">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000056">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000057">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000058">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000059">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000060">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000061">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000062">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000063">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000064">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000065">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000066">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000067">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000068">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000069">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000070">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000071">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000072">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000073">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000074">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000076">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000078">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000079">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019503">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019504">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019505">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019507">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019508">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019509">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019510">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019537">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019538">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019539">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019540">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019541">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019542">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019543">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019544">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019545">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019546">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019567">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019568">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019569">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019570">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019571">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019572">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019573">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019574">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019585">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019631">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019632">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019633">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019634">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019635">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019636">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019642">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019643">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019644">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019645">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019646">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019649">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019653">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019654">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019657">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019658">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019659">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019660">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019661">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019662">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019663">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019664">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019665">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019666">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019667">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019668">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019669">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019670">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019671">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019672">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019673">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019674">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019675">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019676">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019677">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019678">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019679">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019680">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019681">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019682">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019684">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019685">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019688">
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Limit State Title" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019689">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019691">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019693">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019694">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019695">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019707">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019708">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019710">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019711">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019712">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019714">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019715">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019716">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019717">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019718">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019746">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019747">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019749">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019754">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019755">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP098_000001">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP098_000002">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP098_000003">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP098_000004">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP098_000005">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP098_000006">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP098_000007">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP098_000008">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_019503">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_019504">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_019506">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_019508">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_019509">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_019510">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_019560">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_019561">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_019562">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_019563">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_019564">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000003">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000004">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000005">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000007">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000008">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000010">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000011">
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000012">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000013">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000014">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000015">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000016">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000017">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000018">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000019">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000020">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000021">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000022">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000023">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000024">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000025">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000026">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000027">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000028">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000029">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000030">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000031">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000032">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000033">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000034">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000035">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000036">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000037">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000038">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000042">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000043">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000044">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000045">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000046">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000047">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000048">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000049">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000050">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000051">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000052">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000053">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000054">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_000055">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011376">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011378">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011393">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011400">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011401">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011402">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011405">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011407">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011408">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011409">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011410">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011413">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011415">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011416">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011417">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011418">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011421">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011423">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011424">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011425">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011426">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011427">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011428">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011429">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011430">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011431">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011432">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011433">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011434">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011435">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011438">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011440">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011442">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011443">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011444">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011445">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011446">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011447">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011448">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011449">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011450">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011451">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011452">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011453">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011454">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011455">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011456">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011457">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011458">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011459">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011460">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011461">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011462">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011463">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011464">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011465">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011466">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011467">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011468">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011469">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011470">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011471">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011472">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011473">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011482">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011483">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011484">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011485">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011486">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011487">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011488">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011489">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011490">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011491">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011492">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011494">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP311_011495">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000006">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_000009">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011120">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011352">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012925">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_014980">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015139">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015142">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015163">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015164">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015214">
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015445">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015446">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015448">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015449">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015450">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015451">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015452">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015453">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015457">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015458">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015468">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015470">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015472">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016144">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016145">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016146">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016147">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016148">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016149">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016175">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016176">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016177">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016178">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016179">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016180">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016181">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016182">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016183">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016184">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016185">
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016201">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016202">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016203">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016204">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016459">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016460">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016462">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016463">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016464">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016465">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016466">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016467">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016469">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016470">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016471">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016476">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016477">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016481">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016483">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016484">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016486">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016487">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016488">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016489">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016490">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016491">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016492">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016493">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016494">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016495">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016496">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016497">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016499">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016500">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016501">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016502">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016503">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016504">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016505">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016506">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016507">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016508">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016509">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016510">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016511">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016512">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016513">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016514">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016515">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_016559">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016560">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016561">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016569">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016570">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016586">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016587">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016588">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016592">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016594">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016600">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016612">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016613">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016614">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016616">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016627">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016628">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016652">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016653">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016654">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016657">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016658">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016659">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016660">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016676">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016677">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016679">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016681">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016683">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016685">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016686">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016688">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016693">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016704">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016705">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016706">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016707">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016708">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016709">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016710">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016711">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016712">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016713">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016714">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016715">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016716">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016717">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016718">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016719">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016720">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016721">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016722">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016724">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016740">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_017441">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018263">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018264">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018265">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018266">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018267">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018268">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018277">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018278">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018287">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018288">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018289">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018323">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018324">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018325">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018326">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018328">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018332">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018337">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018338">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018339">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018340">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018341">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018342">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018344">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018345">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018346">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018347">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018354">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018355">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018356">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018357">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018367">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018368">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018369">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018370">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018371">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018372">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018373">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018374">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018376">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018377">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018378">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018379">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018380">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018381">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018382">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018383">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018384">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018400">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018401">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018402">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018403">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018404">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018405">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018406">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018407">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018408">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018409">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018410">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018411">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018419">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018421">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018422">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018423">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018424">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018427">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018435">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018438">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018440">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018441">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018442">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018443">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018444">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018445">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018446">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018448">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018449">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018450">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018451">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018452">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018453">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018455">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018456">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018457">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018458">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018459">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018460">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018461">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018462">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018463">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018464">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018465">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018466">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018467">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018468">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018469">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018470">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018513">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018514">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018515">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018523">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018524">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018526">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018527">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018536">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018538">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018540">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018541">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018544">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018545">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018548">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018549">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018553">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018554">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018555">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018556">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018557">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018564">
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018565">
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018625">
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018626">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018627">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018628">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018629">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018630">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018631">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018633">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018634">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018635">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018670">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018671">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018672">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018673">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018674">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018675">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018676">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018677">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018678">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018679">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_018680">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018683">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018684">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018686">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018687">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018689">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018690">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_018993">
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Limit State Title" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019001">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019002">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019003">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019004">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019005">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019006">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019007">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019008">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019012">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019014">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019015">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019017">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019018">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019019">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019020">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019021">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019022">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019023">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019024">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019026">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019027">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019028">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019029">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019030">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019031">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019032">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019033">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019034">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019035">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019036">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019037">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019038">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019039">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019040">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019041">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019042">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019043">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019044">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019045">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019046">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019047">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019048">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019049">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019050">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019051">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019052">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019053">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019054">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019055">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019056">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019057">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019058">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019059">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019060">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019061">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019062">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019067">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019084">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019092">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019154">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019168">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019169">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019170">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019171">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019172">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019174">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019175">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019176">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019178">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019179">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019180">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019181">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019197">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019199">
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019203">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019205">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019207">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019211">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019212">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019214">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019223">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019224">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019225">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019226">
        <Set Vis="1" Prev="" Style="0" StyleName="Limit State Title" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Limit State Title" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Limit State Title" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019227">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019228">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019230">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019231">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019232">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019233">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019234">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019235">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019236">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019237">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019238">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019239">
        <Set Vis="1" Prev="" Style="0" StyleName="Limit State Title" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Limit State Title" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Limit State Title" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019240">
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019245">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019246">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019247">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019248">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019249">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019250">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019251">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019252">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019270">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019271">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019272">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019273">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019274">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019275">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019277">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019279">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019280">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019293">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019294">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019295">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019296">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019298">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019299">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019300">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019307">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019308">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019309">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019310">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019311">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019312">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019315">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019316">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019319">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019320">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019332">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019337">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019339">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019342">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019343">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019344">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019346">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019347">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019348">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019349">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019374">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_019375">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019376">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019377">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019378">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_019380">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015165">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015217">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015375">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016573">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_018279">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_018784">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019065">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019243">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019244">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019392">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019393">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019394">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019395">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019397">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019398">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019493">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019494">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019495">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019496">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019497">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019498">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019499">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019502">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK131_019398">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK131_019399">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK131_019400">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK131_019402">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK131_019403">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK131_019404">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK131_019405">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK131_019406">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK131_019407">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK131_019409">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK131_019410">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="WO" Content="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" />
      <Image Name="RWO" Content="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2/N44403qlOnTiW3AZRsMIEpotLtt99e3XbbbSP/8i//klw3JD/72c+2xaPdxO/RH//4x+RjsVjnz58fnc5948aNrbc2xhhj+pq479I3v/nN6uWXX04esyFXqxyYJhH/3k19fdlyeR4AyzaYwFSHpVUKTOGFF17YFpHG+au/+qvq+vXrycdgOeJU6KeeekpkMsaYHifi0vHjx6vvfe97yWM15Exg2ln8mzf19WXL5XkALJvAVLi43O0f/uEftsWktriU7r/+67+S+7M88WcVkemhhx6qPv300623OsYYY5Y1cVlcnLkUccnl4pRIYNpZ/Ls39fVly+V5ACybwDQAcW+fOEOpGZVqd9555+geQKn96EdcLvfVr37Vjb+NMWaJEzf0jnsuuSyOkglMO4t/+6a+vmy5PA+AZROYBmLcTb8vXryYXE+/3n333erQoUPVuXPnRpdrGGOMWczEMTZuDhyfFueG3pROYNpZLmEnl+cBsGwC04C0b/p9+vTp5DryEJctHj16tHrggQdGb3qMMcZ0O5cvX64OHz5cPfroo6N/16SOxVASgWlnAhNAvwSmgalv+v3d7343uZ38RFz6xje+MbovyPvvv7/1tsgYY8ys87vf/a761re+NQr4m5ubyWMvlEhg2pnABNAvgWlg4qalp06dcvPSwsSfV1zOeO+991ZHjhypfvSjH43uF2KMMWay+f3vf1+98sorow9SiGPpq6++6nshgyMw7UxgAuhXkYGpHZNmkXpc6Fu8GYqbsj///POj/+c9bkj73HPPVT/96U9HZzrFGU5xU/cbN25svaUyxpjVmTj2xadwxrEwjolxb6U4czeOlfXxMu5xJywxVALTzgQmgH4JTEsQ90KKbzRD8PTTTyd/jfOI1xkAsDip77+UJ/4sU/9m58/iU3rbr/0+xKc4p75emtTvMcBOBCZ6l+vrDACGwPfZ4fCmf3c5vN5nfQ45/V31WgNmITDRu1xfZwAwBL7PDoc3/bvL4fU+63PI6e+q1xowCzf5pnclvc4AoDS+zw6HN/27y+H1PutzyOnvqtcaMAuBid6V9DoDgNL4Pjsc3vTvLofX+6zPIae/q15rwCwEJnpX0usMAErj++xweNO/uxxe77M+h5z+rg75tbaxsZH8MCNWy/r6evL1wXwEJnpX0usMAErj++xwDPlNf1dyeL3P+hxy+rvq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" />
      <Image Name="CWO" Content="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" />
      <Image Name="RWO2" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="400">
      <TEMDLoader Name="" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="350|4" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="2" Font="Microsoft Sans Serif|8.25|0|3" Active="0" PreDef="0" MemberDirectory="" MemberID="Beam.1" SectionID="-1" CombiID="-1" />
    </Main>
    <MemberData Width="630">
      <TGroupBox Name="RWO_Box" ID="27" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000027">
          <ENU>Reinforcement</ENU>
        </Texts>
        <TPictureBox Name="Rein_Param" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" ImageName="RWO" SizeMode="4" />
        <TDoubleInput Name="drbo" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="d↓rbo←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="drto" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="d↓rto←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="tro" ID="45" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="t↓ro←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="bro" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="b↓ro←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TCheckBox Name="RWOBS" ID="20" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="RWOBS" BookMarkID="" ForeColor="-16711423" ChbRight="True">
          <Texts TranslateID="DIALOG_000020">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
      </TGroupBox>
      <TGroupBox Name="CWO_Box" ID="39" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000039">
          <ENU>Position and Size of Opening</ENU>
        </Texts>
        <TPictureBox Name="CWO_Param" ID="40" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" ImageName="CWO" SizeMode="4" />
        <TDoubleInput Name="ewo2" ID="42" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="e↓wo←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="Dwo" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="D↓wo←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="do2" ID="41" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="d↓o←" VarNameVisible="False" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
      </TGroupBox>
      <TGroupBox Name="WO_Box" ID="25" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000025">
          <ENU>Position and Size of Opening</ENU>
        </Texts>
        <TPictureBox Name="WO_Param" ID="16" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" ImageName="WO" SizeMode="4" />
        <TDoubleInput Name="ewo" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="e↓wo←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="awo" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="a↓wo←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="hwo" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="h↓wo←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="do" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="d↓o←" VarNameVisible="False" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
      </TGroupBox>
      <TGroupBox Name="Gen_Box" ID="23" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000023">
          <ENU>General</ENU>
        </Texts>
        <TCheckBox Name="RWO" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="RWO" BookMarkID="" ForeColor="-16711423" ChbRight="True">
          <Texts TranslateID="DIALOG_000011">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TComboBox Name="WOS" ID="43" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="WOS" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2" Index="1">
          <Texts TranslateID="DIALOG_000043">
            <ENU>(Select Shape)|Rectangle|Circle</ENU>
          </Texts>
        </TComboBox>
        <TCheckBox Name="WO" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-2894893" BorderStyle="0" Font="Segoe UI|9.75|0|3" VarName="WO" BookMarkID="" ForeColor="-16711423" ChbRight="True">
          <Texts TranslateID="DIALOG_000009">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
      </TGroupBox>
    </MemberData>
    <Setup Width="400" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="STRING_033FC4C3">
      <ENU>"Shear stud diameter does not exceed 0.75''"</ENU>
    </Item>
    <Item TranslateID="STRING_14274E61">
      <ENU>"Pass"</ENU>
    </Item>
    <Item TranslateID="STRING_2544A4EB">
      <ENU>"Maximum Spacing Requirements (8 x Total Slab Thickness or 36 inches)"</ENU>
    </Item>
    <Item TranslateID="STRING_27D2943A">
      <ENU>"Deck nominal rib height does not exceed 3''"</ENU>
    </Item>
    <Item TranslateID="STRING_36F5FA7D">
      <ENU>"Minimum Spacing Requirements (Minimum of 4d↓s← and rib spacing)"</ENU>
    </Item>
    <Item TranslateID="STRING_59951E34">
      <ENU>"Concrete cover c↓c← is minimum 0.5'' above top of studs"</ENU>
    </Item>
    <Item TranslateID="STRING_5D74AA2F">
      <ENU>"Pass/Fail"</ENU>
    </Item>
    <Item TranslateID="STRING_70E068C6">
      <ENU>"Value"</ENU>
    </Item>
    <Item TranslateID="STRING_74B263CE">
      <ENU>"The height of steel studs is ≥ 4d↓s← after installation"</ENU>
    </Item>
    <Item TranslateID="STRING_8636F276">
      <ENU>"Maximum reinforcement steel yield strength is 75 ksi"</ENU>
    </Item>
    <Item TranslateID="STRING_8640063B">
      <ENU>"Check Description"</ENU>
    </Item>
    <Item TranslateID="STRING_8F87F715">
      <ENU>"Fail"</ENU>
    </Item>
    <Item TranslateID="STRING_90CB867D">
      <ENU>"Reference"</ENU>
    </Item>
    <Item TranslateID="STRING_98A1DE0D">
      <ENU>"Concrete slab thickness is at least 2'' above steel deck"</ENU>
    </Item>
    <Item TranslateID="STRING_9CE0CECF">
      <ENU>" in"</ENU>
    </Item>
    <Item TranslateID="STRING_BBF1224B">
      <ENU>"Stud diameter not greater than 2.5x thickness of metal to which it is welded (t↓f←)"</ENU>
    </Item>
    <Item TranslateID="STRING_C13C1523">
      <ENU>"Concrete compressive strength is between 3000 psi ≤ F↓c ←≤ 10000 psi"</ENU>
    </Item>
    <Item TranslateID="STRING_CEA4D1EE">
      <ENU>"Studs extend not less than 1.5'' above top of steel deck"</ENU>
    </Item>
    <Item TranslateID="STRING_E52AA099">
      <ENU>"Minimum Spacing Requirements (6d↓s←)"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000015">
      <ENU>"Warning: Review Member Type"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000073">
      <ENU>"(Member is not composite)"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_019688">
      <ENU>"Stud Layout Not Available for 'Check' Approach"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_019715">
      <ENU>"Warning: Review Member Orientation"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_019716">
      <ENU>"(Member must be either parallel or perpendicular within 5 degrees to decking)"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_019717">
      <ENU>"Composite design supports wide flange (W) shapes only "</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_019718">
      <ENU>"Warning: Review Member Type"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_019746">
      <ENU>"Warning: Construction Self Weight Deflection is 0 inches. "</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_019747">
      <ENU>"Please ensure 'Load type' for self-weight load cases are set to 'Self weight'"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP311_000011">
      <ENU>"Detailing Checks"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_015457">
      <ENU>"An error occured in optimisation: Unable to increase section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_015458">
      <ENU>"An error occured in optimisation: Unable to decrease section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_016204">
      <ENU>"Design Forces"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_017441">
      <ENU>"Warning: Number of studs needed on member exceeds number of studs allowed by spacing requirements"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018328">
      <ENU>"Warning: Load combinations use inconsistent design methods."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018346">
      <ENU>"Warning: Composite design form requires multiple load combinations"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018347">
      <ENU>"Please add the following combinations to a class to procede:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018354">
      <ENU>" 1 - ULS Combination containing only Constuction Stage Loads "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018355">
      <ENU>" 2 - ULS Combination containing at least one Final Stage Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018356">
      <ENU>" 3 - SLS Combination containing only Constuction Stage Loads"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018357">
      <ENU>" 4 - SLS Combination containing at least one Final Stage Load "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018369">
      <ENU>" - ULS Combination containing only Constuction Stage Loads"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018370">
      <ENU>"Warning: Load Class does not contain the following combinations:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018371">
      <ENU>" - ULS Combination containing at least one Final Stage Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018372">
      <ENU>" - SLS Combination containing only Constuction Stage Loads"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018373">
      <ENU>" - SLS Combination containing at least one Final Stage Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018374">
      <ENU>"Please add these combinations to procede"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018376">
      <ENU>"Be sure all combinations use either 1) ASD or 2) LRFD"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018377">
      <ENU>"Warning: Load combinations use inconsistent design methods."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018378">
      <ENU>"Be sure all combinations use either 1) ASD or 2) LRFD"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018379">
      <ENU>"Warning: Composite design form requires multiple load combinations"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018380">
      <ENU>"Please add the following combinations to a class to procede:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018381">
      <ENU>" 1 - ULS Combination containing only Constuction Stage Loads "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018382">
      <ENU>" 2 - ULS Combination containing at least one Final Stage Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018383">
      <ENU>" 3 - SLS Combination containing only Constuction Stage Loads"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018384">
      <ENU>" 4 - SLS Combination containing at least one Final Stage Load "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018564">
      <ENU>"Check of Composite Member " &amp; IO.Beam.Member.Name</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018565">
      <ENU>"Design of Composite Member " &amp; IO.Beam.Member.Name</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018625">
      <ENU>"Summary of Results"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_018993">
      <ENU>"Moment Diagram and Stud Layout"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_019226">
      <ENU>"No section could be found which meets design req's"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_019239">
      <ENU>"Maximum beam depth is currently restricted to " &amp; CUnit(MaxBeamDepth, "in") &amp; " in."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_019240">
      <ENU>"Warning:"</ENU>
    </Item>
  </Texts>
</Root>