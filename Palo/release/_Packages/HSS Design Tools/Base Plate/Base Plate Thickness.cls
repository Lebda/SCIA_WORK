<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="61000" GUID="a8903450-8aa6-49b2-9f20-3eb9a4937e29">
  <CodeEditor>
    <SourceCode Collapsed="20|263|383|438" BreakPoints="">IF(e &lt;= f &amp;&amp; P↓u← &lt; 0) { 
    Thickness →000701= 3; 
} ELSE { 
    IF(e &gt; f &amp;&amp; P↓u← &lt; 0) { 
        Thickness →000702= 2; 
    } ELSE { 
        IF(e &lt;= e↓crit← || (P↓u← == 0 &amp;&amp; M↓u← == 0)) { 
            Thickness →001014= 1; 
        } ELSE { 
            Thickness →000703= 0; 
        } 
    } 
} 


SWITCH(DesignMethod) { 
    CASE 0 :  { //LRFD
        →000981BLOCK { 
            SWITCH(Thickness) { 
                //Large Moment Design Case
                CASE 0 :  { 
                    →000486TEXT("Check Plate Dimensions"); 
                    f →000474= (N/2)-e↓1←; 
                    f1 →000475= [f+(N/2)]↑2←; 
                    f2 →000476= [2*P↓u←*[e+f]]/q↓max←; 
                    IF([f+(N/2)]↑2← &lt;= (2*P↓u←*[e+f])/q↓max←) { 
                        →001124TEXT("(f+N/2)↑2← &lt;= (2*P↓u←*(e+f))/q↓max←"); 
                        →001125TEXT("therefore, base Plate Dimensions are Inadequate, Revise Design."); 
                        EXIT(); 
                    } ELSE { 
                        IF(P↓u← == 0) { 
                            Y1 →001231= [f+(N/2)]+SQRT([f+(N/2)]↑2←-(2*M↓u←)/q↓max←); 
                            Y2 →001232= [f+(N/2)]-SQRT([f+(N/2)]↑2←-(2*M↓u←)/q↓max←); 
                        } ELSE { 
                            Y1 →000472= [f+(N/2)]+SQRT([f+(N/2)]↑2←-(2*P↓u←*[e+f])/q↓max←); 
                            Y2 →000477= [f+(N/2)]-SQRT([f+(N/2)]↑2←-(2*P↓u←*[e+f])/q↓max←); 
                        } 
                        Y →000478= MIN(Y1, Y2); 
                        T↓u← →000479= q↓max←*Y-P↓u←; 
                        T↓rod← →000485= T↓u←/(N↓bolt←/2); 
                        
                        IF(T↓u← &gt; P↓u←) { 
                        } ELSE { 
                            q →000979= (-T↓u←+P↓u←)/Y; 
                        } 
                        →000487TEXT("Determine Minimum Thickness"); 
                        →000488TEXT("At Bearing Interface:"); 
                        
                        IF(Y &gt;= m) { 
                            t↓p4(req)← →000489= SQRT((4*(f↓p,max←*[l↑2←/2]))/(ϕ↓b←*F↓y←)); //KRS: Correct brackets
                        } ELSE { 
                            t↓p4(req)← →000498= SQRT((4*f↓p,max←*Y*[l-(Y/2)])/(ϕ↓b←*F↓y←)); //KRS: Correct brackets
                        } 
                        
                        →000490TEXT("At Tension Interface:"); 
                        x →000491= ABS(l-e↓1←); 
                        t↓p5(req)← →000492= 2.11*SQRT((T↓u←*x)/(B*F↓y←)); 
                        
                        →000493TEXT("Controlling Plate Thickness:"); 
                        t↓p,req← →000494= MAX(t↓p4(req)←, t↓p5(req)←); 
                        →001132TEXT("Design Verification"); 
                        IF(t↓p← &gt;= t↓p,req←) { 
                            →000715TEXT("t↓p← ≥ t↓p,req←"); 
                            →001129TEXT(t↓p← &amp; " ≥ " &amp; t↓p,req←); 
                            →001130TEXT("PASS - Actual thickness of plate exceeds required thickness"); 
                        } ELSE { 
                            →000716TEXT("t↓p← &lt; t↓p,req←"); 
                            →001131TEXT(t↓p← &amp; " &lt; " &amp; t↓p,req←); 
                            →000714TEXT("FAIL - Required plate thickness exceeds specified thickness, revise design."); 
                        } 
                    } 
                } 
                
                //No or Small Moment Design Case Block
                CASE 1 :  { 
                    f →001294= (N/2)-e↓1←; 
                    T↓u← →001015= 0; 
                    T↓rod← →001016= 0; 
                    →000325TEXT("Check Plate Bearing"); 
                    IF(M↓u← == 0 || P↓u← == 0) { 
                        ϕP↓p← →001013= ϕ↓c←*P↓p←; 
                        →001282TEXT("Design Verification"); 
                        IF(P↓u← &lt; ϕP↓p←) { 
                            →001278TEXT("ϕP↓p← ≥ P↓u←"); 
                            →001279TEXT(ϕP↓p← &amp; " ≥ " &amp; P↓u←); 
                            →001007TEXT("PASS - Maximum allowable bearing stress exceeds actual bearing stress."); 
                        } ELSE { 
                            →001280TEXT("ϕP↓p← &lt; P↓u←"); 
                            →001281TEXT(ϕP↓p← &amp; " &lt; " &amp; P↓u←); 
                            →001008TEXT("FAIL - Actual bearing stress exceeds maximum allowable bearing stress."); 
                        } 
                        →001010TEXT("Determine Minimum Plate Thickness"); 
                        t↓p,req← →001009= l*SQRT([2*P↓u←]/[ϕ↓b←*F↓y←*B*N]); 
                        →001133TEXT("Design Verification"); 
                        IF(t↓p← &gt;= t↓p,req←) { 
                            →001134TEXT("t↓p← ≥ t↓p,req←"); 
                            →001135TEXT(t↓p← &amp; " ≥ " &amp; t↓p,req←); 
                            →001136TEXT("PASS - Actual thickness of plate exceeds required thickness"); 
                        } ELSE { 
                            →001137TEXT("t↓p← &lt; t↓p,req←"); 
                            →001138TEXT(t↓p← &amp; " &lt; " &amp; t↓p,req←); 
                            →001139TEXT("FAIL - Required plate thickness exceeds specified thickness, revise design."); 
                        } 
                    } ELSE { 
                        Y →000025= N-[2*e]; 
                        q →000026= P↓u←/Y; 
                        f↓p← →000990= P↓u←/(B*Y); 
                        →001283TEXT("Design Verification"); 
                        IF(q &lt; q↓max←) { 
                            →001284TEXT("q↓max← ≥ q"); 
                            →001285TEXT(q↓max← &amp; " ≥ " &amp; q); 
                            →000027TEXT("PASS - Maximum allowable bearing stress exceeds actual bearing stress."); 
                        } ELSE { 
                            →001286TEXT("q↓max← &lt; q"); 
                            →001287TEXT(q↓max← &amp; " &lt; " &amp; q); 
                            →000028TEXT("FAIL - Actual bearing stress exceeds maximum allowable bearing stress."); 
                        } 
                        
                        
                        →000029TEXT("Determine Minimum Plate Thickness"); 
                        →000031TEXT("At Bearing Interface: Using m, n &amp; l distances"); 
                        t↓p1(req)← →000033= 1.5*m*SQRT(f↓p←/F↓y←); 
                        t↓p2(req)← →000036= 1.5*n*SQRT(f↓p←/F↓y←); 
                        t↓p3(req)← →000037= SQRT(4*(f↓p←*[l↑2←/2])/(ϕ↓b←*F↓y←)); 
                        →000040TEXT("Controlling Plate Thickness"); 
                        t↓p,req← →000042= MAX(t↓p1(req)←, t↓p2(req)←, t↓p3(req)←); 
                        →001140TEXT("Design Verification"); 
                        IF(t↓p← &gt;= t↓p,req←) { 
                            →001141TEXT("t↓p← ≥ t↓p,req←"); 
                            →001142TEXT(t↓p← &amp; " ≥ " &amp; t↓p,req←); 
                            →001143TEXT("PASS - Actual thickness of plate exceeds required thickness"); 
                        } ELSE { 
                            →001144TEXT("t↓p← &lt; t↓p,req←"); 
                            →001145TEXT(t↓p← &amp; " &lt; " &amp; t↓p,req←); 
                            →001146TEXT("FAIL - Required plate thickness exceeds specified thickness, revise design."); 
                        } 
                    } 
                } 
                
                //Moment Uplift Design Case
                CASE 2 :  { 
                    →000708TEXT("Check Plate Dimensions"); 
                    f →000709= N/2-e↓1←; 
                    f1 →000710= [f+N/2]↑2←; 
                    f2 →000711= [2*P↓u←*[f-e]]/q↓max←; 
                    IF([f+(N/2)]↑2← &lt;= (2*P↓u←*[f-e])/(q↓max←)) { 
                        →001155TEXT("(f+N/2)↑2← &lt;= (2*P↓u←*(f-e))/q↓max←"); 
                        →001156TEXT("therefore, base Plate Dimensions are Inadequate, Revise Design."); 
                        EXIT(); 
                    } ELSE { 
                        IF(P↓u← == 0) { 
                            Y1 →000712= [f+(N/2)]+SQRT([f+(N/2)]↑2←-(2*P↓u←*[f-e])/q↓max←); 
                            Y2 →000713= [f+(N/2)]-SQRT([f+(N/2)]↑2←-(2*P↓u←*[f-e])/q↓max←); 
                            Y →000999= MIN(Y1, Y2); 
                            T↓u← →001000= q↓max←*Y-P↓u←; 
                            T↓rod← →001001= T↓u←/(N↓bolt←/2); 
                        } ELSE { 
                            Y1 →001153= [f+(N/2)]+SQRT([f+(N/2)]↑2←-(2*P↓u←*[f-e])/q↓max←); 
                            Y2 →001152= [f+(N/2)]-SQRT([f+(N/2)]↑2←-(2*P↓u←*[f-e])/q↓max←); 
                            Y →000994= MIN(Y1, Y2); 
                            T↓u1← →000995= M↓u←/(N-[2*e↓1←])-P↓u←/2; 
                            T↓u2← →000996= q↓max←*Y-P↓u←; 
                            T↓u← →000997= MAX(T↓u1←, T↓u2←); 
                            T↓rod← →000998= T↓u←/(N↓bolt←/2); 
                        } 
                    } 
                    
                    →000717TEXT("Determine Minimum Plate Thickness"); 
                    →000718TEXT("At Bearing Interface:"); 
                    
                    IF(Y &gt;= m) { 
                        t↓p4(req)← →000719= SQRT(4*(f↓p,max←*[l↑2←/2])/(ϕ↓b←*F↓y←)); 
                    } ELSE { 
                        t↓p4(req)← →000720= SQRT((4*f↓p,max←*Y*[l-(Y/2)])/(ϕ↓b←*F↓y←)); 
                    } 
                    
                    →000721TEXT("At Tension Interface:"); 
                    x →000722= ABS(l-e↓1←); 
                    t↓p5(req)← →000723= 2.11*SQRT((T↓u←*x)/(B*F↓y←)); 
                    
                    →000724TEXT("Controlling Plate Thickness:"); 
                    t↓p,req← →000725= MAX(t↓p4(req)←, t↓p5(req)←); 
                    
                    →001157TEXT("Design Verification"); 
                    IF(t↓p← &gt;= t↓p,req←) { 
                        →001158TEXT("t↓p← ≥ t↓p,req←"); 
                        →001159TEXT(t↓p← &amp; " ≥ " &amp; t↓p,req←); 
                        →001160TEXT("PASS - Actual thickness of plate exceeds required thickness"); 
                    } ELSE { 
                        →001161TEXT("t↓p← &lt; t↓p,req←"); 
                        →001162TEXT(t↓p← &amp; " &lt; " &amp; t↓p,req←); 
                        →001163TEXT("FAIL - Required plate thickness exceeds specified thickness, revise design."); 
                    } 
                } 
                
                //Pure Uplift Design Case
                CASE 3 :  { 
                    
                    →000697TEXT("Determine Minimum Plate Thickness"); 
                    f →001290= (N/2)-e↓1←; 
                    T↓u,max← →000691= M↓u←/(N-[2*e↓1←])-(P↓u←/2); 
                    T↓u,min← →000696= -1*((M↓u←/(N-[2*e↓1←]))+(P↓u←/2)); 
                    T↓u← →001026= T↓u,max←; 
                    T↓rod← →000692= T↓u,max←/N↓by←; 
                    
                    SWITCH(ColumnOrientation) { 
                        CASE 0 :  { //Strong Axis      
                            IF(S↓bolt,x← &gt; d) { //bolts located outside of flanges
                                b↓eff← →001021= 2*([(N-d)/2]-e↓1←); 
                                M↓up← →001025= [T↓u,max←/N↓by←]*[b↓eff←/2]; 
                            } ELSE { 
                                IF(M↓u← &gt; 0) { 
                                    b↓eff← →000693= 2*[S↓bolt,y←/2-t↓w←/2]; 
                                    M↓up← →000705= [T↓u,max←/N↓by←]*[b↓eff←/2]; 
                                } ELSE { 
                                    b↓eff← →000704= S↓bolt,x←/2+[S↓bolt,y←/2-t↓w←/2]; 
                                    M↓up← →000706= [T↓u,max←/N↓by←]*[(S↓bolt,y←-t↓w←)/2]; 
                                } 
                            } 
                        } 
                        CASE 1 :  { //Weak Axis
                            IF((S↓bolt,y←*(N↓by←-1)) &gt; d) { //bolts located outside of flanges
                                IF(M↓u← == 0) { 
                                    b↓eff← →001288= [[[N-d]/2]-e↓1←]+[S↓bolt,y←/2]; 
                                    M↓up← →001289= [T↓u←/N↓by←]*[[[N-d]/2]-e↓1←]; 
                                } ELSE { 
                                    b↓eff← →001023= 2*([(N-d)/2]-e↓1←); 
                                    M↓up← →001024= [T↓u,max←/N↓by←]*[b↓eff←/2]; 
                                } 
                            } ELSE { 
                                IF(M↓u← &gt; 0) { 
                                    b↓eff← →001017= 2*[S↓bolt,y←/2-t↓w←/2]; 
                                    M↓up← →001018= [T↓u,max←/N↓by←]*[b↓eff←/2]; 
                                } ELSE { 
                                    b↓eff← →001019= S↓bolt,x←/2+[S↓bolt,y←/2-t↓w←/2]; 
                                    M↓up← →001020= [T↓u,max←/N↓by←]*[(S↓bolt,y←-t↓w←)/2]; 
                                } 
                            } 
                        } 
                    } 
                    
                    t↓p,req← →000695= SQRT((4*M↓up←)/(b↓eff←*ϕ↓b←*F↓y←)); 
                    
                    →001164TEXT("Design Verification"); 
                    IF(t↓p← &gt;= t↓p,req←) { 
                        →001165TEXT("t↓p← ≥ t↓p,req←"); 
                        →001166TEXT(t↓p← &amp; " ≥ " &amp; t↓p,req←); 
                        →001167TEXT("PASS - Actual thickness of plate exceeds required thickness"); 
                    } ELSE { 
                        →001168TEXT("t↓p← &lt; t↓p,req←"); 
                        →001169TEXT(t↓p← &amp; " &lt; " &amp; t↓p,req←); 
                        →001170TEXT("FAIL - Required plate thickness exceeds specified thickness, revise design."); 
                    } 
                } 
            } 
        } 
    } 
    
    CASE 1 :  { //ASD
        →001027BLOCK { 
            SWITCH(Thickness) { 
                
                //Large Moment Design Case
                CASE 0 :  { 
                    →001236TEXT("Check Plate Dimensions"); 
                    f →001237= (N/2)-e↓1←; 
                    f1 →001238= [f+(N/2)]↑2←; 
                    f2 →001239= [2*P↓u←*[e+f]]/q↓max←; 
                    IF([f+(N/2)]↑2← &lt;= (2*P↓u←*[e+f])/q↓max←) { 
                        →001240TEXT("(f+N/2)↑2← &lt;= (2*P↓u←*(e+f))/q↓max←"); 
                        →001241TEXT("therefore, base Plate Dimensions are Inadequate, Revise Design."); 
                        EXIT(); 
                    } ELSE { 
                        IF(P↓u← == 0) { 
                            Y1 →001242= [f+(N/2)]+SQRT([f+(N/2)]↑2←-(2*M↓u←)/q↓max←); 
                            Y2 →001243= [f+(N/2)]-SQRT([f+(N/2)]↑2←-(2*M↓u←)/q↓max←); 
                        } ELSE { 
                            Y1 →001244= [f+(N/2)]+SQRT([f+(N/2)]↑2←-(2*P↓u←*[e+f])/q↓max←); 
                            Y2 →001245= [f+(N/2)]-SQRT([f+(N/2)]↑2←-(2*P↓u←*[e+f])/q↓max←); 
                        } 
                        Y →001246= MIN(Y1, Y2); 
                        T↓u← →001247= q↓max←*Y-P↓u←; 
                        T↓rod← →001248= T↓u←/(N↓bolt←/2); 
                        
                        IF(T↓u← &gt; P↓u←) { 
                        } ELSE { 
                            q →001249= (-T↓u←+P↓u←)/Y; 
                        } 
                        →001250TEXT("Determine Minimum Thickness"); 
                        →001251TEXT("At Bearing Interface:"); 
                        
                        IF(Y &gt;= m) { 
                            t↓p4(req)← →001252= SQRT((4*f↓p,max←*[l↑2←/2])/(F↓y←/Ω↓b←)); 
                        } ELSE { 
                            t↓p4(req)← →001253= SQRT((4*f↓p,max←*Y*[l-Y/2])/(F↓y←/Ω↓b←)); 
                        } 
                        
                        →001254TEXT("At Tension Interface:"); 
                        x →001255= ABS(l-e↓1←); 
                        t↓p5(req)← →001256= 2.58*SQRT((T↓u←*x)/(B*F↓y←)); 
                        
                        →001257TEXT("Controlling Plate Thickness:"); 
                        t↓p,req← →001258= MAX(t↓p4(req)←, t↓p5(req)←); 
                        →001259TEXT("Design Verification"); 
                        IF(t↓p← &gt;= t↓p,req←) { 
                            →001260TEXT("t↓p← ≥ t↓p,req←"); 
                            →001261TEXT(t↓p← &amp; " ≥ " &amp; t↓p,req←); 
                            →001262TEXT("PASS - Actual thickness of plate exceeds required thickness"); 
                        } ELSE { 
                            →001263TEXT("t↓p← &lt; t↓p,req←"); 
                            →001264TEXT(t↓p← &amp; " &lt; " &amp; t↓p,req←); 
                            →001265TEXT("FAIL - Required plate thickness exceeds specified thickness, revise design."); 
                        } 
                    } 
                } 
                
                //No or Small Moment Design Case Block
                CASE 1 :  { 
                    f →001291= (N/2)-e↓1←; 
                    T↓u← →001204= 0; 
                    T↓rod← →001205= 0; 
                    →001206TEXT("Check Plate Bearing"); 
                    IF(M↓u← == 0 || P↓u← == 0) { 
                        P↓a← →001207= P↓p←/Ω↓c←; 
                        →001277TEXT("Design Verification"); 
                        IF(P↓a← &gt; P↓u←) { 
                            →001266TEXT("P↓a← ≥ P↓u←"); 
                            →001267TEXT(P↓a← &amp; " ≥ " &amp; P↓u←); 
                            →001208TEXT("PASS - Maximum allowable bearing stress exceeds actual bearing stress."); 
                        } ELSE { 
                            →001270TEXT("P↓a← &lt; P↓u←"); 
                            →001271TEXT(P↓a← &amp; " &lt; " &amp; P↓u←); 
                            →001209TEXT("FAIL - Actual bearing stress exceeds maximum allowable bearing stress."); 
                        } 
                        →001210TEXT("Determine Minimum Plate Thickness"); 
                        t↓p,req← →001211= l*SQRT([2*P↓u←*Ω↓b←]/[F↓y←*B*N]); 
                        →001212TEXT("Design Verification"); 
                        IF(t↓p← &gt;= t↓p,req←) { 
                            →001213TEXT("t↓p← ≥ t↓p,req←"); 
                            →001214TEXT(t↓p← &amp; " ≥ " &amp; t↓p,req←); 
                            →001215TEXT("PASS - Actual thickness of plate exceeds required thickness"); 
                        } ELSE { 
                            →001216TEXT("t↓p← &lt; t↓p,req←"); 
                            →001217TEXT(t↓p← &amp; " &lt; " &amp; t↓p,req←); 
                            →001218TEXT("FAIL - Required plate thickness exceeds specified thickness, revise design."); 
                        } 
                    } ELSE { 
                        Y →001219= N-[2*e]; 
                        q →001220= P↓u←/Y; 
                        f↓p← →001221= P↓u←/(B*Y); 
                        →001276TEXT("Design Verification"); 
                        IF(q &lt; q↓max←) { 
                            →001272TEXT("q↓max← ≥ q"); 
                            →001273TEXT(q↓max← &amp; " ≥ " &amp; q); 
                            →001222TEXT("PASS - Maximum allowable bearing stress exceeds actual bearing stress."); 
                        } ELSE { 
                            →001274TEXT("q↓max← &lt; q"); 
                            →001275TEXT(q↓max← &amp; " &lt; " &amp; q); 
                            →001223TEXT("FAIL - Actual bearing stress exceeds maximum allowable bearing stress."); 
                        } 
                        
                        →001064TEXT("Determine Minimum Plate Thickness"); 
                        →001065TEXT("At Bearing Interface: Using m, n &amp; l distances"); 
                        t↓p1(req)← →001067= 1.5*m*SQRT(f↓p←/F↓y←); 
                        t↓p2(req)← →001068= 1.5*n*SQRT(f↓p←/F↓y←); 
                        t↓p3(req)← →001069= SQRT(4*(f↓p←*[l↑2←/2])/(F↓y←/Ω↓b←)); 
                        →001070TEXT("Controlling Plate Thickness"); 
                        t↓p,req← →001071= MAX(t↓p1(req)←, t↓p2(req)←, t↓p3(req)←); 
                        
                        →001224TEXT("Design Verification"); 
                        IF(t↓p← &gt;= t↓p,req←) { 
                            →001225TEXT("t↓p← ≥ t↓p,req←"); 
                            →001226TEXT(t↓p← &amp; " ≥ " &amp; t↓p,req←); 
                            →001227TEXT("PASS - Actual thickness of plate exceeds required thickness"); 
                        } ELSE { 
                            →001228TEXT("t↓p← &lt; t↓p,req←"); 
                            →001229TEXT(t↓p← &amp; " &lt; " &amp; t↓p,req←); 
                            →001230TEXT("FAIL - Required plate thickness exceeds specified thickness, revise design."); 
                        } 
                    } 
                } 
                
                //Moment Uplift Design Case
                CASE 2 :  { 
                    →001185TEXT("Check Plate Dimensions"); 
                    f →001186= N/2-e↓1←; 
                    f1 →001187= [f+N/2]↑2←; 
                    f2 →001188= [2*P↓u←*[f-e]]/q↓max←; 
                    IF([f+(N/2)]↑2← &lt;= (2*P↓u←*[f-e])/q↓max←) { 
                        →001190TEXT("(f+N/2)↑2← &lt;= (2*P↓u←*(f-e))/q↓max←"); 
                        →001191TEXT("therefore, base Plate Dimensions are Inadequate, Revise Design."); 
                        EXIT(); 
                    } ELSE { 
                        IF(P↓u← == 0) { 
                            Y1 →001192= [f+(N/2)]+SQRT([f+(N/2)]↑2←-(2*P↓u←*[f-e])/q↓max←); 
                            Y2 →001193= [f+(N/2)]-SQRT([f+(N/2)]↑2←-(2*P↓u←*[f-e])/q↓max←); 
                            Y →001194= MIN(Y1, Y2); 
                            T↓u← →001195= q↓max←*Y-P↓u←; 
                            T↓rod← →001196= T↓u←/(N↓bolt←/2); 
                        } ELSE { 
                            Y1 →001197= [f+(N/2)]+SQRT([f+(N/2)]↑2←-(2*P↓u←*[f-e])/q↓max←); 
                            Y2 →001198= [f+(N/2)]-SQRT([f+(N/2)]↑2←-(2*P↓u←*[f-e])/q↓max←); 
                            Y →001199= MIN(Y1, Y2); 
                            T↓u1← →001200= M↓u←/(N-[2*e↓1←])-P↓u←/2; 
                            T↓u2← →001201= q↓max←*Y-P↓u←; 
                            T↓u← →001202= MAX(T↓u1←, T↓u2←); 
                            T↓rod← →001203= T↓u←/(N↓bolt←/2); 
                        } 
                    } 
                    →001090TEXT("Determine Minimum Plate Thickness"); 
                    →001091TEXT("At Bearing Interface:"); 
                    
                    IF(Y &gt;= m) { 
                        t↓p4(req)← →001092= SQRT((4*f↓p,max←*[l↑2←/2])/(F↓y←/Ω↓b←)); 
                    } ELSE { 
                        t↓p4(req)← →001093= SQRT((4*f↓p,max←*Y*[l-Y/2])/(F↓y←/Ω↓b←)); 
                    } 
                    
                    →001094TEXT("At Tension Interface:"); 
                    x →001095= ABS(l-e↓1←); 
                    t↓p5(req)← →001096= 2.58*SQRT((T↓u←*x)/(B*F↓y←)); 
                    
                    →001097TEXT("Controlling Plate Thickness:"); 
                    t↓p,req← →001098= MAX(t↓p4(req)←, t↓p5(req)←); 
                    
                    →001178TEXT("Design Verification"); 
                    IF(t↓p← &gt;= t↓p,req←) { 
                        →001179TEXT("t↓p← ≥ t↓p,req←"); 
                        →001180TEXT(t↓p← &amp; " ≥ " &amp; t↓p,req←); 
                        →001181TEXT("PASS - Actual thickness of plate exceeds required thickness"); 
                    } ELSE { 
                        →001182TEXT("t↓p← &lt; t↓p,req←"); 
                        →001183TEXT(t↓p← &amp; " &lt; " &amp; t↓p,req←); 
                        →001184TEXT("FAIL - Required plate thickness exceeds specified thickness, revise design."); 
                    } 
                } 
                
                //Pure Uplift Design Case
                CASE 3 :  { 
                    f →001292= (N/2)-e↓1←; 
                    →001101TEXT("Determine Minimum Plate Thickness"); 
                    T↓u,max← →001103= M↓u←/(N-[2*e↓1←])-(P↓u←/2); 
                    T↓u,min← →001104= -1*((M↓u←/(N-[2*e↓1←]))+(P↓u←/2)); 
                    T↓u← →001105= T↓u,max←; 
                    T↓rod← →001106= T↓u,max←/N↓by←; 
                    
                    SWITCH(ColumnOrientation) { 
                        CASE 0 :  { //Strong Axis      
                            IF(S↓bolt,x← &gt; d) { 
                                b↓eff← →001107= 2*([(N-d)/2]-e↓1←); 
                                M↓up← →001108= [T↓u,max←/N↓by←]*[b↓eff←/2]; 
                            } ELSE { 
                                IF(M↓u← &gt; 0) { 
                                    b↓eff← →001109= 2*[S↓bolt,y←/2-t↓w←/2]; 
                                    M↓up← →001110= [T↓u,max←/N↓by←]*[b↓eff←/2]; 
                                } ELSE { 
                                    b↓eff← →001111= S↓bolt,x←/2+[S↓bolt,y←/2-t↓w←/2]; 
                                    M↓up← →001112= [T↓u,max←/N↓by←]*[(S↓bolt,y←-t↓w←)/2]; 
                                } 
                            } 
                        } 
                        CASE 1 :  { //Weak Axis
                            IF(S↓bolt,y← &gt; d) { 
                                b↓eff← →001113= 2*([(N-d)/2]-e↓1←); 
                                M↓up← →001114= [T↓u,max←/N↓by←]*[b↓eff←/2]; 
                            } ELSE { 
                                IF(M↓u← &gt; 0) { 
                                    b↓eff← →001115= 2*[S↓bolt,y←/2-t↓w←/2]; 
                                    M↓up← →001116= [T↓u,max←/N↓by←]*[b↓eff←/2]; 
                                } ELSE { 
                                    b↓eff← →001117= S↓bolt,x←/2+[S↓bolt,y←/2-t↓w←/2]; 
                                    M↓up← →001118= [T↓u,max←/N↓by←]*[(S↓bolt,y←-t↓w←)/2]; 
                                } 
                            } 
                        } 
                    } 
                    
                    t↓p,req← →001119= SQRT((4*M↓up←*Ω↓b←)/(b↓eff←*F↓y←)); 
                    
                    →001171TEXT("Design Verification"); 
                    IF(t↓p← &gt;= t↓p,req←) { 
                        →001172TEXT("t↓p← ≥ t↓p,req←"); 
                        →001173TEXT(t↓p← &amp; " ≥ " &amp; t↓p,req←); 
                        →001174TEXT("PASS - Actual thickness of plate exceeds required thickness"); 
                    } ELSE { 
                        →001175TEXT("t↓p← &lt; t↓p,req←"); 
                        →001176TEXT(t↓p← &amp; " &lt; " &amp; t↓p,req←); 
                        →001177TEXT("FAIL - Required plate thickness exceeds specified thickness, revise design."); 
                    } 
                } 
            } 
        } 
    } 
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="-1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" NAD="" LicenceID="50320" Autor="" Autor2="" Version="5" EWNSource="" Icon="/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCABkAGQDASIAAhEBAxEB/8QAHQAAAgMAAwEBAAAAAAAAAAAAAAoICQsEBgcFA//EADQQAAICAgEEAgECAgkFAQAAAAMEAgUBBgcACBMUCRIVChEWJBchJjEzNlNjcSIlQkSDI//EAB0BAAICAwEBAQAAAAAAAAAAAAAIBgkFBwoDBAH/xAAvEQACAgIBAwMDAwQCAwAAAAABAgMEBQYRAAcSCBMhCRQiFRYxIzJRcRhCJEFS/9oADAMBAAIRAxEAPwB/jo6Ojo6Ojo68b575/wCJe2XjHYOXuadxrNL0nXgzyRx4w/euLPK7LKWua3W/eLd/s1tFQ8KqkroGdbyIxcDgsuycKd3ed+oB7j+Y2LnTO2tYPb9x5kxVB7VWMSt+U79UZEZQcHsTiSYNRCcyrJABo6pW5Gi967VvIkZRjDds3vXtOiU5Wyz3JUL18bUUTXZl5ID+BZI4IiwIE1iSJGKssZd1K9Mp6fvSh3i9SN+VNCwkNbXKNlauY3XYJpMdrGMm4R3rC0kNi1k8gkUkcjY7EVL1qJJYZbaVa8qz9OEcz9yfAfbvTM33N3Luh8apLV8bTwbNsCSt07XzeFWxZqNbGQ2w3cJPmGpiNPVvT82cw+n7wn9azt9+e/46dItW6qv3vfuQ5KGTF7+hcd2rVUyNtAb0mVHtmY1cZwpzJGvcjjEWIPxIMS5gDIzFDC5u7nY7R282G3s766sjZZsbi5fatLSwYliMZMO2DxTttGzGMY5KcxCZxGOMy/bGOubVantV8vNyj1nYLlQZpLEaqqaxsVxsQgMs15nTWMKJoiMEkhSlgkYFHPMcRnHOdD5Hv1sNqUphcJj6kfPKiybOSssq+XJJianGoYFCVET+BBHuMCCLYNP+kz2fwFBLPc/uht2w2yoWV8IuF0rDRTSCApGoyEOyXZzG62I1la/W+5SWNvtYHiId4lb9RB8fR2FwFDzumIxhCI4zxtVzXVGQkYTZYinuTTcggjnJSxVVZYzCMsAXMXMRylPxP8wXx28wTqk6LuO1zWbu2sIVa9DyNU7Hx+6N01gvXqCM/stSlrsoOzcUOBha7YWisYsmTLlQtBI5/dvwrzJr/r/nuJeTaT2/N6n5fQ9prfa9fxef1/dqg+bw+YPm8f28flF9/r5Ifv5yyswmwwm4uZVtUxVmlWREAwswAkhHXYAWMChMEsZDKIkYkGSMoTjiWM4x8kXfHdacqm/i8TLETwY5KV2o5/g/hILZCtx/9RuPy58T8cSG99LP0xbFSkTUd87gUryKXjuU9n1fYayf3oDZpnX0eSL3OORFdqMWj8BKvLc6tFPdU+w1y9xQW1ZeVLnm9S0p31bOua9c5VT+u6kU6x/AyAy5vEWXjOEoZ/Ug5xx9LrMz7Ze+Puf7RbQbnCPKuxa9SzsEbGz0Zt92x0K9NXslbXjbaxNoak4SOcuWppSSYdCUyjZzJsMLlb5+PX5weGu7GwQ4z5uU13gXmhyDMKgbF03nj3djKQYbPCmvbhUK+sWEkYD9Gjv7tti0bA4sg8ZqVeo7t3UO7uu7NJDRthsJlZSqR1rcqvVsyseBHVuhY0Z2JASKwkEjsfCJZWAJrs9RX07O8vY6nkNowDRd0dBoLNZt5rX6UtbO4ahEvm1vPaw01uzFXhRZXs3sTay9GrBEbV+ajGxSO9Po6OjrbHVfvR0dHR0dHR1HLuq7oOMe0HhnYuauVn5q0NRMdbVV4Pt7ux7M6s2xU67XywMsRtPxRaJkkoEyNZZiYAONYXSZkb0hz82vfXd9y/cVZ8TavYWaHEXDZia8lXgesBVO33fkhYG2xuqfRr2wOTiwFXImABHEaKAPWOWqDcWMH7gbfFpuAmvjxfIWGNXFwOpZZLbqW9yQAj+lXQGWTlh5cKg5ZwC0fpE9Ot71J93cZqDmerqWIiXP7zk4JFhlqa9WnijarVkZZPHIZaw8ePpFYpDE0slp1WGtK6Qc75O+Tlrvl5asOQOQLAyWtpGMto2jLGJGm1amiQuFQhVwUgpOyEScjnlMxMEMxKTDLLLzz0QdcrE7vYaGmsLlLXULe6q6x7YLKJZ11Em+8BVm5fgDEjTSrAlm61EMclkABMDxmecY6kl2jdnvL/eZyFa6FxPTON51zWbPbNpvY1b9hW0NUgAklhs5THmM7O5bh6VJU4MN+4PBkVUB5pf1CeKcn8Ybpw7ultoO/VP4jY6j1iGCNld1NtN1cbaFhXvqEKs4k4sWBITHPBQFwZJ0Ktiq2ouleRGbyA/c2VitW4MjdlRshOH9mzYiKtLAJFI8AqkIip4KqqyRfMTBOnHTZO2Gosex2gZDA6/lNN1qjYh1DFvX/UcJiL6yxUMo9OZXFmSWVDasS2PuJpZZobWQBW/BJYeN7Ofhi+PfQNA1jdMVY+6C2vlkNgrOUdysGo1JvrJ+SrOr6rQvqVVGMMW4COtZyubhOzrAEM6tYpeMFxGq6Ho2iLkT0jTNU01QwUljK6rrtPry5V62BRVy5AVCaYphQEcw0hSjkasDFgCI4knjKMHxR/LNs3Zhs0OM+Y7a82jttvprwnX4Fm0d42dHk/lv9bXAsS0ZGyEgF3qnB2FjrV6SayqmcCfr3qNS23Wd81mk3LTbuv2PV9jrwWlJd1Z8MJWCTGP3gUU8ftKE4SxMLC5oDZUZGZVoIWQlFBwe2ma1PNYaNtfxtDEW6qJHkMbDFEtqvJ+SrK8oBntQTEOYrUru7gskpEodeucX1t9tPUF2z7k24e8G6bV3DwOfs2reobrkbt+bB5imDBNLRr49mXGYPJ4wGrHkcFRr16tZkgnoJJQkqzN+1/rGt7WmKu2nXqPZK8LMHQo39ShcJicGIwBtiVsV2QDZGBlgMDxhgsRHMOM8QLPEoa8//HT2pdw1Y8DbOLdZRuT+sVO5r6lWQkT1ybK9aEVMTGK9KsGwx7lgvrsdesbKUnRyuAYt7abk5ujqf3MfRyETw3ada1FIPF0nhSQEcEf9lJB4JAIII5PB6UfXtu2nUr1fJaxsOZwN6pJ7lezisjapPG/krkgQSorBnRGZXVkcopZT4jhI/vp+Cnk/gutt+QuDnIbpo9bOZWKxh0hX4K5hhSsWT+683g3liwmVppW1zjXht3dXR1e1O2eV0nF/P+401j/7tVbVTv8Avo2NbYon/wDkym6myL/bOucf/gSH9WrU6knZJt11ios/XvrHSeRdAJpN1NoUwNKNqngQDKzICTCcBoTEYU5jJCUJZxlVn5mPi2cfUrObOFFUjnSM7W5oyZFG9txnWlYrakZ45cM2x6lass2dKsD5OwZMljr18zh4FJZ3C6dxu0VepXmzmqxSRiEe7axUY8wR5rzJT/JWj8FJb2VDliAIwGPzcz6MPqJ5bPZjGdrO/mQqW/1NxRwe/XWFd0b2JvClsh9qWO4bUwihGSmev7IkeS5JJGpKd8+FD5Y7XlRnWOz3uIvDWvIGQ2CnE/INqZBc2xJVyjtqHTLckYIgK7XVas0NdzGBbNqCqiGM2eWMfiGc+spKkubTXLmo2GjdNW3VDZoXNPYrZxFivtKtoT1e6vKUZRwZVsATizKMsYIOOcxzj+rrRj+MfvTB3y9q+qcoW5qkPJ9AyzpfLtNVDAkujuVTEZI2ilVCxsWUKnZ6k6F3X4YkGHmYfTWHgaEsRkPZvfps5XfWsvO02Tx8AloWpW8pLlCPwjeKVmPlJZqEqfcYs80D+TflA7vp76kvpIxnazMVe9fbrGQ4/R9uyjUNrwVGARU9a2u4Z7Ve9QghUQ1MJn0SdBUjjirYzKV/ZhPs5SpWrWFdHR0db26ql6hF8inOQO3ztG5a32c2Rskom6NCQK4FmIp3kHm2691Y5wSitdVFdZUcGFyDOs5ZKGi1WDgS3r82mysHLexftbA3sP2brVg8x4xC87jpyMsm8QICCLymLOfjCMYofb6jhCGMRw6z+or2pxLtX1bVa+88QLfZlWdj18TYp+wmK81w+v2D9dmU5i+r9ZaDqbLIhFz4LpJRjIS2gCJmccap/HfIeh6P5vW/jLc9X1T2PJ4fB/EV4jUeby+s54vF7n38nqNfT6/b1j/t4pKX3yv2L214/DpyYqdGExL5cK9i/K3kSOfHkCONPI/kPyX4AHPQl9K3UsTq3YDcu49kIt3Y9qya35vZBmr4fU8fC0KLIVEhWV7lywYUPtMFgkBZ2IR8z4R+1Wu7buyXTNndRZByF3BDT5X3Q1hXWNU+tXPrTFo2vTTsS+TC1RrhI2AmIKpwbcvrBgcTrEWYJ+vyWfGhofdhpVvstBQBDvqAbe0XlWpELaKXbycxH2zWlE2q8tjZFLBZva9Km2Kt3+KKrwoB3RBFq1tqpaeu16nqaCnX9Opo6xCnq1PMdj1a6sVEkiv52inZP4FgCF5mDGOT6/cxSElKefpdMdFqmI/bNXV7FWGbH16MNQoUHBeNB52F8uSJZJvOdn/uMjlieST1S7d7/wDcM97s931xGdyGM3DMbRkNhWzHYYNHWtWH+2w8ntlUfH08aIMVFWC+ylKCOBUEahest/mvg3kHgHcS6ZyDXBA3IOG6u4rSMNa/sCGc4jl+ksGFUyshGXOQsBYVVdUNjxtqAlIf3tW+KP5Ztm7MNmhxnzHbXm0dtt9NeE6/As2jvGzo8n8t/ra4FiWjI2QkAu9U4OwsdavSTWVUzgT9ezD8jvxxaN3S6NfXFPQ/2l/mbh5GnWH+YxceOWZ7hp8MR/zL/fLYNfjj1d2V8pBi/iX7R2BE7nTgvee3/eXNK3VP/Uaob5UZPw+zU/kzANpVmnj/AIG6kTPtVzX2XYj/AIZCq3sWu7D2qz8OZw08poiQmtZIZ4mjc8NTvxqVWWGQELwxH5ePysyxSvfD2c7y9nvX52kyXbXuZi6CbSaajMYVWhr5CG3XXzh2XUrc0c0lDJVGUykwK/8AS97mOfGzX6NfT41LbdZ3zWaTctNu6/Y9X2OvBaUl3VnwwlYJMY/eBRTx+0oThLEwsLmgNlRkZlWghZCUUOxdIOfFH8rmzdjGzQ4z5Lnebf20bfeLmt6gLGXXeLHXcnhZblptbMBDsjZORNnY9cWcWWsFlnHkUzbAaE2Hu9J3bUeSdR13fdC2Kp23TNtqU73W9konBP1NxUviwZV1NoOcwmOcM/WcJfUoCxIA4xHEQcWT0fecZuuNFisVrZKuqjJYxn8pazkkCSMkKZqspHMUyr8c+3KElVl6pQ9UvpY3j0xbo2HzSTZnTMvNNJpe8Q1vZo52rGqSSU7cSSTrjM9QVxHkMZNL5N4i7SaxQminPaOutbjqdPvWrX2oX4fPU7DWM1rf1GqQ6/nh/wDg+l7qziwbOsZiGxq2irH9KxVVbgPJAQ67L0dTVlV1ZHAZXUqykchlYEEEf+wQSCP8dLFDNLWmisQSNFPBLHNDKh8XilicPHIjD5DI6hlI/ggHrN6+STt1J26dz27Ui34/8Ls1rd3Sg6wkpoo3al29U7fXKQKJQ8a+OwqNWlRjKCa4aa2rkAjwZBoYbKf05PP9to/dNvvb+XHsazzpoxLuECHLj8dt3FYLS4rm1QxSaj/Pa7cbMq/jLVYI/grSHO2dCvUl7T+pG4/TQ23ije1QMnPYlFGxdO2LxIOX1O9UQr0kx+Ccln6/i1FyZTieKu4o3+zqwHgpypS+NTZltQ7+e0u+duK+gRX5t0xN+1tGUk69avuX8Ur0WWrHMVF4NKWBlImJOExzPCS5BsYFOKb2Iv2Z3driofbgTO1CoDBB9nlSkNtD5AoiGOzYUKOVRPFQyleV6TcLf/5LfTszDbGpt5Wx2rzyyySRNZk/cOhJPk9ftKIZUsWLKWsJiJpJW9uW1YEsjwzRzeM2lB0dHR05XXNb0tD+oqp7EHE9DflX+tTZi02nSb8wJeexo9q2B20X8ES5ZH6q2w05fMYIwH9z6LlMRdqAFNuA7BOo514WtbA3roVnLPHNg8x4yl8CaW4UzLJvECBTF8QRTn4wjIWf1+o4TnnEcu9/OlxTYckdoVg6mlCylrQ7w6iS2ITu83Ifwu5InqRGUOKcMVuh3aVjABg2jS78aysEwawJkCGKzLCbC7ibBlW1TCZVaWKQDCzACRKBhc4pQKEwSxiQRRyiQZIxnCWJYxnCf954no71XulCYnqUp4yf+7QTPJKgPAHwzqP55AYc/wCT0Z/TQv1dq9KuZ1lbEceQg2LZsXcWM/NaDJ4unRx87qWdwZIa0jklfF3jcoOOUTV66Oox9mnP9Z3PdsfDXNKL3u2G36NQm2yBFk69pLdVa5dba1WqtFlsFX97kbLyCuC/UlO5Wugj6ra8pSc6bmrZhu1q9yu4eC1BFYhcccNFMiyRt8Ej5Vgfgn/fXPDncLkdbzeX17L12qZXB5O9iMlWcMGgvY6zLUtREOqt+E8LqCVUkAHgc9HVS3yO/HFo3dLo19cU9D/aX+ZuHkadYf5jFx45ZnuGnwxH/Mv98tg1+OPV3ZXykGL+JftHYLaejr5criqOZoz4/IQJPWnRkdHUNx5AjyXkHgjn/RHweQes5oe+bP222fF7dqOUs4rM4mzFZr2K8rxeZikWQRye2ylkYqD/ACGVgHQhgD1lv838JbrwLvlro25omxJU0pU1+JJwFJtNXIYDgtaNtoIxOBwJkIXxrkPmrsos1bc8Nqljizf4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbRoD5Hfji0bul0a+uKeh/tL/M3DyNOsP8xi48csz3DT4Yj/AJl/vlsGvxx6u7K+UgxfxL9o7AidzpwXvPb/ALy5pW6p/wCo1Q3yoyfh9mp/JmAbSrNPH/A3UiZ9qua+y7Ef8MhVD2TWtg7W5+HM4aeUUxMzVLaqzRiJ2/KjdQkiWCReI2Dn8zxyVlEUjdE/ZTvb2h9efaPJds+5WLpPskmPijz+AmkihuPdrQf0tp1eysaNQylOb3LcRqoTXUyFUnx736kGnlpO7ajyTqOu77oWxVO26ZttSne63slE4J+puKl8WDKuptBzmExzhn6zhL6lAWJAHGI4iDj2jpBb4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbR8HSd21HknUdd33Qtiqdt0zbalO91vZKJwT9TcVL4sGVdTaDnMJjnDP1nCX1KAsSAOMRxEHFldG3nG7tjRYrla2SrKi5LGs/MleQ/AliJ4MtSUgmKUDkHmKULIpBpM9VHpX3X0w7q2Iy6zZnSszNYl0rdYq5jqZinGfNqF9U8o8fsOPjZFyGPZ/F18btJpqUyOqvv6ky4XVqOKKbJA+9bs6myIBUhsEkhVf0uZdYWaKuWKBgtvVYpFXOq6ddphUciolsRZXH7KNIY5I7wO2HSFXw1Zdi544sTlYsBIzBJeG5VDTjMVhyHJowlFzyWVyZYbLGBAK2oIk2RWt/qDee/6Q+66v4prLb8lR8WUohHh+I9H07hkcVG6j3WALNv/ibdfZGPPAU1S/m/2FZWSoUAVMcPhI4XuOXfkM4bsVE2SUfEkrnlbZbGNJ+Yrq4Gu1jK9HCwJNlUFWSx2awqEqyxlI51bGYGFkzzBKQlx20psHd2OnWVrEZzeLx7hSOGWCaH7sqyuQEjHvEuCpARm4BHJuj9PQsdovp3W9kzUsOJsjtjvW3V3njZjFNk8dkF15J4JKys1m4642OOBknEjWIY/NlbwTQW6Ojo6cbrm368v5q44X5c4r3bjpmQcR2ammsvFvI8IFsE2AWdWva4IjZYnTM2SSi9yKCLBzVRHBLxieYyQzS+5zhO47e+bd64uuE2UfwdswSsA6D1HIVDJiySE2gSws3UGU/oVA6lozi0GVScnQhLPMMagnS4fze/Hj/S5q+eeuOae2a22iHZuM19HWU+FZWLuKgR6976HrjzW3A60nlnmYmnX7hGwlJ153d1amWnu8Wny7FhI8lRiMuSw/nIqKOXmpv8zxKP55BAkUKCWdVB8U8mFjv04PUbS7N90bembTfWlpXcj7anPZmYJWxuw1+UxWRmY8KI2V3pTPJIiRV55pFEs4hhkgr8BvyKV/E2zOdnHMew19Pxzu1hY7DxDfPpzgOg5CeyqS51i1u4HivXa7siKh7NFixVwohsC7EC2Kw7nEYuTdZRn/caax/92qtqp3/fRsa2xRP/APJlN1NkX+2dc4//AAJD+pvn4tfnK1/cavTO3rvQ2INLvoTKatqPPFwwaNXumD5WU15Lkc8U5qU2wQlgyNlvlk+nV2spVTd5ANgW8vjQ7tF3JrQVodT2G0tZoCIsNesMViMZbgY2xK7cRPEx4ps/jEYv/GLI0cKysj9RL0T5zKZvI+oHs9hJczDlY2v9ydWw8AmvxXI4vOXdMPRrRed+tehT3djgg966l3nNJHZgt5GSgz10dcZJ1OyTUsa5tZ+vfWA6i8kcTSbqbQoHVbUaBMgGVmQEgYBwzmIwpwIOcoSxnPJ6ZIEEcg8g/II/gj/PVKTKysVYFWUlWVgQysDwQQfkEH4IPyD8Ho6qW+R344tG7pdGvrinof7S/wAzcPI06w/zGLjxyzPcNPhiP+Zf75bBr8ceruyvlIMX8S/aOwW09HWOyuKo5mjPj8hAk9adGR0dQ3HkCPJeQeCOf9EfB5B6mGh75s/bbZ8Xt2o5SziszibMVmvYryvF5mKRZBHJ7bKWRioP8hlYB0IYA9ZcvOnBe89v+8uaVuqf+o1Q3yoyfh9mp/JmAbSrNPH/AAN1ImfarmvsuxH/AAyFnl8fHyvc39idPtfHaXk3jiLaFnmq7VrI0Ttce7c1+0pbXo+XczSXk9+0429A8MtE89Ja7MmVtV1W4Yr+a3hvtDW4iud35W3PUNH22znl2o1TLeI7nsO1P+ytX7XodLVpWt2OwM8CYtyLmpnq9tWjdtbhlK3UaLeI+dJntGKv9stqVsJlljlKSS1mgmVrMNaU+LV7sPLH2pAeIxMOZAhYcvEsrdK/YnfdS9cnYOev3R7fyW6SWamPzaZTGz18NkszRX3osxrWR8IVW/TkXyttjJPCobKROVq5CTHx9z5E3i45K3nat8vp+S22q6ct2/8ApVj4/YJnwL/ySiC0/VWiFbyjTX8/i80xRISfTj/6eTtHPxVwbuHctttJ6m2c5/jqzT2242IHlONagxXY4WAYUKxms2eznX3I7VFhubOUQVrA0GKg8GlyfjU+Pveu/jm4GtKrO03D+l+vcctb/ILQ0KmuJLOK/W6xoYJBd2zYzRlivpsNJHlVKXFnl1MVfk+NEvXNeptS16i1TXK8NTr2s01Xr1DVLZJlespqVEFbV16+SzIXIU0VgLCyQhCZGOP3nKX7yzP+yepWbuRsbplI3MUTTx4x5l/K3dseaXLq+QHKwqzwrIOVeaaUKQ8DcKP9T71BYPWtMw/pk0W1WS3dixVzeKuNmAi1/WsOKs+s6vMImYRzZKaCtkpqblJq+Nx2PeVWr5WPy+z0dHR0z3VF/R1xnUk7JNuusVFn699Y6TyLoBNJuptCmBpRtU8CAZWZASYTgNCYjCnMZIShLOM8no6CAQQRyD8EH+CP8Hr9VmVgykqykMrKSGVgeQQR8gg/II+QfkdKq/Kv8Mrmy3rvN3bagBc7/uO7PTni+RQYk02HmJ3TCSlgyvlZZUn47b3A5TOsPFZur6jyyOyXipOz6psul3LmvbZR2evXSBmF2q61UMmxAirTCJ5QiWOInDFtVkEWQSKuUgCYEWeI5z1qwdVzd1nxd9qnddVkhsuj1mq7IMOA12ya3XjUnXY+yMI+qmiesOgEIVTFHX0FnR1dhaNkstlR2HMcrE0RvfZuvmp58rrskNHITFpJ6UvKU7Mp45ZGUN7EjnlmIXwJJJBJ56tb9KX1J8z2wxmK0HvJTyO16fj44aWM2Sj42djwlKMyBYbEU0kX6tUroY44Y2lFmONEiikWNApSI7Xfkr7ye0FOdJw7y7Zw06f7ZxoO5Kr7ppS0vLXSISrpb3DGKExl60KJTUDFWXKZTwjOBZwMO7Hjj9TXtC8GQ8u9qtBbFyGMk7DjjkWx12EWIsG+4mafZ6DaJECVQgMRYFeDIBhQ0srMisYRq/Fuev07fcFrjthZ8K7RrO1U8U3reVVYvHyOsHF9ksKdOwgrDaLpxWohjAllNKdYeYGmJZt1uzYWqa49m+JP5DNbhM8O2PkTYlBhCUrGs1ZLEkCGYyvhaFYfCd0yYecjMaSdYwuJcuDSYxELXr6wrt3h0zipVjzv2sQ4jhWqMzSEalgPYSSG2IY/yJIjWEj4LAEDh6sxF9OD1MFtizlrtYM7kCXuZCfOSdtNmNyX2WYZWxUyOvNkrv8ATREkuS5JX5kSvJIJZPO9Fn9TlosF2JJ9oW2nbiEslQM8w06q5mMQlkAmGhcfOFWCQuIwKwNNogYZkSCx5RwKUDebf1EfeLyRRP0XGur8e8Ge+s0jK910DW17IBV5MQDmVf2iB007ZU8CmqbNGsU9ATR4GWddEhYpV1UXxm9/my/jp0vaZzO2tbLQdrrImqHSp20zK5dA2K6eItU5WaW+pVDydiJvyBgtMpDhhOY/DHwG9/3KX4t3a9Y0zhSjsPd8znI+1qkuEPU/KiH7OsaoPYbeHtN16wg+aC/2VtUbAflVwzkHu2y96c/xThjzyCRSpNTCpjAQ5QFmurTrmLjyX8/uIwqsW5CknrFQ9k/pk9pS2xZK92mtSU5VmSPP9zLO7uJK6TSCKHV32PLpkC3syn7c4a480qLEEd/bj6qI5D5I33lnbLPe+S9tvN33C6nAlrsexPmsbR4kMft92GTZzKc5yzMxZf1SMyU7RszYOYpLCOwH4ruf++baat0NZbcY8ICZwTY+YNh12zzXHQECDB1NGWZGgltt4X2EACXFaLJrQfjYHYIuk2LDJPa5+ny7U+IC0ex86Wtt3D7Ygsuw1UWgja1x1i4MnML4568g+V69qU2JCLTBtXxfYo2GLdZ8LStfVX4JJJ1qaldXKLIV6CwEkUUgCVTSTVFACqiioIDAsssAcAgAGEBBFCAxwjCOMYk2qdkb1m0Mnutn8TKszYyCw1izbdiXk/ULytxGGbgOK0k0svLH34SAW0f3/wDqh6vhcG+j+mHBkSRUpcZBu+Uw8OIwmArxIteodQ1aaLyttDCGNeTNUsdRpGOFRichG7CHxft07dOJe1XiXWeF+F9ZDrWma0HMs5lkbFzsVywMUbXatqtYiCW62a6KEZbGxKMY4DGtXVyyFPX1tan7j0dHTKQQQVYIq1aKOCvBGkMEEKLHFFFGoVI40UBURFAVVUAAAADqk7LZbJ57J5DNZrIXMtl8tcsZDJ5PI2Jbd7IXrcrT2rly1OzzWLFiZ3lmmldnd2LMST0dHR0devWP6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6//Z">
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://sciadesignforms.com/</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Calculation</ENU>
      </CalculationName>
      <ResultGroups TranslateID="ResultGroups">
        <ENU>
        </ENU>
      </ResultGroups>
    </Header>
    <Styles>
      <Style Key="Limit State Body" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body - dy 8 " X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="8" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Outcome Text dy 12" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" />
      <Style Key="Limit State Outcome" X="350" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Limit State Body - Wrap dy 25" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body Label" X="350" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Limit State Title" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Title" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Result" X="5" Y="0" Hor="1" Ver="4" SpX="15" SpY="5" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" />
      <Style Key="Label Italics" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Title2" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="DesignVerify" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Name="N" ESA_ID="" Type="Double" Value="330.2e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="e↓1←" ESA_ID="" Type="Double" Value="76.2e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="f" ESA_ID="" Type="Double" Value="88.9e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="f1" ESA_ID="" Type="Double" Value="64.516e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Name="P↓u←" ESA_ID="" Type="Double" Value="-1.067573e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="e" ESA_ID="" Type="Double" Value="254e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="q↓max←" ESA_ID="" Type="Double" Value="15.48121e6" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="175126.8" Dim="kip/in" />
      </Variable>
      <Variable Name="f2" ESA_ID="" Type="Double" Value="22.77035e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Name="Y1" ESA_ID="" Type="Double" Value="458.3175e-3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="Y2" ESA_ID="" Type="Double" Value="49.68248e-3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="T↓u←" ESA_ID="" Type="Double" Value="1.836718e6" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="N↓bolt←" ESA_ID="" Type="Double" Value="6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="m" ESA_ID="" Type="Double" Value="221.8944e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="l" ESA_ID="" Type="Double" Value="221.996e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="f↓p,max←" ESA_ID="" Type="Double" Value="8.411604e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894757e6" Dim="ksi" />
      </Variable>
      <Variable Name="ϕ↓b←" ESA_ID="" Type="Double" Value="900e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="F↓y←" ESA_ID="" Type="Double" Value="248.2113e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894757e6" Dim="ksi" />
      </Variable>
      <Variable Name="t↓p4(req)←" ESA_ID="" Type="Double" Value="38.40985e-3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="x" ESA_ID="" Type="Double" Value="145.796e-3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="B" ESA_ID="" Type="Double" Value="330.2e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓p5(req)←" ESA_ID="" Type="Double" Value="120.6083e-3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="q" ESA_ID="" Type="Double" Value="-1.250906e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="175126.8" Dim="kip/in" />
      </Variable>
      <Variable Name="t↓p1(req)←" ESA_ID="" Type="Double" Value="NaN" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="n" ESA_ID="" Type="Double" Value="157.2514e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓p2(req)←" ESA_ID="" Type="Double" Value="NaN" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓p3(req)←" ESA_ID="" Type="Double" Value="NaN" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓p←" ESA_ID="" Type="Double" Value="50.8e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="e↓crit←" ESA_ID="" Type="Double" Value="311.912e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="M↓u←" ESA_ID="" Type="Double" Value="56492.4" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="112.9848" Dim="kip•in" />
      </Variable>
      <Variable Name="T↓u,max←" ESA_ID="" Type="Double" Value="234767.2" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="N↓by←" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="T↓rod←" ESA_ID="" Type="Double" Value="612239.3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="t↓w←" ESA_ID="" Type="Double" Value="13.97e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="b↓eff←" ESA_ID="" Type="Double" Value="253.492e-3" Precision="4">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="M↓up←" ESA_ID="" Type="Double" Value="9918.602" Precision="4">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="112.9848" Dim="kip•in" />
      </Variable>
      <Variable Name="T↓u,min←" ESA_ID="" Type="Double" Value="-12356.13" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="S↓bolt,y←" ESA_ID="" Type="Double" Value="190.5e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="Thickness" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="Y" ESA_ID="" Type="Double" Value="49.68248e-3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓p,req←" ESA_ID="" Type="Double" Value="120.6083e-3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="S↓bolt,x←" ESA_ID="" Type="Double" Value="457.2e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="T↓u1←" ESA_ID="" Type="Double" Value="851516.5" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="T↓u2←" ESA_ID="" Type="Double" Value="1.836718e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="f↓p←" ESA_ID="" Type="Double" Value="-3.788329e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="P↓p←" ESA_ID="" Type="Double" Value="8.494772e6" Precision="3">
        <Description TranslateID="VARIABLE_P↓p←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕP↓p←" ESA_ID="" Type="Double" Value="5.521602e6" Precision="3">
        <Description TranslateID="VARIABLE_ϕP↓p←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕ↓c←" ESA_ID="" Type="Double" Value="650e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓c←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="d" ESA_ID="" Type="Double" Value="203.708e-3" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="ColumnOrientation" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_ColumnOrientation">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="DesignMethod" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_DesignMethod">
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
      <Variable Name="Ω↓c←" ESA_ID="" Type="Double" Value="2.5" Precision="2">
        <Description TranslateID="VARIABLE_Ω↓c←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="P↓a←" ESA_ID="" Type="Double" Value="3.397909e6" Precision="2">
        <Description TranslateID="VARIABLE_P↓a←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="N↓bolt,y←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_N↓bolt,y←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
    </Variables>
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Plate Thickness</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_1">
          <ENU>Layout 2</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_2">
          <ENU>Layout 6</ENU>
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
      <VC ID="000701">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="13" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000702">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="13" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001014">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000703">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="13" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000981">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000486">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000474">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000475">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="76.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000476">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001124">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001125">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000472">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="156" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000477">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000478">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000479">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="249" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000485">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000979">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000487">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="320" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000488">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="339" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000489">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="615" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000498">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000490">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="413" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000491">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="433" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000492">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="468" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000493">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="496" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000494">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="515" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001132">
        <Set Vis="1" Prev="494" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000715">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001129">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001130">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000716">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001131">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000714">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001015">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001016">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000325">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="38.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1273" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1273" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
      </VC>
      <VC ID="001013">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001007">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="25" Y="86.9" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="25" Y="113" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="444" Y="1348" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="444" Y="1348" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
      </VC>
      <VC ID="001008">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Result" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="114" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001010">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="134" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1367" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1367" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
      </VC>
      <VC ID="001009">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001133">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001134">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001135">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001136">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001137">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001138">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001139">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000025">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="32.2" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="58.6" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1293" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1293" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="000026">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="59.9" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="86.4" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1321" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1321" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="000990">
        <Set Vis="1" Prev="26" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000027">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="25" Y="86.9" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="25" Y="113" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="444" Y="1348" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="444" Y="1348" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
      </VC>
      <VC ID="000028">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Result" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="114" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000029">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="134" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1367" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1367" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
      </VC>
      <VC ID="000031">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="32.2" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="154" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1387" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1387" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
      </VC>
      <VC ID="000033">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="119" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="241" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1474" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1474" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="000036">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="159" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="281" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1514" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1514" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="000037">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="217" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="339" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1571" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1571" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="000040">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="244" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="366" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1598" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1598" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
      </VC>
      <VC ID="000042">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="264" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1618" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1618" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="001140">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001141">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001142">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001143">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001144">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001145">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001146">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000708">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000709">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000710">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="76.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000711">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001155">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001156">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000712">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="156" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000713">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000999">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001000">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001001">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001153">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="156" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001152">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000994">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000995">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="249" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000996">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000997">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000998">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000717">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="320" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000718">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="339" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000719">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="13" Y="615" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="615" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000720">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000721">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="413" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000722">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="433" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000723">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="468" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000724">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="496" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000725">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="515" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001157">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001158">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001159">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001160">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001161">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001162">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001163">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000697">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="551" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="26.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000700">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="563" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000691">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="579" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="54.4" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000696">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="616" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="91.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001026">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000692">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="653" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="129" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001021">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001025">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000693">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="689" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="165" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000705">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000704">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000706">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001023">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001024">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001017">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="689" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="165" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001018">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001019">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001020">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000695">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="763" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="239" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001164">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001165">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001166">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001167">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001168">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001169">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001170">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001027">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001028">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001029">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001030">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="76.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001031">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001123">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001122">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001032">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="156" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001033">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001034">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001035">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="249" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001036">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001037">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001038">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="320" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001039">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="339" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001040">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="13" Y="615" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="615" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001041">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001042">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="413" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001043">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="433" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001044">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="468" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001045">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="496" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001046">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="515" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001047">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="25" Y="537" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="25" Y="17.7" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="444" Y="1639" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="444" Y="1639" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
      </VC>
      <VC ID="001048">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="616" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="19" Y="2052" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="2013" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="2013" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001204">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001205">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001206">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="38.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1273" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1273" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
      </VC>
      <VC ID="001207">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001208">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="25" Y="86.9" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="25" Y="113" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="444" Y="1348" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="444" Y="1348" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
      </VC>
      <VC ID="001209">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Result" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="114" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001210">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="134" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1367" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1367" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
      </VC>
      <VC ID="001211">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001212">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001213">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001214">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001215">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001216">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001217">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001218">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001219">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="32.2" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="58.6" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1293" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1293" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="001220">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="59.9" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="86.4" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1321" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1321" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="001221">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001222">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="25" Y="86.9" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="25" Y="113" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="444" Y="1348" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="444" Y="1348" Hor="1" Ver="4" SpX="25" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|1|2" EqStyle="7" />
      </VC>
      <VC ID="001223">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Result" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="114" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001064">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="134" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1367" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1367" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|7|2" EqStyle="7" />
      </VC>
      <VC ID="001065">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="32.2" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="154" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1387" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1387" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
      </VC>
      <VC ID="001067">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="119" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="241" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1474" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1474" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="001068">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="159" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="281" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1514" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1514" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="001069">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="217" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="339" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1571" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1571" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="001070">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="244" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="366" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1598" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="419" Y="1598" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|2|2" EqStyle="7" />
      </VC>
      <VC ID="001071">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="264" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1618" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="419" Y="1618" Hor="1" Ver="4" SpX="0" SpY="6" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="7" />
      </VC>
      <VC ID="001224">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001225">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001226">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001227">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001228">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001229">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001230">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001185">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001186">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001187">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="76.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001188">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001190">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001191">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001192">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="156" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001193">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001194">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001195">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001196">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001197">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="156" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001198">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001199">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001200">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="249" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001201">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001202">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001203">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001090">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="320" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001091">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="339" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001092">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="615" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001093">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001094">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="413" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001095">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="433" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001096">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="468" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001097">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="496" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001098">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="515" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001178">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001179">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001180">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001181">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001182">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001183">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001184">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001101">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="551" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="26.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001102">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="563" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001103">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="579" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="54.4" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001104">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="616" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="91.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001105">
        <Set Vis="0" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001106">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="653" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="129" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001107">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001108">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001109">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="689" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="165" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001110">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001111">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001112">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001113">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001114">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001115">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="689" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="165" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001116">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001117">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001118">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001119">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="763" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="239" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001171">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001172">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001173">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001174">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001175">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001176">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001177">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001231">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="156" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001232">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001233">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001234">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="249" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001235">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001236">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001237">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001238">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="76.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1379" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001239">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001240">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001241">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001242">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="156" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001243">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001244">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="156" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001245">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="200" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001246">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1541" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001247">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="249" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001248">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1592" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001249">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001250">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="320" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001251">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="339" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1654" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001252">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="615" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001253">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001254">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="413" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1734" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001255">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="433" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001256">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="468" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1795" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001257">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="496" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1825" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001258">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="515" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001259">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001260">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001261">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001262">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001263">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001264">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001265">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001266">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001267">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001268">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001269">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001270">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001271">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001272">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001273">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001274">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001275">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001276">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001277">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001278">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001279">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001280">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001281">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001282">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001283">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001284">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001285">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001286">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001287">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001288">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001289">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001290">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001291">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001292">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001293">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001294">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="28" Y="1342" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
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
    <Item TranslateID="TEXT_000486">
      <ENU>"Check Plate Dimensions"</ENU>
    </Item>
    <Item TranslateID="TEXT_000487">
      <ENU>"Determine Minimum Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_000488">
      <ENU>"At Bearing Interface:"</ENU>
    </Item>
    <Item TranslateID="TEXT_000490">
      <ENU>"At Tension Interface:"</ENU>
    </Item>
    <Item TranslateID="TEXT_000493">
      <ENU>"Controlling Plate Thickness:"</ENU>
    </Item>
    <Item TranslateID="TEXT_000325">
      <ENU>"Check Plate Bearing"</ENU>
    </Item>
    <Item TranslateID="TEXT_000027">
      <ENU>"PASS - Maximum allowable bearing stress exceeds actual bearing stress."</ENU>
    </Item>
    <Item TranslateID="TEXT_000028">
      <ENU>"FAIL - Actual bearing stress exceeds maximum allowable bearing stress."</ENU>
    </Item>
    <Item TranslateID="TEXT_000029">
      <ENU>"Determine Minimum Plate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_000031">
      <ENU>"At Bearing Interface: Using m, n &amp; l distances"</ENU>
    </Item>
    <Item TranslateID="TEXT_000040">
      <ENU>"Controlling Plate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_000697">
      <ENU>"Determine Minimum Plate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_000708">
      <ENU>"Check Plate Dimensions"</ENU>
    </Item>
    <Item TranslateID="TEXT_000717">
      <ENU>"Determine Minimum Plate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_000718">
      <ENU>"At Bearing Interface:"</ENU>
    </Item>
    <Item TranslateID="TEXT_000721">
      <ENU>"At Tension Interface:"</ENU>
    </Item>
    <Item TranslateID="TEXT_000724">
      <ENU>"Controlling Plate Thickness:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001007">
      <ENU>"PASS - Maximum allowable bearing stress exceeds actual bearing stress."</ENU>
    </Item>
    <Item TranslateID="TEXT_001008">
      <ENU>"FAIL - Actual bearing stress exceeds maximum allowable bearing stress."</ENU>
    </Item>
    <Item TranslateID="TEXT_001010">
      <ENU>"Determine Minimum Plate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001028">
      <ENU>"Check Plate Dimensions"</ENU>
    </Item>
    <Item TranslateID="TEXT_001038">
      <ENU>"Determine Minimum Plate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001039">
      <ENU>"At Bearing Interface:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001042">
      <ENU>"At Tension Interface:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001045">
      <ENU>"Controlling Plate Thickness:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001047">
      <ENU>"PASS - Design Baseplate Thickness Exceeds Required Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001048">
      <ENU>"FAIL - Increase Design Baseplate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001064">
      <ENU>"Determine Minimum Plate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001065">
      <ENU>"At Bearing Interface: Using m, n &amp; l distances"</ENU>
    </Item>
    <Item TranslateID="TEXT_001070">
      <ENU>"Controlling Plate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001090">
      <ENU>"Determine Minimum Plate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001091">
      <ENU>"At Bearing Interface:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001094">
      <ENU>"At Tension Interface:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001097">
      <ENU>"Controlling Plate Thickness:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001101">
      <ENU>"Determine Minimum Plate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001122">
      <ENU>"therefore, base Plate Dimensions are Inadequate, Revise Design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001123">
      <ENU>"(f+N/2)↑2← &lt;= (2*P↓u←*(e+f))/q↓max←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001124">
      <ENU>"(f+N/2)↑2← &lt;= (2*P↓u←*(e+f))/q↓max←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001125">
      <ENU>"therefore, base Plate Dimensions are Inadequate, Revise Design."</ENU>
    </Item>
    <Item TranslateID="TEXT_000715">
      <ENU>"t↓p← ≥ t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001129">
      <ENU>t↓p← &amp; " ≥ " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001130">
      <ENU>"PASS - Actual thickness of plate exceeds required thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_000716">
      <ENU>"t↓p← &lt; t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001131">
      <ENU>t↓p← &amp; " &lt; " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_000714">
      <ENU>"FAIL - Required plate thickness exceeds specified thickness, revise design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001132">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001133">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001134">
      <ENU>"t↓p← ≥ t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001135">
      <ENU>t↓p← &amp; " ≥ " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001136">
      <ENU>"PASS - Actual thickness of plate exceeds required thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001137">
      <ENU>"t↓p← &lt; t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001138">
      <ENU>t↓p← &amp; " &lt; " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001139">
      <ENU>"FAIL - Required plate thickness exceeds specified thickness, revise design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001140">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001141">
      <ENU>"t↓p← ≥ t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001142">
      <ENU>t↓p← &amp; " ≥ " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001143">
      <ENU>"PASS - Actual thickness of plate exceeds required thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001144">
      <ENU>"t↓p← &lt; t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001145">
      <ENU>t↓p← &amp; " &lt; " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001146">
      <ENU>"FAIL - Required plate thickness exceeds specified thickness, revise design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001155">
      <ENU>"(f+N/2)↑2← &lt;= (2*P↓u←*(f-e))/q↓max←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001156">
      <ENU>"therefore, base Plate Dimensions are Inadequate, Revise Design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001157">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001158">
      <ENU>"t↓p← ≥ t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001159">
      <ENU>t↓p← &amp; " ≥ " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001160">
      <ENU>"PASS - Actual thickness of plate exceeds required thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001161">
      <ENU>"t↓p← &lt; t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001162">
      <ENU>t↓p← &amp; " &lt; " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001163">
      <ENU>"FAIL - Required plate thickness exceeds specified thickness, revise design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001164">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001165">
      <ENU>"t↓p← ≥ t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001166">
      <ENU>t↓p← &amp; " ≥ " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001167">
      <ENU>"PASS - Actual thickness of plate exceeds required thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001168">
      <ENU>"t↓p← &lt; t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001169">
      <ENU>t↓p← &amp; " &lt; " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001170">
      <ENU>"FAIL - Required plate thickness exceeds specified thickness, revise design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001171">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001172">
      <ENU>"t↓p← ≥ t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001173">
      <ENU>t↓p← &amp; " ≥ " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001174">
      <ENU>"PASS - Actual thickness of plate exceeds required thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001175">
      <ENU>"t↓p← &lt; t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001176">
      <ENU>t↓p← &amp; " &lt; " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001177">
      <ENU>"FAIL - Required plate thickness exceeds specified thickness, revise design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001178">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001179">
      <ENU>"t↓p← ≥ t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001180">
      <ENU>t↓p← &amp; " ≥ " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001181">
      <ENU>"PASS - Actual thickness of plate exceeds required thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001182">
      <ENU>"t↓p← &lt; t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001183">
      <ENU>t↓p← &amp; " &lt; " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001184">
      <ENU>"FAIL - Required plate thickness exceeds specified thickness, revise design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001185">
      <ENU>"Check Plate Dimensions"</ENU>
    </Item>
    <Item TranslateID="TEXT_001190">
      <ENU>"(f+N/2)↑2← &lt;= (2*P↓u←*(f-e))/q↓max←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001191">
      <ENU>"therefore, base Plate Dimensions are Inadequate, Revise Design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001206">
      <ENU>"Check Plate Bearing"</ENU>
    </Item>
    <Item TranslateID="TEXT_001208">
      <ENU>"PASS - Maximum allowable bearing stress exceeds actual bearing stress."</ENU>
    </Item>
    <Item TranslateID="TEXT_001209">
      <ENU>"FAIL - Actual bearing stress exceeds maximum allowable bearing stress."</ENU>
    </Item>
    <Item TranslateID="TEXT_001210">
      <ENU>"Determine Minimum Plate Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001212">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001213">
      <ENU>"t↓p← ≥ t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001214">
      <ENU>t↓p← &amp; " ≥ " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001215">
      <ENU>"PASS - Actual thickness of plate exceeds required thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001216">
      <ENU>"t↓p← &lt; t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001217">
      <ENU>t↓p← &amp; " &lt; " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001218">
      <ENU>"FAIL - Required plate thickness exceeds specified thickness, revise design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001222">
      <ENU>"PASS - Maximum allowable bearing stress exceeds actual bearing stress."</ENU>
    </Item>
    <Item TranslateID="TEXT_001223">
      <ENU>"FAIL - Actual bearing stress exceeds maximum allowable bearing stress."</ENU>
    </Item>
    <Item TranslateID="TEXT_001224">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001225">
      <ENU>"t↓p← ≥ t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001226">
      <ENU>t↓p← &amp; " ≥ " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001227">
      <ENU>"PASS - Actual thickness of plate exceeds required thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001228">
      <ENU>"t↓p← &lt; t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001229">
      <ENU>t↓p← &amp; " &lt; " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001230">
      <ENU>"FAIL - Required plate thickness exceeds specified thickness, revise design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001236">
      <ENU>"Check Plate Dimensions"</ENU>
    </Item>
    <Item TranslateID="TEXT_001240">
      <ENU>"(f+N/2)↑2← &lt;= (2*P↓u←*(e+f))/q↓max←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001241">
      <ENU>"therefore, base Plate Dimensions are Inadequate, Revise Design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001250">
      <ENU>"Determine Minimum Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001251">
      <ENU>"At Bearing Interface:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001254">
      <ENU>"At Tension Interface:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001257">
      <ENU>"Controlling Plate Thickness:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001259">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001260">
      <ENU>"t↓p← ≥ t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001261">
      <ENU>t↓p← &amp; " ≥ " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001262">
      <ENU>"PASS - Actual thickness of plate exceeds required thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_001263">
      <ENU>"t↓p← &lt; t↓p,req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001264">
      <ENU>t↓p← &amp; " &lt; " &amp; t↓p,req←</ENU>
    </Item>
    <Item TranslateID="TEXT_001265">
      <ENU>"FAIL - Required plate thickness exceeds specified thickness, revise design."</ENU>
    </Item>
    <Item TranslateID="TEXT_001266">
      <ENU>"P↓a← ≥ P↓u←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001267">
      <ENU>P↓a← &amp; " ≥ " &amp; P↓u←</ENU>
    </Item>
    <Item TranslateID="TEXT_001268">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001269">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001270">
      <ENU>"P↓a← &lt; P↓u←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001271">
      <ENU>P↓a← &amp; " &lt; " &amp; P↓u←</ENU>
    </Item>
    <Item TranslateID="TEXT_001272">
      <ENU>"q↓max← ≥ q"</ENU>
    </Item>
    <Item TranslateID="TEXT_001273">
      <ENU>q↓max← &amp; " ≥ " &amp; q</ENU>
    </Item>
    <Item TranslateID="TEXT_001274">
      <ENU>"q↓max← &lt; q"</ENU>
    </Item>
    <Item TranslateID="TEXT_001275">
      <ENU>q↓max← &amp; " &lt; " &amp; q</ENU>
    </Item>
    <Item TranslateID="TEXT_001276">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001277">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001278">
      <ENU>"ϕP↓p← ≥ P↓u←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001279">
      <ENU>ϕP↓p← &amp; " ≥ " &amp; P↓u←</ENU>
    </Item>
    <Item TranslateID="TEXT_001280">
      <ENU>"ϕP↓p← &lt; P↓u←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001281">
      <ENU>ϕP↓p← &amp; " &lt; " &amp; P↓u←</ENU>
    </Item>
    <Item TranslateID="TEXT_001282">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001283">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_001284">
      <ENU>"q↓max← ≥ q"</ENU>
    </Item>
    <Item TranslateID="TEXT_001285">
      <ENU>q↓max← &amp; " ≥ " &amp; q</ENU>
    </Item>
    <Item TranslateID="TEXT_001286">
      <ENU>"q↓max← &lt; q"</ENU>
    </Item>
    <Item TranslateID="TEXT_001287">
      <ENU>q↓max← &amp; " &lt; " &amp; q</ENU>
    </Item>
  </Texts>
</Root>