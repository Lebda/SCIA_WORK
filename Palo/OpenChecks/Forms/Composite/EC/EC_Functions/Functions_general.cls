<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="e153287b-98a0-42df-a432-a6245f0b6490">
  <CodeEditor>
    <SourceCode Collapsed="3|235|463|496|508|520|577|591|602|609|616|650|654|756|763|843|850|894|917|933|945" BreakPoints="">//Code dependent functions - EC

→KRS014_000025BLOCK("Function for loading values from Member data") { 
    public object GetMemberData() { 
        //support values to simplify new Structure()
        double fabrication →KRS014_000094= IO.Beam.CrossSection.Chars.Fabrication; 
        bool bfabrication →KRS014_000095= fabrication == 0; //true for rolled, false for welded
        double rib_dir →KRS014_000102= GetRibDir(); 
        IF(rib_dir != 999) { 
            double n↓r← →KRS014_000096= rib_dir == 0 ? IO.MemberData.Composite.Connectors.PrimaryBeams.nr : IO.MemberData.Composite.Connectors.SecondaryBeams.nr; 
            IF(n↓r← &gt; 1) { 
                double b↓0,stud← →KRS014_000103= rib_dir == 0 ? IO.MemberData.Composite.Connectors.PrimaryBeams.bcstud : IO.MemberData.Composite.Connectors.SecondaryBeams.bcstud; 
            } ELSE { 
                double b↓0,stud← →KRS014_001631= 0; 
            } 
        } ELSE { 
            double n↓r← →KRS014_000105= 0; 
            double b↓0,stud← →KRS014_000106= 0; 
        } 
        
        object DataExchange →KRS014_000067= new Structure(
        //new properties from EC
        //calculation prerequisities
        "DesignApproach", IO.Beam.MemberData.Composite.Composite.DesignApproach, // 0 = Optimize Beam , 1 = Stud, 2 = Balanced, 3 = User
        "TargetDegree", IO.Beam.MemberData.Composite.Composite.TargetDegree, // Target Degree of CA
        "BeamDepthRestriction", IO.Beam.MemberData.Composite.Composite.BeamDepthRestriction, // 1 = Yes , 0 = No
        "MaxBeamDepth", IO.Beam.MemberData.Composite.Composite.MaxBeamDepth, // Max Beam Depth
        "CS", IO.Beam.CrossSection, 
        "CalcApproach", IO.MemberData.Composite.Composite.CalcApproach, //0 = Design; 1 = Check
        "NegativeSteelOnly", IO.MemberData.Composite.Composite.Resistance.NegativeSteelOnly == 1, //0 - false, 1 - true
        "UseConcrShearRes", IO.MemberData.Composite.Composite.Resistance.UseShearResistance == 1, //0 - false, 1 - true
        "UC_lim", 999, //Value for UC when Error apepar during calculation
        "Beam_Name", IO.Beam.Member.Name, //string name of the beam
        "Code_Name", IO.SetupNA.EC_1994_1_1.Name, //string name of used EC
        "π", Tools.PI, 
        "e", Tools.E, 
        
        //span geometry
        "L_previous", IO.Beam.PlateRib.Span.Length.Previous, //Length of previous beam [m]
        "L", IO.Beam.PlateRib.Span.Length.Current, //Length of current beam [m]
        "L_next", IO.Beam.PlateRib.Span.Length.Next, //Length of next beam [m]
        "L_y", IO.Section.BucklingData.yy.Span.L, //Buckling length of current beam in y axis [m]
        "L_z", IO.Section.BucklingData.zz.Span.L, //Buckling length of current beam in z axis [m]
        "k_z", IO.Section.BucklingData.zz.Span.k, //Buckling coefficient in z axis [-]
        "dx_span", GetSectionPositionOnSpan(), //Position on the beam where calculation is executed [m] = position of section 0 on the beam
        "Span_previous", GetTypeOfPreviousSpan(), //0 - none, 1 - continuous, 2 - cantilever
        "Span_next", GetTypeOfNextSpan(), //0 - none, 1 - continuous, 2 - cantilever
        "Span", GetTypeOfSpan(), //0 -&gt; none - beam - none, 1 -&gt; none - beam - continuous, 2 -&gt; none - beam - cantilever, 3 -&gt; continuous - beam - none, 4 -&gt; continuous - beam - continuous, 5 -&gt; continuous - beam - cantilever, 6 -&gt; cantilever - beam - none, 7 -&gt; cantilever - beam - continuous, 8 -&gt; cantilever - beam - cantilever, 9 -&gt; cantilever  
        
        // Effective width data
        "Entity_left", IO.Section.Neighbour.Left.Entity, //Type of entity on the left, 1 - beam exist on the left, 2 - edge exist on the left
        "L_left", IO.Section.Neighbour.Left.Distance, //Distance to the left entity [m]
        "Entity_right", IO.Section.Neighbour.Right.Entity, //Type of entity on the right, 1 - beam exist on the right, 2 - edge exist on the right
        "L_right", IO.Section.Neighbour.Right.Distance, //Distance to the right entity [m]
        "ShapeOfRib", IO.Beam.PlateRib.ShapeOfRib, //Shale of rib, 4 - used
        "beffCheck_left", IO.Section.Beff.Check.Left, //Effective width on the left [m]
        "beffCheck_right", IO.Section.Beff.Check.Right, //Effective width on the right [m]
        "beffCheck_total", IO.Section.Beff.Check.Total, //Effective width on the right [m]

        //Steel section geometry
        "fabrication", fabrication, //0 for rolled, 1 for welded
        "bfabrication", bfabrication, //true for rolled, false for welded
        "Beam_CS_Name", IO.Beam.CrossSection.Description, //string name of section
        "h_a", bfabrication ? IO.Beam.CrossSection.Geometry.h : IO.Beam.CrossSection.Geometry.Ba, //height of section [m]
        "b", bfabrication ? IO.Beam.CrossSection.Geometry.b : IO.Beam.CrossSection.Geometry.Bb, //width of section [m]
        "t_w", bfabrication ? IO.Beam.CrossSection.Geometry.s : IO.Beam.CrossSection.Geometry.tha, //thickness of web [m]
        "t_f", bfabrication ? IO.Beam.CrossSection.Geometry.t : IO.Beam.CrossSection.Geometry.thb, //thickness of flange [m]
        "r", bfabrication ? IO.Beam.CrossSection.Geometry.r : 0, //non-zero only for rolled //radius in web/flange connection [m]
        "a", bfabrication ? 0 : IO.Beam.CrossSection.Geometry.a, //non-zero onyl for welded // height of weld in web/flange connection [m]
        "A_a", IO.Beam.CrossSection.Chars.A, //area of sectin [m↑2←]
        "AL", IO.Beam.CrossSection.Chars.AL, //circumference per unit length [m↑2←/m]
        "I_y", IO.Beam.CrossSection.Chars.Iy, //second moment of area about y-axis [m↑4←]
        "I_z", IO.Beam.CrossSection.Chars.Iz, //second moment of area about y-axis [m↑4←]
        "i_z", IO.Beam.CrossSection.Chars.iz, //radius of gyration about principal z axis [m]
        "Wpl_y", IO.Beam.CrossSection.Chars.Wply, //Plastic section modulus about principal y axis [m↑3←]
        "Steel_FCode", IO.Beam.CrossSection.Geometry.FormCode, //FormCode of sections - 1 rolled I shapes
        "Struct_type", IO.Beam.Member.StructuralType, //Structural type, 12 - Plate rib
        "Struct_priority", IO.Beam.Member.StructuralPriority, //Structural priority, 0-100 - 92 for plate rib
        
        //Steel section material
        "Beam_Material_Name", IO.Beam.CrossSection.Material.Name, //string name of steel section material
        "f_yb", IO.Beam.CrossSection.Material.EC.fy, //Yield strength [Pa]
        "f_ub", IO.Beam.CrossSection.Material.EC.fu, //Ultimate strength [Pa]
        "E_b", IO.Beam.CrossSection.Material.EC.E, //E modulus [Pa]
        "ρ_a", IO.Beam.CrossSection.Material.EC.UnitMass, //Unit mass [kg/m↑3←]
        
        //Concrete slab geometry
        "h_s", IO.Beam.Composite.Slab.Thickness, //Thickness of cocnrete slab [m]
        "slab_model", IO.Beam.Composite.Slab.AnalysisModel, //Slab analysis model, 2 - Composite deck
        
        //Concrete slab material
        "Slab_Material_Name", IO.Beam.Composite.Slab.Material.Name, //string name of concrete material
        "f_ck", IO.Beam.Composite.Slab.Material.EC.fck, //Characteristics compressive strength [Pa]
        "E_cm", IO.Beam.Composite.Slab.Material.EC.Ecm, //E modulus [Pa]
        "f_ctm", IO.Beam.Composite.Slab.Material.EC.fctm, //Mean tensile strength [Pa]
        
        //Concrete corrosion attack
        "XC", IO.Setup.Concrete.Solver.General.MinCover.CorrosionAttack.Carbonation, //corrosion by carbonation environment
        "XD", IO.Setup.Concrete.Solver.General.MinCover.CorrosionAttack.Chlorides, //corrosion by chlorides environment
        "XS", IO.Setup.Concrete.Solver.General.MinCover.CorrosionAttack.ChloridesSea, //corrosion by sea chlorides environment
        "XF", IO.Setup.Concrete.Solver.General.MinCover.CorrosionAttack.FreezeThaw, //corrosion by freeze/thawn cycles environment
        "XA", IO.Setup.Concrete.Solver.General.MinCover.CorrosionAttack.Chemical, //corrosion by chemicals environment
        
        //Reinforcement geometry
        "d_l", IO.Beam.MemberData.Composite.Reinf2D.Long.Diameter, //Diameter of longitudinal reinforcement
        "s_l", IO.Beam.MemberData.Composite.Reinf2D.Long.Spacing, //Spacing of longitudinal reiforcement
        "c_l", IO.Beam.MemberData.Composite.Reinf2D.Long.Cover, //Cover to longitudinal reiforcement
        "d_t", IO.Beam.MemberData.Composite.Reinf2D.Transv.Diameter, //Diameter of tranverse reinforcement
        "s_t", IO.Beam.MemberData.Composite.Reinf2D.Transv.Spacing, //Spacing of transverse reinforcement
        "c_t", IO.Beam.MemberData.Composite.Reinf2D.Long.Cover+IO.Beam.MemberData.Composite.Reinf2D.Long.Diameter, //Cover to transverser reinforcement
        "TestConCover", IO.MemberData.Composite.Connectors.Test_Cover == 1, //Test concrete cover, false - No, True - Yes
        
        //Reinforcement material
        "Reinf_Material_Name", IO.Beam.MemberData.Composite.Reinf2D.Material.Name, //string name of reiforcement material
        "fyk_r", IO.Beam.MemberData.Composite.Reinf2D.Material.EC.fyk, //Characteristics yield strength [Pa]
        
        //Shear connection type, geometry and material
        "Stud_Material_Name", IO.Beam.MemberData.Composite.Connectors.Connector.Material.Name, //string with name of shear connection material
        "shear_conn", IO.Beam.Composite.Connection.Type, //type of shear connection, 2
        "η_i", IO.Beam.Composite.Connection.Degree, //degree of shear connection [-]
        "stud_approach", IO.Beam.MemberData.Composite.Composite.CalcApproach, //0 = Design; 1 = Check
        "Stud_Name", IO.Beam.MemberData.Composite.Connectors.Connector.Name, //string with name of the stud
        "d_s", IO.Beam.MemberData.Composite.Connectors.Connector.ds, //diameter of stud [m]
        "h_nom", IO.Beam.MemberData.Composite.Connectors.Connector.hsc, //height of stud [m]
        "h_sc", IO.Beam.MemberData.Composite.Connectors.Connector.hsc-0.005, //height of stud - 0,05 [m]
        "n_r", n↓r←, //number of studs in one rib, generally 1 or 2
        "b0_stud", b↓0,stud←, //distance between studs when more than 1 is used [m]
        "LongSpacing", IO.MemberData.Composite.Connectors.PrimaryBeams.LongitudinalSpacing, //longitudinal spacing of studs [m]
        "trough", IO.MemberData.Composite.Connectors.SecondaryBeams.placement, //placement of studs in secondary beams, 1 - every trough, 2 - every 2nd trough, 3 - every 3rd trough
        "welding", IO.Beam.MemberData.Composite.Connectors.welding, //welding of connectors, 1 - trough the steel sheeting, 2 - directly to the beam
        "f_us", IO.MemberData.Composite.Connectors.Connector.Material.EC.fu, //Ultimate strength of shear conn material [Pa]
        "f_ys", IO.MemberData.Composite.Connectors.Connector.Material.EC.fy, //Yield strength of conn material [Pa]
        "Overwrite_cb_min", IO.MemberData.Composite.Connectors.CodebasedMinimum == 1, //Overwrite code-based minimum spacing, False - no, True - yes
        "Min_shear_long_spacing", IO.MemberData.Composite.Connectors.MinimumLongitudinalSpacing, //new minimum spacing
        "Overwrite_cb_max", IO.MemberData.Composite.Connectors.CodebasedMaximum == 1, //Overwrite code-based maximum spacing, False - no, True - yes
        "Max_shear_long_spacing", IO.MemberData.Composite.Connectors.MaximumLongitudinalSpacing, //new maximum spacing
        "η_target", IO.MemberData.Composite.Composite.TargetDegree, 
        
        //Steel sheeting geometry and material
        "Sheeting_Material_Name", IO.Beam.Composite.Slab.Sheeting.Material.Name, //string with steel sheetign material
        "Sheeting_Name", IO.Beam.Composite.Slab.Sheeting.Name, //string with material name for sheeting
        "b_b", IO.Beam.Composite.Slab.Sheeting.Geometry.bb, //width of bottom sheeting rib [m]
        "b_s", IO.Beam.Composite.Slab.Sheeting.Geometry.bs, //spacing of sheeting ribs [m] (the greatest value of all rib distances)
        "b_r", IO.Beam.Composite.Slab.Sheeting.Geometry.br, //width of top sheetign rib [m]
        "h_p", IO.Beam.Composite.Slab.Sheeting.Geometry.hp, //height of sheetign rib [m]
        "t_p", IO.Beam.Composite.Slab.Sheeting.Geometry.th, //thickness of sheeting [m]
        "b0_rib", IO.Beam.Composite.Slab.Sheeting.Geometry.b0, //spacing of sheeting ribs [m] in the central axis
        "h_d", IO.Beam.Composite.Slab.Sheeting.Geometry.hd, //height of rib strenghtening [m] (can be zero)
        "sheeting_angle", IO.Beam.Composite.Slab.SheetingAngle, //angle of sheeting [°]
        "sheeting_shape", IO.Beam.Composite.Slab.Sheeting.Geometry.Shape, //shape of sheeting, 1 - used
        "sheeting", 1, //Profiled sheeting present
        "rib_dir", rib_dir, //direction of rib, 0 - parallel, 1 - transverse, 999 - incorrect angle
        
        //setup
        "propped", IO.Setup.Composite.AnalysisModel.CompositeBeamsArePropped == 1, //if true, construction is not calculated
        
        //camber + deflection limits
        "CamberType", IO.Beam.MemberData.Composite.Deflection.CamberType, // 4 = Design, 5 = No Camber, 1 = Abs, 2 = Relative
        "IsCamber", IO.Beam.MemberData.Composite.Deflection.CamberType == 1 || IO.Beam.MemberData.Composite.Deflection.CamberType == 2, 
        
        "CamberAbs", IO.Beam.MemberData.Composite.Deflection.CamberAbs, // Camber - Abs Value
        "MaxCamber", IO.Beam.MemberData.Composite.Deflection.CamberMax, // Max Camber Value
        "CamberRel", IO.Beam.MemberData.Composite.Deflection.CamberRel, // Camber - Relative Value

        "LimitConstr", IO.Beam.MemberData.Composite.Deflection.LimitCS, //Limit for deflection in construction stage, value in L/xx
        "LimitLiveFin", IO.Beam.MemberData.Composite.Deflection.LimitAdd, //Limit for live load deflection in final stage, value in L/xx
        "LimitTotalFin", IO.Beam.MemberData.Composite.Deflection.LimitTotal, //Limit for final load deflection in final stage, value in L/xx
        
        //Additional data for drawings
        "SizeDrawings", 200, //Scale for drawings
        "UserDimFont", 8.5, //Size of dimension fonts in drawings

        //MemberData for ULS final
        "plastic_theory", IO.MemberData.Composite.Composite.Resistance.UsePlasticTheory, //True - Use plastic theory calculation (EN 1994-1-1 6.2.1.3 (3))
        "C4", IO.MemberData.Composite.Composite.Resistance.LoadFactor, //Load factor (Designers’ guide to EN 1994-1-1, Appendix A)
        "θ", IO.MemberData.Composite.Composite.Resistance.AngleOfConcreteStrut*180/Math.PI, //Angle of concrete strut (EN 1992-1-1 6.2.4 (4))
        
        //MemberData for opening
        "bWO", IO.MemberData.Composite.WebOpening.IncludeWebOpening == 1, //True - web opening is used, False - no web opening
        "WOShape", IO.MemberData.Composite.WebOpening.ShapeType, //web opening selector, 1 - rectangle, 2 - circle
        "ho", IO.MemberData.Composite.WebOpening.Height, //height of the opening
        "lo", IO.MemberData.Composite.WebOpening.Length, //length of the opening
        "eo", IO.MemberData.Composite.WebOpening.Eccentricity, //eccentricity of the opening
        "se", IO.MemberData.Composite.WebOpening.DistFromStart, //distance from the start of member

        //NA values initialisation
        "γ_M0", 0, 
        "γ_M1", 0, 
        "η_sb", 0, 
        "θ_fmin", 0, 
        "θ_fmax", 0, 
        "γ_V1", 0, 
        "γ_V2", 0, 
        "γ_V", 0, 
        "γ_C", 0, 
        "γ_S", 0, 
        "α_cc", 0, 
        "ν", 0, 
        
        //Additional data
        "EWNCodes", new Structure(), //structure for storing already used EWN, to have only unique in the final list
        "CN", 0, //chapter number, have to exists due ValidateInput
        "x", 999, //distance of neutral axis, needed only in case PNA in steel web, in other case used this x=999
        "SectionID_Con_SB", 0, //ID  of section for ULS construction Shear buckling check
        "SectionID_Con_V", 0, //ID  of section for ULS construction V check
        "SectionID_Con_M", 0, //ID  of section for ULS construction M check
        "SectionID_Con_LTB", 0, //ID  of section for ULS construction LTB check

        "SectionID_SLS_Con", 0, //ID  of section for SLS construction deflection check

        "SectionID_Fin_M", 0, //ID  of section for ULS beff and Bending moment resistancecalculation
        "SectionID_Fin_V", 0, //ID  of section for ULS final V check
        "SectionID_Fin_LTB", 0, //ID  of section for ULS final V check

        "SectionID_Live", 0, //ID  of section for SLS final live load deflection check
        "SectionID_Total", 0, //ID  of section for SLS final total load deflection check
        "SectionID_Permanent", 0//ID  of section for SLS final total load deflection check
        ); 
        
        //This is from US form
        //        →KRS014_000039double Camber; 
        //        →KRS014_000040double MaxCamber; 
        //        SWITCH(→KRS014_000031DataExchange.CamberType) { 
        //            CASE 0 :  { Camber →KRS014_000014= 0; MaxCamber →KRS014_000015= MaxCamber; } // Design Camber        
        //            CASE 1 :  { Camber →KRS014_000016= 0; MaxCamber →KRS014_000017= 0; } // No Camber
        //            CASE 2 :  { Camber →KRS014_000018= →KRS014_000032DataExchange.CamberAbs; MaxCamber →KRS014_000019= →KRS014_000034DataExchange.CamberAbs; } // Abs Camber
        //            CASE 3 :  { Camber →KRS014_000020= →KRS014_000033DataExchange.CamberRel; MaxCamber →KRS014_000021= →KRS014_000035DataExchange.CamberRel; } //Relative Camber
        //            DEFAULT :  { Camber →KRS014_000022= 0; MaxCamber →KRS014_000023= 0; } 
        //        } 
        //        //        →KRS014_000036DataExchange.Set("Camber", Camber); 
        //        →KRS014_000037DataExchange.Set("MaxCamber", MaxCamber); 
        
        return DataExchange; 
    } 
    
    public object GetMemberDataStandalone() { 
        //function for manually hardcoded values to be able to run checks standalone
        //do not change defaults, it make TestIO fail
        
        object DataExchange →KRS014_000168= new Structure(
        //new properties from EC
        //calculation prerequisities
        "CalcApproach", 1, //0 = Design; 1 = Check
        "NegativeSteelOnly", false, //0 - false, 1 - true
        "UseConcrShearRes", false, //0 - false, 1 - true
        "UC_lim", 999, //Value for UC when Error apepar during calculation
        "Beam_Name", "B1 standalone", //string name of the beam
        "Code_Name", "EN 1994-1-1 standalone", //string name of used EC
        "π", Tools.PI, 
        "e", Tools.E, 
        
        //span geometry
        "L_previous", 4, //Length of previous beam [m]
        "L", 5, //Length of current beam [m]
        "L_next", 6, //Length of next beam [m]
        "L_y", 5, //Buckling length of current beam in y axis [m]
        "L_z", 5, //Buckling length of current beam in z axis [m]
        "k_z", 1, //Buckling coefficient in z axis [-]
        "dx_span", 2, //Position on the beam where calculation (or drawing) is executed [m]
        "Span_previous", 1, //0 - none, 1 - continuous, 2 - cantilever
        "Span_next", 2, //0 - none, 1 - continuous, 2 - cantilever
        "Span", 5, //0 -&gt; none - beam - none, 1 -&gt; none - beam - continuous, 2 -&gt; none - beam - cantilever, 3 -&gt; continuous - beam - none, 4 -&gt; continuous - beam - continuous, 5 -&gt; continuous - beam - cantilever, 6 -&gt; cantilever - beam - none, 7 -&gt; cantilever - beam - continuous, 8 -&gt; cantilever - beam - cantilever, 9 -&gt; cantilever  
        
        // Effective width data
        "Entity_left", 1, //Type of entity on the left, 1 - beam exist on the left, 2 - edge exist on the left
        "L_left", 1.15, //Distance to the left entity [m]
        "Entity_right", 2, //Type of entity on the right, 1 - beam exist on the right, 2 - edge exist on the right
        "L_right", 0.85, //Distance to the right entity [m]
        "ShapeOfRib", 4, //Shale of rib, 4 - used
        "beffCheck_left", 0.78, //Effective width on the left [m]
        "beffCheck_right", 1.12, //Effective width on the right [m]
        
        //Steel section geometry
        "fabrication", 0, //0 for rolled, 1 for welded
        "bfabrication", true, //true for rolled, false for welded
        "Beam_CS_Name", "HEA300", //string name of section
        "h_a", 0.29, //height of section [m]
        "b", 0.3, //width of section [m]
        "t_w", 0.009, //thickness of web [m]
        "t_f", 0.014, //thickness of flange [m]
        "r", 0.027, //non-zero only for rolled //radius in web/flange connection [m]
        "a", 0.004, //non-zero onyl for welded // height of weld in web/flange connection [m]
        "A_a", 1.13*10↑-2←, //area of sectin [m↑2←]
        "AL", 1.72, //circumference per unit length [m↑2←/m]
        "I_y", 1.83*10↑-4←, //second moment of area about y-axis [m↑4←]
        "I_z", 1.03*10↑-4←, //second moment of area about z-axis [m↑4←]
        "i_z", 0.075, //radius of gyration about principal z axis [m]
        "Wpl_y", 1.38*10↑-3←, //Plastic section modulus about principal y axis [m↑3←]
        "Steel_FCode", 1, //FormCode of sections - 1 rolled I shapes
        "Struct_type", 12, //Structural type, 12 - Plate rib
        "Struct_priority", 92, //Structural priority, 0-100 - 92 for plate rib
        
        //Steel section material
        "Beam_Material_Name", "S235", //string name of steel section material
        "f_yb", 235*10↑6←, //Yield strength [Pa]
        "f_ub", 360*10↑6←, //Ultimate strength [Pa]
        "E_b", 210*10↑9←, //E modulus [Pa]
        "ρ_a", 7850, //Unit mass [kg/m↑3←]
        
        //Concrete slab geometry
        "h_s", 0.22, //Thickness of cocnrete slab [m]
        "slab_model", 2, //Slab analysis model, 2 - Composite deck
        
        //Concrete slab material
        "Slab_Material_Name", "C20/25", //string name of concrete material
        "f_ck", 20*10↑6←, //Characteristics compressive strength [Pa]
        "E_cm", 31*10↑9←, //E modulus [Pa]
        "f_ctm", 2.8*10↑6←, //Mean tensile strength [Pa]
        
        //Concrete corrosion attack
        "XC", 3, //corrosion by carbonation environment
        "XD", 0, //corrosion by chlorides environment
        "XS", 0, //corrosion by sea chlorides environment
        "XF", 0, //corrosion by freeze/thawn cycles environment
        "XA", 0, //corrosion by chemicals environment
        
        //Reinforcement geometry
        "d_l", 0.016, //Diameter of longitudinal reinforcement
        "s_l", 0.13, //Spacing of longitudinal reiforcement
        "c_l", 0.025, //Cover to longitudinal reiforcement
        "d_t", 0.010, //Diameter of tranverse reinforcement
        "s_t", 0.25, //Spacing of transverse reinforcement
        "c_t", 0.035, //Cover to transverser reinforcement
        "TestConCover", true, //Test concrete cover, false - No, True - Yes
        
        //Reinforcement material
        "Reinf_Material_Name", "B500B", //string name of reiforcement material
        "fyk_r", 500*10↑6←, //Characteristics yield strength [Pa]
        
        //Shear connection type, geometry and material
        "Stud_Material_Name", "S235", //string with name of shear connection material
        "shear_conn", 2, //type of shear connection, 2
        "η_i", 0.45, //degree of shear connection [-]
        "stud_approach", 1, //0 = Design; 1 = Check
        "Stud_Name", "STUD", //string with name of the stud
        "d_s", 0.020, //diameter of stud [m]
        "h_nom", 0.1, //height of stud [m]
        "h_sc", 0.095, //height of stud - 0,05 [m]
        "n_r", 1, //number of studs in one rib, generally 1 or 2
        "b0_stud", 0.025, //distance between studs when more than 1 is used [m]
        "LongSpacing", 0.1, //longitudinal spacing of studs [m]
        "trough", 1, //placement of studs in secondary beams, 1 - every trough, 2 - every 2nd trough, 3 - every 3rd trough
        "welding", 1, //welding of connectors, 1 - trough the steel sheeting, 2 - directly to the beam
        "f_us", 360*10↑6←, //Ultimate strength of shear conn material [Pa]
        "f_ys", 235*10↑6←, //Yield strength of conn material [Pa]
        "Overwrite_cb_min", false, //Overwrite code-based minimum spacing, False - no, True - yes
        "Min_shear_long_spacing", 0.095, //new minimum spacing
        "Overwrite_cb_max", false, //Overwrite code-based maximum spacing, False - no, True - yes
        "Max_shear_long_spacing", 0.80, //new maximum spacing
        
        //Steel sheeting geometry and material
        "Sheeting_Material_Name", "S235", //string with steel sheetign material
        "Sheeting_Name", "Sheet1", //string with material name for sheeting
        "b_b", 0.039, //width of bottom sheeting rib [m]
        "b_s", 0.22, //spacing of sheeting ribs [m] (the greatest value of all rib distances)
        "b_r", 0.15, //width of top sheetign rib [m]
        "h_p", 0.019, //height of sheetign rib [m]
        "t_p", 0.00063, //thickness of sheeting [m]
        "b0_rib", 0.055, //spacing of sheeting ribs [m] in the central axis
        "h_d", 0, //height of rib strenghtening [m] (can be zero)
        "sheeting_angle", 90, //angle of sheeting [°]
        "sheeting_shape", 1, //shape of sheeting, 1 - used
        "sheeting", 1, //Profiled sheeting present
        "rib_dir", 0, //direction of rib, 0 - parallel, 1 - transverse, 999 - incorrect angle
        
        //setup
        "propped", false, //if true, construction is not calculated
        
        //camber + deflection limits
        "CamberType", 1, // 4 = Design, 5 = No Camber, 1 = Abs, 2 = Relative
        "IsCamber", true, //true for CamberType == 1 or == 2
        
        "CamberAbs", 0.006, // Camber - Abs Value
        "MaxCamber", 0.010, // Max Camber Value
        "CamberRel", 0.002, // Camber - Relative Value L/xx - 0.002 = 1/500

        "LimitConstr", 0.004, //Limit for deflection in construction stage, value in L/xx - 0.004 = 1/250
        "LimitLiveFin", 0.0025, //Limit for live load deflection in final stage, value in L/xx - 0.0025 = 1/400
        "LimitTotalFin", 0.005, //Limit for final load deflection in final stage, value in L/xx - 0.005 = 1/200
        
        //Additional data for drawings
        "SizeDrawings", 200, //Scale for drawings
        "UserDimFont", 8.5, //Size of dimension fonts in drawings
        "CN", 0, //Chapter numberr, start from 0 for standalone

        //MemberData for ULS final
        "plastic_theory", true, //True - Use plastic theory calculation (EN 1994-1-1 6.2.1.3 (3))
        "C4", 25, 
        "θ", 26.5, 
        
        //Opening
        "bWO", true, 
        "WOShape", 1, //web opening selector, 1 - rectangle, 2 - circle
        "ho", 0.10, 
        "lo", 0.10, 
        "eo", 0.05, 
        "se", 1.00, 
        "ULS_Con_Forces_Opening", new Structure("N", 0, "Vy", 0, "Vz", 15034, "Mx", 0, "My", 12456, "Mz", 0), 
        "ULS_Fin_Forces_Opening", new Structure("N", 0, "Vy", 0, "Vz", 18975, "Mx", 0, "My", 19556, "Mz", 0), 
        //        "ULS_Fin_Forces_Opening_start", new Structure("N", 0, "Vy", 0, "Vz", 25000, "Mx", 0, "My", 26000, "Mz", 0), 
        //        "ULS_Fin_Forces_Opening_end", new Structure("N", 0, "Vy", 0, "Vz", 35000, "Mx", 0, "My", 35000, "Mz", 0), 
        "Open_V_Design", 45100, 
        "d_x_opening", 1.48, 
        "N_studsOver_opening", 12, 
        "N_studsTo_opening", 9, 
        
        //additional data for standalone runs
        "bULS_Con_Loads", true, 
        "bULS_Fin_Loads", true, 
        "bSLS_Con_Loads", true, 
        "bSLS_Fin_Loads", true, 
        "ε", 1, 
        "b_eff_max", 1.77, 
        "d_x_fin_LR", 6, 
        "d_x_beff", 2.5, 
        "EWNCodes", new Structure(), 
        "x", 999, //distance of neutral axis, needed only in case PNA in steel web, in other case used this x=999
        
        //Load forces structures for standalone
        "SectionID_Con_V", 0, 
        "ULS_Con_Forces_V", new Structure("N", 0, "Vy", 0, "Vz", 25000, "Mx", 0, "My", 15000, "Mz", 0), 
        "ULS_Con_Loads_V", new Structure("CombiKey", "1.35*LC1+1.35*LC2", "ID", 1, "LoadName", "CO1", "CombiType", 8, "Type", 1), 
        "SectionID_Con_M", 2, 
        "ULS_Con_Forces_M", new Structure("N", 0, "Vy", 0, "Vz", 35000, "Mx", 0, "My", 25000, "Mz", 0), 
        "ULS_Con_Loads_M", new Structure("CombiKey", "1.35*LC1+1.35*LC2+1.5*LC3", "ID", 2, "LoadName", "CO2", "CombiType", 8, "Type", 1), 
        "SectionID_Con_LTB", 4, 
        "ULS_Con_Forces_LTB", new Structure("N", 0, "Vy", 0, "Vz", 30000, "Mx", 0, "My", 35000, "Mz", 0), 
        "ULS_Con_Loads_LTB", new Structure("CombiKey", "1.35*LC1+1.35*LC2+1.5*LC3", "ID", 2, "LoadName", "CO2", "CombiType", 8, "Type", 1), 
        
        "SLS_Con_Deflections", new Structure("ux", 0, "uy", 0, "uz", -0.022, "fix", 0.01, "fiy", 0.002, "fiz", 0), 
        "SLS_Con_Loads", new Structure("CombiKey", "LC1+LC2", "ID", 3, "LoadName", "CO2", "CombiType", 8, "Type", 1), 
        "SectionID_SLS_Con", 5, 
        
        "SectionID_Fin_M", 6, 
        "ULS_Fin_Forces_M", new Structure("N", 0, "Vy", 0, "Vz", 35000, "Mx", 0, "My", 28000, "Mz", 0), 
        "ULS_Fin_Loads_M", new Structure("CombiKey", "1.35*LC1+1.55*LC2", "ID", 7, "LoadName", "CO3", "CombiType", 4, "Type", 1), 
        "SectionID_Fin_V", 7, 
        "ULS_Fin_Forces_V", new Structure("N", 0, "Vy", 0, "Vz", 48000, "Mx", 0, "My", 18000, "Mz", 0), 
        "ULS_Fin_Loads_V", new Structure("CombiKey", "1.35*LC1+1.55*LC2+1.25*LC4", "ID", 8, "LoadName", "CO4", "CombiType", 4, "Type", 1), 
        "SectionID_Fin_LTB", 8, 
        "ULS_Fin_Forces_LTB", new Structure("N", 0, "Vy", 0, "Vz", 62000, "Mx", 0, "My", -86000, "Mz", 0), 
        "ULS_Fin_Loads_LTB", new Structure("CombiKey", "1.35*LC1+1.62*LC2+1.32*LC6", "ID", 9, "LoadName", "CO5", "CombiType", 4, "Type", 1), 
        
        "SLS_Fin_Forces", new Structure("N", 0, "Vy", 0, "Vz", 35000, "Mx", 0, "My", -28000, "Mz", 0), 
        "SLS_Fin_Live_Deflections", new Structure("ux", 0, "uy", 0, "uz", -0.018, "fix", 0.012, "fiy", 0.002, "fiz", 0), 
        "SLS_Fin_Loads_Live", new Structure("CombiKey", "LC1+LC2+LC3", "ID", 4, "LoadName", "CO2", "CombiType", 9, "Type", 1), 
        "SectionID_Live", 6, 
        "SLS_Fin_Total_Deflections", new Structure("ux", 0, "uy", 0, "uz", -0.024, "fix", 0.012, "fiy", 0.002, "fiz", 0), 
        "SLS_Fin_Loads_Total", new Structure("CombiKey", "LC1+LC2+LC3+LC4", "ID", 5, "LoadName", "CO2", "CombiType", 9, "Type", 1), 
        "SectionID_Total", 6, 
        "SLS_Fin_Permanent_Deflections", new Structure("ux", 0, "uy", 0, "uz", -0.016, "fix", 0.010, "fiy", 0.002, "fiz", 0), 
        "SLS_Fin_Loads_Permanent", new Structure("CombiKey", "LC1+LC2+1.05*LC3", "ID", 6, "LoadName", "CO2", "CombiType", 9, "Type", 1), 
        "SectionID_Permanent", 5
        ); 
        //ToDo - add other load forces for other checks as needed


        
        
        
        return DataExchange; 
    } 
    
    private double GetSectionPositionOnSpan() { 
        // Actual span
        double StartMember →KRS014_000078= IO.Section.BucklingData.yy.Span.StartMember; 
        double StartSection →KRS014_000079= IO.Section.BucklingData.yy.Span.StartSection; 
        double d↓x,span← →KRS014_000080= IO.Section.BucklingData.yy.Position; 
        double L →KRS014_000090= IO.Beam.PlateRib.Span.Length.Current; 
        double Δd↓x,span← →KRS014_000082= 0; 
        
        IF(COMPARE(d↓x,span←, 0, 6) == 0) { 
            d↓x,span← →KRS014_000081= 0; 
        } 
        
        IF(!IO.Beam.BucklingSystem.yy.Span.Contains("L")) { 
            FOREACH(object obSpan in IO.Beam.BucklingSystem.yy.Span) { 
                double StartMember_span →KRS014_000083= obSpan.StartMember; 
                double StartSection_span →KRS014_000084= obSpan.StartSection; 
                double Length_span →KRS014_000085= obSpan.L; 
                IF(StartMember == StartMember_span &amp;&amp; StartSection == StartSection_span) { 
                    Δd↓x,span← →KRS014_000086= 0; 
                    Break(); 
                } ELSE { 
                    Δd↓x,span← →KRS014_000087= Length_span; 
                } 
                d↓x,span← →KRS014_000088= d↓x,span←+Δd↓x,span←; 
            } 
        } 
        
        IF(COMPARE(d↓x,span←, L, 6) == 0) { 
            d↓x,span← →KRS014_000089= L; 
        } 
        return d↓x,span←; 
    } 
    
    private double GetTypeOfPreviousSpan() { 
        IF(COMPARE(IO.Beam.PlateRib.Span.Length.Previous, 0, 6) == 0) { 
            return 0; //none
        } ELSE { 
            IF(IO.Beam.PlateRib.Span.Boundary.Previous &gt; 0) { 
                return 1; //continuous
            } ELSE { 
                return 2; //cantilever
            } 
        } 
    } 
    
    private double GetTypeOfNextSpan() { 
        IF(COMPARE(IO.Beam.PlateRib.Span.Length.Next, 0, 6) == 0) { 
            return 0; //none
        } ELSE { 
            IF(IO.Beam.PlateRib.Span.Boundary.Next &gt; 0) { 
                return 1; //continuous
            } ELSE { 
                return 2; //cantilever
            } 
        } 
    } 
    
    private double GetTypeOfSpan() { 
        // Recognition of the current span type
        // Definition of the current position: Extern_beff.span →INI400_006415= mother_span
        //span = 0 -&gt; none - beam - none 
        //span = 1 -&gt; none - beam - continuous 
        //span = 2 -&gt; none - beam - cantilever 
        //span = 3 -&gt; continuous - beam - none 
        //span = 4 -&gt; continuous - beam - continuous 
        //span = 5 -&gt; continuous - beam - cantilever 
        //span = 6 -&gt; cantilever - beam - none 
        //span = 7 -&gt; cantilever - beam - continuous 
        //span = 8 -&gt; cantilever - beam - cantilever 
        //span = 9 -&gt; cantilever 

        double span↓previous← →KRS014_000092= GetTypeOfPreviousSpan(); 
        double span↓next← →KRS014_000093= GetTypeOfNextSpan(); 
        
        //Recognition of a current span type for calculation of beff
        IF(IO.Beam.PlateRib.Span.Boundary.Start == 0 || IO.Beam.PlateRib.Span.Boundary.End == 0) { 
            return 9; 
        } ELSE { 
            IF(span↓previous← == 0 &amp;&amp; span↓next← == 0) { 
                return 0; 
            } ELSE { 
                IF(span↓previous← == 0 &amp;&amp; span↓next← == 1) { 
                    return 1; 
                } ELSE { 
                    IF(span↓previous← == 0 &amp;&amp; span↓next← == 2) { 
                        return 2; 
                    } ELSE { 
                        IF(span↓previous← == 1 &amp;&amp; span↓next← == 0) { 
                            return 3; 
                        } ELSE { 
                            IF(span↓previous← == 1 &amp;&amp; span↓next← == 1) { 
                                return 4; 
                            } ELSE { 
                                IF(span↓previous← == 1 &amp;&amp; span↓next← == 2) { 
                                    return 5; 
                                } ELSE { 
                                    IF(span↓previous← == 2 &amp;&amp; span↓next← == 0) { 
                                        return 6; 
                                    } ELSE { 
                                        IF(span↓previous← == 2 &amp;&amp; span↓next← == 1) { 
                                            return 7; 
                                        } ELSE { 
                                            return 8; 
                                        } 
                                    } 
                                } 
                            } 
                        } 
                    } 
                } 
            } 
        } 
    } 
    
    private double GetRibDir() { 
        double sheeting_angle →KRS014_000098= IO.Beam.Composite.Slab.SheetingAngle; 
        IF(COMPARE(sheeting_angle, 80, 6) &gt;= 0 &amp;&amp; COMPARE(sheeting_angle, 100, 6) &lt;= 0) { 
            return 1; //Transverse
        } 
        
        IF(COMPARE(sheeting_angle, 10, 6) &lt;= 0 || COMPARE(sheeting_angle, 170, 6) &gt;= 0) { 
            return 0; //Parallel
        } 
        return 999; 
    } 
} 

→KRS014_000072BLOCK("Function for calculation header") { 
    public void PrintHeader(double CalcApproach, string Beam_Name, string Code_Name) { 
        IF(CalcApproach == 0) { 
            string comp_calc →KRS014_000258= TR("Composite beam design for member"); 
        } ELSE { 
            string comp_calc →KRS014_000259= TR("Composite beam check for member"); 
        } 
        string in_accord →KRS014_000075= TR("in accordance with"); 
        →KRS014_000069TEXT(comp_calc &amp; " " &amp; Beam_Name &amp; ", " &amp; in_accord &amp; " " &amp; Code_Name &amp; "."); 
        →KRS014_001238PAGEBREAK(); 
    } 
    
    public void PrintHeaderSection(string dx) { 
        string section →KRS014_000255= TR("Section"); 
        →KRS014_000257TEXT(section &amp; " d↓x← = " &amp; dx &amp; " m"); 
    } 
} 

→KRS014_000063BLOCK("Function for get section position") { 
    public double GetSectionPosition(double SectionID) { 
        return IO.IsStandalone ? 0 : IO.Beam.Section[SectionID].Dx; 
    } 
} 

→KRS014_000119BLOCK("Function for shear resistance of steel section") { 
    //Shear resistance of a steel section
    public void Get_V_Rd(object DataExchange, bool IsOpening, out double V↓pl,Rd←) { //
        →KRS014_000221double&lt;mm↑2←,2&gt; A↓a← →KRS014_000224= DataExchange.A_a; 
        →KRS014_000222double&lt;mm,2&gt; b →KRS014_000225= DataExchange.b; 
        →KRS014_000220double&lt;mm,2&gt; t↓f← →KRS014_000226= DataExchange.t_f; 
        →KRS014_000219double&lt;mm,2&gt; t↓w← →KRS014_000227= DataExchange.t_w; 
        →KRS014_002743double&lt;mm,2&gt; h↓o← →KRS014_002744= DataExchange.ho; 
        →KRS014_000215double&lt;mm,2&gt; r →KRS014_000228= DataExchange.r; 
        →KRS014_000217double&lt;mm,2&gt; h↓w← →KRS014_000229= DataExchange.h_w; 
        →KRS014_000223double&lt;MPa,2&gt; f↓yb← →KRS014_000230= DataExchange.f_yb; 
        →KRS014_000231double η↓sb← →KRS014_000232= DataExchange.η_sb; 
        →KRS014_000233double γ↓M0← →KRS014_000234= DataExchange.γ_M0; 
        
        IF(COMPARE(DataExchange.fabrication, 0, 6) &lt;= 0) { // Rolled I and H sections, load parallel to web
            IF(IsOpening) { 
                double&lt;mm↑2←,2&gt; A↓v← →KRS014_002742= A↓a←-2*b*t↓f←+[t↓w←+2*r]*t↓f←-h↓o←*t↓w←; 
            } ELSE { 
                double&lt;mm↑2←,2&gt; A↓v← →KRS014_000107= A↓a←-2*b*t↓f←+[t↓w←+2*r]*t↓f←; 
            } 
            IF(!IsOpening) { 
                double&lt;mm↑2←,2&gt; A↓v,min← →KRS014_000108= η↓sb←*h↓w←*t↓w←; 
                →KRS014_000109TEXT("A↓v← " &amp; " ≥ " &amp; "A↓v,min←"); 
                IF(COMPARE(A↓v←, A↓v,min←, 6) &gt;= 0) { 
                    →KRS014_000110TEXT(Val(10↑6←*A↓v←, 3) &amp; " mm↑2← " &amp; " ≥ " &amp; Val(10↑6←*A↓v,min←, 3) &amp; " mm↑2← "); 
                } ELSE { 
                    →KRS014_000111TEXT(Val(10↑6←*A↓v←, 4) &amp; " mm↑2← " &amp; " &lt; " &amp; Val(10↑6←*A↓v,min←, 4) &amp; " mm↑2← "); 
                    A↓v← →KRS014_000112= A↓v,min←; 
                } 
            } 
        } ELSE { // Welded I and H sections, load parallel to web
            double&lt;mm↑2←,2&gt; A↓v← →KRS014_000113= η↓sb←*h↓w←*t↓w←; 
        } 
        double&lt;kN,2&gt; V↓pl,Rd← →KRS014_000116= A↓v←*f↓yb←/(SQRT(3)*γ↓M0←); 
    } 
    
    public void Get_V_Rd(object DataExchange, out double V↓pl,Rd←) { //double γ↓M,fi,a←, double k↓y,θ←, bool fire, bool construction, double k↓y,θ,w←,
        →KRS014_002741Get_V_Rd(DataExchange, false, out V↓pl,Rd←); 
    } 
    
    public void ShearBucklingCheck(object DataExchange, bool IsConstruction, bool IsOpening, out double V↓b,Rd←) { 
        IF(IsConstruction) { 
            IF(IsOpening) { 
                →KRS014_002768double&lt;kN,-2&gt; N↓Ed,con,SB← →KRS014_002769= DataExchange.ULS_Con_Forces_Opening.N; 
                →KRS014_002770double&lt;kN,-2&gt; V↓Ed,con,SB← →KRS014_002771= DataExchange.ULS_Con_Forces_Opening.Vz; 
                →KRS014_002772double&lt;kNm,-2&gt; M↓Ed,con,SB← →KRS014_002773= DataExchange.ULS_Con_Forces_Opening.My; 
                →KRS014_002774RenameVar(N↓Ed,con,SB←, "N↓Ed,con,o←"); 
                →KRS014_002775RenameVar(V↓Ed,con,SB←, "V↓Ed,con,o←"); 
                →KRS014_002776RenameVar(M↓Ed,con,SB←, "M↓Ed,con,o←"); 
            } ELSE { 
                →KRS014_002692double&lt;kN,-2&gt; N↓Ed,con,SB← →KRS014_002693= DataExchange.ULS_Con_Forces_V.N; 
                →KRS014_002696double&lt;kN,-2&gt; V↓Ed,con,SB← →KRS014_002697= DataExchange.ULS_Con_Forces_V.Vz; 
                →KRS014_002698double&lt;kNm,-2&gt; M↓Ed,con,SB← →KRS014_002699= DataExchange.ULS_Con_Forces_V.My; 
            } 
        } ELSE { 
            IF(IsOpening) { 
                →KRS014_002777double&lt;kN,-2&gt; N↓Ed,con,SB← →KRS014_002778= DataExchange.ULS_Fin_Forces_Opening.N; 
                →KRS014_002779double&lt;kN,-2&gt; V↓Ed,con,SB← →KRS014_002780= DataExchange.ULS_Fin_Forces_Opening.Vz; 
                →KRS014_002781double&lt;kNm,-2&gt; M↓Ed,con,SB← →KRS014_002782= DataExchange.ULS_Fin_Forces_Opening.My; 
                →KRS014_002783RenameVar(N↓Ed,con,SB←, "N↓Ed,fin,o←"); 
                →KRS014_002784RenameVar(V↓Ed,con,SB←, "V↓Ed,fin,o←"); 
                →KRS014_002785RenameVar(M↓Ed,con,SB←, "M↓Ed,fin,o←"); 
            } ELSE { 
                →KRS014_002719double&lt;kN,-2&gt; N↓Ed,con,SB← →KRS014_002720= DataExchange.ULS_Fin_Forces_V.N; 
                →KRS014_002721double&lt;kN,-2&gt; V↓Ed,con,SB← →KRS014_002722= DataExchange.ULS_Fin_Forces_V.Vz; 
                →KRS014_002723double&lt;kNm,-2&gt; M↓Ed,con,SB← →KRS014_002724= DataExchange.ULS_Fin_Forces_V.My; 
                →KRS014_002735RenameVar(N↓Ed,con,SB←, "N↓Ed,fin,SB←"); 
                →KRS014_002736RenameVar(V↓Ed,con,SB←, "V↓Ed,fin,SB←"); 
                →KRS014_002737RenameVar(M↓Ed,con,SB←, "M↓Ed,fin,SB←"); 
            } 
        } 
        double&lt;MPa,2&gt; f↓yb← →KRS014_002726= DataExchange.f_yb; 
        →KRS014_002727double γ↓M0← →KRS014_002728= DataExchange.γ_M0; 
        →KRS014_002731double γ↓M1← →KRS014_002732= DataExchange.γ_M0; 
        
        double&lt;mm,2&gt; h↓a← →KRS014_002733= DataExchange.h_a; 
        double&lt;mm,2&gt; t↓f← →KRS014_002734= DataExchange.t_f; 
        double&lt;mm,2&gt; h↓w← →KRS014_002668= DataExchange.h_w; 
        double&lt;mm,2&gt; t↓w← →KRS014_002669= DataExchange.t_w; 
        double&lt;mm,2&gt; b↓f← →KRS014_002689= DataExchange.b; 
        double&lt;m,2&gt; L →KRS014_002715= DataExchange.L; 
        double ε →KRS014_002670= DataExchange.ε; 
        double η↓sb← →KRS014_002673= DataExchange.η_sb; 
        double&lt;mm,2&gt; h↓o← →KRS014_002755= DataExchange.ho; 
        double&lt;mm,2&gt; l↓o← →KRS014_002756= DataExchange.WOShape == 1 ? DataExchange.lo : DataExchange.ho; 
        
        →KRS014_002665double λ↓w,rel←; 
        →KRS014_002674double χ↓w←; 
        →KRS014_002705double&lt;kN,-2&gt; V↓b,Rd←; 
        →KRS014_002717double&lt;kN,-2&gt; V↓b,Rd,lim←; 
        →KRS014_002680double&lt;kN,-2&gt; V↓bw,Rd←; 
        →KRS014_002685double&lt;mm,2&gt; h↓f←; 
        →KRS014_002690double&lt;mm↑2←,2&gt; A↓f←; 
        →KRS014_002687double&lt;kNm,-2&gt; M↓f,Rd←; 
        →KRS014_002703double&lt;kN,-2&gt; V↓bf,Rd←; 
        →KRS014_002709double c; 
        
        →KRS014_002672TEXT("Contribution of the web"); 
        λ↓w,rel← →KRS014_002666= h↓w←/(86.4*t↓w←*ε) @REF("(5.5)"); 
        IF(λ↓w,rel← &lt; 0.83/η↓sb←) { 
            →KRS014_002676TEXT("&lt; " &amp; '0.83/η↓sb←' &amp; " = " &amp; 0.83/η↓sb← &amp; " = " &amp; Val(0.83/η↓sb←, -3)); 
            χ↓w← →KRS014_002675= η↓sb←; 
        } ELSE { 
            →KRS014_002677TEXT("≥ " &amp; '0.83/η↓sb←' &amp; " = " &amp; 0.83/η↓sb← &amp; " = " &amp; Val(0.83/η↓sb←, -3)); 
            χ↓w← →KRS014_002678= 0.83/η↓sb←; 
        } 
        //The contribution of the web to the resistance
        V↓bw,Rd← →KRS014_002681= (χ↓w←*f↓yb←*h↓w←*t↓w←)/(SQRT(3)*γ↓M1←) @REF("(5.2)"); 
        IF(IsOpening) { 
            V↓bw,Rd← →KRS014_002754= 0.9*V↓bw,Rd←*(1-SQRT(h↓o←*l↓o←)/h↓w←); 
        } 
        →KRS014_002682PAGEBREAK(); 
        
        →KRS014_002684TEXT("Contribution of the flanges"); 
        h↓f← →KRS014_002686= h↓a←-t↓f←; 
        A↓f← →KRS014_002691= b↓f←*t↓f←; 
        IF(COMPARE(N↓Ed,con,SB←, 0, 6) == 0) { 
            M↓f,Rd← →KRS014_002688= h↓f←*A↓f←*(f↓yb←/γ↓M0←); 
        } ELSE { 
            M↓f,Rd← →KRS014_002694= h↓f←*A↓f←*(f↓yb←/γ↓M0←)*(1-N↓Ed,con,SB←/(2*A↓f←*f↓yb←/γ↓M0←)); 
        } 
        IF(COMPARE(M↓Ed,con,SB←, M↓f,Rd←, 6) == -1) { 
            b↓f← →KRS014_002710= MIN(b↓f←, 30*ε*t↓f←+t↓w←); 
            c →KRS014_002708= L*(0.25+(1.6*b↓f←*t↓f←↑2←*f↓yb←)/(t↓w←*h↓w←↑2←*f↓yb←)); 
            V↓bf,Rd← →KRS014_002707= (b↓f←*t↓f←↑2←*f↓yb←)/(c*γ↓M1←)*(1-(M↓Ed,con,SB←/M↓f,Rd←)↑2←) @REF("(5.8)"); 
        } ELSE { 
            V↓bf,Rd← →KRS014_002706= 0; 
        } 
        →KRS014_002711PAGEBREAK(); 
        
        →KRS014_002712TEXT("Resistance"); 
        V↓b,Rd← →KRS014_002704= V↓bw,Rd←+V↓bf,Rd←; 
        V↓b,Rd,lim← →KRS014_002716= η↓sb←*f↓yb←*h↓w←*t↓w←/(SQRT(3)*γ↓M1←); 
        V↓b,Rd← →KRS014_002718= MIN(V↓b,Rd←, V↓b,Rd,lim←); 
        
        →KRS014_003039DataExchange.Set("V_bw_Rd", V↓bw,Rd←); 
        
        →KRS014_002738RenameVar(N↓Ed,con,SB←); 
        →KRS014_002739RenameVar(V↓Ed,con,SB←); 
        →KRS014_002740RenameVar(M↓Ed,con,SB←); 
    } 
    
    public void ShearBucklingCheck(object DataExchange, bool IsConstruction, out double V↓b,Rd←) { 
        →KRS014_002753ShearBucklingCheck(DataExchange, IsConstruction, false, out double V↓b,Rd←); 
    } 
} 

→KRS014_000157BLOCK("Function for steel web clasification") { 
    //Steel web classification - bending &amp; compression
    public void Get_steel_web_class(object DataExchange, double ε, double α↓cl←, double x, out double class_web) { 
        //Local variables with the same names as global variables
        →KRS014_000212double&lt;mm,2&gt; r →KRS014_000248= DataExchange.r; 
        →KRS014_000213double&lt;mm,2&gt; a →KRS014_000249= DataExchange.a; 
        →KRS014_000214double&lt;mm,2&gt; h↓a← →KRS014_000250= DataExchange.h_a; 
        →KRS014_000158double&lt;mm,2&gt; c↓w←; 
        →KRS014_001878double&lt;mm,2&gt; x; 
        →KRS014_000159double&lt;mm,2&gt; t↓w← →KRS014_000251= DataExchange.t_w; 
        →KRS014_000210double&lt;mm,2&gt; t↓f← →KRS014_000252= DataExchange.t_f; 
        bool bfabrication →KRS014_000253= DataExchange.bfabrication; 
        bool NegativeSteelOnly →KRS014_001886= DataExchange.NegativeSteelOnly; 
        double PNAPosition →KRS014_001661= DataExchange.PNAPosition; 
        
        c↓w← →KRS014_000207= bfabrication ? h↓a←-2*t↓f←-2*r : h↓a←-2*t↓f←-2*a*SQRT(2); 
        web_ratio →KRS014_000208= c↓w←/t↓w←; 
        IF(COMPARE(x, 999, 6) != 0) { 
            IF(DataExchange.positive_moment) { 
                α↓cl← →KRS014_001875= x/c↓w←; // PNA in steel web with positive moment
            } ELSE { 
                IF(!NegativeSteelOnly) { 
                    IF(PNAPosition == 4 || PNAPosition == 5) { 
                        α↓cl← →KRS014_001885= 1; //PNA in steel flange or PNA in steel web rounding with negative moment
                    } ELSE { 
                        α↓cl← →KRS014_001877= (c↓w←-x)/c↓w←; // PNA in steel web with negative moment
                    } 
                } 
            } 
        } 
        
        IF(COMPARE(α↓cl←, 0.5, 6) == 1) { 
            IF(COMPARE(web_ratio, 396*ε/(13*α↓cl←-1), 6) &lt;= 0) { 
                →KRS014_000122TEXT('c↓w←/t↓w←' &amp; " ≤ " &amp; '396*ε/(13*α↓cl←-1)'); 
                →KRS014_000123TEXT(c↓w←/t↓w← &amp; " ≤ " &amp; 396*ε/(13*α↓cl←-1)); 
                →KRS014_000124TEXT(Val(c↓w←/t↓w←, 2) &amp; " ≤ " &amp; Val(396*ε/(13*α↓cl←-1), 2)); 
                →KRS014_000125TEXT("OK"); 
                →KRS014_000126TEXT("Web classified as Class 1."); 
                class_web →KRS014_000127= 1; 
            } ELSE { 
                IF(COMPARE(web_ratio, 396*ε/(13*α↓cl←-1), 6) == 1 &amp;&amp; COMPARE(web_ratio, 456*ε/(13*α↓cl←-1), 6) &lt;= 0) { 
                    →KRS014_000128TEXT('396*ε/(13*α↓cl←-1)' &amp; " &lt; " &amp; 'c↓w←/t↓w←' &amp; " ≤ " &amp; '456*ε/(13*α↓cl←-1)'); 
                    →KRS014_000129TEXT(396*ε/(13*α↓cl←-1) &amp; " &lt; " &amp; c↓w←/t↓w← &amp; " ≤ " &amp; 456*ε/(13*α↓cl←-1)); 
                    →KRS014_000130TEXT(Val(396*ε/(13*α↓cl←-1), 2) &amp; " &lt; " &amp; Val(c↓w←/t↓w←, 2) &amp; " ≤ " &amp; Val(456*ε/(13*α↓cl←-1), 2)); 
                    →KRS014_000131TEXT("OK"); 
                    →KRS014_000132TEXT("Web classified as Class 2."); 
                    class_web →KRS014_000133= 2; 
                } ELSE { 
                    →KRS014_000134TEXT('c↓w←/t↓w←' &amp; " &gt; " &amp; '456*ε/(13*α↓cl←-1)'); 
                    →KRS014_000135TEXT(c↓w←/t↓w← &amp; " &gt; " &amp; 456*ε/(13*α↓cl←-1)); 
                    →KRS014_000136TEXT(Val(c↓w←/t↓w←, 2) &amp; " &gt; " &amp; Val(456*ε/(13*α↓cl←-1), 2)); 
                    →KRS014_003045TEXT("Unsuitable Web Class."); 
                    class_web →KRS014_000138= 999; 
                } 
            } 
        } ELSE { 
            IF(COMPARE(web_ratio, 36*ε/α↓cl←, 6) &lt;= 0) { 
                →KRS014_000139TEXT('c↓w←/t↓w←' &amp; " ≤ " &amp; '36*ε/α↓cl←'); 
                →KRS014_000140TEXT(c↓w←/t↓w← &amp; " ≤ " &amp; 36*ε/α↓cl←); 
                →KRS014_000141TEXT(Val(c↓w←/t↓w←, 2) &amp; " ≤ " &amp; Val(36*ε/α↓cl←, 2)); 
                →KRS014_000142TEXT("OK"); 
                →KRS014_000143TEXT("Web classified as Class 1."); 
                class_web →KRS014_000144= 1; 
            } ELSE { 
                IF(COMPARE(web_ratio, 36*ε/α↓cl←, 6) == 1 &amp;&amp; COMPARE(web_ratio, 41.5*ε/α↓cl←, 6) &lt;= 0) { 
                    →KRS014_000145TEXT('36*ε/α↓cl←' &amp; " &lt; " &amp; 'c↓w←/t↓w←' &amp; " ≤ " &amp; '41.5*ε/α↓cl←'); 
                    →KRS014_000146TEXT(36*ε/α↓cl← &amp; " &lt; " &amp; c↓w←/t↓w← &amp; " ≤ " &amp; 41.5*ε/α↓cl←); 
                    →KRS014_000147TEXT(Val(36*ε/α↓cl←, 2) &amp; " &lt; " &amp; Val(c↓w←/t↓w←, 2) &amp; " ≤ " &amp; Val(41.5*ε/α↓cl←, 2)); 
                    →KRS014_000148TEXT("OK"); 
                    →KRS014_000149TEXT("Web classified as Class 2."); 
                    class_web →KRS014_000150= 2; 
                } ELSE { 
                    →KRS014_000151TEXT('c↓w←/t↓w←' &amp; " &gt; " &amp; '41.5*ε/α↓cl←'); 
                    →KRS014_000152TEXT(c↓w←/t↓w← &amp; " &gt; " &amp; 41.5*ε/α↓cl←); 
                    →KRS014_000153TEXT(Val(c↓w←/t↓w←, 2) &amp; " &gt; " &amp; Val(41.5*ε/α↓cl←, 2)); 
                    →KRS014_003046TEXT("Unsuitable Web Class."); 
                    class_web →KRS014_000155= 999; 
                } 
            } 
        } 
    } 
    
    public void Get_steel_web_class(object DataExchange, double ε, double α↓cl←, out double class_web) { 
        →KRS014_001876Get_steel_web_class(DataExchange, ε, α↓cl←, 999, out class_web); 
    } 
} 

→KRS014_000170BLOCK("Function for steel web clasification") { 
    // Compression flange classification
    public void Get_steel_flange_class(object DataExchange, double ε, out double class_fl) { 
        //Local variables with the same names as global variables
        →KRS014_000179bool bfabrication →KRS014_000241= DataExchange.bfabrication; 
        →KRS014_000180double&lt;mm,2&gt; b →KRS014_000242= DataExchange.b; 
        →KRS014_000181double&lt;mm,2&gt; r →KRS014_000243= DataExchange.r; 
        →KRS014_000182double&lt;mm,2&gt; a →KRS014_000244= DataExchange.a; 
        →KRS014_000183double&lt;mm,2&gt; c↓f←; 
        →KRS014_000184double&lt;mm,2&gt; t↓f← →KRS014_000246= DataExchange.t_f; 
        →KRS014_000185double&lt;mm,2&gt; t↓w← →KRS014_000247= DataExchange.t_w; 
        →KRS014_000186double ε; 
        
        double c↓f← →KRS014_000187= bfabrication ? (b-t↓w←-2*r)/2 : (b-t↓w←-2*a*SQRT(2))/2; 
        double fl_ratio →KRS014_000188= c↓f←/t↓f←; 
        
        IF(COMPARE(fl_ratio, 9*ε, 6) &lt;= 0) { 
            →KRS014_000189TEXT('c↓f←/t↓f←' &amp; " ≤ " &amp; '9*ε'); 
            →KRS014_000190TEXT(c↓f←/t↓f← &amp; " ≤ " &amp; 9*ε); 
            →KRS014_000191TEXT(Val(c↓f←/t↓f←, 2) &amp; " ≤ " &amp; Val(9*ε, 2)); 
            →KRS014_000192TEXT("OK"); 
            →KRS014_000193TEXT("Flange classified as Class 1."); 
            class_fl →KRS014_000194= 1; 
        } ELSE { 
            IF(COMPARE(fl_ratio, 9*ε, 6) == 1 &amp;&amp; COMPARE(fl_ratio, 10*ε, 6) &lt;= 0) { 
                →KRS014_000195TEXT('9*ε' &amp; " &lt; " &amp; 'c↓f←/t↓f←' &amp; " ≤ " &amp; '10*ε'); 
                →KRS014_000196TEXT(9*ε &amp; " &lt; " &amp; c↓f←/t↓f← &amp; " ≤ " &amp; 10*ε); 
                →KRS014_000197TEXT(Val(9*ε, 2) &amp; " &lt; " &amp; Val(c↓f←/t↓f←, 2) &amp; " ≤ " &amp; Val(10*ε, 2)); 
                →KRS014_000198TEXT("OK"); 
                →KRS014_000199TEXT("Flange classified as Class 2."); 
                class_fl →KRS014_000200= 2; 
            } ELSE { 
                IF(COMPARE(fl_ratio, 10*ε, 6) == 1) { 
                    →KRS014_000201TEXT('10*ε' &amp; " &lt; " &amp; 'c↓f←/t↓f←'); 
                    →KRS014_000202TEXT(10*ε &amp; " &lt; " &amp; c↓f←/t↓f←); 
                    →KRS014_000203TEXT(Val(10*ε, 2) &amp; " &lt; " &amp; Val(c↓f←/t↓f←, 2)); 
                    →KRS014_003047TEXT("Unsuitable Flange Class."); 
                    class_fl →KRS014_000205= 999; 
                } 
            } 
        } 
    } 
} 

→KRS014_000160BLOCK("Function for LTB case") { 
    //LTB general case
    public void Get_LTB_coef(object DataExchange, double λ↓LT,rel←, out double Χ↓LT←) { //, double λ↓LT,θ,com←
        →KRS014_000235double&lt;mm,2&gt; h↓a← →KRS014_000236= DataExchange.h_a; 
        →KRS014_000237double&lt;mm,2&gt; b →KRS014_000238= DataExchange.b; 
        →KRS014_000239double&lt;MPa,2&gt; f↓yb← →KRS014_000240= DataExchange.f_yb; 
        
        IF(COMPARE(λ↓LT,rel←, 0.2, 6) &lt;= 0) { 
            Χ↓LT← →INI400_007489= 1; 
        } ELSE { 
            IF(COMPARE(h↓a←/b, 2, 6) &lt;= 0) { 
                →INI400_007370TEXT("h↓a←/b &lt;= 2 " &amp; " -&gt; Buckling curve 'a'"); 
                double&lt;,3&gt; α↓LT← →INI400_007371= 0.21; 
            } ELSE { 
                →INI400_007372TEXT("h↓a←/b &gt; 2 " &amp; " -&gt; Buckling curve 'b'"); 
                double α↓LT← →INI400_007373= 0.34; 
            } 
            double&lt;,2&gt; Φ↓LT← →INI400_007378= 0.5*[1+α↓LT←*(λ↓LT,rel←-0.2)+λ↓LT,rel←↑2←]; 
            double&lt;,2&gt; Χ↓LT← →INI400_007379= 1/(Φ↓LT←+SQRT(Φ↓LT←↑2←-λ↓LT,rel←↑2←)); 
            Χ↓LT← →INI400_007380= MIN(Χ↓LT←, 1); 
        } 
    } 
} 

→KRS014_001339BLOCK("Function for camber calculation") { 
    public void GetCamber(object DataExchange, double d↓x←, out double δ↓z,cam←, out double δ↓z,cam,i←) { 
        double L →KRS014_001345= DataExchange.L; 
        →KRS014_001341double&lt;mm,1&gt; δ↓z,cam,i←; 
        →KRS014_001344double&lt;mm,-2&gt; δ↓z,cam←; 
        
        SWITCH(DataExchange.CamberType) { 
            CASE 1 :  { δ↓z,cam,i← →KRS014_001340= DataExchange.CamberAbs; } //Absolute value of camber
            CASE 2 :  { δ↓z,cam,i← →KRS014_001342= L*DataExchange.CamberRel; } //Relative value of camber
            DEFAULT :  { δ↓z,cam,i← →KRS014_001343= 0; } //0 for No camber and design camber
        } 
        δ↓z,cam← →KRS014_001346= -4*δ↓z,cam,i←*d↓x←↑2←/L↑2←+4*δ↓z,cam,i←*d↓x←/L; //Camber in the section

    } 
} 

→KRS014_001879BLOCK("Function for adding EWN in rectangle") { 
    public void AddEWN(object DataExchange, string EWNCode) { 
        //  IF(!DataExchange.EWNCodes.Contains(EWNCode)) { 
        object fontsColors →UNK000_019243= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\FontsAndColors.CLC"); 
        object FontsAndColors →UNK000_019244= fontsColors.GetFontsAndColors(); 
        →KRS014_000678EWN.TraceRectEWN(EWNCode, FontsAndColors.TableWidth()); 
        →KRS014_001555DataExchange.EWNCodes.Set(EWNCode, 0); 
        //  } 
    } 
} 

→GMP014_000111BLOCK("Function for Opening Forces") { 
    
    public void OpeningData(object DataExchange) { 
        object ULS_Con_Loads →KRS014_002747= DataExchange.ULS_Con_Loads; 
        object ULS_Fin_Loads →KRS014_002745= DataExchange.ULS_Fin_Loads; 
        
        
        IF(DataExchange.WOShape == 2) { 
            double width →GMP014_000180= DataExchange.ho; 
        } ELSE { 
            double width →GMP014_000181= DataExchange.lo; 
        } 
        
        double d↓o← →GMP014_000112= DataExchange.se+width/2; 
        double d↓os← →GMP014_000113= DataExchange.se; 
        double d↓oe← →GMP014_000114= DataExchange.se+width; 
        
        double N↓uo,ULS,Con← →KRS014_002752= 0; 
        double V↓uo,ULS,Con← →GMP011_019567= 0; 
        double M↓uo,ULS,Con← →KRS014_002751= 0; 
        
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
            double FN↓o← →KRS014_002760= (ABS(d2d↓ol←)/(ABS(d2d↓ol←)+ABS(d2d↓or←)+0.00001))*(IO.Beam.Section[i_d2d↓or←].InternalForces[Load.ID].N-IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].N)+IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].N; 
            IF(ABS(FN↓o←) &gt; N↓uo,ULS,Fin←) { 
                N↓uo,ULS,Fin← →KRS014_002761= FN↓o←; 
            } 
            double FN↓os← →KRS014_002762= (ABS(d2d↓osl←)/(ABS(d2d↓osl←)+ABS(d2d↓osr←)+0.00001))*(IO.Beam.Section[i_d2d↓osr←].InternalForces[Load.ID].N-IO.Beam.Section[i_d2d↓osl←].InternalForces[Load.ID].N)+IO.Beam.Section[i_d2d↓osl←].InternalForces[Load.ID].N; 
            IF(ABS(FN↓os←) &gt; N↓uos,ULS,Fin←) { 
                N↓uos,ULS,Fin← →KRS014_002763= FN↓os←; 
            } 
            double FN↓oe← →KRS014_002764= (ABS(d2d↓oel←)/(ABS(d2d↓oel←)+ABS(d2d↓oer←)+0.00001))*(IO.Beam.Section[i_d2d↓oer←].InternalForces[Load.ID].N-IO.Beam.Section[i_d2d↓oel←].InternalForces[Load.ID].N)+IO.Beam.Section[i_d2d↓oel←].InternalForces[Load.ID].N; 
            IF(ABS(FN↓oe←) &gt; N↓uoe,ULS,Fin←) { 
                N↓uoe,ULS,Fin← →KRS014_002765= FN↓oe←; 
            } 
            
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
            
            double CM↓o← →GMP014_000174= (ABS(d2d↓ol←)/(ABS(d2d↓ol←)+ABS(d2d↓or←)+0.00001))*(IO.Beam.Section[i_d2d↓or←].InternalForces[Load.ID].My-IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].My)+IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].My; 
            IF(ABS(CM↓o←) &gt; M↓yo,ULS,Fin←) { 
                M↓yo,ULS,Fin← →GMP014_000175= CM↓o←; 
            } 
            double CM↓os← →GMP014_000176= (ABS(d2d↓osl←)/(ABS(d2d↓osl←)+ABS(d2d↓osr←)+0.00001))*(IO.Beam.Section[i_d2d↓osr←].InternalForces[Load.ID].My-IO.Beam.Section[i_d2d↓osl←].InternalForces[Load.ID].My)+IO.Beam.Section[i_d2d↓osl←].InternalForces[Load.ID].My; 
            IF(ABS(CM↓os←) &gt; M↓yos,ULS,Fin←) { 
                M↓yos,ULS,Fin← →GMP014_000177= CM↓os←; 
            } 
            double CM↓oe← →GMP014_000178= (ABS(d2d↓oel←)/(ABS(d2d↓oel←)+ABS(d2d↓oer←)+0.00001))*(IO.Beam.Section[i_d2d↓oer←].InternalForces[Load.ID].My-IO.Beam.Section[i_d2d↓oel←].InternalForces[Load.ID].My)+IO.Beam.Section[i_d2d↓oel←].InternalForces[Load.ID].My; 
            IF(ABS(CM↓oe←) &gt; M↓yoe,ULS,Fin←) { 
                M↓yoe,ULS,Fin← →GMP014_000179= CM↓oe←; 
            } 
        } 
        FOREACH(object Load in ULS_Con_Loads) { 
            double CN↓o← →KRS014_002749= (ABS(d2d↓ol←)/(ABS(d2d↓ol←)+ABS(d2d↓or←)+0.00001))*(IO.Beam.Section[i_d2d↓or←].InternalForces[Load.ID].N-IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].N)+IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].N; 
            IF(ABS(CN↓o←) &gt; N↓uo,ULS,Con←) { 
                N↓uo,ULS,Con← →KRS014_002750= CN↓o←; 
            } 
            double CV↓o← →GMP011_019671= (ABS(d2d↓ol←)/(ABS(d2d↓ol←)+ABS(d2d↓or←)+0.00001))*(IO.Beam.Section[i_d2d↓or←].InternalForces[Load.ID].Vz-IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].Vz)+IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].Vz; 
            IF(ABS(CV↓o←) &gt; V↓uo,ULS,Con←) { 
                V↓uo,ULS,Con← →GMP011_019672= CV↓o←; 
            } 
            double CM↓o← →GMP014_000165= (ABS(d2d↓ol←)/(ABS(d2d↓ol←)+ABS(d2d↓or←)+0.00001))*(IO.Beam.Section[i_d2d↓or←].InternalForces[Load.ID].My-IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].My)+IO.Beam.Section[i_d2d↓ol←].InternalForces[Load.ID].My; 
            IF(ABS(CM↓o←) &gt; M↓yo,ULS,Con←) { 
                M↓yo,ULS,Con← →GMP014_000166= CM↓o←; 
            } 
        } 
        
        // Beginning and End Moments and Shears (Final ULS)
        double V↓z0,ULS,Fin← →GMP014_000115= 0; 
        double V↓z1,ULS,Fin← →GMP014_000116= 0; 
        double M↓y0,ULS,Fin← →GMP014_000117= 0; 
        double M↓y1,ULS,Fin← →GMP014_000118= 0; 
        
        FOREACH(object Load in ULS_Fin_Loads) { 
            double FV↓z0,ULS,Fin← →GMP014_000119= IO.Beam.Section[0].InternalForces[Load.ID].Vz; 
            IF(ABS(FV↓z0,ULS,Fin←) &gt; ABS(V↓z0,ULS,Fin←)) { V↓z0,ULS,Fin← →GMP014_000120= FV↓z0,ULS,Fin←; } 
            double FV↓z1,ULS,Fin← →GMP014_000121= IO.Beam.Section[IO.Beam.Section.Count-1].InternalForces[Load.ID].Vz; 
            IF(ABS(FV↓z1,ULS,Fin←) &gt; ABS(V↓z1,ULS,Fin←)) { V↓z1,ULS,Fin← →GMP014_000122= FV↓z1,ULS,Fin←; } 
            double FM↓y0,ULS,Fin← →GMP014_000123= IO.Beam.Section[0].InternalForces[Load.ID].My; 
            IF(ABS(FM↓y0,ULS,Fin←) &gt; ABS(M↓y0,ULS,Fin←)) { M↓y0,ULS,Fin← →GMP014_000124= FM↓y0,ULS,Fin←; } 
            double FM↓y1,ULS,Fin← →GMP014_000125= IO.Beam.Section[IO.Beam.Section.Count-1].InternalForces[Load.ID].My; 
            IF(ABS(FM↓y1,ULS,Fin←) &gt; ABS(M↓y1,ULS,Fin←)) { M↓y1,ULS,Fin← →GMP014_000126= FM↓y1,ULS,Fin←; } 
        } 
        
        IF(COMPARE(ABS(M↓yos,ULS,Fin←), ABS(M↓yoe,ULS,Fin←), 3) &gt;= 0) { 
            Vd_opening →GMP014_000182= V↓uos,ULS,Fin←; 
        } ELSE { 
            Vd_opening →GMP014_000183= V↓uoe,ULS,Fin←; 
        } 
        
        
        N →GMP011_000086= 0; 
        
        double Spacing →GMP014_000186= DataExchange.rib_dir == 0 ? DataExchange.LongSpacing : DataExchange.b_s*DataExchange.trough; 
        double TotalStuds →GMP014_000187= DataExchange.L/Spacing; 
        
        //        N↓oe← →GMP011_000090= ROUND((d↓oe←/Spacing)); 
        //        N↓os← →GMP011_000091= ROUND((d↓os←/Spacing)); 
        //        
        //        N↓o← →GMP011_000081= N↓oe←-N↓os←; 
        
        
        IF(d↓o← &lt; DataExchange.L/2) { 
            d↓o← →KRS014_003041= d↓o←; 
            //            N →GMP011_000087= N↓oe←; 
        } ELSE { 
            d↓o← →KRS014_003042= DataExchange.L-d↓o←; 
            //            N →GMP011_000088= TotalStuds-N↓os←; 
        } 
        N →KRS014_003040= ROUNDUP(((d↓o←-0.3)/Spacing))*DataExchange.n_r; 
        
        
        IF(ULS_Con_Loads.Count &gt; 0) { 
            →KRS014_002746DataExchange.Set("ULS_Con_Forces_Opening", new Structure("N", N↓uo,ULS,Con←, "Vy", 0, "Vz", V↓uo,ULS,Con←, "Mx", 0, "My", M↓yo,ULS,Con←, "Mz", 0)); 
        } 
        IF(ULS_Fin_Loads.Count &gt; 0) { 
            →KRS014_002757DataExchange.Set("ULS_Fin_Forces_Opening", new Structure("N", N↓uo,ULS,Fin←, "Vy", 0, "Vz", V↓uo,ULS,Fin←, "Mx", 0, "My", M↓yo,ULS,Fin←, "Mz", 0)); 
            //            →KRS014_002758DataExchange.Set("ULS_Fin_Forces_Opening_start", new Structure("N", N↓uos,ULS,Fin←, "Vy", 0, "Vz", V↓uos,ULS,Fin←, "Mx", 0, "My", M↓yos,ULS,Fin←, "Mz", 0)); 
            //            →KRS014_002759DataExchange.Set("ULS_Fin_Forces_Opening_end", new Structure("N", N↓uoe,ULS,Fin←, "Vy", 0, "Vz", V↓uoe,ULS,Fin←, "Mx", 0, "My", M↓yoe,ULS,Fin←, "Mz", 0)); 
        } 
        →GMP014_000185DataExchange.Set("Open_V_Design", Vd_opening); 
        →KRS014_002748DataExchange.Set("d_x_opening", d↓o←); 
        
        
        //        →GMP014_000188DataExchange.Set("N_studsOver_opening", N↓o←); 
        //        →GMP014_000189DataExchange.Set("N_studsTo_opening", N); 
        →KRS014_003043DataExchange.Set("N_studsTo_opening", N); 
    } 
    
} 
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="" Autor2="" Version="1" EWNSource="Composite.xml" Icon="/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCABkAGQDASIAAhEBAxEB/8QAHQAAAgMAAwEBAAAAAAAAAAAAAAoICQsEBgcFA//EADQQAAICAgEEAgECAgkFAQAAAAMEAgUBBgcACBMUCRIVChEWJBchJjEzNlNjcSIlQkSDI//EAB0BAAICAwEBAQAAAAAAAAAAAAAIBgkFBwoDBAH/xAAvEQACAgIBAwMDAwQCAwAAAAABAgMEBQYRAAcSCBMhCRQiFRYxIzJRcRhCJEFS/9oADAMBAAIRAxEAPwB/jo6Ojo6Ojo68b575/wCJe2XjHYOXuadxrNL0nXgzyRx4w/euLPK7LKWua3W/eLd/s1tFQ8KqkroGdbyIxcDgsuycKd3ed+oB7j+Y2LnTO2tYPb9x5kxVB7VWMSt+U79UZEZQcHsTiSYNRCcyrJABo6pW5Gi967VvIkZRjDds3vXtOiU5Wyz3JUL18bUUTXZl5ID+BZI4IiwIE1iSJGKssZd1K9Mp6fvSh3i9SN+VNCwkNbXKNlauY3XYJpMdrGMm4R3rC0kNi1k8gkUkcjY7EVL1qJJYZbaVa8qz9OEcz9yfAfbvTM33N3Luh8apLV8bTwbNsCSt07XzeFWxZqNbGQ2w3cJPmGpiNPVvT82cw+n7wn9azt9+e/46dItW6qv3vfuQ5KGTF7+hcd2rVUyNtAb0mVHtmY1cZwpzJGvcjjEWIPxIMS5gDIzFDC5u7nY7R282G3s766sjZZsbi5fatLSwYliMZMO2DxTttGzGMY5KcxCZxGOMy/bGOubVantV8vNyj1nYLlQZpLEaqqaxsVxsQgMs15nTWMKJoiMEkhSlgkYFHPMcRnHOdD5Hv1sNqUphcJj6kfPKiybOSssq+XJJianGoYFCVET+BBHuMCCLYNP+kz2fwFBLPc/uht2w2yoWV8IuF0rDRTSCApGoyEOyXZzG62I1la/W+5SWNvtYHiId4lb9RB8fR2FwFDzumIxhCI4zxtVzXVGQkYTZYinuTTcggjnJSxVVZYzCMsAXMXMRylPxP8wXx28wTqk6LuO1zWbu2sIVa9DyNU7Hx+6N01gvXqCM/stSlrsoOzcUOBha7YWisYsmTLlQtBI5/dvwrzJr/r/nuJeTaT2/N6n5fQ9prfa9fxef1/dqg+bw+YPm8f28flF9/r5Ifv5yyswmwwm4uZVtUxVmlWREAwswAkhHXYAWMChMEsZDKIkYkGSMoTjiWM4x8kXfHdacqm/i8TLETwY5KV2o5/g/hILZCtx/9RuPy58T8cSG99LP0xbFSkTUd87gUryKXjuU9n1fYayf3oDZpnX0eSL3OORFdqMWj8BKvLc6tFPdU+w1y9xQW1ZeVLnm9S0p31bOua9c5VT+u6kU6x/AyAy5vEWXjOEoZ/Ug5xx9LrMz7Ze+Puf7RbQbnCPKuxa9SzsEbGz0Zt92x0K9NXslbXjbaxNoak4SOcuWppSSYdCUyjZzJsMLlb5+PX5weGu7GwQ4z5uU13gXmhyDMKgbF03nj3djKQYbPCmvbhUK+sWEkYD9Gjv7tti0bA4sg8ZqVeo7t3UO7uu7NJDRthsJlZSqR1rcqvVsyseBHVuhY0Z2JASKwkEjsfCJZWAJrs9RX07O8vY6nkNowDRd0dBoLNZt5rX6UtbO4ahEvm1vPaw01uzFXhRZXs3sTay9GrBEbV+ajGxSO9Po6OjrbHVfvR0dHR0dHR1HLuq7oOMe0HhnYuauVn5q0NRMdbVV4Pt7ux7M6s2xU67XywMsRtPxRaJkkoEyNZZiYAONYXSZkb0hz82vfXd9y/cVZ8TavYWaHEXDZia8lXgesBVO33fkhYG2xuqfRr2wOTiwFXImABHEaKAPWOWqDcWMH7gbfFpuAmvjxfIWGNXFwOpZZLbqW9yQAj+lXQGWTlh5cKg5ZwC0fpE9Ot71J93cZqDmerqWIiXP7zk4JFhlqa9WnijarVkZZPHIZaw8ePpFYpDE0slp1WGtK6Qc75O+Tlrvl5asOQOQLAyWtpGMto2jLGJGm1amiQuFQhVwUgpOyEScjnlMxMEMxKTDLLLzz0QdcrE7vYaGmsLlLXULe6q6x7YLKJZ11Em+8BVm5fgDEjTSrAlm61EMclkABMDxmecY6kl2jdnvL/eZyFa6FxPTON51zWbPbNpvY1b9hW0NUgAklhs5THmM7O5bh6VJU4MN+4PBkVUB5pf1CeKcn8Ybpw7ultoO/VP4jY6j1iGCNld1NtN1cbaFhXvqEKs4k4sWBITHPBQFwZJ0Ktiq2ouleRGbyA/c2VitW4MjdlRshOH9mzYiKtLAJFI8AqkIip4KqqyRfMTBOnHTZO2Gosex2gZDA6/lNN1qjYh1DFvX/UcJiL6yxUMo9OZXFmSWVDasS2PuJpZZobWQBW/BJYeN7Ofhi+PfQNA1jdMVY+6C2vlkNgrOUdysGo1JvrJ+SrOr6rQvqVVGMMW4COtZyubhOzrAEM6tYpeMFxGq6Ho2iLkT0jTNU01QwUljK6rrtPry5V62BRVy5AVCaYphQEcw0hSjkasDFgCI4knjKMHxR/LNs3Zhs0OM+Y7a82jttvprwnX4Fm0d42dHk/lv9bXAsS0ZGyEgF3qnB2FjrV6SayqmcCfr3qNS23Wd81mk3LTbuv2PV9jrwWlJd1Z8MJWCTGP3gUU8ftKE4SxMLC5oDZUZGZVoIWQlFBwe2ma1PNYaNtfxtDEW6qJHkMbDFEtqvJ+SrK8oBntQTEOYrUru7gskpEodeucX1t9tPUF2z7k24e8G6bV3DwOfs2reobrkbt+bB5imDBNLRr49mXGYPJ4wGrHkcFRr16tZkgnoJJQkqzN+1/rGt7WmKu2nXqPZK8LMHQo39ShcJicGIwBtiVsV2QDZGBlgMDxhgsRHMOM8QLPEoa8//HT2pdw1Y8DbOLdZRuT+sVO5r6lWQkT1ybK9aEVMTGK9KsGwx7lgvrsdesbKUnRyuAYt7abk5ujqf3MfRyETw3ada1FIPF0nhSQEcEf9lJB4JAIII5PB6UfXtu2nUr1fJaxsOZwN6pJ7lezisjapPG/krkgQSorBnRGZXVkcopZT4jhI/vp+Cnk/gutt+QuDnIbpo9bOZWKxh0hX4K5hhSsWT+683g3liwmVppW1zjXht3dXR1e1O2eV0nF/P+401j/7tVbVTv8Avo2NbYon/wDkym6myL/bOucf/gSH9WrU6knZJt11ios/XvrHSeRdAJpN1NoUwNKNqngQDKzICTCcBoTEYU5jJCUJZxlVn5mPi2cfUrObOFFUjnSM7W5oyZFG9txnWlYrakZ45cM2x6lass2dKsD5OwZMljr18zh4FJZ3C6dxu0VepXmzmqxSRiEe7axUY8wR5rzJT/JWj8FJb2VDliAIwGPzcz6MPqJ5bPZjGdrO/mQqW/1NxRwe/XWFd0b2JvClsh9qWO4bUwihGSmev7IkeS5JJGpKd8+FD5Y7XlRnWOz3uIvDWvIGQ2CnE/INqZBc2xJVyjtqHTLckYIgK7XVas0NdzGBbNqCqiGM2eWMfiGc+spKkubTXLmo2GjdNW3VDZoXNPYrZxFivtKtoT1e6vKUZRwZVsATizKMsYIOOcxzj+rrRj+MfvTB3y9q+qcoW5qkPJ9AyzpfLtNVDAkujuVTEZI2ilVCxsWUKnZ6k6F3X4YkGHmYfTWHgaEsRkPZvfps5XfWsvO02Tx8AloWpW8pLlCPwjeKVmPlJZqEqfcYs80D+TflA7vp76kvpIxnazMVe9fbrGQ4/R9uyjUNrwVGARU9a2u4Z7Ve9QghUQ1MJn0SdBUjjirYzKV/ZhPs5SpWrWFdHR0db26ql6hF8inOQO3ztG5a32c2Rskom6NCQK4FmIp3kHm2691Y5wSitdVFdZUcGFyDOs5ZKGi1WDgS3r82mysHLexftbA3sP2brVg8x4xC87jpyMsm8QICCLymLOfjCMYofb6jhCGMRw6z+or2pxLtX1bVa+88QLfZlWdj18TYp+wmK81w+v2D9dmU5i+r9ZaDqbLIhFz4LpJRjIS2gCJmccap/HfIeh6P5vW/jLc9X1T2PJ4fB/EV4jUeby+s54vF7n38nqNfT6/b1j/t4pKX3yv2L214/DpyYqdGExL5cK9i/K3kSOfHkCONPI/kPyX4AHPQl9K3UsTq3YDcu49kIt3Y9qya35vZBmr4fU8fC0KLIVEhWV7lywYUPtMFgkBZ2IR8z4R+1Wu7buyXTNndRZByF3BDT5X3Q1hXWNU+tXPrTFo2vTTsS+TC1RrhI2AmIKpwbcvrBgcTrEWYJ+vyWfGhofdhpVvstBQBDvqAbe0XlWpELaKXbycxH2zWlE2q8tjZFLBZva9Km2Kt3+KKrwoB3RBFq1tqpaeu16nqaCnX9Opo6xCnq1PMdj1a6sVEkiv52inZP4FgCF5mDGOT6/cxSElKefpdMdFqmI/bNXV7FWGbH16MNQoUHBeNB52F8uSJZJvOdn/uMjlieST1S7d7/wDcM97s931xGdyGM3DMbRkNhWzHYYNHWtWH+2w8ntlUfH08aIMVFWC+ylKCOBUEahest/mvg3kHgHcS6ZyDXBA3IOG6u4rSMNa/sCGc4jl+ksGFUyshGXOQsBYVVdUNjxtqAlIf3tW+KP5Ztm7MNmhxnzHbXm0dtt9NeE6/As2jvGzo8n8t/ra4FiWjI2QkAu9U4OwsdavSTWVUzgT9ezD8jvxxaN3S6NfXFPQ/2l/mbh5GnWH+YxceOWZ7hp8MR/zL/fLYNfjj1d2V8pBi/iX7R2BE7nTgvee3/eXNK3VP/Uaob5UZPw+zU/kzANpVmnj/AIG6kTPtVzX2XYj/AIZCq3sWu7D2qz8OZw08poiQmtZIZ4mjc8NTvxqVWWGQELwxH5ePysyxSvfD2c7y9nvX52kyXbXuZi6CbSaajMYVWhr5CG3XXzh2XUrc0c0lDJVGUykwK/8AS97mOfGzX6NfT41LbdZ3zWaTctNu6/Y9X2OvBaUl3VnwwlYJMY/eBRTx+0oThLEwsLmgNlRkZlWghZCUUOxdIOfFH8rmzdjGzQ4z5Lnebf20bfeLmt6gLGXXeLHXcnhZblptbMBDsjZORNnY9cWcWWsFlnHkUzbAaE2Hu9J3bUeSdR13fdC2Kp23TNtqU73W9konBP1NxUviwZV1NoOcwmOcM/WcJfUoCxIA4xHEQcWT0fecZuuNFisVrZKuqjJYxn8pazkkCSMkKZqspHMUyr8c+3KElVl6pQ9UvpY3j0xbo2HzSTZnTMvNNJpe8Q1vZo52rGqSSU7cSSTrjM9QVxHkMZNL5N4i7SaxQminPaOutbjqdPvWrX2oX4fPU7DWM1rf1GqQ6/nh/wDg+l7qziwbOsZiGxq2irH9KxVVbgPJAQ67L0dTVlV1ZHAZXUqykchlYEEEf+wQSCP8dLFDNLWmisQSNFPBLHNDKh8XilicPHIjD5DI6hlI/ggHrN6+STt1J26dz27Ui34/8Ls1rd3Sg6wkpoo3al29U7fXKQKJQ8a+OwqNWlRjKCa4aa2rkAjwZBoYbKf05PP9to/dNvvb+XHsazzpoxLuECHLj8dt3FYLS4rm1QxSaj/Pa7cbMq/jLVYI/grSHO2dCvUl7T+pG4/TQ23ije1QMnPYlFGxdO2LxIOX1O9UQr0kx+Ccln6/i1FyZTieKu4o3+zqwHgpypS+NTZltQ7+e0u+duK+gRX5t0xN+1tGUk69avuX8Ur0WWrHMVF4NKWBlImJOExzPCS5BsYFOKb2Iv2Z3driofbgTO1CoDBB9nlSkNtD5AoiGOzYUKOVRPFQyleV6TcLf/5LfTszDbGpt5Wx2rzyyySRNZk/cOhJPk9ftKIZUsWLKWsJiJpJW9uW1YEsjwzRzeM2lB0dHR05XXNb0tD+oqp7EHE9DflX+tTZi02nSb8wJeexo9q2B20X8ES5ZH6q2w05fMYIwH9z6LlMRdqAFNuA7BOo514WtbA3roVnLPHNg8x4yl8CaW4UzLJvECBTF8QRTn4wjIWf1+o4TnnEcu9/OlxTYckdoVg6mlCylrQ7w6iS2ITu83Ifwu5InqRGUOKcMVuh3aVjABg2jS78aysEwawJkCGKzLCbC7ibBlW1TCZVaWKQDCzACRKBhc4pQKEwSxiQRRyiQZIxnCWJYxnCf954no71XulCYnqUp4yf+7QTPJKgPAHwzqP55AYc/wCT0Z/TQv1dq9KuZ1lbEceQg2LZsXcWM/NaDJ4unRx87qWdwZIa0jklfF3jcoOOUTV66Oox9mnP9Z3PdsfDXNKL3u2G36NQm2yBFk69pLdVa5dba1WqtFlsFX97kbLyCuC/UlO5Wugj6ra8pSc6bmrZhu1q9yu4eC1BFYhcccNFMiyRt8Ej5Vgfgn/fXPDncLkdbzeX17L12qZXB5O9iMlWcMGgvY6zLUtREOqt+E8LqCVUkAHgc9HVS3yO/HFo3dLo19cU9D/aX+ZuHkadYf5jFx45ZnuGnwxH/Mv98tg1+OPV3ZXykGL+JftHYLaejr5criqOZoz4/IQJPWnRkdHUNx5AjyXkHgjn/RHweQes5oe+bP222fF7dqOUs4rM4mzFZr2K8rxeZikWQRye2ylkYqD/ACGVgHQhgD1lv838JbrwLvlro25omxJU0pU1+JJwFJtNXIYDgtaNtoIxOBwJkIXxrkPmrsos1bc8Nqljizf4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbRoD5Hfji0bul0a+uKeh/tL/M3DyNOsP8xi48csz3DT4Yj/AJl/vlsGvxx6u7K+UgxfxL9o7AidzpwXvPb/ALy5pW6p/wCo1Q3yoyfh9mp/JmAbSrNPH/A3UiZ9qua+y7Ef8MhVD2TWtg7W5+HM4aeUUxMzVLaqzRiJ2/KjdQkiWCReI2Dn8zxyVlEUjdE/ZTvb2h9efaPJds+5WLpPskmPijz+AmkihuPdrQf0tp1eysaNQylOb3LcRqoTXUyFUnx736kGnlpO7ajyTqOu77oWxVO26ZttSne63slE4J+puKl8WDKuptBzmExzhn6zhL6lAWJAHGI4iDj2jpBb4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbR8HSd21HknUdd33Qtiqdt0zbalO91vZKJwT9TcVL4sGVdTaDnMJjnDP1nCX1KAsSAOMRxEHFldG3nG7tjRYrla2SrKi5LGs/MleQ/AliJ4MtSUgmKUDkHmKULIpBpM9VHpX3X0w7q2Iy6zZnSszNYl0rdYq5jqZinGfNqF9U8o8fsOPjZFyGPZ/F18btJpqUyOqvv6ky4XVqOKKbJA+9bs6myIBUhsEkhVf0uZdYWaKuWKBgtvVYpFXOq6ddphUciolsRZXH7KNIY5I7wO2HSFXw1Zdi544sTlYsBIzBJeG5VDTjMVhyHJowlFzyWVyZYbLGBAK2oIk2RWt/qDee/6Q+66v4prLb8lR8WUohHh+I9H07hkcVG6j3WALNv/ibdfZGPPAU1S/m/2FZWSoUAVMcPhI4XuOXfkM4bsVE2SUfEkrnlbZbGNJ+Yrq4Gu1jK9HCwJNlUFWSx2awqEqyxlI51bGYGFkzzBKQlx20psHd2OnWVrEZzeLx7hSOGWCaH7sqyuQEjHvEuCpARm4BHJuj9PQsdovp3W9kzUsOJsjtjvW3V3njZjFNk8dkF15J4JKys1m4642OOBknEjWIY/NlbwTQW6Ojo6cbrm368v5q44X5c4r3bjpmQcR2ammsvFvI8IFsE2AWdWva4IjZYnTM2SSi9yKCLBzVRHBLxieYyQzS+5zhO47e+bd64uuE2UfwdswSsA6D1HIVDJiySE2gSws3UGU/oVA6lozi0GVScnQhLPMMagnS4fze/Hj/S5q+eeuOae2a22iHZuM19HWU+FZWLuKgR6976HrjzW3A60nlnmYmnX7hGwlJ153d1amWnu8Wny7FhI8lRiMuSw/nIqKOXmpv8zxKP55BAkUKCWdVB8U8mFjv04PUbS7N90bembTfWlpXcj7anPZmYJWxuw1+UxWRmY8KI2V3pTPJIiRV55pFEs4hhkgr8BvyKV/E2zOdnHMew19Pxzu1hY7DxDfPpzgOg5CeyqS51i1u4HivXa7siKh7NFixVwohsC7EC2Kw7nEYuTdZRn/caax/92qtqp3/fRsa2xRP/APJlN1NkX+2dc4//AAJD+pvn4tfnK1/cavTO3rvQ2INLvoTKatqPPFwwaNXumD5WU15Lkc8U5qU2wQlgyNlvlk+nV2spVTd5ANgW8vjQ7tF3JrQVodT2G0tZoCIsNesMViMZbgY2xK7cRPEx4ps/jEYv/GLI0cKysj9RL0T5zKZvI+oHs9hJczDlY2v9ydWw8AmvxXI4vOXdMPRrRed+tehT3djgg966l3nNJHZgt5GSgz10dcZJ1OyTUsa5tZ+vfWA6i8kcTSbqbQoHVbUaBMgGVmQEgYBwzmIwpwIOcoSxnPJ6ZIEEcg8g/II/gj/PVKTKysVYFWUlWVgQysDwQQfkEH4IPyD8Ho6qW+R344tG7pdGvrinof7S/wAzcPI06w/zGLjxyzPcNPhiP+Zf75bBr8ceruyvlIMX8S/aOwW09HWOyuKo5mjPj8hAk9adGR0dQ3HkCPJeQeCOf9EfB5B6mGh75s/bbZ8Xt2o5SziszibMVmvYryvF5mKRZBHJ7bKWRioP8hlYB0IYA9ZcvOnBe89v+8uaVuqf+o1Q3yoyfh9mp/JmAbSrNPH/AAN1ImfarmvsuxH/AAyFnl8fHyvc39idPtfHaXk3jiLaFnmq7VrI0Ttce7c1+0pbXo+XczSXk9+0429A8MtE89Ja7MmVtV1W4Yr+a3hvtDW4iud35W3PUNH22znl2o1TLeI7nsO1P+ytX7XodLVpWt2OwM8CYtyLmpnq9tWjdtbhlK3UaLeI+dJntGKv9stqVsJlljlKSS1mgmVrMNaU+LV7sPLH2pAeIxMOZAhYcvEsrdK/YnfdS9cnYOev3R7fyW6SWamPzaZTGz18NkszRX3osxrWR8IVW/TkXyttjJPCobKROVq5CTHx9z5E3i45K3nat8vp+S22q6ct2/8ApVj4/YJnwL/ySiC0/VWiFbyjTX8/i80xRISfTj/6eTtHPxVwbuHctttJ6m2c5/jqzT2242IHlONagxXY4WAYUKxms2eznX3I7VFhubOUQVrA0GKg8GlyfjU+Pveu/jm4GtKrO03D+l+vcctb/ILQ0KmuJLOK/W6xoYJBd2zYzRlivpsNJHlVKXFnl1MVfk+NEvXNeptS16i1TXK8NTr2s01Xr1DVLZJlespqVEFbV16+SzIXIU0VgLCyQhCZGOP3nKX7yzP+yepWbuRsbplI3MUTTx4x5l/K3dseaXLq+QHKwqzwrIOVeaaUKQ8DcKP9T71BYPWtMw/pk0W1WS3dixVzeKuNmAi1/WsOKs+s6vMImYRzZKaCtkpqblJq+Nx2PeVWr5WPy+z0dHR0z3VF/R1xnUk7JNuusVFn699Y6TyLoBNJuptCmBpRtU8CAZWZASYTgNCYjCnMZIShLOM8no6CAQQRyD8EH+CP8Hr9VmVgykqykMrKSGVgeQQR8gg/II+QfkdKq/Kv8Mrmy3rvN3bagBc7/uO7PTni+RQYk02HmJ3TCSlgyvlZZUn47b3A5TOsPFZur6jyyOyXipOz6psul3LmvbZR2evXSBmF2q61UMmxAirTCJ5QiWOInDFtVkEWQSKuUgCYEWeI5z1qwdVzd1nxd9qnddVkhsuj1mq7IMOA12ya3XjUnXY+yMI+qmiesOgEIVTFHX0FnR1dhaNkstlR2HMcrE0RvfZuvmp58rrskNHITFpJ6UvKU7Mp45ZGUN7EjnlmIXwJJJBJ56tb9KX1J8z2wxmK0HvJTyO16fj44aWM2Sj42djwlKMyBYbEU0kX6tUroY44Y2lFmONEiikWNApSI7Xfkr7ye0FOdJw7y7Zw06f7ZxoO5Kr7ppS0vLXSISrpb3DGKExl60KJTUDFWXKZTwjOBZwMO7Hjj9TXtC8GQ8u9qtBbFyGMk7DjjkWx12EWIsG+4mafZ6DaJECVQgMRYFeDIBhQ0srMisYRq/Fuev07fcFrjthZ8K7RrO1U8U3reVVYvHyOsHF9ksKdOwgrDaLpxWohjAllNKdYeYGmJZt1uzYWqa49m+JP5DNbhM8O2PkTYlBhCUrGs1ZLEkCGYyvhaFYfCd0yYecjMaSdYwuJcuDSYxELXr6wrt3h0zipVjzv2sQ4jhWqMzSEalgPYSSG2IY/yJIjWEj4LAEDh6sxF9OD1MFtizlrtYM7kCXuZCfOSdtNmNyX2WYZWxUyOvNkrv8ATREkuS5JX5kSvJIJZPO9Fn9TlosF2JJ9oW2nbiEslQM8w06q5mMQlkAmGhcfOFWCQuIwKwNNogYZkSCx5RwKUDebf1EfeLyRRP0XGur8e8Ge+s0jK910DW17IBV5MQDmVf2iB007ZU8CmqbNGsU9ATR4GWddEhYpV1UXxm9/my/jp0vaZzO2tbLQdrrImqHSp20zK5dA2K6eItU5WaW+pVDydiJvyBgtMpDhhOY/DHwG9/3KX4t3a9Y0zhSjsPd8znI+1qkuEPU/KiH7OsaoPYbeHtN16wg+aC/2VtUbAflVwzkHu2y96c/xThjzyCRSpNTCpjAQ5QFmurTrmLjyX8/uIwqsW5CknrFQ9k/pk9pS2xZK92mtSU5VmSPP9zLO7uJK6TSCKHV32PLpkC3syn7c4a480qLEEd/bj6qI5D5I33lnbLPe+S9tvN33C6nAlrsexPmsbR4kMft92GTZzKc5yzMxZf1SMyU7RszYOYpLCOwH4ruf++baat0NZbcY8ICZwTY+YNh12zzXHQECDB1NGWZGgltt4X2EACXFaLJrQfjYHYIuk2LDJPa5+ny7U+IC0ex86Wtt3D7Ygsuw1UWgja1x1i4MnML4568g+V69qU2JCLTBtXxfYo2GLdZ8LStfVX4JJJ1qaldXKLIV6CwEkUUgCVTSTVFACqiioIDAsssAcAgAGEBBFCAxwjCOMYk2qdkb1m0Mnutn8TKszYyCw1izbdiXk/ULytxGGbgOK0k0svLH34SAW0f3/wDqh6vhcG+j+mHBkSRUpcZBu+Uw8OIwmArxIteodQ1aaLyttDCGNeTNUsdRpGOFRichG7CHxft07dOJe1XiXWeF+F9ZDrWma0HMs5lkbFzsVywMUbXatqtYiCW62a6KEZbGxKMY4DGtXVyyFPX1tan7j0dHTKQQQVYIq1aKOCvBGkMEEKLHFFFGoVI40UBURFAVVUAAAADqk7LZbJ57J5DNZrIXMtl8tcsZDJ5PI2Jbd7IXrcrT2rly1OzzWLFiZ3lmmldnd2LMST0dHR0devWP6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6//Z">
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
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" />
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|1|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="NormReference" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 3 bold" X="30" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
    </NormRef>
    <Variables />
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
      <VC ID="GMP011_000086">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019567">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
      <VC ID="GMP011_019572">
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
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_019672">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000111">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000112">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000113">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000114">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000115">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000116">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000117">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000118">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000119">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000120">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000121">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000122">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000123">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000124">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000125">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000126">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000165">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000166">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000174">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000175">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000176">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000177">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000178">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000179">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000180">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000181">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000182">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000183">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000185">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000186">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP014_000187">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007370">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
      </VC>
      <VC ID="INI400_007371">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_007372">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
      </VC>
      <VC ID="INI400_007373">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_007378">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_007379">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_007380">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_007489">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS014_000025">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000063">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000067">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000069">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000072">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000075">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000078">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000079">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000080">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000081">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000082">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000083">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000084">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000085">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000086">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000087">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000088">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000089">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000090">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000092">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000093">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000094">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000095">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000096">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000098">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000102">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000103">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000105">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000106">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000107">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000108">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000109">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000110">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000111">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000112">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="KRS014_000113">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000116">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000119">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000122">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000123">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000124">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000125">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000126">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000127">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000128">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000129">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000130">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000131">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000132">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000133">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000134">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000135">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000136">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000138">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000139">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000140">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000141">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000142">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000143">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000144">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000145">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000146">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000147">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000148">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000149">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000150">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000151">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000152">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000153">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000155">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000157">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000160">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000168">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000170">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000187">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000188">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000189">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000190">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000191">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000192">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000193">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000194">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000195">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000196">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000197">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000198">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 bold" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000199">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000200">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000201">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000202">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000203">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000205">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000207">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000208">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000224">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000225">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000226">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000227">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000228">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000229">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000230">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000232">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000234">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000236">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000238">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000240">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000241">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000242">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000243">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000244">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000246">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000247">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000248">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000249">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000250">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000251">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000252">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000253">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000255">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000257">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000258">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000259">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_000678">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001238">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001339">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001340">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001342">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001343">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001345">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001346">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001555">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001631">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001661">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001875">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001876">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001877">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001879">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001885">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_001886">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002666">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002668">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002669">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002670">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002672">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002673">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002675">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002676">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002677">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002678">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002681">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002682">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002684">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002686">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002688">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002689">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002691">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002693">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002694">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002697">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002699">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002704">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002706">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002707">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002708">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002710">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002711">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002712">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002715">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002716">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002718">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002720">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002722">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002724">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002726">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002728">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002732">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002733">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002734">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002735">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002736">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002737">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002738">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002739">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002740">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002741">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002742">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002744">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002745">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002746">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002747">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002748">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002749">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002750">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002751">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002752">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002753">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002754">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002755">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002756">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002757">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002760">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002761">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002762">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002763">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002764">
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002765">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002769">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002771">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002773">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002774">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002775">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002776">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002778">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002780">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002782">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002783">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002784">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_002785">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_003039">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS014_003040">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_003041">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_003042">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_003043">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS014_003045">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS014_003046">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS014_003047">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019243">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_019244">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
    <Item TranslateID="BLOCK_GMP014_000111">
      <ENU>"Function for Opening Forces"</ENU>
    </Item>
    <Item ID="BLOCK_KRS014_000025">
      <ENU>"Function for loading values from Member data"</ENU>
    </Item>
    <Item ID="BLOCK_KRS014_000063">
      <ENU>"Function for get section position"</ENU>
    </Item>
    <Item ID="BLOCK_KRS014_000072">
      <ENU>"Function for calculation header"</ENU>
    </Item>
    <Item ID="BLOCK_KRS014_000119">
      <ENU>"Function for shear resistance of steel section"</ENU>
    </Item>
    <Item ID="BLOCK_KRS014_000157">
      <ENU>"Function for steel web clasification"</ENU>
    </Item>
    <Item ID="BLOCK_KRS014_000160">
      <ENU>"Function for LTB case"</ENU>
    </Item>
    <Item ID="BLOCK_KRS014_000170">
      <ENU>"Function for steel web clasification"</ENU>
    </Item>
    <Item TranslateID="BLOCK_KRS014_001339">
      <ENU>"Function for camber calculation"</ENU>
    </Item>
    <Item TranslateID="BLOCK_KRS014_001879">
      <ENU>"Function for adding EWN in rectangle"</ENU>
    </Item>
    <Item TranslateID="STRING_1FF001D9">
      <ENU>"Section"</ENU>
    </Item>
    <Item TranslateID="STRING_51375096">
      <ENU>"Composite beam design for member"</ENU>
    </Item>
    <Item TranslateID="STRING_7B79C4E2">
      <ENU>"in accordance with"</ENU>
    </Item>
    <Item TranslateID="STRING_F882AB05">
      <ENU>"Composite beam check for member"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007370">
      <ENU>"h↓a←/b &lt;= 2 " &amp; " -&gt; Buckling curve 'a'"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007372">
      <ENU>"h↓a←/b &gt; 2 " &amp; " -&gt; Buckling curve 'b'"</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000069">
      <ENU>comp_calc &amp; " " &amp; Beam_Name &amp; ", " &amp; in_accord &amp; " " &amp; Code_Name &amp; "."</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000109">
      <ENU>"A↓v← " &amp; " ≥ " &amp; "A↓v,min←"</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000110">
      <ENU>Val(10↑6←*A↓v←, 3) &amp; " mm↑2← " &amp; " ≥ " &amp; Val(10↑6←*A↓v,min←, 3) &amp; " mm↑2← "</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000111">
      <ENU>Val(10↑6←*A↓v←, 4) &amp; " mm↑2← " &amp; " &lt; " &amp; Val(10↑6←*A↓v,min←, 4) &amp; " mm↑2← "</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000122">
      <ENU>'c↓w←/t↓w←' &amp; " ≤ " &amp; '396*ε/(13*α↓cl←-1)'</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000123">
      <ENU>c↓w←/t↓w← &amp; " ≤ " &amp; 396*ε/(13*α↓cl←-1)</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000124">
      <ENU>Val(c↓w←/t↓w←, 2) &amp; " ≤ " &amp; Val(396*ε/(13*α↓cl←-1), 2)</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000125">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000126">
      <ENU>"Web classified as Class 1."</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000128">
      <ENU>'396*ε/(13*α↓cl←-1)' &amp; " &lt; " &amp; 'c↓w←/t↓w←' &amp; " ≤ " &amp; '456*ε/(13*α↓cl←-1)'</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000129">
      <ENU>396*ε/(13*α↓cl←-1) &amp; " &lt; " &amp; c↓w←/t↓w← &amp; " ≤ " &amp; 456*ε/(13*α↓cl←-1)</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000130">
      <ENU>Val(396*ε/(13*α↓cl←-1), 2) &amp; " &lt; " &amp; Val(c↓w←/t↓w←, 2) &amp; " ≤ " &amp; Val(456*ε/(13*α↓cl←-1), 2)</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000131">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000132">
      <ENU>"Web classified as Class 2."</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000134">
      <ENU>'c↓w←/t↓w←' &amp; " &gt; " &amp; '456*ε/(13*α↓cl←-1)'</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000135">
      <ENU>c↓w←/t↓w← &amp; " &gt; " &amp; 456*ε/(13*α↓cl←-1)</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000136">
      <ENU>Val(c↓w←/t↓w←, 2) &amp; " &gt; " &amp; Val(456*ε/(13*α↓cl←-1), 2)</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000139">
      <ENU>'c↓w←/t↓w←' &amp; " ≤ " &amp; '36*ε/α↓cl←'</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000140">
      <ENU>c↓w←/t↓w← &amp; " ≤ " &amp; 36*ε/α↓cl←</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000141">
      <ENU>Val(c↓w←/t↓w←, 2) &amp; " ≤ " &amp; Val(36*ε/α↓cl←, 2)</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000142">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000143">
      <ENU>"Web classified as Class 1."</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000145">
      <ENU>'36*ε/α↓cl←' &amp; " &lt; " &amp; 'c↓w←/t↓w←' &amp; " ≤ " &amp; '41.5*ε/α↓cl←'</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000146">
      <ENU>36*ε/α↓cl← &amp; " &lt; " &amp; c↓w←/t↓w← &amp; " ≤ " &amp; 41.5*ε/α↓cl←</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000147">
      <ENU>Val(36*ε/α↓cl←, 2) &amp; " &lt; " &amp; Val(c↓w←/t↓w←, 2) &amp; " ≤ " &amp; Val(41.5*ε/α↓cl←, 2)</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000148">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000149">
      <ENU>"Web classified as Class 2."</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000151">
      <ENU>'c↓w←/t↓w←' &amp; " &gt; " &amp; '41.5*ε/α↓cl←'</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000152">
      <ENU>c↓w←/t↓w← &amp; " &gt; " &amp; 41.5*ε/α↓cl←</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000153">
      <ENU>Val(c↓w←/t↓w←, 2) &amp; " &gt; " &amp; Val(41.5*ε/α↓cl←, 2)</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000189">
      <ENU>'c↓f←/t↓f←' &amp; " ≤ " &amp; '9*ε'</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000190">
      <ENU>c↓f←/t↓f← &amp; " ≤ " &amp; 9*ε</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000191">
      <ENU>Val(c↓f←/t↓f←, 2) &amp; " ≤ " &amp; Val(9*ε, 2)</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000192">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000193">
      <ENU>"Flange classified as Class 1."</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000195">
      <ENU>'9*ε' &amp; " &lt; " &amp; 'c↓f←/t↓f←' &amp; " ≤ " &amp; '10*ε'</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000196">
      <ENU>9*ε &amp; " &lt; " &amp; c↓f←/t↓f← &amp; " ≤ " &amp; 10*ε</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000197">
      <ENU>Val(9*ε, 2) &amp; " &lt; " &amp; Val(c↓f←/t↓f←, 2) &amp; " ≤ " &amp; Val(10*ε, 2)</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000198">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_000199">
      <ENU>"Flange classified as Class 2."</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000201">
      <ENU>'10*ε' &amp; " &lt; " &amp; 'c↓f←/t↓f←'</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000202">
      <ENU>10*ε &amp; " &lt; " &amp; c↓f←/t↓f←</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000203">
      <ENU>Val(10*ε, 2) &amp; " &lt; " &amp; Val(c↓f←/t↓f←, 2)</ENU>
    </Item>
    <Item ID="TEXT_KRS014_000257">
      <ENU>section &amp; " d↓x← = " &amp; dx &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_002672">
      <ENU>"Contribution of the web"</ENU>
    </Item>
    <Item ID="TEXT_KRS014_002676">
      <ENU>"&lt; " &amp; '0.83/η↓sb←' &amp; " = " &amp; 0.83/η↓sb← &amp; " = " &amp; Val(0.83/η↓sb←, -3)</ENU>
    </Item>
    <Item ID="TEXT_KRS014_002677">
      <ENU>"≥ " &amp; '0.83/η↓sb←' &amp; " = " &amp; 0.83/η↓sb← &amp; " = " &amp; Val(0.83/η↓sb←, -3)</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_002684">
      <ENU>"Contribution of the flanges"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_002712">
      <ENU>"Resistance"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_003045">
      <ENU>"Unsuitable Web Class."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_003046">
      <ENU>"Unsuitable Web Class."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS014_003047">
      <ENU>"Unsuitable Flange Class."</ENU>
    </Item>
  </Texts>
</Root>