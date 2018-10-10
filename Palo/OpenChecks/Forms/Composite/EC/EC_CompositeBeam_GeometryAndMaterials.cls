<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="170001" GUID="74b2ca89-722d-4ec8-a468-82254efa0c34">
  <CodeEditor>
    <SourceCode Collapsed="14|23|30|38|47|54|65|117|197|258|307|338|379|593|611|626|675|698|727|779|784|824|852|857|896|924" BreakPoints="">//composites geometry and material form

class PrintGeometryAndMaterials { 
    
    //--------------------------variables------------------------------------
    //ExternalCLC
    →KRS00014_000977object Functions_properties; 
    →KRS00014_001111object Functions_general; 
    →KRS00014_000816object FontsAndColors; 
    
    //Additional data for drawings
    →KRS00014_001108double CN; 
    
    //-----------------------------------Constructor-------------------------
    public void PrintGeometryAndMaterials(object _DataExchange) { 
        DataExchange →KRS00014_000028= _DataExchange; 
        →KRS00014_001113LoadExternCLCs(); 
        object fontsColors →UNK00000_019243= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\FontsAndColors.CLC"); 
        FontsAndColors →UNK00000_019244= fontsColors.GetFontsAndColors(); 
        CN →KRS00014_001175= _DataExchange.Get("CN"); 
    } 
    
    //---------------------------Public functions----------------------------
    public void PrintGeoAndMat(out double CN) { 
        double CN →KRS00014_001306= DataExchange.CN; 
        →KRS00014_001296CN++; →KRS00014_001361PrintGeometryData(CN); 
        →KRS00014_001298CN++; →KRS00014_001300PrintCSSProperties(CN); 
    } 
    
    //---------------------------Private functions-----------------------------  
    private void LoadExternCLCs() { 
        →KRS00014_000030BLOCK { //Load extern CLC
            Functions_general →KRS00014_001112= LoadExternCLC(Tools.Dir_Forms &amp; "Composite\EC\EC_Functions\Functions_general.CLC"); 
        } 
    } 
    
    
    //Geometry data
    private void PrintGeometryData(double CN) { 
        string sGeomData →KRS00014_001235= TR("Geometry data"); 
        →KRS00014_000608TEXT(CN &amp; ". " &amp; sGeomData); 
        →KRS00100_000003PAGEBREAK(); 
        
        →KRS00014_001359PrintSectionDrawings(); 
        →KRS00014_001360PrintGeometry(); 
    } 
    
    private void PrintCSSProperties(double CN) { 
        string sCSSMat →KRS00014_001236= TR("Cross-section &amp; materials"); 
        →KRS00014_000850TEXT(CN &amp; ". " &amp; sCSSMat); 
        →KRS00014_001356PrintSteelSection(CN); 
        →KRS00014_001364PrintConcrete(CN); 
    } 
    
    private void SetTable(object T) { 
        T.BorderPen →INI00400_018670= FontsAndColors.TableBorderPen(); 
        T[0].BorderPen →INI00400_018671= FontsAndColors.TableBorderPen(); 
        T.GridPen →INI00400_018672= FontsAndColors.TableGridPen(); 
        T.Rows[0].Font →INI00400_018673= FontsAndColors.TableHeaderFont(); 
        T.Font →INI00400_018674= FontsAndColors.TableCellsFont(); 
        T.Padding.All →INI00400_018675= 5; 
        T.Padding.Top →INI00400_018676= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
        T.Padding.Bottom →INI00400_018677= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
    } 
    
    private void PrintSectionDrawings() { 
        //Images representing geometry
        →KRS00014_000611BLOCK { 
            →KRS00014_000648BLOCK { //Drawing of composite CSS
                object Extern_Draw →KRS00014_000646= LoadExternCLC(Tools.Dir_Forms &amp; "CompositeBeam_EN\CompositeGraphics.clc"); //Reconsider moving graphics to new folder structure
                object ED_Input →KRS00014_000612= new Structure(
                "Draw", 3, 
                "ScaleG", DataExchange.SizeDrawings, 
                "UserDimFont", DataExchange.UserDimFont, 
                "Sheeting", DataExchange.sheeting, 
                "htot", DataExchange.h_s, 
                "b", DataExchange.b, 
                "tf", DataExchange.t_f, 
                "tw", DataExchange.t_w, 
                "r1", DataExchange.r, 
                "h", DataExchange.h_a, 
                "RibDir", DataExchange.rib_dir, 
                "b0rib", DataExchange.b0_rib, 
                "bb", DataExchange.b_b, 
                "br", DataExchange.b_r, 
                "bs", DataExchange.b_s, 
                "hp", DataExchange.h_p, 
                "nr", DataExchange.n_r, 
                "ds", DataExchange.d_s, 
                "hsc", DataExchange.h_sc, 
                "b0stud", DataExchange.b0_stud); 
                object ED_Output →KRS00014_000613= new Structure(); 
            } 
            →KRS00014_000649Extern_Draw.Draw(ED_Input, ED_Output, 0); 
            
            →KRS00014_000650BLOCK { 
                object ED_Input →KRS00006_000858= new Structure(
                "Draw", 2, 
                "ScaleG", DataExchange.SizeDrawings, 
                "UserDimFont", DataExchange.UserDimFont, 
                "Sheeting", DataExchange.sheeting, 
                "htot", DataExchange.h_s, 
                "b0rib", DataExchange.b0_rib, 
                "bb", DataExchange.b_b, 
                "br", DataExchange.b_r, 
                "bs", DataExchange.b_s, 
                "hp", DataExchange.h_p, 
                "ReinfCover", DataExchange.c_l, 
                "ReinfDist", DataExchange.s_t, 
                "dl", DataExchange.d_l); 
                object ED_Output →KRS00006_000857= new Structure(); 
            } 
            →KRS00014_000657Extern_Draw.Draw(ED_Input, ED_Output, 0); 
        } 
        →KRS00014_001239PAGEBREAK(); 
    } 
    
    private void PrintGeometry() { 
        //Geometry printout
        →KRS00014_000661BLOCK { 
            IF(DataExchange.Span == 0) { 
                →KRS00014_001568TEXT("Simply supported beam"); 
            } ELSE { 
                IF(DataExchange.Span == 9) { 
                    →KRS00014_001569TEXT("Cantilever"); 
                } ELSE { 
                    →KRS00014_001570TEXT("Continuous beam"); 
                } 
            } 
            →KRS00014_001572BLOCK { 
                object T →KRS00014_001571= new Table(3); 
                
                T[0][0].Value →INI00400_018629= TR("Symbol"); 
                T[0][1].Value →INI00400_018630= TR("Value"); 
                T[0][2].Value →INI00400_018631= TR("Description"); 
                
                //symbols in first column
                double rowID →KRS00014_001581= 1; 
                T[rowID][0].Value →KRS00014_001582= "L"; →KRS00014_001583rowID++; 
                IF(DataExchange.Span_previous != 0) { 
                    T[rowID][0].Value →KRS00014_001584= "L↓previous←"; →KRS00014_001585rowID++; 
                } 
                IF(DataExchange.Span_next != 0) { 
                    T[rowID][0].Value →KRS00014_001586= "L↓next←"; →KRS00014_001587rowID++; 
                } 
                T[rowID][0].Value →KRS00014_001588= "L↓left←"; →KRS00014_001589rowID++; 
                T[rowID][0].Value →KRS00014_001590= "L↓right←"; →KRS00014_001591rowID++; 
                
                //values in second column
                double rowID →KRS00014_001592= 1; 
                T[rowID][1].Value →KRS00014_001593= Val(DataExchange.L, 3) &amp; " m"; →KRS00014_001594rowID++; 
                IF(DataExchange.Span_previous != 0) { 
                    T[rowID][1].Value →KRS00014_001595= Val(DataExchange.L_previous, 3) &amp; " m"; →KRS00014_001596rowID++; 
                } 
                IF(DataExchange.Span_next != 0) { 
                    T[rowID][1].Value →KRS00014_001597= Val(DataExchange.L_next, 3) &amp; " m"; →KRS00014_001598rowID++; 
                } 
                T[rowID][1].Value →KRS00014_001599= Val(DataExchange.L_left, 2) &amp; " m"; →KRS00014_001600rowID++; 
                T[rowID][1].Value →KRS00014_001601= Val(DataExchange.L_right, 2) &amp; " m"; →KRS00014_001602rowID++; 
                
                //Description in third column
                double rowID →KRS00014_001603= 1; 
                T[rowID][2].Value →KRS00014_001604= TR("Length of the current span"); →KRS00014_001605rowID++; 
                IF(DataExchange.Span_previous != 0) { 
                    T[rowID][2].Value →KRS00014_001606= TR("Length of previous span"); →KRS00014_001607rowID++; 
                } 
                IF(DataExchange.Span_next != 0) { 
                    T[rowID][2].Value →KRS00014_001608= TR("Length of next span"); →KRS00014_001609rowID++; 
                } 
                T[rowID][2].Value →KRS00014_001610= DataExchange.Entity_left == 2 ? TR("Distance to the slab edge at the left") : TR("Beam spacing at the left"); →KRS00014_001611rowID++; 
                T[rowID][2].Value →KRS00014_001612= DataExchange.Entity_right == 2 ? TR("Distance to the slab edge at the right") : TR("Beam spacing at the right"); →KRS00014_001613rowID++; 
                
                →KRS00014_001580SetTable(T); 
            } 
            →KRS00014_001573T.Draw(); 
            
        } 
        
        //Check on rib direction
        IF(DataExchange.rib_dir == 999) { 
            →KRS00100_000002Functions_general.AddEWN(DataExchange, "W/04"); //The angle between the member and ribs of profiled steel sheeting is bigger than 10 degrees.
        } 
        
        IF(COMPARE(DataExchange.L, DataExchange.L_y, 6) != 0) { 
            //For a continuous beam, intermediate buckling supports y-y are ignored in both the calculation of the effective width for the analysis model and the check.
            →KRS00014_001555Functions_general.AddEWN(DataExchange, "W/25"); 
        } 
        
        IF(DataExchange.TypeOfConnection == 1) { 
            //For advanced composite action
            →KRS00100_000001Functions_general.AddEWN(DataExchange, "W/43"); 
        } 
        →KRS00014_000815PAGEBREAK(); 
    } 
    
    
    //CSS and materials
    private void PrintSteelSection(double CN) { 
        →KRS00014_001652BLOCK { 
            string sText →KRS00014_001371= TR("Steel section properties"); 
            →KRS00014_000852TEXT(CN &amp; ".1 " &amp; sText); 
            →KRS01026_000002BLOCK { 
                →KRS00014_001357PrintSteelSectProperties(); 
                →KRS00014_001358PrintSteelMaterial(); 
            } 
            →KRS01026_000001PAGEBREAK(); 
            IF(DataExchange.bWO) { →KRS01026_000135PrintOpening(); } 
            
            
        } 
        IF(COMPARE(DataExchange.f_yb, 460*10↑6←, 6) &gt; 0) { 
            //Steel material of the beam does not conform to EN 1994-1-1 Art. 3.3 (2).
            →KRS00014_001556Functions_general.AddEWN(DataExchange, "W3/06"); 
        } 
        IF(DataExchange.Openings.Count == 0 &amp;&amp; (DataExchange.bOpeningCSS || DataExchange.bOpeningOverlap || DataExchange.bOpeningWrongGeometry || DataExchange.bOpeningVerticalOut || DataExchange.bOpeningHorizontalOut)) { 
            →KRS00400_000032TEXT("Openings for design"); 
        } 
        IF(DataExchange.bOpeningCSS) { 
            //Openings with Cross-section shape are not supported for the design.
            →KRS00400_000030Functions_general.AddEWN(DataExchange, "W/48"); 
        } 
        IF(DataExchange.bOpeningOverlap) { 
            //Openings with Cross-section shape are not supported for the design.
            →KRS00400_000031Functions_general.AddEWN(DataExchange, "W/49"); 
        } 
        IF(DataExchange.bOpeningWrongGeometry) { 
            //Alpha, Beta and Orientation different than 0 is not allowed for openings
            →KRS00400_000034Functions_general.AddEWN(DataExchange, "W/50"); 
        } 
        IF(DataExchange.bOpeningVerticalOut) { 
            //Openings in collision with steel section geometry are not considered for the design.
            →KRS00400_000035Functions_general.AddEWN(DataExchange, "E/27"); 
        } 
        IF(DataExchange.bOpeningHorizontalOut) { 
            //Openings breaching steel section span are not considered for the design.
            →KRS00400_000036Functions_general.AddEWN(DataExchange, "W/52"); 
        } 
        →KRS00014_001653PAGEBREAK(); 
        
        IF(DataExchange.bWebPost || DataExchange.bWebPostIsolated) { 
            →KRS18100_000004PrintWebPosts(); 
            IF(DataExchange.bWebPostIsolated) { 
                //Web posts wider than 5*l↓o← are not considered for the design.
                →KRS18100_000029Functions_general.AddEWN(DataExchange, "N/31"); 
            } 
            →KRS18100_000030PAGEBREAK(); 
        } 
        
        IF(DataExchange.bWO) { 
            →KRS01026_000136PrintOpeningGeomLimit(); 
            IF(!DataExchange.bPracticalGeomLimitsOK) { 
                //Practical geometric limits for beams with web openings are not met for one or more opening (SCI P355 Table 2.1)
                →GMP01026_000152Functions_general.AddEWN(DataExchange, "W/53"); 
            } 
            →KRS01026_000003PAGEBREAK(); 
        } 
    } 
    
    private void PrintSteelSectProperties() { 
        string sText →KRS00014_001982= DataExchange.Beam_CS_Name; 
        →KRS00014_001631TEXT("Section:"); 
        →KRS00014_001632TEXT(sText); 
        →KRS00014_001614BLOCK { 
            object T →KRS00014_001615= new Table(3); 
            
            T[0][0].Value →KRS00014_001616= TR("Symbol"); 
            T[0][1].Value →KRS00014_001617= TR("Value"); 
            T[0][2].Value →KRS00014_001618= TR("Description"); 
            
            //symbols in first column
            T[1][0].Value →KRS00014_001622= "h↓a←"; 
            T[2][0].Value →KRS00014_001623= "b"; 
            T[3][0].Value →KRS00014_001624= "t↓w←"; 
            T[4][0].Value →KRS00014_001625= "t↓f←"; 
            T[5][0].Value →KRS00014_001626= DataExchange.bfabrication ? "r" : "a"; 
            T[6][0].Value →KRS00014_001627= "A↓a←"; 
            T[7][0].Value →KRS00014_001628= "I↓y←"; 
            T[8][0].Value →KRS00014_001629= "i↓z←"; 
            T[9][0].Value →KRS00014_001630= "W↓pl,y←"; 
            
            //values in second column
            T[1][1].Value →KRS00014_001633= Val(DataExchange.h_a*1000, 3) &amp; " mm"; 
            T[2][1].Value →KRS00014_001634= Val(DataExchange.b*1000, 3) &amp; " mm"; 
            T[3][1].Value →KRS00014_001635= Val(DataExchange.t_w*1000, 3) &amp; " mm"; 
            T[4][1].Value →KRS00014_001636= Val(DataExchange.t_f*1000, 3) &amp; " mm"; 
            T[5][1].Value →KRS00014_001637= DataExchange.bfabrication ? Val(DataExchange.r*1000, 3) &amp; " mm" : Val(DataExchange.a*1000, 3) &amp; " mm"; 
            T[6][1].Value →KRS00014_001638= Val(DataExchange.A_a*10↑6←, 3) &amp; " mm↑2←"; 
            T[7][1].Value →KRS00014_001639= Val(DataExchange.I_y*10↑12←, 3) &amp; " mm↑4←"; 
            T[8][1].Value →KRS00014_001640= Val(DataExchange.i_z*1000, 3) &amp; " mm"; 
            T[9][1].Value →KRS00014_001641= Val(DataExchange.Wpl_y*10↑9←, 3) &amp; " mm↑3←"; 
            
            //Description in third column
            T[1][2].Value →KRS00014_001643= TR("Height"); 
            T[2][2].Value →KRS00014_001644= TR("Width"); 
            T[3][2].Value →KRS00014_001645= TR("Web thickness"); 
            T[4][2].Value →KRS00014_001646= TR("Flange thickness"); 
            T[5][2].Value →KRS00014_001647= DataExchange.bfabrication ? TR("Radius") : TR("Weld"); 
            T[6][2].Value →KRS00014_001648= TR("Area"); 
            T[7][2].Value →KRS00014_001649= TR("Moment of inertia"); 
            T[8][2].Value →KRS00014_001650= TR("Radius of gyration"); 
            T[9][2].Value →KRS00014_001651= TR("Plastic section modulus"); 
            
            →KRS00014_001619SetTable(T); 
        } 
        →KRS00014_001620T.Draw(); 
    } 
    
    private void PrintSteelMaterial() { 
        string sText →KRS00014_001983= DataExchange.Beam_Material_Name; 
        →KRS00014_001654TEXT("Section material:"); 
        →KRS00014_001655TEXT(sText); 
        →KRS00014_001656BLOCK { 
            object T →KRS00014_001657= new Table(3); 
            
            T[0][0].Value →KRS00014_001658= TR("Symbol"); 
            T[0][1].Value →KRS00014_001659= TR("Value"); 
            T[0][2].Value →KRS00014_001660= TR("Description"); 
            
            //symbols in first column
            T[1][0].Value →KRS00014_001663= "f↓yb←"; 
            T[2][0].Value →KRS00014_001664= "f↓ub←"; 
            T[3][0].Value →KRS00014_001665= "E↓b←"; 
            
            //values in second column
            T[1][1].Value →KRS00014_001666= Val(DataExchange.f_yb*10↑-6←, 2) &amp; " MPa"; 
            T[2][1].Value →KRS00014_001667= Val(DataExchange.f_ub*10↑-6←, 3) &amp; " MPa"; 
            T[3][1].Value →KRS00014_001668= Val(DataExchange.E_b*10↑-9←, 3) &amp; " GPa"; 
            
            //Description in third column
            T[1][2].Value →KRS00014_001669= TR("Yield strength"); 
            T[2][2].Value →KRS00014_001670= TR("Ultimate strength"); 
            T[3][2].Value →KRS00014_001671= TR("E modulus"); 
            
            →KRS00014_001661SetTable(T); 
        } 
        →KRS00014_001662T.Draw(); 
    } 
    
    private void PrintOpening() { 
        →KRS00014_002008TEXT("Openings for design"); 
        →KRS00014_001990BLOCK { 
            object T →KRS00014_001991= new Table(7); 
            
            T[0][0].Value →KRS00400_000002= TR("Name"); 
            T[0][1].Value →KRS00400_000003= TR("Shape"); 
            T[0][2].Value →KRS00014_001992= TR("Height") &amp; " - h↓o←"; 
            T[0][3].Value →KRS00014_001993= TR("Length") &amp; " - l↓o←"; 
            T[0][4].Value →KRS00014_001994= TR("Eccentricity") &amp; " - e↓o←"; 
            T[0][5].Value →KRS00400_000004= TR("Distance") &amp; " - d↓x←"; 
            T[0][6].Value →KRS01026_000004= TR("Reinforcement"); 
            
            FOREACH(object Opening in DataExchange.Openings) { 
                →KRS00400_000008double →KRS00400_000007r++; 
                T[r][0].Value →KRS00400_000005= Opening.WOName; 
                SWITCH(Opening.WOShape) { 
                    CASE 0 :  { 
                        T[r][1].Value →KRS00400_000015= TR("Rectangle"); 
                    } 
                    CASE 1 :  { 
                        T[r][1].Value →KRS00400_000020= TR("Circle"); 
                    } 
                    CASE 4 :  { 
                        T[r][1].Value →KRS00400_000029= TR("Elongated"); 
                    } 
                    DEFAULT :  { 
                        T[r][1].Value →KRS00400_000037= TR("Not supported"); 
                    } 
                } 
                T[r][2].Value →KRS00400_000016= Val(Opening.ho*10↑3←, 0) &amp; " mm"; 
                T[r][3].Value →KRS00400_000017= Val(Opening.lo*10↑3←, 3) &amp; " mm"; 
                T[r][4].Value →KRS00400_000018= Val(Opening.eo*10↑3←, 3) &amp; " mm"; 
                T[r][5].Value →KRS00400_000019= Val(Opening.d_x_opening, 3) &amp; " m"; 
                T[r][6].Value →KRS01026_000005= Opening.bHS ? TR("Yes") : TR("No"); 
            } 
            →KRS00014_002004SetTable(T); 
        } 
        →KRS00014_002005T.Draw(); 
    } 
    
    private void PrintOpeningGeomLimit() { 
        →KRS01026_000082bool Condition; 
        →KRS01026_000099double r; 
        →GMP01026_000186TEXT("Practical geometric limits for openings"); 
        
        →GMP01026_000187BLOCK { 
            object T →GMP01026_000188= new Table(6); 
            
            T[0][0].Value →GMP01026_000189= TR("Name"); 
            T[0][1].Value →GMP01026_000190= TR("Max") &amp; " - h↓o←"; 
            T[0][2].Value →GMP01026_000191= TR("Min") &amp; " - h↓b←"; 
            T[0][3].Value →GMP01026_000192= TR("Min") &amp; " - h↓t←"; 
            T[0][4].Value →GMP01026_000193= TR("Ratio") &amp; " - h↓b←/h↓t←"; 
            T[0][5].Value →GMP01026_000194= TR("Max") &amp; " - l↓o←"; 
            
            →GMP01026_000197DataExchange.Set("bPracticalGeomLimitsOK", true); 
            FOREACH(object Opening in DataExchange.Openings) { 
                →GMP01026_000200r++; 
                T[r][0].Value →GMP01026_000201= Opening.WOName; 
                double topTee →GMP01026_000202= (DataExchange.h_a-Opening.ho)/2-Opening.eo; 
                double botTee →GMP01026_000203= (DataExchange.h_a-Opening.ho)/2+Opening.eo; 
                bool highShear →GMP01026_000204= (COMPARE(ABS(Opening.Open_V_Design), 0.5*ABS(DataExchange.ULS_Fin_Forces_V.Vz), 6) == 1); // High shear
                SWITCH(Opening.WOShape) { 
                    CASE 0 :  { // Rectangle
                        // Max Depth of opening
                        Condition →KRS01026_000081= COMPARE(Opening.ho, 0.7*DataExchange.h_a, 6) == 1; 
                        →KRS01026_000080DrawStatus(T, r, 1, Condition); 
                        // Min. depth of bot Tee
                        Condition →KRS01026_000083= COMPARE(botTee, 0.1*DataExchange.h_a, 6) == -1; 
                        →KRS01026_000084DrawStatus(T, r, 2, Condition); 
                        // Min. depth  of Top Tee
                        IF(!Opening.bHS) { // unstiffened
                            Condition →KRS01026_000085= COMPARE(topTee, MAX(0.1*Opening.lo, 0.1*DataExchange.h_a), 6) == -1; 
                            →KRS01026_000086DrawStatus(T, r, 3, Condition); 
                        } ELSE { 
                            Condition →KRS01026_000087= COMPARE(topTee, 0.1*DataExchange.h_a, 6) == -1; 
                            →KRS01026_000088DrawStatus(T, r, 3, Condition); 
                        } 
                        // Max. ratio of depth of Tees
                        Condition →KRS01026_000089= COMPARE((botTee/topTee), 2.0, 6) == 1 || COMPARE((botTee/topTee), 1.0, 6) == -1; 
                        →KRS01026_000090DrawStatus(T, r, 4, Condition); 
                        //Max opening length
                        IF(!Opening.bHS) { // unstiffened
                            IF(highShear) { // High shear
                                Condition →KRS01026_000091= COMPARE(Opening.lo, 1.5*Opening.ho, 6) == 1; 
                                →KRS01026_000092DrawStatus(T, r, 5, Condition); 
                            } ELSE { // Low shear
                                Condition →KRS01026_000093= COMPARE(Opening.lo, 2.5*Opening.ho, 6) == 1; 
                                →KRS01026_000094DrawStatus(T, r, 5, Condition); 
                            } 
                        } ELSE { // stiffened
                            IF(highShear) { // High shear
                                Condition →KRS01026_000095= COMPARE(Opening.lo, 2.5*Opening.ho, 6) == 1; 
                                →KRS01026_000096DrawStatus(T, r, 5, Condition); 
                            } ELSE { // Low shear
                                Condition →KRS01026_000097= COMPARE(Opening.lo, 4*Opening.ho, 6) == 1; 
                                →KRS01026_000098DrawStatus(T, r, 5, Condition); 
                            } 
                        } 
                    } 
                    CASE 1 :  { // Circular
                        // Max depth of opening
                        Condition →KRS01026_000100= COMPARE(Opening.ho, 0.8*DataExchange.h_a, 6) == 1; 
                        →KRS01026_000101DrawStatus(T, r, 1, Condition); 
                        // Min. depth of bot Tee
                        Condition →KRS01026_000102= COMPARE(botTee, DataExchange.t_f+0.030, 6) == -1; 
                        →KRS01026_000103DrawStatus(T, r, 2, Condition); 
                        // Min. depth  of Top Tee
                        Condition →KRS01026_000104= COMPARE(topTee, DataExchange.t_f+0.030, 6) == -1; 
                        →KRS01026_000105DrawStatus(T, r, 3, Condition); 
                        // Ratio of depth of Tees
                        Condition →KRS01026_000106= COMPARE((botTee/topTee), 3.0, 6) == 1 || COMPARE((botTee/topTee), 0.5, 6) == -1; 
                        →KRS01026_000107DrawStatus(T, r, 4, Condition); 
                        //Max opening length
                        T[r][5].Value →GMP01026_000227= TR("-"); 
                        
                    } 
                    CASE 4 :  { // Elongated
                        // Max depth of opening
                        Condition →KRS01026_000108= COMPARE(Opening.ho, 0.8*DataExchange.h_a, 6) == 1; 
                        →KRS01026_000109DrawStatus(T, r, 1, Condition); 
                        // Min. depth of bot Tee
                        Condition →KRS01026_000110= COMPARE(botTee, DataExchange.t_f+0.030, 6) == -1; 
                        →KRS01026_000111DrawStatus(T, r, 2, Condition); 
                        // Min. depth  of Top Tee
                        Condition →KRS01026_000112= COMPARE(topTee, DataExchange.t_f+0.030, 6) == -1; 
                        →KRS01026_000113DrawStatus(T, r, 3, Condition); 
                        // Ratio of depth of Tees
                        Condition →KRS01026_000114= COMPARE((botTee/topTee), 3.0, 6) == 1 || COMPARE((botTee/topTee), 0.5, 6) == -1; 
                        →KRS01026_000115DrawStatus(T, r, 4, Condition); 
                        //Max opening length
                        T[r][5].Value →GMP01026_000614= TR("-"); 
                    } 
                    DEFAULT :  { 
                        T[r][1].Value →GMP01026_000609= TR("-"); 
                        T[r][2].Value →GMP01026_000610= TR("-"); 
                        T[r][3].Value →GMP01026_000611= TR("-"); 
                        T[r][4].Value →GMP01026_000612= TR("-"); 
                        T[r][5].Value →GMP01026_000613= TR("-"); 
                    } 
                } 
            } 
            →GMP01026_000310SetTable(T); 
        } 
        T.Columns[0].Alignment →GMP01026_000505= ContentAlignment.MiddleCenter; 
        T.Columns[1].Alignment →GMP01026_000506= ContentAlignment.MiddleCenter; 
        T.Columns[2].Alignment →GMP01026_000507= ContentAlignment.MiddleCenter; 
        T.Columns[3].Alignment →GMP01026_000508= ContentAlignment.MiddleCenter; 
        T.Columns[4].Alignment →GMP01026_000509= ContentAlignment.MiddleCenter; 
        T.Columns[5].Alignment →GMP01026_000510= ContentAlignment.MiddleCenter; 
        →GMP01026_000311T.Draw(); 
        
        
        →GMP01026_000346TEXT("Practical geometric limits for web posts"); 
        
        →GMP01026_000511BLOCK { 
            object T →GMP01026_000512= new Table(3); 
            →GMP01026_000513double r →GMP01026_000514= 0; 
            T[0][0].Value →GMP01026_000515= TR("Name"); 
            T[0][1].Value →GMP01026_000516= TR("Min") &amp; " - s↓o←"; 
            T[0][2].Value →GMP01026_000517= TR("Min") &amp; " - s↓e←"; 
            double endPositionOfLastOpening →GMP01026_000519= 0.0; 
            FOREACH(object Post in DataExchange.Webposts) { 
                →GMP01026_000521r++; 
                T[r][0].Value →GMP01026_000522= Post.WPName; 
                bool highShear →GMP01026_000617= (COMPARE(ABS(Opening.Open_V_Design), 0.5*ABS(DataExchange.ULS_Fin_Forces_V.Vz), 6) == 1); // High shear bool highShear →GMP01026_000523= (COMPARE(Opening.Open_V_Design, 0.5*DataExchange.ULS_Fin_Forces_V.Vz, 6) == 1); // High shear
                double so →GMP01026_000524= Post.s_o; 
                SWITCH(Post.WPAdjOpenShape) { 
                    CASE 0 :  { // Rectangle             
                        //Web post
                        T[r][1].Value →GMP01026_000527= Val(so, 0) &amp; " m"; 
                        IF(highShear) { // High shear
                            Condition →KRS01026_000116= COMPARE(so, Opening.lo, 6) == -1; 
                            →KRS01026_000117DrawStatus(T, r, 1, Condition); 
                        } ELSE { 
                            Condition →KRS01026_000118= COMPARE(so, 0.5*Opening.lo, 6) == -1; 
                            →KRS01026_000119DrawStatus(T, r, 1, Condition); 
                        } 
                    } 
                    CASE 1 :  { // Circular
                        //Web post
                        IF(highShear) { // High shear
                            Condition →KRS01026_000120= COMPARE(so, 0.4*Opening.ho, 6) == -1; 
                            →KRS01026_000121DrawStatus(T, r, 1, Condition); 
                        } ELSE { 
                            Condition →KRS01026_000122= COMPARE(so, 0.3*Opening.ho, 6) == -1; 
                            →KRS01026_000123DrawStatus(T, r, 1, Condition); 
                        } 
                    } 
                    CASE 4 :  { // Elongated
                        //Web post
                        IF(highShear) { // High shear
                            Condition →KRS01026_000124= COMPARE(so, 0.4*Opening.ho, 6) == -1; 
                            →KRS01026_000125DrawStatus(T, r, 1, Condition); 
                        } ELSE { 
                            Condition →KRS01026_000126= COMPARE(so, 0.3*Opening.ho, 6) == -1; 
                            →KRS01026_000127DrawStatus(T, r, 1, Condition); 
                        } 
                    } 
                    DEFAULT :  { 
                        T[r][1].Value →GMP01026_000605= TR("-"); 
                    } 
                } 
                T[r][2].Value →GMP01026_000606= TR("-"); 
            } 
            →GMP01026_000600double r2 →GMP01026_000601= 0; 
            FOREACH(object Opening in DataExchange.Openings) { 
                →KRS01026_000128r2++; 
                
                IF(r2 == 1 || r2 == DataExchange.Openings.Count) { 
                    →GMP01026_000604r++; 
                    T[r][0].Value →GMP01026_000562= Opening.WOName; 
                } 
                bool highShear →GMP01026_000563= (COMPARE(Opening.Open_V_Design, 0.5*DataExchange.ULS_Fin_Forces_V.Vz, 6) == 1); // High shear
                se →GMP01026_000565= MIN(Opening.se, DataExchange.L-Opening.se-Opening.lo); 
                
                SWITCH(Opening.WOShape) { 
                    CASE 0 :  { // Rectangle             
                        //End Web post
                        IF(r2 == 1 || r2 == DataExchange.Openings.Count) { 
                            Condition →KRS01026_000129= COMPARE(se, MAX(Opening.lo, DataExchange.h_a), 6) == -1; 
                            →KRS01026_000130DrawStatus(T, r, 2, Condition); 
                        } 
                    } 
                    CASE 1 :  { // circular
                        // End Web post
                        IF(r2 == 1 || r2 == DataExchange.Openings.Count) { 
                            Condition →KRS01026_000131= COMPARE(se, 0.5*Opening.ho, 6) == -1; 
                            →KRS01026_000132DrawStatus(T, r, 2, Condition); 
                        } 
                    } 
                    CASE 4 :  { // Elongated
                        // End Web post
                        IF(r2 == 1 || r2 == DataExchange.Openings.Count) { 
                            Condition →KRS01026_000133= COMPARE(se, 0.5*Opening.ho, 6) == -1; 
                            →KRS01026_000134DrawStatus(T, r, 2, Condition); 
                        } 
                    } 
                    DEFAULT :  { 
                        T[r][2].Value →GMP01026_000608= TR("-"); 
                    } 
                } 
                T[r][1].Value →GMP01026_000607= TR("-"); 
            } 
            
            →GMP01026_000559SetTable(T); 
        } 
        T.Columns[0].Alignment →GMP01026_000502= ContentAlignment.MiddleCenter; 
        T.Columns[1].Alignment →GMP01026_000503= ContentAlignment.MiddleCenter; 
        T.Columns[2].Alignment →GMP01026_000504= ContentAlignment.MiddleCenter; 
        →GMP01026_000465T.Draw(); 
        
    } 
    
    private void PrintWebPosts() { 
        →KRS18100_000005TEXT("Web posts for design"); 
        →KRS18100_000006BLOCK { 
            object T →KRS18100_000007= new Table(2); 
            
            T[0][0].Value →KRS18100_000008= TR("Name"); 
            T[0][1].Value →KRS18100_000009= TR("Width") &amp; " - s↓o←"; 
            
            FOREACH(object WebPost in DataExchange.Webposts) { 
                →KRS18100_000015double →KRS18100_000016r++; 
                T[r][0].Value →KRS18100_000017= WebPost.WPName; 
                T[r][1].Value →KRS18100_000022= Val(WebPost.s_o*10↑3←, 0) &amp; " mm"; 
            } 
            →KRS18100_000027SetTable(T); 
        } 
        →KRS18100_000028T.Draw(); 
    } 
    
    private void PrintConcrete(double CN) { 
        →KRS00014_001893BLOCK { 
            string sText →KRS00014_001372= TR("Concrete slab with profiled sheeting"); 
            →KRS00014_001362TEXT(CN &amp; ".2 " &amp; sText); 
            →KRS00014_001365PrintConcreteSlab(); 
            →KRS00014_001894BLOCK { 
                →KRS00014_001403PrintProfiledSheeting(); 
                →KRS00014_001460PrintShearConnectors(); 
            } 
            →KRS00014_001980PAGEBREAK(); 
            →KRS00014_001516PrintReinforcement(); 
        } 
        →KRS00014_001981PAGEBREAK(); 
    } 
    
    private void PrintConcreteSlab() { 
        →KRS00014_001692BLOCK { 
            SWITCH(DataExchange.rib_dir) { //bitmap picture of the sheeting
                CASE 0 :  { //parallel
                    SWITCH(DataExchange.sheeting_shape) { 
                        CASE 0 :  { 
                            →KRS00014_001712IMG("sheeting_parallel_re-entrant_trough"); 
                        } 
                        CASE 1 :  { 
                            →KRS00014_001713IMG("sheeting_parallel_open_trough"); 
                        } 
                        DEFAULT :  { 
                            →KRS00014_001714TEXT("Incorrect type of sheeting shape"); 
                        } 
                    } 
                } 
                CASE 1 :  { //transverse
                    SWITCH(DataExchange.sheeting_shape) { 
                        CASE 0 :  { 
                            →KRS00014_001716IMG("sheeting_transverse_re-entrant_trough"); 
                        } 
                        CASE 1 :  { 
                            →KRS00014_001717IMG("sheeting_transverse_open_trough"); 
                        } 
                        DEFAULT :  { 
                            →KRS00014_001718TEXT("Incorrect type of sheeting shape"); 
                        } 
                    } 
                } 
                DEFAULT :  { //IGEA-B27LH7 - diagonal beams are handled as Transverse
                    SWITCH(DataExchange.sheeting_shape) { 
                        CASE 0 :  { 
                            →KRS18100_000001IMG("sheeting_transverse_re-entrant_trough"); 
                        } 
                        CASE 1 :  { 
                            →KRS18100_000002IMG("sheeting_transverse_open_trough"); 
                        } 
                        DEFAULT :  { 
                            →KRS18100_000003TEXT("Incorrect type of sheeting shape"); 
                        } 
                    } 
                } 
            } 
            →KRS00014_001672PrintConcreteSlabGeometry(); 
            →KRS00014_001673PrintConcreteSlabMaterial(); 
        } 
        →KRS00014_001977PAGEBREAK(); 
    } 
    
    private void PrintConcreteSlabGeometry() { 
        →KRS00014_001674TEXT("Slab"); 
        →KRS00014_001676BLOCK { 
            object T →KRS00014_001677= new Table(3); 
            
            T[0][0].Value →KRS00014_001678= TR("Symbol"); 
            T[0][1].Value →KRS00014_001679= TR("Value"); 
            T[0][2].Value →KRS00014_001680= TR("Description"); 
            
            //symbols in first column
            T[1][0].Value →KRS00014_001681= "h↓s←"; 
            
            //values in second column
            T[1][1].Value →KRS00014_001684= DataExchange.sheeting == 0 ? Val((DataExchange.h_s-DataExchange.h_p)*10↑3←, 2) &amp; " mm" : Val(DataExchange.h_s*10↑3←, 2) &amp; " mm"; 
            
            //Description in third column
            T[1][2].Value →KRS00014_001687= TR("Total height of the slab"); 
            
            →KRS00014_001690SetTable(T); 
        } 
        →KRS00014_001691T.Draw(); 
    } 
    
    private void PrintConcreteSlabMaterial() { 
        string sText →KRS00014_001984= DataExchange.Slab_Material_Name; 
        →KRS00014_001694TEXT("Slab material:"); 
        →KRS00014_001695TEXT(sText); 
        →KRS00014_001696BLOCK { 
            object T →KRS00014_001697= new Table(3); 
            
            T[0][0].Value →KRS00014_001698= TR("Symbol"); 
            T[0][1].Value →KRS00014_001699= TR("Value"); 
            T[0][2].Value →KRS00014_001700= TR("Description"); 
            
            //symbols in first column
            T[1][0].Value →KRS00014_001701= "f↓ck←"; 
            T[2][0].Value →KRS00014_001702= "E↓cm←"; 
            
            
            //values in second column
            T[1][1].Value →KRS00014_001704= Val(DataExchange.f_ck*10↑-6←, 2) &amp; " MPa"; 
            T[2][1].Value →KRS00014_001705= Val(DataExchange.E_cm*10↑-9←, 2) &amp; " GPa"; 
            
            //Description in third column
            T[1][2].Value →KRS00014_001707= TR("Characteristics strength"); 
            T[2][2].Value →KRS00014_001708= TR("E modulus"); 
            
            →KRS00014_001710SetTable(T); 
        } 
        →KRS00014_001711T.Draw(); 
    } 
    
    private void PrintProfiledSheeting() { 
        string sTextA →KRS00014_001985= DataExchange.Sheeting_Name; 
        string sTextB →KRS00014_001986= DataExchange.Sheeting_Material_Name; 
        →KRS00014_001721TEXT("Profiled sheeting:"); 
        →KRS00014_001722TEXT(sTextA); 
        →KRS00014_001793TEXT("Profiled sheeting material:"); 
        →KRS00014_001794TEXT(sTextB); 
        →KRS00014_001723BLOCK { 
            object T →KRS00014_001724= new Table(3); 
            
            T[0][0].Value →KRS00014_001725= TR("Symbol"); 
            T[0][1].Value →KRS00014_001726= TR("Value"); 
            T[0][2].Value →KRS00014_001727= TR("Description"); 
            
            //symbols in first column
            double rowID →KRS00014_001736= 1; 
            T[rowID][0].Value →KRS00014_001739= "h↓p←"; →KRS00014_001740rowID++; 
            T[rowID][0].Value →KRS00014_001741= "h↓c←"; →KRS00014_001742rowID++; 
            T[rowID][0].Value →KRS00014_001743= "h↓d←"; →KRS00014_001744rowID++; 
            T[rowID][0].Value →KRS00014_001745= "b↓s←"; →KRS00014_001746rowID++; 
            T[rowID][0].Value →KRS00014_001747= "b↓r←"; →KRS00014_001748rowID++; 
            T[rowID][0].Value →KRS00014_001749= "b↓b←"; →KRS00014_001750rowID++; 
            T[rowID][0].Value →KRS00014_001751= "b↓0,rib←"; →KRS00014_001752rowID++; 
            T[rowID][0].Value →KRS00014_001753= "t↓p←"; →KRS00014_001754rowID++; 
            
            //values in second column
            double rowID →KRS00014_001755= 1; 
            T[rowID][1].Value →KRS00014_001758= Val(DataExchange.h_p*10↑3←, 2) &amp; " mm"; →KRS00014_001759rowID++; 
            T[rowID][1].Value →KRS00014_001760= Val((DataExchange.h_s-DataExchange.h_p)*10↑3←, 2) &amp; " mm"; →KRS00014_001761rowID++; 
            T[rowID][1].Value →KRS00014_001762= Val(DataExchange.h_d*10↑3←, 2) &amp; " mm"; →KRS00014_001763rowID++; 
            T[rowID][1].Value →KRS00014_001764= Val(DataExchange.b_s*10↑3←, 2) &amp; " mm"; →KRS00014_001765rowID++; 
            T[rowID][1].Value →KRS00014_001766= Val(DataExchange.b_r*10↑3←, 2) &amp; " mm"; →KRS00014_001767rowID++; 
            T[rowID][1].Value →KRS00014_001768= Val(DataExchange.b_b*10↑3←, 2) &amp; " mm"; →KRS00014_001769rowID++; 
            T[rowID][1].Value →KRS00014_001770= Val(DataExchange.b0_rib*10↑3←, 2) &amp; " mm"; →KRS00014_001771rowID++; 
            T[rowID][1].Value →KRS00014_001772= Val(DataExchange.t_p*10↑3←, 2) &amp; " mm"; →KRS00014_001773rowID++; 
            
            //Description in third column
            double rowID →KRS00014_001774= 1; 
            T[rowID][2].Value →KRS00014_001777= TR("Depth of the ribs"); →KRS00014_001778rowID++; 
            T[rowID][2].Value →KRS00014_001779= TR("Height of full concrete"); →KRS00014_001780rowID++; 
            T[rowID][2].Value →KRS00014_001781= TR("Top dovetail height"); →KRS00014_001782rowID++; 
            T[rowID][2].Value →KRS00014_001783= TR("Spacing of the ribs"); →KRS00014_001784rowID++; 
            T[rowID][2].Value →KRS00014_001785= TR("Top width of the rib"); →KRS00014_001786rowID++; 
            T[rowID][2].Value →KRS00014_001787= TR("Bottom width of the rib"); →KRS00014_001788rowID++; 
            T[rowID][2].Value →KRS00014_001789= TR("Mean width of the ribs"); →KRS00014_001790rowID++; 
            T[rowID][2].Value →KRS00014_001791= TR("Thickness of the sheeting"); →KRS00014_001792rowID++; 
            
            →KRS00014_001734SetTable(T); 
        } 
        →KRS00014_001735T.Draw(); 
    } 
    
    private void PrintShearConnectors() { 
        →KRS00014_001813PrintShearConnectorsGeometry(); 
        →KRS00014_001814PrintShearConnectorsMaterial(); 
    } 
    
    private void PrintShearConnectorsGeometry() { 
        string sText →KRS00014_001987= DataExchange.Stud_Name; 
        →KRS00014_001817TEXT("Shear connector:"); 
        →KRS00014_001818TEXT(sText); 
        →KRS00014_001819BLOCK { 
            object T →KRS00014_001820= new Table(3); 
            
            T[0][0].Value →KRS00014_001821= TR("Symbol"); 
            T[0][1].Value →KRS00014_001822= TR("Value"); 
            T[0][2].Value →KRS00014_001823= TR("Description"); 
            
            //symbols in first column
            T[1][0].Value →KRS00014_001877= "d↓s←"; 
            T[2][0].Value →KRS00014_001879= "h↓sc←"; 
            T[3][0].Value →KRS00014_001880= "n↓r←"; 
            IF(DataExchange.n_r &gt; 1) { 
                T[4][0].Value →KRS00014_001881= "b↓0,stud←"; 
            } 
            
            //values in second column
            T[1][1].Value →KRS00014_001882= Val(DataExchange.d_s*10↑3←, 2) &amp; " mm"; 
            T[2][1].Value →KRS00014_001884= Val(DataExchange.h_sc*10↑3←, 2) &amp; " mm"; 
            T[3][1].Value →KRS00014_001885= DataExchange.n_r; 
            IF(DataExchange.n_r &gt; 1) { 
                T[4][1].Value →KRS00014_001886= Val(DataExchange.b0_stud*10↑3←, 2) &amp; " mm"; 
            } 
            
            //Description in third column
            T[1][2].Value →KRS00014_001887= TR("Diameter"); 
            T[2][2].Value →KRS00014_001888= TR("Nominal height"); 
            T[3][2].Value →KRS00014_001890= TR("Amount per trough or section"); 
            IF(DataExchange.n_r &gt; 1) { 
                T[4][2].Value →KRS00014_001891= TR("Transverse spacing"); 
            } 
            
            →KRS00014_001875SetTable(T); 
        } 
        →KRS00014_001876T.Draw(); 
    } 
    
    private void PrintShearConnectorsMaterial() { 
        string sText →KRS00014_001988= DataExchange.Stud_Material_Name; 
        →KRS00014_001907TEXT("Shear connectors material:"); 
        →KRS00014_001908TEXT(sText); 
        →KRS00014_001909BLOCK { 
            object T →KRS00014_001910= new Table(3); 
            
            T[0][0].Value →KRS00014_001911= TR("Symbol"); 
            T[0][1].Value →KRS00014_001912= TR("Value"); 
            T[0][2].Value →KRS00014_001913= TR("Description"); 
            
            //symbols in first column
            T[1][0].Value →KRS00014_001914= "f↓us←"; 
            
            //values in second column
            T[1][1].Value →KRS00014_001916= Val(DataExchange.f_ub*10↑-6←, 2) &amp; " MPa"; 
            
            
            //Description in third column
            T[1][2].Value →KRS00014_001918= TR("Ultimate strength"); 
            
            
            →KRS00014_001920SetTable(T); 
        } 
        
        →KRS00014_001921T.Draw(); 
    } 
    
    private void PrintReinforcement() { 
        →KRS00014_001519PrintReinforcementGeometry(); 
        →KRS00014_001520PrintReinforcementMaterial(); 
    } 
    
    private void →KRS00014_001524PrintReinforcementGeometry() { 
        →KRS00014_001923TEXT("Reinforcement"); 
        
        →KRS00014_001925BLOCK { 
            object T →KRS00014_001926= new Table(3); 
            
            T[0][0].Value →KRS00014_001927= TR("Symbol"); 
            T[0][1].Value →KRS00014_001928= TR("Value"); 
            T[0][2].Value →KRS00014_001929= TR("Description"); 
            
            //symbols in first column
            T[1][0].Value →KRS00014_001947= "d↓l←"; 
            T[2][0].Value →KRS00014_001948= "s↓l←"; 
            T[3][0].Value →KRS00014_001949= "c↓l←"; 
            T[4][0].Value →KRS00014_001950= "d↓t←"; 
            T[5][0].Value →KRS00014_001951= "s↓t←"; 
            T[6][0].Value →KRS00014_001952= "c↓t←"; 
            
            //values in second column
            T[1][1].Value →KRS00014_001953= Val(DataExchange.d_l*10↑3←, 2) &amp; " mm"; 
            T[2][1].Value →KRS00014_001954= Val(DataExchange.s_l*10↑3←, 2) &amp; " mm"; 
            T[3][1].Value →KRS00014_001955= Val(DataExchange.c_l*10↑3←, 2) &amp; " mm"; 
            T[4][1].Value →KRS00014_001956= Val(DataExchange.d_t*10↑3←, 2) &amp; " mm"; 
            T[5][1].Value →KRS00014_001957= Val(DataExchange.s_t*10↑3←, 2) &amp; " mm"; 
            T[6][1].Value →KRS00014_001958= Val(DataExchange.c_t*10↑3←, 2) &amp; " mm"; 
            
            //Description in third column
            T[1][2].Value →KRS00014_001959= TR("Longitudinal bar diameter"); 
            T[2][2].Value →KRS00014_001960= TR("Longitudinal bar spacing"); 
            T[3][2].Value →KRS00014_001961= TR("Longitudinal bar cover"); 
            T[4][2].Value →KRS00014_001962= TR("Transverse bar diameter"); 
            T[5][2].Value →KRS00014_001963= TR("Transverse bar spacing"); 
            T[6][2].Value →KRS00014_001964= TR("Transverse bar cover"); 
            
            →KRS00014_001945SetTable(T); 
        } 
        →KRS00014_001946T.Draw(); 
    } 
    
    private void →KRS00014_001535PrintReinforcementMaterial() { 
        string sText →KRS00014_001989= DataExchange.Reinf_Material_Name; 
        →KRS00014_001965TEXT("Reinforcement material:"); 
        →KRS00014_001966TEXT(sText); 
        →KRS00014_001967BLOCK { 
            object T →KRS00014_001968= new Table(3); 
            
            T[0][0].Value →KRS00014_001969= TR("Symbol"); 
            T[0][1].Value →KRS00014_001970= TR("Value"); 
            T[0][2].Value →KRS00014_001971= TR("Description"); 
            
            //symbols in first column
            T[1][0].Value →KRS00014_001972= "f↓yk,r←"; 
            
            //values in second column
            T[1][1].Value →KRS00014_001973= Val(DataExchange.fyk_r*10↑-6←, 2) &amp; " MPa"; 
            
            
            //Description in third column
            T[1][2].Value →KRS00014_001974= TR("Characteristic yield strength"); 
            
            
            →KRS00014_001975SetTable(T); 
        } 
        
        →KRS00014_001976T.Draw(); 
    } 
    
    private void DrawStatus(object T, double row, double column, bool IsOK) { 
        //Add colored status OK/Not OK
        IF(!IsOK) { //Negative condition
            T[row][column].Value =  { →KRS01026_000074FontsAndColors.DrawGraphicsForCheckStatus(1); } 
        } ELSE { 
            T[row][column].Value =  { →KRS01026_000075FontsAndColors.DrawGraphicsForCheckStatus(0); } 
            →KRS01026_000079DataExchange.Set("bPracticalGeomLimitsOK", false); 
        } 
    } 
    
} 

//-----------------------------calculation----------------------------
→KRS00014_001301BLOCK { //standalone drawing of output
    IF(!IO.IsExternCLC) { 
        object Functions_general →KRS00014_001304= LoadExternCLC(Tools.Dir_Forms &amp; "Composite\EC\EC_Functions\Functions_general.CLC"); 
        object DataExchange →KRS00014_001302= Functions_general.GetMemberDataStandalone(); // fill DataExchange for standalone
        →KRS00400_000001DataExchange.Set("bWO", DataExchange.Openings.Count &gt; 0); 
        double CN →KRS00014_001217= 0; 
        object GeoAndMat →KRS00014_001022= new PrintGeometryAndMaterials(DataExchange); 
        →KRS00014_001303GeoAndMat.PrintGeoAndMat(out CN); 
        
    } 
} 
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="" Autor2="" Version="1" EWNSource="Composite.xml" Icon="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">
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
      <Style Key="Subchapter 1 row" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
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
      <Variable Modifier="Public" Name="CN" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>CN</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DataExchange" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>DataExchange</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="Functions_general" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>Functions_general</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="GeoAndMat" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>GeoAndMat</ENU>
        </LocalNames>
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
      <VC ID="GMP01026_000152">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000186">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000187">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000188">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000189">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000190">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000191">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000192">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000193">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000194">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000197">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000200">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000201">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000202">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000203">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000204">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000227">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000310">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000311">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000346">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000465">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000502">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000503">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000504">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000505">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000506">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000507">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000508">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000509">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000510">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000511">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000512">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000514">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000515">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000516">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000517">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000519">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000521">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000522">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000524">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000527">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000559">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000562">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000563">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000565">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000601">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000604">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000605">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000606">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000607">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000608">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000609">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000610">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000611">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000612">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000613">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000614">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000617">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018629">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018630">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018631">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018670">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018671">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018672">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018673">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018674">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018675">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018676">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018677">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00006_000857">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00006_000858">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000028">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000030">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000608">
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000611">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000612">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000613">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000646">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000648">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000649">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000650">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000657">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000661">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000815">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000850">
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000852">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001022">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001112">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001113">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001175">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001217">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001235">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001236">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001239">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001296">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001298">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001300">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001301">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001302">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001303">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001304">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001306">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001356">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001357">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001358">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001359">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001360">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001361">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001362">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001364">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001365">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001371">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001372">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001403">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001460">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001516">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001519">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001520">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001555">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001556">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001568">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001569">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001570">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001571">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001572">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001573">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001580">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001581">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001582">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001583">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001584">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001585">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001586">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001587">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001588">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001589">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001590">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001591">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001592">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001593">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001594">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001595">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001596">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001597">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001598">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001599">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001600">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001601">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001602">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001603">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001604">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001605">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001606">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001607">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001608">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001609">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001610">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001611">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001612">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001613">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001614">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001615">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001616">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001617">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001618">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001619">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001620">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001622">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001623">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001624">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001625">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001626">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001627">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001628">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001629">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001630">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001631">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001632">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001633">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001634">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001635">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001636">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001637">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001638">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001639">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001640">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001641">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001643">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001644">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001645">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001646">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001647">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001648">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001649">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001650">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001651">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001652">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001653">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001654">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001655">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001656">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001657">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001658">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001659">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001660">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001661">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001662">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001663">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001664">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001665">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001666">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001667">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001668">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001669">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001670">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001671">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001672">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="1" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="1" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="1" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="1" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="1" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="1" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001673">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001674">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001676">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001677">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001678">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001679">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001680">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001681">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001684">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001687">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001690">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001691">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001692">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001694">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001695">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001696">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001697">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001698">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001699">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001700">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001701">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001702">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001704">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001705">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001707">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001708">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001710">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001711">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001712">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001713">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001714">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001716">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001717">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001718">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001721">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001722">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001723">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001724">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001725">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001726">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001727">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001734">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001735">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001736">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001739">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001740">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001741">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001742">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001743">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001744">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001745">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001746">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001747">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001748">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001749">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001750">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001751">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001752">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001753">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001754">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001755">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001758">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001759">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001760">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001761">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001762">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001763">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001764">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001765">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001766">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001767">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001768">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001769">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001770">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001771">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001772">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001773">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001774">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001777">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001778">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001779">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001780">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001781">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001782">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001783">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001784">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001785">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001786">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001787">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001788">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001789">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001790">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001791">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001792">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001793">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001794">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001813">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001814">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001817">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001818">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001819">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001820">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001821">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001822">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001823">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001875">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001876">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001877">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001879">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001880">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001881">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001882">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001884">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001885">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001886">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001887">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001888">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001890">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001891">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001893">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001894">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001907">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001908">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001909">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001910">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001911">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001912">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001913">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001914">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001916">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001918">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001920">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001921">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001923">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001925">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001926">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001927">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001928">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001929">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001945">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001946">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001947">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001948">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001949">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001950">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001951">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001952">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001953">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001954">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001955">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001956">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001957">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001958">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001959">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001960">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001961">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001962">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001963">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001964">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001965">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001966">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001967">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001968">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001969">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001970">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001971">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001972">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001973">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001974">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001975">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001976">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001977">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001980">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001981">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001982">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001983">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001984">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001985">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001986">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001987">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001988">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001989">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001990">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001991">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001992">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001993">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001994">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002004">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002005">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002008">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00100_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00100_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00100_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000001">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000002">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000003">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000004">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000008">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000015">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000016">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000018">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000019">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000020">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000029">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000030">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000031">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000032">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000034">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000035">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000036">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000037">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000004">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000074">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000075">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000079">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000080">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000081">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000083">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000084">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000085">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000086">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000087">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000088">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000089">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000090">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000091">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000092">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000093">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000094">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000095">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000096">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000097">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000098">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000100">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000101">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000102">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000103">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000104">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000105">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000106">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000107">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000108">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000109">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000110">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000111">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000112">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000113">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000114">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000115">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000116">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000117">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000118">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000119">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000120">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000121">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000122">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000123">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000124">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000125">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000126">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000127">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000128">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000129">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000130">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000131">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000132">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000133">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000134">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000135">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000136">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000006">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000007">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000008">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000009">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000015">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000022">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000027">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000028">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000029">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000030">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="UNK00000_019243">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK00000_019244">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="sheeting_parallel_open_trough" Content="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" />
      <Image Name="sheeting_parallel_re-entrant_trough" Content="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" />
      <Image Name="sheeting_transverse_open_trough" Content="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" />
      <Image Name="sheeting_transverse_re-entrant_trough" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500" />
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="STRING_07C96C2D">
      <ENU>"Total height of the slab"</ENU>
    </Item>
    <Item TranslateID="STRING_0A53F80A">
      <ENU>"Width"</ENU>
    </Item>
    <Item TranslateID="STRING_0B85F17A">
      <ENU>"Spacing of the ribs"</ENU>
    </Item>
    <Item TranslateID="STRING_108EBB93">
      <ENU>"Transverse spacing"</ENU>
    </Item>
    <Item TranslateID="STRING_17F2AC98">
      <ENU>"Min"</ENU>
    </Item>
    <Item TranslateID="STRING_1E961A9E">
      <ENU>"Transverse bar spacing"</ENU>
    </Item>
    <Item TranslateID="STRING_1FFE0D07">
      <ENU>"Yes"</ENU>
    </Item>
    <Item TranslateID="STRING_2440D5F6">
      <ENU>"Area"</ENU>
    </Item>
    <Item ID="STRING_26FEF4BE">
      <ENU>"-"</ENU>
    </Item>
    <Item TranslateID="STRING_27631289">
      <ENU>"Amount per trough or section"</ENU>
    </Item>
    <Item TranslateID="STRING_2A72DADE">
      <ENU>"E modulus"</ENU>
    </Item>
    <Item TranslateID="STRING_2BE9A6AA">
      <ENU>"Longitudinal bar cover"</ENU>
    </Item>
    <Item TranslateID="STRING_2DB17F5D">
      <ENU>"Weld"</ENU>
    </Item>
    <Item TranslateID="STRING_2E4DC266">
      <ENU>"Eccentricity"</ENU>
    </Item>
    <Item TranslateID="STRING_3969833E">
      <ENU>"Length"</ENU>
    </Item>
    <Item TranslateID="STRING_3A55FCAA">
      <ENU>"Plastic section modulus"</ENU>
    </Item>
    <Item TranslateID="STRING_3D542595">
      <ENU>"Beam spacing at the left"</ENU>
    </Item>
    <Item TranslateID="STRING_4622AF34">
      <ENU>"No"</ENU>
    </Item>
    <Item TranslateID="STRING_4C008336">
      <ENU>"Distance to the slab edge at the right"</ENU>
    </Item>
    <Item TranslateID="STRING_4E5FFECD">
      <ENU>"Rectangle"</ENU>
    </Item>
    <Item TranslateID="STRING_536A9A2B">
      <ENU>"Top dovetail height"</ENU>
    </Item>
    <Item TranslateID="STRING_57CAACAA">
      <ENU>"Max"</ENU>
    </Item>
    <Item TranslateID="STRING_5FE0E3B0">
      <ENU>"Length of previous span"</ENU>
    </Item>
    <Item TranslateID="STRING_70C43496">
      <ENU>"Cross-section &amp; materials"</ENU>
    </Item>
    <Item TranslateID="STRING_70E068C6">
      <ENU>"Value"</ENU>
    </Item>
    <Item TranslateID="STRING_78B16184">
      <ENU>"Top width of the rib"</ENU>
    </Item>
    <Item TranslateID="STRING_7E084EA8">
      <ENU>"Characteristics strength"</ENU>
    </Item>
    <Item TranslateID="STRING_80AE4561">
      <ENU>"Radius of gyration"</ENU>
    </Item>
    <Item TranslateID="STRING_80FFD49E">
      <ENU>"Yield strength"</ENU>
    </Item>
    <Item TranslateID="STRING_879A620C">
      <ENU>"Diameter"</ENU>
    </Item>
    <Item TranslateID="STRING_8B493169">
      <ENU>"Elongated"</ENU>
    </Item>
    <Item TranslateID="STRING_8D7CA831">
      <ENU>"Nominal height"</ENU>
    </Item>
    <Item TranslateID="STRING_912EFEF2">
      <ENU>"Length of the current span"</ENU>
    </Item>
    <Item TranslateID="STRING_94F88384">
      <ENU>"Distance"</ENU>
    </Item>
    <Item TranslateID="STRING_9A73B5ED">
      <ENU>"Transverse bar diameter"</ENU>
    </Item>
    <Item TranslateID="STRING_9D576E95">
      <ENU>"Concrete slab with profiled sheeting"</ENU>
    </Item>
    <Item TranslateID="STRING_9E12AA70">
      <ENU>"Reinforcement"</ENU>
    </Item>
    <Item TranslateID="STRING_9F4A7498">
      <ENU>"Flange thickness"</ENU>
    </Item>
    <Item TranslateID="STRING_A77F44A3">
      <ENU>"Distance to the slab edge at the left"</ENU>
    </Item>
    <Item TranslateID="STRING_A78377F1">
      <ENU>"Height of full concrete"</ENU>
    </Item>
    <Item TranslateID="STRING_A7E5AB6F">
      <ENU>"Circle"</ENU>
    </Item>
    <Item TranslateID="STRING_AAB6E28F">
      <ENU>"Longitudinal bar spacing"</ENU>
    </Item>
    <Item TranslateID="STRING_B0EFCA9B">
      <ENU>"Steel section properties"</ENU>
    </Item>
    <Item TranslateID="STRING_B2DCF804">
      <ENU>"Transverse bar cover"</ENU>
    </Item>
    <Item TranslateID="STRING_B3CD83FD">
      <ENU>"Not supported"</ENU>
    </Item>
    <Item TranslateID="STRING_B82736A4">
      <ENU>"Shape"</ENU>
    </Item>
    <Item TranslateID="STRING_B956322B">
      <ENU>"Description"</ENU>
    </Item>
    <Item TranslateID="STRING_C2DE3ABD">
      <ENU>"Thickness of the sheeting"</ENU>
    </Item>
    <Item TranslateID="STRING_C753FC33">
      <ENU>"Ultimate strength"</ENU>
    </Item>
    <Item TranslateID="STRING_C831E046">
      <ENU>"Longitudinal bar diameter"</ENU>
    </Item>
    <Item TranslateID="STRING_CD56DAFB">
      <ENU>"Height"</ENU>
    </Item>
    <Item TranslateID="STRING_CE3B1D58">
      <ENU>"Length of next span"</ENU>
    </Item>
    <Item TranslateID="STRING_D2E0B739">
      <ENU>"Name"</ENU>
    </Item>
    <Item TranslateID="STRING_D3588252">
      <ENU>"Beam spacing at the right"</ENU>
    </Item>
    <Item TranslateID="STRING_D9633308">
      <ENU>"Ratio"</ENU>
    </Item>
    <Item TranslateID="STRING_DA11D422">
      <ENU>"Mean width of the ribs"</ENU>
    </Item>
    <Item TranslateID="STRING_DDBDB856">
      <ENU>"Geometry data"</ENU>
    </Item>
    <Item TranslateID="STRING_DF0D591D">
      <ENU>"Bottom width of the rib"</ENU>
    </Item>
    <Item TranslateID="STRING_E183C52F">
      <ENU>"Symbol"</ENU>
    </Item>
    <Item TranslateID="STRING_E26663A4">
      <ENU>"Characteristic yield strength"</ENU>
    </Item>
    <Item TranslateID="STRING_EC155945">
      <ENU>"Radius"</ENU>
    </Item>
    <Item TranslateID="STRING_EF07234E">
      <ENU>"Moment of inertia"</ENU>
    </Item>
    <Item TranslateID="STRING_F4FC5297">
      <ENU>"Web thickness"</ENU>
    </Item>
    <Item TranslateID="STRING_F66B20C8">
      <ENU>"Depth of the ribs"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP01026_000186">
      <ENU>"Practical geometric limits for openings"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP01026_000346">
      <ENU>"Practical geometric limits for web posts"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_000608">
      <ENU>CN &amp; ". " &amp; sGeomData</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_000850">
      <ENU>CN &amp; ". " &amp; sCSSMat</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_000852">
      <ENU>CN &amp; ".1 " &amp; sText</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_001362">
      <ENU>CN &amp; ".2 " &amp; sText</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001568">
      <ENU>"Simply supported beam"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001569">
      <ENU>"Cantilever"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001570">
      <ENU>"Continuous beam"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001631">
      <ENU>"Section:"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001654">
      <ENU>"Section material:"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001674">
      <ENU>"Slab"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001694">
      <ENU>"Slab material:"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001714">
      <ENU>"Incorrect type of sheeting shape"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001718">
      <ENU>"Incorrect type of sheeting shape"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001721">
      <ENU>"Profiled sheeting:"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001793">
      <ENU>"Profiled sheeting material:"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001817">
      <ENU>"Shear connector:"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001907">
      <ENU>"Shear connectors material:"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001923">
      <ENU>"Reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001965">
      <ENU>"Reinforcement material:"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_002008">
      <ENU>"Openings for design"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00400_000032">
      <ENU>"Openings for design"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS18100_000003">
      <ENU>"Incorrect type of sheeting shape"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS18100_000005">
      <ENU>"Web posts for design"</ENU>
    </Item>
  </Texts>
</Root>