<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="61000" GUID="8d99fca1-7c62-4cd8-be19-93943d4a134f">
  <CodeEditor>
    <SourceCode Collapsed="6|47|49|219|248|250" BreakPoints="">//Column to Base Plate Weld Strength

θ →001708= 90; 

SWITCH(DesignMethod) { 
    CASE 0 :  { //LRFD
        IF(M↓u← == 0 &amp;&amp; P↓u← &gt;= 0 &amp;&amp; V↓u← &gt; 0) { //Web Weld Only
            //Web Weld
            SWITCH(FormCode) { 
                CASE 1 :  { 
                    →001709TEXT("Column Web Weld"); 
                    R↓ww← →001710= V↓u←/[2*[d-2*t↓f←]]; 
                    ϕR↓nw← →001711= ϕ↓v←*0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]; 
                    ϕR↓nw,l← →001712= ϕR↓nw←*[w↓tw←/SQRT(2)]; 
                    
                    →001713TEXT("Design Verification:"); 
                    IF(ϕR↓nw,l← &gt;= R↓ww←) { 
                        →001714TEXT("R↓nw,l← ≥ R↓ww←"); 
                        →001715TEXT(ϕR↓nw,l← &amp; " ≥ " &amp; R↓ww←); 
                        →001716TEXT("PASS - Web Weld Strength exceeds force in Web Weld"); 
                    } ELSE { 
                        →001717TEXT("R↓nw,l← &lt; R↓ww←"); 
                        →001718TEXT(ϕR↓nw,l← &amp; " &lt; " &amp; R↓ww←); 
                        →001719TEXT("FAIL - Force in Web Weld exceeds Web Weld Strength"); 
                    } 
                } 
                CASE 2 :  { 
                    →001929TEXT("HSS Column Weld along Height"); 
                    R↓ww← →001930= V↓u←/[2*h↓cf←]; 
                    ϕR↓nw← →001931= ϕ↓v←*0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]; 
                    ϕR↓nw,l← →001932= ϕR↓nw←*[w↓tw←/SQRT(2)]; 
                    
                    →001933TEXT("Design Verification:"); 
                    IF(ϕR↓nw,l← &gt;= R↓ww←) { 
                        →001934TEXT("R↓nw,l← ≥ R↓ww←"); 
                        →001935TEXT(ϕR↓nw,l← &amp; " ≥ " &amp; R↓ww←); 
                        →001936TEXT("PASS - Web Weld Strength exceeds force in Web Weld"); 
                    } ELSE { 
                        →001937TEXT("R↓nw,l← &lt; R↓ww←"); 
                        →001938TEXT(ϕR↓nw,l← &amp; " &lt; " &amp; R↓ww←); 
                        →001939TEXT("FAIL - Force in Web Weld exceeds Web Weld Strength"); 
                    } 
                } 
                CASE 3 :  { 
                } 
            } 
        } 
        IF(M↓u← == 0 &amp;&amp; V↓u← == 0 &amp;&amp; P↓u← &gt;= 0) { //Minimum Weld Only
        } 
        IF(M↓u← &gt; 0 &amp;&amp; P↓u← &gt;= 0 &amp;&amp; V↓u← == 0) { //Flange Weld Only
            //Flange Weld
            SWITCH(FormCode) { 
                CASE 1 :  { 
                    →001826TEXT("Column Flange Weld"); 
                    P↓tf← →001827= b↓f←*t↓f←*F↓y←; 
                    F↓tf← →001828= M↓u←/(d-t↓f←)-P↓u←*(b↓f←*t↓f←)/A; 
                    F↓fc← →001829= MIN(P↓tf←, MAX(F↓tf←, PhysConst(0, "kip"))); 
                    R↓wf← →001830= F↓fc←/(2*[b↓f←-t↓w←]); 
                    ϕR↓nf← →001831= ϕ↓v←*0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]; 
                    ϕR↓nf,l← →001832= ϕR↓nf←*[w↓tf←/SQRT(2)]; 
                    
                    →001833TEXT("Design Verification:"); 
                    IF(ϕR↓nf,l← &gt;= R↓wf←) { 
                        →001834TEXT("R↓nf,l← ≥ R↓wf←"); 
                        →001835TEXT(ϕR↓nf,l← &amp; " ≥ " &amp; R↓wf←); 
                        →001836TEXT("PASS - Flange Weld Strength exceeds force in Flange Weld"); 
                    } ELSE { 
                        →001837TEXT("R↓nf,l← &lt; R↓wf←"); 
                        →001838TEXT(ϕR↓nf,l← &amp; " &lt; " &amp; R↓wf←); 
                        →001839TEXT("FAIL - Force in Flange Weld exceeds Flange Weld Strength"); 
                    } 
                } 
                CASE 2 :  { 
                    //Weld along b↓cf←
                    →001978TEXT("HSS Column Weld along Width"); 
                    P↓tf← →001979= b↓cf←*t↓HSS←*F↓y←; 
                    F↓tf← →001980= M↓u←/(h↓cf←-t↓HSS←)-P↓u←*(b↓cf←*t↓HSS←)/A; 
                    F↓fc← →001981= MIN(P↓tf←, MAX(F↓tf←, PhysConst(0, "kip"))); 
                    R↓wf← →001982= F↓fc←/(2*b↓cf←); 
                    ϕR↓nf← →001983= ϕ↓v←*0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]; 
                    ϕR↓nf,l← →001984= ϕR↓nf←*[w↓tf←/SQRT(2)]; 
                    
                    →001985TEXT("Design Verification:"); 
                    IF(ϕR↓nf,l← &gt;= R↓wf←) { 
                        →001986TEXT("R↓nf,l← ≥ R↓wf←"); 
                        →001987TEXT(ϕR↓nf,l← &amp; " ≥ " &amp; R↓wf←); 
                        →001988TEXT("PASS - Flange Weld Strength exceeds force in Flange Weld"); 
                    } ELSE { 
                        →001989TEXT("R↓nf,l← &lt; R↓wf←"); 
                        →001990TEXT(ϕR↓nf,l← &amp; " &lt; " &amp; R↓wf←); 
                        →001991TEXT("FAIL - Force in Flange Weld exceeds Flange Weld Strength"); 
                    } 
                } 
                CASE 3 :  { 
                } 
            } 
        } 
        IF(M↓u← &gt; 0 &amp;&amp; ((P↓u← &gt;= 0 &amp;&amp; V↓u← &gt; 0) || (P↓u← &lt; 0))) { 
            //Flange Weld
            SWITCH(FormCode) { 
                CASE 1 :  { 
                    →001683TEXT("Column Flange Weld"); 
                    P↓tf← →000010= b↓f←*t↓f←*F↓y←; 
                    F↓tf← →000011= M↓u←/(d-t↓f←)-P↓u←*(b↓f←*t↓f←)/A; 
                    F↓fc← →000012= MIN(P↓tf←, MAX(F↓tf←, PhysConst(0, "kip"))); 
                    R↓wf← →000013= F↓fc←/(2*[b↓f←-t↓w←]); 
                    ϕR↓nf← →000014= ϕ↓v←*0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]; 
                    ϕR↓nf,l← →000015= ϕR↓nf←*[w↓tf←/SQRT(2)]; 
                    
                    →001676TEXT("Design Verification:"); 
                    IF(ϕR↓nf,l← &gt;= R↓wf←) { 
                        →001677TEXT("R↓nf,l← ≥ R↓wf←"); 
                        →001678TEXT(ϕR↓nf,l← &amp; " ≥ " &amp; R↓wf←); 
                        →001679TEXT("PASS - Flange Weld Strength exceeds force in Flange Weld"); 
                    } ELSE { 
                        →001680TEXT("R↓nf,l← &lt; R↓wf←"); 
                        →001681TEXT(ϕR↓nf,l← &amp; " &lt; " &amp; R↓wf←); 
                        →001682TEXT("FAIL - Force in Flange Weld exceeds Flange Weld Strength"); 
                    } 
                    
                    //Web Weld
                    →001684TEXT("Column Web Weld"); 
                    IF(V↓u← &gt; 0) { 
                        R↓ww← →000023= V↓u←/[2*[d-2*t↓f←]]; 
                        ϕR↓nw← →000024= ϕ↓v←*0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]; 
                        ϕR↓nw,l← →000025= ϕR↓nw←*[w↓tw←/SQRT(2)]; 
                        
                        →001685TEXT("Design Verification:"); 
                        IF(ϕR↓nw,l← &gt;= R↓ww←) { 
                            →001686TEXT("R↓nw,l← ≥ R↓ww←"); 
                            →001687TEXT(ϕR↓nw,l← &amp; " ≥ " &amp; R↓ww←); 
                            →001688TEXT("PASS - Web Weld Strength exceeds force in Web Weld"); 
                        } ELSE { 
                            →001689TEXT("R↓nw,l← &lt; R↓ww←"); 
                            →001690TEXT(ϕR↓nw,l← &amp; " &lt; " &amp; R↓ww←); 
                            →001691TEXT("FAIL - Force in Web Weld exceeds Web Weld Strength"); 
                        } 
                    } 
                    ELSE { 
                        →001850TEXT("b↓eff← = " &amp; b↓eff←); 
                        F↓tw← →001840= ABS(P↓u←)*[(A-[2*b↓f←*t↓f←])/A]; 
                        R↓wt← →001851= F↓tw←/[2*[d-(2*t↓f←)]]; 
                        ϕR↓nw← →001841= ϕ↓v←*0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]; 
                        ϕR↓nw,t← →001849= ϕR↓nw←*[w↓tw←/SQRT(2)]; 
                        
                        →001842TEXT("Design Verification:"); 
                        IF(ϕR↓nw,t← &gt;= R↓wt←) { 
                            →001843TEXT("ϕR↓nw,t← ≥ R↓wt←"); 
                            →001844TEXT(ϕR↓nw,t← &amp; " ≥ " &amp; R↓wt←); 
                            →001845TEXT("PASS - Web Weld Strength exceeds force in Web Weld"); 
                        } ELSE { 
                            →001846TEXT("ϕR↓nw,t← &lt; R↓wt←"); 
                            →001847TEXT(ϕR↓nw,t← &amp; " &lt; " &amp; R↓wt←); 
                            →001848TEXT("FAIL - Force in Web Weld exceeds Web Weld Strength"); 
                        } 
                    } 
                } 
                CASE 2 :  { 
                    //Weld along b↓cf←
                    →001940TEXT("HSS Column Weld along Width"); 
                    P↓tf← →001941= b↓cf←*t↓HSS←*F↓y←; 
                    F↓tf← →001954= M↓u←/(h↓cf←-t↓HSS←)-P↓u←*(b↓cf←*t↓HSS←)/A; 
                    F↓fc← →001943= MIN(P↓tf←, MAX(F↓tf←, PhysConst(0, "kip"))); 
                    R↓wf← →001944= F↓fc←/(2*b↓cf←); 
                    ϕR↓nf← →001945= ϕ↓v←*0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]; 
                    ϕR↓nf,l← →001946= ϕR↓nf←*[w↓tf←/SQRT(2)]; 
                    
                    →001947TEXT("Design Verification:"); 
                    IF(ϕR↓nf,l← &gt;= R↓wf←) { 
                        →001948TEXT("R↓nf,l← ≥ R↓wf←"); 
                        →001949TEXT(ϕR↓nf,l← &amp; " ≥ " &amp; R↓wf←); 
                        →001950TEXT("PASS - Flange Weld Strength exceeds force in Flange Weld"); 
                    } ELSE { 
                        →001951TEXT("R↓nf,l← &lt; R↓wf←"); 
                        →001952TEXT(ϕR↓nf,l← &amp; " &lt; " &amp; R↓wf←); 
                        →001953TEXT("FAIL - Force in Flange Weld exceeds Flange Weld Strength"); 
                    } 
                    //Weld along h↓cf←
                    →001955TEXT("HSS Column Weld along Height"); 
                    IF(V↓u← &gt; 0) { 
                        R↓ww← →001956= V↓u←/[2*h↓cf←]; 
                        ϕR↓nw← →001957= ϕ↓v←*0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]; 
                        ϕR↓nw,l← →001958= ϕR↓nw←*[w↓tw←/SQRT(2)]; 
                        
                        →001959TEXT("Design Verification:"); 
                        IF(ϕR↓nw,l← &gt;= R↓ww←) { 
                            →001960TEXT("R↓nw,l← ≥ R↓ww←"); 
                            →001961TEXT(ϕR↓nw,l← &amp; " ≥ " &amp; R↓ww←); 
                            →001962TEXT("PASS - Web Weld Strength exceeds force in Web Weld"); 
                        } ELSE { 
                            →001963TEXT("R↓nw,l← &lt; R↓ww←"); 
                            →001964TEXT(ϕR↓nw,l← &amp; " &lt; " &amp; R↓ww←); 
                            →001965TEXT("FAIL - Force in Web Weld exceeds Web Weld Strength"); 
                        } 
                    } 
                    ELSE { 
                        F↓tw← →001967= ABS(P↓u←)*[(A-[2*b↓cf←*t↓HSS←])/A]; 
                        R↓wt← →001968= F↓tw←/[2*[h↓cf←-(2*t↓HSS←)]]; 
                        ϕR↓nw← →001969= ϕ↓v←*0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]; 
                        ϕR↓nw,t← →001970= ϕR↓nw←*[w↓tw←/SQRT(2)]; 
                        
                        →001971TEXT("Design Verification:"); 
                        IF(ϕR↓nw,t← &gt;= R↓wt←) { 
                            →001972TEXT("ϕR↓nw,t← ≥ R↓wt←"); 
                            →001973TEXT(ϕR↓nw,t← &amp; " ≥ " &amp; R↓wt←); 
                            →001974TEXT("PASS - Web Weld Strength exceeds force in Web Weld"); 
                        } ELSE { 
                            →001975TEXT("ϕR↓nw,t← &lt; R↓wt←"); 
                            →001976TEXT(ϕR↓nw,t← &amp; " &lt; " &amp; R↓wt←); 
                            →001977TEXT("FAIL - Force in Web Weld exceeds Web Weld Strength"); 
                        } 
                    } 
                } 
                CASE 3 :  { 
                } 
            } 
        } 
    } 
    CASE 1 :  { //ASD
        IF(M↓u← == 0 &amp;&amp; P↓u← &gt;= 0 &amp;&amp; V↓u← &gt; 0) { //web weld only
            //Web Weld
            SWITCH(FormCode) { 
                CASE 1 :  { 
                    →001720TEXT("Column Web Weld"); 
                    R↓ww← →001721= V↓u←/[2*[d-2*t↓f←]]; 
                    R↓nw/←Ω →001722= 0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]/Ω↓v←; 
                    R↓nw,l/←Ω →001723= R↓nw/←Ω*[w↓tw←/SQRT(2)]; 
                } 
                CASE 2 :  { 
                    →001992TEXT("HSS Column Weld along Height"); 
                    R↓ww← →001993= V↓u←/[2*h↓cf←]; 
                    R↓nw/←Ω →002010= 0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]/Ω↓v←; 
                    R↓nw,l/←Ω →002011= R↓nw/←Ω*[w↓tw←/SQRT(2)]; 
                } 
                CASE 3 :  { 
                } 
            } 
            →002003TEXT("Design Verification:"); 
            IF(R↓nw,l/←Ω &gt;= R↓ww←) { 
                →002004TEXT("R↓nw,l/←Ω ≥ R↓ww←"); 
                →002005TEXT(R↓nw,l/←Ω &amp; " ≥ " &amp; R↓ww←); 
                →002006TEXT("PASS - Web Weld Strength exceeds force in Web Weld"); 
            } ELSE { 
                →002007TEXT("R↓nw,l/←Ω &lt; R↓ww←"); 
                →002008TEXT(R↓nw,l/←Ω &amp; " &lt; " &amp; R↓ww←); 
                →002009TEXT("FAIL - Force in Web Weld exceeds Web Weld Strength"); 
            } 
        } 
        IF(M↓u← == 0 &amp;&amp; V↓u← == 0 &amp;&amp; P↓u← &gt;= 0) { //Minimum Weld Only
        } 
        IF(M↓u← &gt; 0 &amp;&amp; P↓u← &gt;= 0 &amp;&amp; V↓u← == 0) { //Flange Weld Only
            //Flange Weld
            SWITCH(FormCode) { 
                CASE 1 :  { 
                    →001852TEXT("Column Flange Weld"); 
                    P↓tf← →001853= b↓f←*t↓f←*F↓y←; 
                    F↓tf← →001854= M↓u←/(d-t↓f←)-P↓u←*(b↓f←*t↓f←)/A; 
                    F↓fc← →001855= MIN(P↓tf←, MAX(F↓tf←, PhysConst(0, "kip"))); 
                    R↓wf← →001856= F↓fc←/(2*[b↓f←-t↓w←]); 
                    R↓nf/←Ω →001857= 0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]/Ω↓v←; 
                    R↓nf,l/←Ω →001858= R↓nf/←Ω*[w↓tf←/SQRT(2)]; 
                } 
                CASE 2 :  { 
                    →001896TEXT("HSS Column Weld along Depth"); 
                    P↓tf← →001897= b↓c←*t↓HSS←*F↓y←; 
                    F↓tf← →001898= M↓u←/(h↓c←-t↓HSS←)-P↓u←*(b↓c←*t↓HSS←)/A; 
                    F↓fc← →001899= MIN(P↓tf←, MAX(F↓tf←, PhysConst(0, "kip"))); 
                    R↓wf← →001900= F↓fc←/(2*[b↓f←-t↓w←]); 
                    R↓nf/←Ω →001901= 0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]/Ω↓v←; 
                    R↓nf,l/←Ω →001902= R↓nf/←Ω*[w↓tf←/SQRT(2)]; 
                    
                } 
                CASE 3 :  { 
                    
                } 
            } 
            →001859TEXT("Design Verification:"); 
            IF(R↓nf,l/←Ω &gt;= R↓wf←) { 
                →001860TEXT("R↓nf,l/←Ω ≥ R↓wf←"); 
                →001861TEXT(R↓nf,l/←Ω &amp; " ≥ " &amp; R↓wf←); 
                →001862TEXT("PASS - Flange Weld Strength exceeds force in Flange Weld"); 
            } ELSE { 
                →001863TEXT("R↓nf,l/←Ω &lt; R↓wf←"); 
                →001864TEXT(R↓nf,l/←Ω &amp; " &lt; " &amp; R↓wf←); 
                →001865TEXT("FAIL - Force in Flange Weld exceeds Flange Weld Strength"); 
            } 
        } 
        IF(M↓u← &gt; 0 &amp;&amp; ((P↓u← &gt;= 0 &amp;&amp; V↓u← &gt; 0) || (P↓u← &lt; 0))) { 
            SWITCH(FormCode) { 
                CASE 1 :  { 
                    //Flange Weld
                    →001707TEXT("Column Flange Weld"); 
                    P↓tf← →000001= b↓f←*t↓f←*F↓y←; 
                    F↓tf← →000002= M↓u←/(d-t↓f←)-P↓u←*(b↓f←*t↓f←)/A; 
                    F↓fc← →000003= MIN(P↓tf←, MAX(F↓tf←, PhysConst(0, "kip"))); 
                    R↓wf← →000004= F↓fc←/(2*[b↓f←-t↓w←]); 
                    R↓nf/←Ω →000005= 0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]/Ω↓v←; 
                    R↓nf,l/←Ω →000007= R↓nf/←Ω*[w↓tf←/SQRT(2)]; 
                    
                    →001692TEXT("Design Verification:"); 
                    IF(R↓nf,l/←Ω &gt;= R↓wf←) { 
                        →001693TEXT("R↓nf,l/←Ω ≥ R↓wf←"); 
                        →001694TEXT(R↓nf,l/←Ω &amp; " ≥ " &amp; R↓wf←); 
                        →001695TEXT("PASS - Flange Weld Strength exceeds force in Flange Weld"); 
                    } ELSE { 
                        →001696TEXT("R↓nf,l/←Ω &lt; R↓wf←"); 
                        →001697TEXT(R↓nf,l/←Ω &amp; " &lt; " &amp; R↓wf←); 
                        →001698TEXT("FAIL - Force in Flange Weld exceeds Flange Weld Strength"); 
                    } 
                    
                    //Web Weld
                    →001706TEXT("Column Web Weld"); 
                    IF(V↓u← &gt; 0) { 
                        R↓ww← →000018= V↓u←/[2*[d-2*t↓f←]]; 
                        R↓nw/←Ω →000019= 0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]/Ω↓v←; 
                        R↓nw,l/←Ω →000020= R↓nw/←Ω*[w↓tw←/SQRT(2)]; 
                        
                        →001699TEXT("Design Verification:"); 
                        IF(R↓nw,l/←Ω &gt;= R↓ww←) { 
                            →001700TEXT("R↓nw,l/←Ω ≥ R↓ww←"); 
                            →001701TEXT(R↓nw,l/←Ω &amp; " ≥ " &amp; R↓ww←); 
                            →001702TEXT("PASS - Web Weld Strength exceeds force in Web Weld"); 
                        } ELSE { 
                            →001703TEXT("R↓nw,l/←Ω &lt; R↓ww←"); 
                            →001704TEXT(R↓nw,l/←Ω &amp; " &lt; " &amp; R↓ww←); 
                            →001705TEXT("FAIL - Force in Web Weld exceeds Web Weld Strength"); 
                        } 
                    } 
                    ELSE { 
                        →001866TEXT("b↓eff← = " &amp; b↓eff←); 
                        F↓tw← →001867= ABS(P↓u←)*[(A-[2*b↓f←*t↓f←])/A]; 
                        R↓wt← →001868= F↓tw←/[2*[d-(2*t↓f←)]]; 
                        R↓nw/←Ω →001869= 0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]/Ω↓v←; 
                        R↓nw,t/←Ω →001870= R↓nw/←Ω*[w↓tw←/SQRT(2)]; 
                        
                        →001871TEXT("Design Verification:"); 
                        IF(R↓nw,t/←Ω &gt;= R↓wt←) { 
                            →001872TEXT("R↓nw,t/←Ω ≥ R↓wt←"); 
                            →001873TEXT(R↓nw,t/←Ω &amp; " ≥ " &amp; R↓wt←); 
                            →001874TEXT("PASS - Web Weld Strength exceeds force in Web Weld"); 
                        } ELSE { 
                            →001875TEXT("R↓nw,t/←Ω &lt; R↓wt←"); 
                            →001876TEXT(R↓nw,t/←Ω &amp; " &lt; " &amp; R↓wt←); 
                            →001877TEXT("FAIL - Force in Web Weld exceeds Web Weld Strength"); 
                        } 
                    } 
                } 
                CASE 2 :  { 
                    //Weld along b↓cf←
                    →002018TEXT("HSS Column Weld along Width"); 
                    P↓tf← →002019= b↓cf←*t↓HSS←*F↓y←; 
                    F↓tf← →002020= M↓u←/(h↓cf←-t↓HSS←)-P↓u←*(b↓cf←*t↓HSS←)/A; 
                    F↓fc← →002021= MIN(P↓tf←, MAX(F↓tf←, PhysConst(0, "kip"))); 
                    R↓wf← →002022= F↓fc←/(2*b↓cf←); 
                    R↓nf/←Ω →002016= 0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]/Ω↓v←; 
                    R↓nf,l/←Ω →002017= R↓nf/←Ω*[w↓tf←/SQRT(2)]; 
                    
                    →002052TEXT("Design Verification:"); 
                    IF(R↓nf,l/←Ω &gt;= R↓wf←) { 
                        →002053TEXT("R↓nf,l/←Ω ≥ R↓wf←"); 
                        →002054TEXT(R↓nf,l/←Ω &amp; " ≥ " &amp; R↓wf←); 
                        →002055TEXT("PASS - Flange Weld Strength exceeds force in Flange Weld"); 
                    } ELSE { 
                        →002056TEXT("R↓nf,l/←Ω &lt; R↓wf←"); 
                        →002057TEXT(R↓nf,l/←Ω &amp; " &lt; " &amp; R↓wf←); 
                        →002058TEXT("FAIL - Force in Flange Weld exceeds Flange Weld Strength"); 
                    } 
                    
                    //Weld along h↓cf←
                    →002030TEXT("HSS Column Weld along Depth"); 
                    IF(V↓u← &gt; 0) { 
                        R↓ww← →002031= V↓u←/[2*h↓cf←]; 
                        R↓nw/←Ω →002059= 0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]/Ω↓v←; 
                        R↓nw,l/←Ω →002060= R↓nw/←Ω*[w↓tw←/SQRT(2)]; 
                        
                        →002061TEXT("Design Verification:"); 
                        IF(R↓nw,l/←Ω &gt;= R↓ww←) { 
                            →002062TEXT("R↓nw,l/←Ω ≥ R↓ww←"); 
                            →002063TEXT(R↓nw,l/←Ω &amp; " ≥ " &amp; R↓ww←); 
                            →002064TEXT("PASS - Web Weld Strength exceeds force in Web Weld"); 
                        } ELSE { 
                            →002065TEXT("R↓nw,l/←Ω &lt; R↓ww←"); 
                            →002066TEXT(R↓nw,l/←Ω &amp; " &lt; " &amp; R↓ww←); 
                            →002067TEXT("FAIL - Force in Web Weld exceeds Web Weld Strength"); 
                        } 
                    } 
                    ELSE { 
                        F↓tw← →002041= ABS(P↓u←)*[(A-[2*b↓cf←*t↓HSS←])/A]; 
                        R↓wt← →002042= F↓tw←/[2*[h↓cf←-(2*t↓HSS←)]]; 
                        R↓nw/←Ω →002068= 0.6*F↓EXX←*[1.0+0.5*(SIN(θ))↑2←]/Ω↓v←; 
                        R↓nw,t/←Ω →002069= R↓nw/←Ω*[w↓tw←/SQRT(2)]; 
                        
                        →002070TEXT("Design Verification:"); 
                        IF(R↓nw,t/←Ω &gt;= R↓wt←) { 
                            →002071TEXT("R↓nw,t/←Ω ≥ R↓wt←"); 
                            →002072TEXT(R↓nw,t/←Ω &amp; " ≥ " &amp; R↓wt←); 
                            →002073TEXT("PASS - Web Weld Strength exceeds force in Web Weld"); 
                        } ELSE { 
                            →002074TEXT("R↓nw,t/←Ω &lt; R↓wt←"); 
                            →002075TEXT(R↓nw,t/←Ω &amp; " &lt; " &amp; R↓wt←); 
                            →002076TEXT("FAIL - Force in Web Weld exceeds Web Weld Strength"); 
                        } 
                    } 
                } 
                CASE 3 :  { 
                } 
            } 
        } 
    } 
} 
IF(M↓u← == 0) { 
    →001825TEXT("Minimmum Weld Size (Table J2.4)"); 
    SWITCH(FormCode) { 
        CASE 1 :  { 
            →001909TEXT("Column Flange Weld"); 
            →001814TEXT("t↓f← = " &amp; t↓f←); 
            IF(t↓f← &lt;= PhysConst(0.25, "in")) { 
                w↓tf,min← →001884= PhysConst(0.125, "in"); 
            } 
            IF(t↓f← &gt; PhysConst(0.25, "in") &amp;&amp; t↓f← &lt;= PhysConst(0.5, "in")) { 
                w↓tf,min← →001885= PhysConst(0.1875, "in"); 
            } 
            IF(t↓f← &gt; PhysConst(0.50, "in") &amp;&amp; t↓f← &lt;= PhysConst(0.75, "in")) { 
                w↓tf,min← →001886= PhysConst(0.25, "in"); 
            } 
            IF(t↓f← &gt; PhysConst(0.75, "in")) { 
                w↓tf,min← →001887= PhysConst(0.3125, "in"); 
            } 
        } 
        CASE 2 :  { 
            →001813TEXT("Column Wall Weld"); 
            →001882TEXT("t↓HSS← = " &amp; t↓HSS←); 
            IF(t↓HSS← &lt;= PhysConst(0.25, "in")) { 
                w↓tf,min← →001888= PhysConst(0.125, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.25, "in") &amp;&amp; t↓HSS← &lt;= PhysConst(0.5, "in")) { 
                w↓tf,min← →001889= PhysConst(0.1875, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.50, "in") &amp;&amp; t↓HSS← &lt;= PhysConst(0.75, "in")) { 
                w↓tf,min← →001890= PhysConst(0.25, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.75, "in")) { 
                w↓tf,min← →001891= PhysConst(0.3125, "in"); 
            } 
        } 
        CASE 3 :  { 
            →001910TEXT("Column Wall Weld"); 
            →001883TEXT("t↓HSS← = " &amp; t↓HSS←); 
            IF(t↓HSS← &lt;= PhysConst(0.25, "in")) { 
                w↓tf,min← →001892= PhysConst(0.125, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.25, "in") &amp;&amp; t↓HSS← &lt;= PhysConst(0.5, "in")) { 
                w↓tf,min← →001893= PhysConst(0.1875, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.50, "in") &amp;&amp; t↓HSS← &lt;= PhysConst(0.75, "in")) { 
                w↓tf,min← →001894= PhysConst(0.25, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.75, "in")) { 
                w↓tf,min← →001895= PhysConst(0.3125, "in"); 
            } 
        } 
    } 
    IF(w↓tf← &gt;= w↓tf,min←) { 
        →001819TEXT("w↓tf← ≥ w↓tf,min←"); 
        →001820TEXT(w↓tf← &amp; " ≥ " &amp; w↓tf,min←); 
        →001821TEXT("PASS - Flange Weld size exceeds minimum required"); 
    } ELSE { 
        →001822TEXT("w↓tf← &lt; w↓tf,min←"); 
        →001823TEXT(w↓tf← &amp; " &lt; " &amp; w↓tf,min←); 
        →001824TEXT("FAIL - Flange Weld size must be increased"); 
    } 
} ELSE { 
    SWITCH(FormCode) { 
        CASE 1 :  { 
            →001778TEXT("Minimmum Weld Size (Table J2.4)"); 
            →001787TEXT("Column Flange Weld"); 
            →001785TEXT("t↓f← = " &amp; t↓f←); 
            IF(t↓f← &lt;= PhysConst(0.25, "in")) { 
                w↓tf,min← →001788= PhysConst(0.125, "in"); 
            } 
            IF(t↓f← &gt; PhysConst(0.25, "in") &amp;&amp; t↓f← &lt;= PhysConst(0.5, "in")) { 
                w↓tf,min← →001789= PhysConst(0.1875, "in"); 
            } 
            IF(t↓f← &gt; PhysConst(0.50, "in") &amp;&amp; t↓f← &lt;= PhysConst(0.75, "in")) { 
                w↓tf,min← →001790= PhysConst(0.25, "in"); 
            } 
            IF(t↓f← &gt; PhysConst(0.75, "in")) { 
                w↓tf,min← →001792= PhysConst(0.3125, "in"); 
            } 
            IF(w↓tf← &gt;= w↓tf,min←) { 
                →001779TEXT("w↓tf← ≥ w↓tf,min←"); 
                →001780TEXT(w↓tf← &amp; " ≥ " &amp; w↓tf,min←); 
                →001781TEXT("PASS - Flange Weld size exceeds minimum required"); 
            } ELSE { 
                →001782TEXT("w↓tf← &lt; w↓tf,min←"); 
                →001783TEXT(w↓tf← &amp; " &lt; " &amp; w↓tf,min←); 
                →001784TEXT("FAIL - Flange Weld size must be increased"); 
            } 
            
            →001799TEXT("Column Web Weld"); 
            →001811TEXT("t↓w← = " &amp; t↓w←); 
            IF(t↓w← &lt;= PhysConst(0.25, "in")) { 
                w↓tw,min← →001801= PhysConst(0.125, "in"); 
            } 
            IF(t↓w← &gt; PhysConst(0.25, "in") &amp;&amp; t↓w← &lt;= PhysConst(0.5, "in")) { 
                w↓tw,min← →001802= PhysConst(0.1875, "in"); 
            } 
            IF(t↓w← &gt; PhysConst(0.50, "in") &amp;&amp; t↓w← &lt;= PhysConst(0.75, "in")) { 
                w↓tw,min← →001803= PhysConst(0.25, "in"); 
            } 
            IF(t↓w← &gt; PhysConst(0.75, "in")) { 
                w↓tw,min← →001804= PhysConst(0.3125, "in"); 
            } 
            IF(w↓tw← &gt;= w↓tw,min←) { 
                →001805TEXT("w↓tw← ≥ w↓tw,min←"); 
                →001806TEXT(w↓tw← &amp; " ≥ " &amp; w↓tw,min←); 
                →001807TEXT("PASS - Web Weld size exceeds minimum required"); 
            } ELSE { 
                →001808TEXT("w↓tw← &lt; w↓tw,min←"); 
                →001809TEXT(w↓tw← &amp; " &lt; " &amp; w↓tw,min←); 
                →001810TEXT("FAIL - Web Weld size must be increased"); 
            } 
        } 
        CASE 2 :  { 
            →002077TEXT("Minimmum Weld Size (Table J2.4)"); 
            →001911TEXT("HSS Column Weld along Width"); 
            →001912TEXT("t↓HSS← = " &amp; t↓HSS←); 
            IF(t↓HSS← &lt;= PhysConst(0.25, "in")) { 
                w↓tb,min← →001913= PhysConst(0.125, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.25, "in") &amp;&amp; t↓HSS← &lt;= PhysConst(0.5, "in")) { 
                w↓tb,min← →001914= PhysConst(0.1875, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.50, "in") &amp;&amp; t↓HSS← &lt;= PhysConst(0.75, "in")) { 
                w↓tb,min← →001915= PhysConst(0.25, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.75, "in")) { 
                w↓tb,min← →001916= PhysConst(0.3125, "in"); 
            } 
            IF(w↓tb← &gt;= w↓tf,min←) { 
                →002079TEXT("w↓tb← ≥ w↓tb,min←"); 
                →002080TEXT(w↓tf← &amp; " ≥ " &amp; w↓tf,min←); 
                →002081TEXT("PASS - Flange Weld size exceeds minimum required"); 
            } ELSE { 
                →002082TEXT("w↓tb← &lt; w↓tb,min←"); 
                →002083TEXT(w↓tb← &amp; " &lt; " &amp; w↓tf,min←); 
                →002084TEXT("FAIL - Flange Weld size must be increased"); 
            } 
            
            →002085TEXT("HSS Column Weld along Height"); 
            →002086TEXT("t↓HSS← = " &amp; t↓w←); 
            IF(t↓HSS← &lt;= PhysConst(0.25, "in")) { 
                w↓th,min← →002087= PhysConst(0.125, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.25, "in") &amp;&amp; t↓HSS← &lt;= PhysConst(0.5, "in")) { 
                w↓th,min← →002088= PhysConst(0.1875, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.50, "in") &amp;&amp; t↓HSS← &lt;= PhysConst(0.75, "in")) { 
                w↓th,min← →002089= PhysConst(0.25, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.75, "in")) { 
                w↓th,min← →002090= PhysConst(0.3125, "in"); 
            } 
            IF(w↓th← &gt;= w↓th,min←) { 
                →002091TEXT("w↓th← ≥ w↓th,min←"); 
                →002092TEXT(w↓th← &amp; " ≥ " &amp; w↓th,min←); 
                →002093TEXT("PASS - Web Weld size exceeds minimum required"); 
            } ELSE { 
                →002094TEXT("w↓th← &lt; w↓th,min←"); 
                →002095TEXT(w↓th← &amp; " &lt; " &amp; w↓th,min←); 
                →002096TEXT("FAIL - Web Weld size must be increased"); 
            } 
        } 
        CASE 3 :  { 
            →002078TEXT("Minimmum Weld Size (Table J2.4)"); 
            →001917TEXT("Column Wall Weld"); 
            →001918TEXT("t↓HSS← = " &amp; t↓HSS←); 
            IF(t↓HSS← &lt;= PhysConst(0.25, "in")) { 
                w↓tf,min← →001919= PhysConst(0.125, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.25, "in") &amp;&amp; t↓HSS← &lt;= PhysConst(0.5, "in")) { 
                w↓tf,min← →001920= PhysConst(0.1875, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.50, "in") &amp;&amp; t↓HSS← &lt;= PhysConst(0.75, "in")) { 
                w↓tf,min← →001921= PhysConst(0.25, "in"); 
            } 
            IF(t↓HSS← &gt; PhysConst(0.75, "in")) { 
                w↓tf,min← →001922= PhysConst(0.3125, "in"); 
            } 
        } 
    } 
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" NAD="" LicenceID="50320" Autor="" Autor2="" Version="1" EWNSource="" Icon="/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCABkAGQDASIAAhEBAxEB/8QAHQAAAgMAAwEBAAAAAAAAAAAAAAoICQsEBgcFA//EADQQAAICAgEEAgECAgkFAQAAAAMEAgUBBgcACBMUCRIVChEWJBchJjEzNlNjcSIlQkSDI//EAB0BAAICAwEBAQAAAAAAAAAAAAAIBgkFBwoDBAH/xAAvEQACAgIBAwMDAwQCAwAAAAABAgMEBQYRAAcSCBMhCRQiFRYxIzJRcRhCJEFS/9oADAMBAAIRAxEAPwB/jo6Ojo6Ojo68b575/wCJe2XjHYOXuadxrNL0nXgzyRx4w/euLPK7LKWua3W/eLd/s1tFQ8KqkroGdbyIxcDgsuycKd3ed+oB7j+Y2LnTO2tYPb9x5kxVB7VWMSt+U79UZEZQcHsTiSYNRCcyrJABo6pW5Gi967VvIkZRjDds3vXtOiU5Wyz3JUL18bUUTXZl5ID+BZI4IiwIE1iSJGKssZd1K9Mp6fvSh3i9SN+VNCwkNbXKNlauY3XYJpMdrGMm4R3rC0kNi1k8gkUkcjY7EVL1qJJYZbaVa8qz9OEcz9yfAfbvTM33N3Luh8apLV8bTwbNsCSt07XzeFWxZqNbGQ2w3cJPmGpiNPVvT82cw+n7wn9azt9+e/46dItW6qv3vfuQ5KGTF7+hcd2rVUyNtAb0mVHtmY1cZwpzJGvcjjEWIPxIMS5gDIzFDC5u7nY7R282G3s766sjZZsbi5fatLSwYliMZMO2DxTttGzGMY5KcxCZxGOMy/bGOubVantV8vNyj1nYLlQZpLEaqqaxsVxsQgMs15nTWMKJoiMEkhSlgkYFHPMcRnHOdD5Hv1sNqUphcJj6kfPKiybOSssq+XJJianGoYFCVET+BBHuMCCLYNP+kz2fwFBLPc/uht2w2yoWV8IuF0rDRTSCApGoyEOyXZzG62I1la/W+5SWNvtYHiId4lb9RB8fR2FwFDzumIxhCI4zxtVzXVGQkYTZYinuTTcggjnJSxVVZYzCMsAXMXMRylPxP8wXx28wTqk6LuO1zWbu2sIVa9DyNU7Hx+6N01gvXqCM/stSlrsoOzcUOBha7YWisYsmTLlQtBI5/dvwrzJr/r/nuJeTaT2/N6n5fQ9prfa9fxef1/dqg+bw+YPm8f28flF9/r5Ifv5yyswmwwm4uZVtUxVmlWREAwswAkhHXYAWMChMEsZDKIkYkGSMoTjiWM4x8kXfHdacqm/i8TLETwY5KV2o5/g/hILZCtx/9RuPy58T8cSG99LP0xbFSkTUd87gUryKXjuU9n1fYayf3oDZpnX0eSL3OORFdqMWj8BKvLc6tFPdU+w1y9xQW1ZeVLnm9S0p31bOua9c5VT+u6kU6x/AyAy5vEWXjOEoZ/Ug5xx9LrMz7Ze+Puf7RbQbnCPKuxa9SzsEbGz0Zt92x0K9NXslbXjbaxNoak4SOcuWppSSYdCUyjZzJsMLlb5+PX5weGu7GwQ4z5uU13gXmhyDMKgbF03nj3djKQYbPCmvbhUK+sWEkYD9Gjv7tti0bA4sg8ZqVeo7t3UO7uu7NJDRthsJlZSqR1rcqvVsyseBHVuhY0Z2JASKwkEjsfCJZWAJrs9RX07O8vY6nkNowDRd0dBoLNZt5rX6UtbO4ahEvm1vPaw01uzFXhRZXs3sTay9GrBEbV+ajGxSO9Po6OjrbHVfvR0dHR0dHR1HLuq7oOMe0HhnYuauVn5q0NRMdbVV4Pt7ux7M6s2xU67XywMsRtPxRaJkkoEyNZZiYAONYXSZkb0hz82vfXd9y/cVZ8TavYWaHEXDZia8lXgesBVO33fkhYG2xuqfRr2wOTiwFXImABHEaKAPWOWqDcWMH7gbfFpuAmvjxfIWGNXFwOpZZLbqW9yQAj+lXQGWTlh5cKg5ZwC0fpE9Ot71J93cZqDmerqWIiXP7zk4JFhlqa9WnijarVkZZPHIZaw8ePpFYpDE0slp1WGtK6Qc75O+Tlrvl5asOQOQLAyWtpGMto2jLGJGm1amiQuFQhVwUgpOyEScjnlMxMEMxKTDLLLzz0QdcrE7vYaGmsLlLXULe6q6x7YLKJZ11Em+8BVm5fgDEjTSrAlm61EMclkABMDxmecY6kl2jdnvL/eZyFa6FxPTON51zWbPbNpvY1b9hW0NUgAklhs5THmM7O5bh6VJU4MN+4PBkVUB5pf1CeKcn8Ybpw7ultoO/VP4jY6j1iGCNld1NtN1cbaFhXvqEKs4k4sWBITHPBQFwZJ0Ktiq2ouleRGbyA/c2VitW4MjdlRshOH9mzYiKtLAJFI8AqkIip4KqqyRfMTBOnHTZO2Gosex2gZDA6/lNN1qjYh1DFvX/UcJiL6yxUMo9OZXFmSWVDasS2PuJpZZobWQBW/BJYeN7Ofhi+PfQNA1jdMVY+6C2vlkNgrOUdysGo1JvrJ+SrOr6rQvqVVGMMW4COtZyubhOzrAEM6tYpeMFxGq6Ho2iLkT0jTNU01QwUljK6rrtPry5V62BRVy5AVCaYphQEcw0hSjkasDFgCI4knjKMHxR/LNs3Zhs0OM+Y7a82jttvprwnX4Fm0d42dHk/lv9bXAsS0ZGyEgF3qnB2FjrV6SayqmcCfr3qNS23Wd81mk3LTbuv2PV9jrwWlJd1Z8MJWCTGP3gUU8ftKE4SxMLC5oDZUZGZVoIWQlFBwe2ma1PNYaNtfxtDEW6qJHkMbDFEtqvJ+SrK8oBntQTEOYrUru7gskpEodeucX1t9tPUF2z7k24e8G6bV3DwOfs2reobrkbt+bB5imDBNLRr49mXGYPJ4wGrHkcFRr16tZkgnoJJQkqzN+1/rGt7WmKu2nXqPZK8LMHQo39ShcJicGIwBtiVsV2QDZGBlgMDxhgsRHMOM8QLPEoa8//HT2pdw1Y8DbOLdZRuT+sVO5r6lWQkT1ybK9aEVMTGK9KsGwx7lgvrsdesbKUnRyuAYt7abk5ujqf3MfRyETw3ada1FIPF0nhSQEcEf9lJB4JAIII5PB6UfXtu2nUr1fJaxsOZwN6pJ7lezisjapPG/krkgQSorBnRGZXVkcopZT4jhI/vp+Cnk/gutt+QuDnIbpo9bOZWKxh0hX4K5hhSsWT+683g3liwmVppW1zjXht3dXR1e1O2eV0nF/P+401j/7tVbVTv8Avo2NbYon/wDkym6myL/bOucf/gSH9WrU6knZJt11ios/XvrHSeRdAJpN1NoUwNKNqngQDKzICTCcBoTEYU5jJCUJZxlVn5mPi2cfUrObOFFUjnSM7W5oyZFG9txnWlYrakZ45cM2x6lass2dKsD5OwZMljr18zh4FJZ3C6dxu0VepXmzmqxSRiEe7axUY8wR5rzJT/JWj8FJb2VDliAIwGPzcz6MPqJ5bPZjGdrO/mQqW/1NxRwe/XWFd0b2JvClsh9qWO4bUwihGSmev7IkeS5JJGpKd8+FD5Y7XlRnWOz3uIvDWvIGQ2CnE/INqZBc2xJVyjtqHTLckYIgK7XVas0NdzGBbNqCqiGM2eWMfiGc+spKkubTXLmo2GjdNW3VDZoXNPYrZxFivtKtoT1e6vKUZRwZVsATizKMsYIOOcxzj+rrRj+MfvTB3y9q+qcoW5qkPJ9AyzpfLtNVDAkujuVTEZI2ilVCxsWUKnZ6k6F3X4YkGHmYfTWHgaEsRkPZvfps5XfWsvO02Tx8AloWpW8pLlCPwjeKVmPlJZqEqfcYs80D+TflA7vp76kvpIxnazMVe9fbrGQ4/R9uyjUNrwVGARU9a2u4Z7Ve9QghUQ1MJn0SdBUjjirYzKV/ZhPs5SpWrWFdHR0db26ql6hF8inOQO3ztG5a32c2Rskom6NCQK4FmIp3kHm2691Y5wSitdVFdZUcGFyDOs5ZKGi1WDgS3r82mysHLexftbA3sP2brVg8x4xC87jpyMsm8QICCLymLOfjCMYofb6jhCGMRw6z+or2pxLtX1bVa+88QLfZlWdj18TYp+wmK81w+v2D9dmU5i+r9ZaDqbLIhFz4LpJRjIS2gCJmccap/HfIeh6P5vW/jLc9X1T2PJ4fB/EV4jUeby+s54vF7n38nqNfT6/b1j/t4pKX3yv2L214/DpyYqdGExL5cK9i/K3kSOfHkCONPI/kPyX4AHPQl9K3UsTq3YDcu49kIt3Y9qya35vZBmr4fU8fC0KLIVEhWV7lywYUPtMFgkBZ2IR8z4R+1Wu7buyXTNndRZByF3BDT5X3Q1hXWNU+tXPrTFo2vTTsS+TC1RrhI2AmIKpwbcvrBgcTrEWYJ+vyWfGhofdhpVvstBQBDvqAbe0XlWpELaKXbycxH2zWlE2q8tjZFLBZva9Km2Kt3+KKrwoB3RBFq1tqpaeu16nqaCnX9Opo6xCnq1PMdj1a6sVEkiv52inZP4FgCF5mDGOT6/cxSElKefpdMdFqmI/bNXV7FWGbH16MNQoUHBeNB52F8uSJZJvOdn/uMjlieST1S7d7/wDcM97s931xGdyGM3DMbRkNhWzHYYNHWtWH+2w8ntlUfH08aIMVFWC+ylKCOBUEahest/mvg3kHgHcS6ZyDXBA3IOG6u4rSMNa/sCGc4jl+ksGFUyshGXOQsBYVVdUNjxtqAlIf3tW+KP5Ztm7MNmhxnzHbXm0dtt9NeE6/As2jvGzo8n8t/ra4FiWjI2QkAu9U4OwsdavSTWVUzgT9ezD8jvxxaN3S6NfXFPQ/2l/mbh5GnWH+YxceOWZ7hp8MR/zL/fLYNfjj1d2V8pBi/iX7R2BE7nTgvee3/eXNK3VP/Uaob5UZPw+zU/kzANpVmnj/AIG6kTPtVzX2XYj/AIZCq3sWu7D2qz8OZw08poiQmtZIZ4mjc8NTvxqVWWGQELwxH5ePysyxSvfD2c7y9nvX52kyXbXuZi6CbSaajMYVWhr5CG3XXzh2XUrc0c0lDJVGUykwK/8AS97mOfGzX6NfT41LbdZ3zWaTctNu6/Y9X2OvBaUl3VnwwlYJMY/eBRTx+0oThLEwsLmgNlRkZlWghZCUUOxdIOfFH8rmzdjGzQ4z5Lnebf20bfeLmt6gLGXXeLHXcnhZblptbMBDsjZORNnY9cWcWWsFlnHkUzbAaE2Hu9J3bUeSdR13fdC2Kp23TNtqU73W9konBP1NxUviwZV1NoOcwmOcM/WcJfUoCxIA4xHEQcWT0fecZuuNFisVrZKuqjJYxn8pazkkCSMkKZqspHMUyr8c+3KElVl6pQ9UvpY3j0xbo2HzSTZnTMvNNJpe8Q1vZo52rGqSSU7cSSTrjM9QVxHkMZNL5N4i7SaxQminPaOutbjqdPvWrX2oX4fPU7DWM1rf1GqQ6/nh/wDg+l7qziwbOsZiGxq2irH9KxVVbgPJAQ67L0dTVlV1ZHAZXUqykchlYEEEf+wQSCP8dLFDNLWmisQSNFPBLHNDKh8XilicPHIjD5DI6hlI/ggHrN6+STt1J26dz27Ui34/8Ls1rd3Sg6wkpoo3al29U7fXKQKJQ8a+OwqNWlRjKCa4aa2rkAjwZBoYbKf05PP9to/dNvvb+XHsazzpoxLuECHLj8dt3FYLS4rm1QxSaj/Pa7cbMq/jLVYI/grSHO2dCvUl7T+pG4/TQ23ije1QMnPYlFGxdO2LxIOX1O9UQr0kx+Ccln6/i1FyZTieKu4o3+zqwHgpypS+NTZltQ7+e0u+duK+gRX5t0xN+1tGUk69avuX8Ur0WWrHMVF4NKWBlImJOExzPCS5BsYFOKb2Iv2Z3driofbgTO1CoDBB9nlSkNtD5AoiGOzYUKOVRPFQyleV6TcLf/5LfTszDbGpt5Wx2rzyyySRNZk/cOhJPk9ftKIZUsWLKWsJiJpJW9uW1YEsjwzRzeM2lB0dHR05XXNb0tD+oqp7EHE9DflX+tTZi02nSb8wJeexo9q2B20X8ES5ZH6q2w05fMYIwH9z6LlMRdqAFNuA7BOo514WtbA3roVnLPHNg8x4yl8CaW4UzLJvECBTF8QRTn4wjIWf1+o4TnnEcu9/OlxTYckdoVg6mlCylrQ7w6iS2ITu83Ifwu5InqRGUOKcMVuh3aVjABg2jS78aysEwawJkCGKzLCbC7ibBlW1TCZVaWKQDCzACRKBhc4pQKEwSxiQRRyiQZIxnCWJYxnCf954no71XulCYnqUp4yf+7QTPJKgPAHwzqP55AYc/wCT0Z/TQv1dq9KuZ1lbEceQg2LZsXcWM/NaDJ4unRx87qWdwZIa0jklfF3jcoOOUTV66Oox9mnP9Z3PdsfDXNKL3u2G36NQm2yBFk69pLdVa5dba1WqtFlsFX97kbLyCuC/UlO5Wugj6ra8pSc6bmrZhu1q9yu4eC1BFYhcccNFMiyRt8Ej5Vgfgn/fXPDncLkdbzeX17L12qZXB5O9iMlWcMGgvY6zLUtREOqt+E8LqCVUkAHgc9HVS3yO/HFo3dLo19cU9D/aX+ZuHkadYf5jFx45ZnuGnwxH/Mv98tg1+OPV3ZXykGL+JftHYLaejr5criqOZoz4/IQJPWnRkdHUNx5AjyXkHgjn/RHweQes5oe+bP222fF7dqOUs4rM4mzFZr2K8rxeZikWQRye2ylkYqD/ACGVgHQhgD1lv838JbrwLvlro25omxJU0pU1+JJwFJtNXIYDgtaNtoIxOBwJkIXxrkPmrsos1bc8Nqljizf4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbRoD5Hfji0bul0a+uKeh/tL/M3DyNOsP8xi48csz3DT4Yj/AJl/vlsGvxx6u7K+UgxfxL9o7AidzpwXvPb/ALy5pW6p/wCo1Q3yoyfh9mp/JmAbSrNPH/A3UiZ9qua+y7Ef8MhVD2TWtg7W5+HM4aeUUxMzVLaqzRiJ2/KjdQkiWCReI2Dn8zxyVlEUjdE/ZTvb2h9efaPJds+5WLpPskmPijz+AmkihuPdrQf0tp1eysaNQylOb3LcRqoTXUyFUnx736kGnlpO7ajyTqOu77oWxVO26ZttSne63slE4J+puKl8WDKuptBzmExzhn6zhL6lAWJAHGI4iDj2jpBb4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbR8HSd21HknUdd33Qtiqdt0zbalO91vZKJwT9TcVL4sGVdTaDnMJjnDP1nCX1KAsSAOMRxEHFldG3nG7tjRYrla2SrKi5LGs/MleQ/AliJ4MtSUgmKUDkHmKULIpBpM9VHpX3X0w7q2Iy6zZnSszNYl0rdYq5jqZinGfNqF9U8o8fsOPjZFyGPZ/F18btJpqUyOqvv6ky4XVqOKKbJA+9bs6myIBUhsEkhVf0uZdYWaKuWKBgtvVYpFXOq6ddphUciolsRZXH7KNIY5I7wO2HSFXw1Zdi544sTlYsBIzBJeG5VDTjMVhyHJowlFzyWVyZYbLGBAK2oIk2RWt/qDee/6Q+66v4prLb8lR8WUohHh+I9H07hkcVG6j3WALNv/ibdfZGPPAU1S/m/2FZWSoUAVMcPhI4XuOXfkM4bsVE2SUfEkrnlbZbGNJ+Yrq4Gu1jK9HCwJNlUFWSx2awqEqyxlI51bGYGFkzzBKQlx20psHd2OnWVrEZzeLx7hSOGWCaH7sqyuQEjHvEuCpARm4BHJuj9PQsdovp3W9kzUsOJsjtjvW3V3njZjFNk8dkF15J4JKys1m4642OOBknEjWIY/NlbwTQW6Ojo6cbrm368v5q44X5c4r3bjpmQcR2ammsvFvI8IFsE2AWdWva4IjZYnTM2SSi9yKCLBzVRHBLxieYyQzS+5zhO47e+bd64uuE2UfwdswSsA6D1HIVDJiySE2gSws3UGU/oVA6lozi0GVScnQhLPMMagnS4fze/Hj/S5q+eeuOae2a22iHZuM19HWU+FZWLuKgR6976HrjzW3A60nlnmYmnX7hGwlJ153d1amWnu8Wny7FhI8lRiMuSw/nIqKOXmpv8zxKP55BAkUKCWdVB8U8mFjv04PUbS7N90bembTfWlpXcj7anPZmYJWxuw1+UxWRmY8KI2V3pTPJIiRV55pFEs4hhkgr8BvyKV/E2zOdnHMew19Pxzu1hY7DxDfPpzgOg5CeyqS51i1u4HivXa7siKh7NFixVwohsC7EC2Kw7nEYuTdZRn/caax/92qtqp3/fRsa2xRP/APJlN1NkX+2dc4//AAJD+pvn4tfnK1/cavTO3rvQ2INLvoTKatqPPFwwaNXumD5WU15Lkc8U5qU2wQlgyNlvlk+nV2spVTd5ANgW8vjQ7tF3JrQVodT2G0tZoCIsNesMViMZbgY2xK7cRPEx4ps/jEYv/GLI0cKysj9RL0T5zKZvI+oHs9hJczDlY2v9ydWw8AmvxXI4vOXdMPRrRed+tehT3djgg966l3nNJHZgt5GSgz10dcZJ1OyTUsa5tZ+vfWA6i8kcTSbqbQoHVbUaBMgGVmQEgYBwzmIwpwIOcoSxnPJ6ZIEEcg8g/II/gj/PVKTKysVYFWUlWVgQysDwQQfkEH4IPyD8Ho6qW+R344tG7pdGvrinof7S/wAzcPI06w/zGLjxyzPcNPhiP+Zf75bBr8ceruyvlIMX8S/aOwW09HWOyuKo5mjPj8hAk9adGR0dQ3HkCPJeQeCOf9EfB5B6mGh75s/bbZ8Xt2o5SziszibMVmvYryvF5mKRZBHJ7bKWRioP8hlYB0IYA9ZcvOnBe89v+8uaVuqf+o1Q3yoyfh9mp/JmAbSrNPH/AAN1ImfarmvsuxH/AAyFnl8fHyvc39idPtfHaXk3jiLaFnmq7VrI0Ttce7c1+0pbXo+XczSXk9+0429A8MtE89Ja7MmVtV1W4Yr+a3hvtDW4iud35W3PUNH22znl2o1TLeI7nsO1P+ytX7XodLVpWt2OwM8CYtyLmpnq9tWjdtbhlK3UaLeI+dJntGKv9stqVsJlljlKSS1mgmVrMNaU+LV7sPLH2pAeIxMOZAhYcvEsrdK/YnfdS9cnYOev3R7fyW6SWamPzaZTGz18NkszRX3osxrWR8IVW/TkXyttjJPCobKROVq5CTHx9z5E3i45K3nat8vp+S22q6ct2/8ApVj4/YJnwL/ySiC0/VWiFbyjTX8/i80xRISfTj/6eTtHPxVwbuHctttJ6m2c5/jqzT2242IHlONagxXY4WAYUKxms2eznX3I7VFhubOUQVrA0GKg8GlyfjU+Pveu/jm4GtKrO03D+l+vcctb/ILQ0KmuJLOK/W6xoYJBd2zYzRlivpsNJHlVKXFnl1MVfk+NEvXNeptS16i1TXK8NTr2s01Xr1DVLZJlespqVEFbV16+SzIXIU0VgLCyQhCZGOP3nKX7yzP+yepWbuRsbplI3MUTTx4x5l/K3dseaXLq+QHKwqzwrIOVeaaUKQ8DcKP9T71BYPWtMw/pk0W1WS3dixVzeKuNmAi1/WsOKs+s6vMImYRzZKaCtkpqblJq+Nx2PeVWr5WPy+z0dHR0z3VF/R1xnUk7JNuusVFn699Y6TyLoBNJuptCmBpRtU8CAZWZASYTgNCYjCnMZIShLOM8no6CAQQRyD8EH+CP8Hr9VmVgykqykMrKSGVgeQQR8gg/II+QfkdKq/Kv8Mrmy3rvN3bagBc7/uO7PTni+RQYk02HmJ3TCSlgyvlZZUn47b3A5TOsPFZur6jyyOyXipOz6psul3LmvbZR2evXSBmF2q61UMmxAirTCJ5QiWOInDFtVkEWQSKuUgCYEWeI5z1qwdVzd1nxd9qnddVkhsuj1mq7IMOA12ya3XjUnXY+yMI+qmiesOgEIVTFHX0FnR1dhaNkstlR2HMcrE0RvfZuvmp58rrskNHITFpJ6UvKU7Mp45ZGUN7EjnlmIXwJJJBJ56tb9KX1J8z2wxmK0HvJTyO16fj44aWM2Sj42djwlKMyBYbEU0kX6tUroY44Y2lFmONEiikWNApSI7Xfkr7ye0FOdJw7y7Zw06f7ZxoO5Kr7ppS0vLXSISrpb3DGKExl60KJTUDFWXKZTwjOBZwMO7Hjj9TXtC8GQ8u9qtBbFyGMk7DjjkWx12EWIsG+4mafZ6DaJECVQgMRYFeDIBhQ0srMisYRq/Fuev07fcFrjthZ8K7RrO1U8U3reVVYvHyOsHF9ksKdOwgrDaLpxWohjAllNKdYeYGmJZt1uzYWqa49m+JP5DNbhM8O2PkTYlBhCUrGs1ZLEkCGYyvhaFYfCd0yYecjMaSdYwuJcuDSYxELXr6wrt3h0zipVjzv2sQ4jhWqMzSEalgPYSSG2IY/yJIjWEj4LAEDh6sxF9OD1MFtizlrtYM7kCXuZCfOSdtNmNyX2WYZWxUyOvNkrv8ATREkuS5JX5kSvJIJZPO9Fn9TlosF2JJ9oW2nbiEslQM8w06q5mMQlkAmGhcfOFWCQuIwKwNNogYZkSCx5RwKUDebf1EfeLyRRP0XGur8e8Ge+s0jK910DW17IBV5MQDmVf2iB007ZU8CmqbNGsU9ATR4GWddEhYpV1UXxm9/my/jp0vaZzO2tbLQdrrImqHSp20zK5dA2K6eItU5WaW+pVDydiJvyBgtMpDhhOY/DHwG9/3KX4t3a9Y0zhSjsPd8znI+1qkuEPU/KiH7OsaoPYbeHtN16wg+aC/2VtUbAflVwzkHu2y96c/xThjzyCRSpNTCpjAQ5QFmurTrmLjyX8/uIwqsW5CknrFQ9k/pk9pS2xZK92mtSU5VmSPP9zLO7uJK6TSCKHV32PLpkC3syn7c4a480qLEEd/bj6qI5D5I33lnbLPe+S9tvN33C6nAlrsexPmsbR4kMft92GTZzKc5yzMxZf1SMyU7RszYOYpLCOwH4ruf++baat0NZbcY8ICZwTY+YNh12zzXHQECDB1NGWZGgltt4X2EACXFaLJrQfjYHYIuk2LDJPa5+ny7U+IC0ex86Wtt3D7Ygsuw1UWgja1x1i4MnML4568g+V69qU2JCLTBtXxfYo2GLdZ8LStfVX4JJJ1qaldXKLIV6CwEkUUgCVTSTVFACqiioIDAsssAcAgAGEBBFCAxwjCOMYk2qdkb1m0Mnutn8TKszYyCw1izbdiXk/ULytxGGbgOK0k0svLH34SAW0f3/wDqh6vhcG+j+mHBkSRUpcZBu+Uw8OIwmArxIteodQ1aaLyttDCGNeTNUsdRpGOFRichG7CHxft07dOJe1XiXWeF+F9ZDrWma0HMs5lkbFzsVywMUbXatqtYiCW62a6KEZbGxKMY4DGtXVyyFPX1tan7j0dHTKQQQVYIq1aKOCvBGkMEEKLHFFFGoVI40UBURFAVVUAAAADqk7LZbJ57J5DNZrIXMtl8tcsZDJ5PI2Jbd7IXrcrT2rly1OzzWLFiZ3lmmldnd2LMST0dHR0devWP6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6//Z">
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
      <Style Key="Limit State Body 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body Align" X="5" Y="0" Hor="1" Ver="4" SpX="16" SpY="2" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Result" X="5" Y="0" Hor="1" Ver="4" SpX="15" SpY="5" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" />
      <Style Key="Title" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Limit State Title" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Limit State Body Label" X="350" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Limit State Body - Wrap dy 25" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Outcome" X="350" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Outcome Text dy 12" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" />
      <Style Key="Limit State Body - dy 8 " X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="8" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Title2" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Label Italics" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
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
      <Variable Name="DesignMethod" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_DesignMethod">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="t↓w←" ESA_ID="" Type="Double" Value="11.303e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓w←">
          <ENU>Column Web Thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓f←" ESA_ID="" Type="Double" Value="11.303e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓f←">
          <ENU>Column Flange Thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="P↓u←" ESA_ID="" Type="Double" Value="-222411.1" Precision="2">
        <Description TranslateID="VARIABLE_P↓u←">
          <ENU>Design Axial Load</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="M↓u←" ESA_ID="" Type="Double" Value="56492.4" Precision="2">
        <Description TranslateID="VARIABLE_M↓u←">
          <ENU>Design Moment</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="112.9848" Dim="kip∙in" />
      </Variable>
      <Variable Name="b↓f←" ESA_ID="" Type="Double" Value="207.264e-3" Precision="2">
        <Description TranslateID="VARIABLE_b↓f←">
          <ENU>Column Flange Width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="d" ESA_ID="" Type="Double" Value="203.708e-3" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>Column Depth</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="Ω↓v←" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_Ω↓v←">
          <ENU>Weld Shear Safety Factor</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕ↓v←" ESA_ID="" Type="Double" Value="750e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓v←">
          <ENU>Weld Shear Reduction Coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="F↓y←" ESA_ID="" Type="Double" Value="248.2113e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓y←">
          <ENU>Base Plate Yield Strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="P↓tf←" ESA_ID="" Type="Double" Value="581485.9" Precision="3">
        <Description TranslateID="VARIABLE_P↓tf←">
          <ENU>Flange Tension Capacity</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="A" ESA_ID="" Type="Double" Value="22.5806e-3" Precision="2">
        <Description TranslateID="VARIABLE_A">
          <ENU>Area of Column</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Name="F↓tf←" ESA_ID="" Type="Double" Value="316686.7" Precision="3">
        <Description TranslateID="VARIABLE_F↓tf←">
          <ENU>Flange Force in Tension</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="F↓fc←" ESA_ID="" Type="Double" Value="316686.7" Precision="3">
        <Description TranslateID="VARIABLE_F↓fc←">
          <ENU>Critical Flange Force</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="R↓wf←" ESA_ID="" Type="Double" Value="808035.1" Precision="3">
        <Description TranslateID="VARIABLE_R↓wf←">
          <ENU>Flange Weld Force (per inch)</ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="175126.8" Dim="kip/in" />
      </Variable>
      <Variable Name="F↓EXX←" ESA_ID="" Type="Double" Value="482.6331e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓EXX←">
          <ENU>Weld Electrode Strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="θ" ESA_ID="" Type="Double" Value="90" Precision="2">
        <Description TranslateID="VARIABLE_θ">
          <ENU>Angle of Load</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Name="V↓u←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_V↓u←">
          <ENU>Shear Load</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="R↓ww←" ESA_ID="" Type="Double" Value="184214.8" Precision="3">
        <Description TranslateID="VARIABLE_R↓ww←">
          <ENU>Web Weld Force</ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="175126.8" Dim="kip/in" />
      </Variable>
      <Variable Name="ϕR↓nf←" ESA_ID="" Type="Double" Value="325.7773e6" Precision="3">
        <Description TranslateID="VARIABLE_ϕR↓nf←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="ϕR↓nf,l←" ESA_ID="" Type="Double" Value="1.828477e6" Precision="3">
        <Description TranslateID="VARIABLE_ϕR↓nf,l←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="175126.8" Dim="kip/in" />
      </Variable>
      <Variable Name="ϕR↓nw←" ESA_ID="" Type="Double" Value="325.7773e6" Precision="3">
        <Description TranslateID="VARIABLE_ϕR↓nw←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="ϕR↓nw,l←" ESA_ID="" Type="Double" Value="1.828477e6" Precision="3">
        <Description TranslateID="VARIABLE_ϕR↓nw,l←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="175126.8" Dim="kip/in" />
      </Variable>
      <Variable Name="w↓tf←" ESA_ID="" Type="Double" Value="7.9375e-3" Precision="3">
        <Description TranslateID="VARIABLE_w↓tf←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="w↓tw←" ESA_ID="" Type="Double" Value="7.9375e-3" Precision="3">
        <Description TranslateID="VARIABLE_w↓tw←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="w↓tf,min←" ESA_ID="" Type="Double" Value="4.7625e-3" Precision="3">
        <Description TranslateID="VARIABLE_w↓tf,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="w↓tw,min←" ESA_ID="" Type="Double" Value="4.7625e-3" Precision="3">
        <Description TranslateID="VARIABLE_w↓tw,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="F↓tw←" ESA_ID="" Type="Double" Value="176261.4" Precision="3">
        <Description TranslateID="VARIABLE_F↓tw←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕR↓nw,t←" ESA_ID="" Type="Double" Value="1.828477e6" Precision="2">
        <Description TranslateID="VARIABLE_ϕR↓nw,t←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="175126.8" Dim="kip/in" />
      </Variable>
      <Variable Name="R↓wt←" ESA_ID="" Type="Double" Value="486635.8" Precision="3">
        <Description TranslateID="VARIABLE_R↓wt←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="175126.8" Dim="kip/in" />
      </Variable>
      <Variable Name="b↓eff←" ESA_ID="" Type="Double" Value="253.492e-3" Precision="2">
        <Description TranslateID="VARIABLE_b↓eff←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="R↓nw/←Ω" ESA_ID="" Type="Double" Value="217.1849e6" Precision="2">
        <Description TranslateID="VARIABLE_R↓nw/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="R↓nw,l/←Ω" ESA_ID="" Type="Double" Value="1.218985e6" Precision="2">
        <Description TranslateID="VARIABLE_R↓nw,l/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="175126.8" Dim="kip/in" />
      </Variable>
      <Variable Name="R↓nf/←Ω" ESA_ID="" Type="Double" Value="217.1849e6" Precision="2">
        <Description TranslateID="VARIABLE_R↓nf/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="R↓nf,l/←Ω" ESA_ID="" Type="Double" Value="1.218985e6" Precision="2">
        <Description TranslateID="VARIABLE_R↓nf,l/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="175126.8" Dim="kip/in" />
      </Variable>
      <Variable Name="R↓nw,t/←Ω" ESA_ID="" Type="Double" Value="1.218985e6" Precision="2">
        <Description TranslateID="VARIABLE_R↓nw,t/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="175126.8" Dim="kip/in" />
      </Variable>
      <Variable Name="t↓HSS←" ESA_ID="" Type="Double" Value="6.0706e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓HSS←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="FormCode" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_FormCode">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="b↓c←" ESA_ID="" Type="Double" Value="152.4e-3" Precision="2">
        <Description TranslateID="VARIABLE_b↓c←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="h↓c←" ESA_ID="" Type="Double" Value="152.4e-3" Precision="2">
        <Description TranslateID="VARIABLE_h↓c←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="h↓cf←" ESA_ID="" Type="Double" Value="436.5625e-3" Precision="2">
        <Description TranslateID="VARIABLE_h↓cf←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="b↓cf←" ESA_ID="" Type="Double" Value="233.3625e-3" Precision="2">
        <Description TranslateID="VARIABLE_b↓cf←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="w↓tb←" ESA_ID="" Type="Double" Value="7.9375e-3" Precision="2">
        <Description TranslateID="VARIABLE_w↓tb←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="w↓tb,min←" ESA_ID="" Type="Double" Value="3.175e-3" Precision="2">
        <Description TranslateID="VARIABLE_w↓tb,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="w↓th,min←" ESA_ID="" Type="Double" Value="3.175e-3" Precision="2">
        <Description TranslateID="VARIABLE_w↓th,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="w↓th←" ESA_ID="" Type="Double" Value="7.9375e-3" Precision="2">
        <Description TranslateID="VARIABLE_w↓th←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
    </Variables>
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Layout 0</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_1">
          <ENU>Layout 1</ENU>
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
      <VC ID="001683">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000010">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000011">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000012">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000013">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000014">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000015">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001676">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001677">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001678">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001679">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001680">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001681">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001682">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001684">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000023">
        <Set Vis="1" Prev="1684" Style="2" StyleName="Limit State Body 2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000024">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000025">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001685">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001686">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001687">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001688">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001689">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001690">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001691">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001707">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000001">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000002">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000003">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000004">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000005">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000007">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001692">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001693">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001694">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001695">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001696">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001697">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001698">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001706">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000018">
        <Set Vis="1" Prev="1706" Style="2" StyleName="Limit State Body 2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000019">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000020">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001699">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001700">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001701">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001702">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001703">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001704">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001705">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001708">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001709">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001710">
        <Set Vis="1" Prev="1709" Style="2" StyleName="Limit State Body 2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001711">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001712">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001713">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001714">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001715">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001716">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001717">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001718">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001719">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001720">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001721">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body 2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001722">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001723">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001724">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001725">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001726">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001727">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001728">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001729">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001730">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001731">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001732">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body 2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001733">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001734">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001735">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001736">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001737">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001738">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001739">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001740">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001741">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001742">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001743">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001744">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001745">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001746">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001747">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001748">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001749">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001750">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001751">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001752">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001753">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001754">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001755">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001756">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001757">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body 2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001758">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001759">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001760">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001761">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001762">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001763">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001764">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001765">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001766">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001767">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001768">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body 2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001769">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001770">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001771">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001772">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001773">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001774">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001775">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001776">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001777">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001778">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001779">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001780">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001781">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001782">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001783">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001784">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001785">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001786">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001787">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001788">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001789">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001790">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001791">
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001792">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001793">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001794">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001795">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001796">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001797">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001798">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001799">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001800">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001801">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001802">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001803">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001804">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001805">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001806">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001807">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001808">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001809">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001810">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001811">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001812">
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001813">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001814">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001815">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001816">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001817">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001818">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001819">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001820">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001821">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001822">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001823">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001824">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001825">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001826">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001827">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001828">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001829">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001830">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001831">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001832">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001833">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001834">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001835">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001836">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001837">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001838">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001839">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001840">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001841">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001842">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001843">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001844">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001845">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001846">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001847">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001848">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001850">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001851">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001849">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001852">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001853">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001854">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001855">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001856">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001857">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001858">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001859">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001860">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001861">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001862">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001863">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001864">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001865">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001866">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001867">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001868">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001869">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001870">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001871">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001872">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001873">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001874">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001875">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001876">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001877">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001878">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001879">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001880">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001881">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001882">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001883">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001884">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001885">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001886">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001887">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001888">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001889">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001890">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001891">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001892">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001893">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001894">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001895">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001896">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001897">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001898">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001899">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001900">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001901">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001902">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001903">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001904">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001905">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001906">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001907">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001908">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001909">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001910">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001911">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001912">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001913">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001914">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001915">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001916">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001917">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001918">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001919">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001920">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001921">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001922">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001923">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001924">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001925">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001926">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001927">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001928">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001929">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001930">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body 2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001931">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001932">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001933">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001934">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001935">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001936">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001937">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001938">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001939">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001940">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001941">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001942">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001943">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001944">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001945">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001946">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001947">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001948">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001949">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001950">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001951">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001952">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001953">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001954">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001955">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001956">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body 2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001957">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001958">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001959">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001960">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001961">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001962">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001963">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001964">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001965">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001966">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001967">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001968">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001969">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001970">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001971">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001972">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001973">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001974">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001975">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001976">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001977">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001978">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001979">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001980">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001981">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001982">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001983">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001984">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001985">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001986">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001987">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001988">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001989">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001990">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001991">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="001992">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001993">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body 2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001994">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001995">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001996">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001997">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001998">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001999">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002000">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002001">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002002">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002003">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002004">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002005">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002006">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002007">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002008">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002009">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002010">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002011">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002012">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002013">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002014">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002015">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002016">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002017">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002018">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002019">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002020">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002021">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002022">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002023">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002024">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002025">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002026">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002027">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002028">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002029">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002030">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002031">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body 2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002032">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002033">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002034">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002035">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002036">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002037">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002038">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002039">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002040">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002041">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002042">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002043">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002044">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002045">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002046">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002047">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002048">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002049">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002050">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002051">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002052">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002053">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002054">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002055">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002056">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002057">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002058">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002059">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002060">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002061">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002062">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002063">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002064">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002065">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002066">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002067">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002068">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002069">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002070">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002071">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002072">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002073">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002074">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002075">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002076">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002077">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002078">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002079">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002080">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002081">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002082">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002083">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002084">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002085">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002086">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002087">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002088">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002089">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002090">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002091">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002092">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002093">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="002094">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002095">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="002096">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Result" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
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
    <Item TranslateID="TEXT_001676">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001677">
      <ENU>"R↓nf,l← ≥ R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001678">
      <ENU>ϕR↓nf,l← &amp; " ≥ " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001679">
      <ENU>"PASS - Flange Weld Strength exceeds force in Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001680">
      <ENU>"R↓nf,l← &lt; R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001681">
      <ENU>ϕR↓nf,l← &amp; " &lt; " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001682">
      <ENU>"FAIL - Force in Flange Weld exceeds Flange Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001683">
      <ENU>"Column Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001684">
      <ENU>"Column Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001685">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001686">
      <ENU>"R↓nw,l← ≥ R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001687">
      <ENU>ϕR↓nw,l← &amp; " ≥ " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001688">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001689">
      <ENU>"R↓nw,l← &lt; R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001690">
      <ENU>ϕR↓nw,l← &amp; " &lt; " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001691">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001707">
      <ENU>"Column Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001692">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001693">
      <ENU>"R↓nf,l/←Ω ≥ R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001694">
      <ENU>R↓nf,l/←Ω &amp; " ≥ " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001695">
      <ENU>"PASS - Flange Weld Strength exceeds force in Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001696">
      <ENU>"R↓nf,l/←Ω &lt; R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001697">
      <ENU>R↓nf,l/←Ω &amp; " &lt; " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001698">
      <ENU>"FAIL - Force in Flange Weld exceeds Flange Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001706">
      <ENU>"Column Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001699">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001700">
      <ENU>"R↓nw,l/←Ω ≥ R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001701">
      <ENU>R↓nw,l/←Ω &amp; " ≥ " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001702">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001703">
      <ENU>"R↓nw,l/←Ω &lt; R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001704">
      <ENU>R↓nw,l/←Ω &amp; " &lt; " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001705">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001709">
      <ENU>"Column Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001713">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001714">
      <ENU>"R↓nw,l← ≥ R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001715">
      <ENU>ϕR↓nw,l← &amp; " ≥ " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001716">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001717">
      <ENU>"R↓nw,l← &lt; R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001718">
      <ENU>ϕR↓nw,l← &amp; " &lt; " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001719">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001720">
      <ENU>"Column Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001724">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001725">
      <ENU>"R↓nw,l/←Ω ≥ R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001726">
      <ENU>R↓nw,l/←Ω &amp; " ≥ " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001727">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001728">
      <ENU>"R↓nw,l/←Ω &lt; R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001729">
      <ENU>R↓nw,l/←Ω &amp; " &lt; " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001730">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001731">
      <ENU>"Column Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001735">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001736">
      <ENU>"R↓nf,l← ≥ R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001737">
      <ENU>R↓nf,l← &amp; " ≥ " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001738">
      <ENU>"PASS - Flange Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001739">
      <ENU>"R↓nf,l← &lt; R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001740">
      <ENU>R↓nf,l← &amp; " &lt; " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001741">
      <ENU>"FAIL - Force in Flange Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001742">
      <ENU>"Column Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001749">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001750">
      <ENU>"R↓nf,l← ≥ R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001751">
      <ENU>R↓nf,l← &amp; " ≥ " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001752">
      <ENU>"PASS - Flange Weld Strength exceeds force in Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001753">
      <ENU>"R↓nf,l← &lt; R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001754">
      <ENU>R↓nf,l← &amp; " &lt; " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001755">
      <ENU>"FAIL - Force in Flange Weld exceeds Flange Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001756">
      <ENU>"Column Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001760">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001761">
      <ENU>"R↓nw,l← ≥ R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001762">
      <ENU>R↓nw,l← &amp; " ≥ " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001763">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001764">
      <ENU>"R↓nw,l← &lt; R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001765">
      <ENU>R↓nw,l← &amp; " &lt; " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001766">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001767">
      <ENU>"Column Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001771">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001772">
      <ENU>"R↓nf,l← ≥ R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001773">
      <ENU>R↓nf,l← &amp; " ≥ " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001774">
      <ENU>"PASS - Flange Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001775">
      <ENU>"R↓nf,l← &lt; R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001776">
      <ENU>R↓nf,l← &amp; " &lt; " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001777">
      <ENU>"FAIL - Force in Flange Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001778">
      <ENU>"Minimmum Weld Size (Table J2.4)"</ENU>
    </Item>
    <Item TranslateID="TEXT_001779">
      <ENU>"w↓tf← ≥ w↓tf,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001780">
      <ENU>w↓tf← &amp; " ≥ " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001781">
      <ENU>"PASS - Flange Weld size exceeds minimum required"</ENU>
    </Item>
    <Item TranslateID="TEXT_001782">
      <ENU>"w↓tf← &lt; w↓tf,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001783">
      <ENU>w↓tf← &amp; " &lt; " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001784">
      <ENU>"FAIL - Flange Weld size must be increased"</ENU>
    </Item>
    <Item TranslateID="TEXT_001785">
      <ENU>"t↓f← = " &amp; t↓f←</ENU>
    </Item>
    <Item TranslateID="TEXT_001786">
      <ENU>"t↓w← = " &amp; t↓w←</ENU>
    </Item>
    <Item TranslateID="TEXT_001787">
      <ENU>"Column Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001793">
      <ENU>"w↓tf,min← = " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001796">
      <ENU>"w↓tf,min← = " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001795">
      <ENU>"w↓tf,min← = " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001794">
      <ENU>"w↓tf,min← = " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001797">
      <ENU>"t↓w← = " &amp; t↓w←</ENU>
    </Item>
    <Item TranslateID="TEXT_001799">
      <ENU>"Column Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001811">
      <ENU>"t↓w← = " &amp; t↓w←</ENU>
    </Item>
    <Item TranslateID="TEXT_001805">
      <ENU>"w↓tw← ≥ w↓tw,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001806">
      <ENU>w↓tw← &amp; " ≥ " &amp; w↓tw,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001807">
      <ENU>"PASS - Web Weld size exceeds minimum required"</ENU>
    </Item>
    <Item TranslateID="TEXT_001808">
      <ENU>"w↓tw← &lt; w↓tw,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001809">
      <ENU>w↓tw← &amp; " &lt; " &amp; w↓tw,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001810">
      <ENU>"FAIL - Web Weld size must be increased"</ENU>
    </Item>
    <Item TranslateID="TEXT_001825">
      <ENU>"Minimmum Weld Size (Table J2.4)"</ENU>
    </Item>
    <Item TranslateID="TEXT_001813">
      <ENU>"Column Wall Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001814">
      <ENU>"t↓f← = " &amp; t↓f←</ENU>
    </Item>
    <Item TranslateID="TEXT_001819">
      <ENU>"w↓tf← ≥ w↓tf,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001820">
      <ENU>w↓tf← &amp; " ≥ " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001821">
      <ENU>"PASS - Flange Weld size exceeds minimum required"</ENU>
    </Item>
    <Item TranslateID="TEXT_001822">
      <ENU>"w↓tf← &lt; w↓tf,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001823">
      <ENU>w↓tf← &amp; " &lt; " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001824">
      <ENU>"FAIL - Flange Weld size must be increased"</ENU>
    </Item>
    <Item TranslateID="TEXT_001826">
      <ENU>"Column Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001833">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001834">
      <ENU>"R↓nf,l← ≥ R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001835">
      <ENU>ϕR↓nf,l← &amp; " ≥ " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001836">
      <ENU>"PASS - Flange Weld Strength exceeds force in Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001837">
      <ENU>"R↓nf,l← &lt; R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001838">
      <ENU>ϕR↓nf,l← &amp; " &lt; " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001839">
      <ENU>"FAIL - Force in Flange Weld exceeds Flange Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001850">
      <ENU>"b↓eff← = " &amp; b↓eff←</ENU>
    </Item>
    <Item TranslateID="TEXT_001842">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001843">
      <ENU>"ϕR↓nw,t← ≥ R↓wt←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001844">
      <ENU>ϕR↓nw,t← &amp; " ≥ " &amp; R↓wt←</ENU>
    </Item>
    <Item TranslateID="TEXT_001845">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001846">
      <ENU>"ϕR↓nw,t← &lt; R↓wt←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001847">
      <ENU>ϕR↓nw,t← &amp; " &lt; " &amp; R↓wt←</ENU>
    </Item>
    <Item TranslateID="TEXT_001848">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001852">
      <ENU>"Column Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001859">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001860">
      <ENU>"R↓nf,l/←Ω ≥ R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001861">
      <ENU>R↓nf,l/←Ω &amp; " ≥ " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001862">
      <ENU>"PASS - Flange Weld Strength exceeds force in Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001863">
      <ENU>"R↓nf,l/←Ω &lt; R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001864">
      <ENU>R↓nf,l/←Ω &amp; " &lt; " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001865">
      <ENU>"FAIL - Force in Flange Weld exceeds Flange Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001866">
      <ENU>"b↓eff← = " &amp; b↓eff←</ENU>
    </Item>
    <Item TranslateID="TEXT_001871">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001872">
      <ENU>"R↓nw,t/←Ω ≥ R↓wt←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001873">
      <ENU>R↓nw,t/←Ω &amp; " ≥ " &amp; R↓wt←</ENU>
    </Item>
    <Item TranslateID="TEXT_001874">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001875">
      <ENU>"R↓nw,t/←Ω &lt; R↓wt←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001876">
      <ENU>R↓nw,t/←Ω &amp; " &lt; " &amp; R↓wt←</ENU>
    </Item>
    <Item TranslateID="TEXT_001877">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001878">
      <ENU>"Column Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001879">
      <ENU>"Use 5/16'' Fillet weld on each flange"</ENU>
    </Item>
    <Item TranslateID="TEXT_001880">
      <ENU>"Column Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001881">
      <ENU>"Use 5/16'' Fillet weld on each flange"</ENU>
    </Item>
    <Item TranslateID="TEXT_001882">
      <ENU>"t↓HSS← = " &amp; t↓HSS←</ENU>
    </Item>
    <Item TranslateID="TEXT_001883">
      <ENU>"t↓HSS← = " &amp; t↓HSS←</ENU>
    </Item>
    <Item TranslateID="TEXT_001896">
      <ENU>"HSS Column Weld along Depth"</ENU>
    </Item>
    <Item TranslateID="TEXT_001909">
      <ENU>"Column Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001910">
      <ENU>"Column Wall Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001911">
      <ENU>"HSS Column Weld along Width"</ENU>
    </Item>
    <Item TranslateID="TEXT_001912">
      <ENU>"t↓HSS← = " &amp; t↓HSS←</ENU>
    </Item>
    <Item TranslateID="TEXT_001917">
      <ENU>"Column Wall Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001918">
      <ENU>"t↓HSS← = " &amp; t↓HSS←</ENU>
    </Item>
    <Item TranslateID="TEXT_001923">
      <ENU>"w↓tf← ≥ w↓tf,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001924">
      <ENU>w↓tf← &amp; " ≥ " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001925">
      <ENU>"PASS - Flange Weld size exceeds minimum required"</ENU>
    </Item>
    <Item TranslateID="TEXT_001926">
      <ENU>"w↓tf← &lt; w↓tf,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001927">
      <ENU>w↓tf← &amp; " &lt; " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_001928">
      <ENU>"FAIL - Flange Weld size must be increased"</ENU>
    </Item>
    <Item TranslateID="TEXT_001929">
      <ENU>"HSS Column Weld along Height"</ENU>
    </Item>
    <Item TranslateID="TEXT_001933">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001934">
      <ENU>"R↓nw,l← ≥ R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001935">
      <ENU>ϕR↓nw,l← &amp; " ≥ " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001936">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001937">
      <ENU>"R↓nw,l← &lt; R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001938">
      <ENU>ϕR↓nw,l← &amp; " &lt; " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001939">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001940">
      <ENU>"HSS Column Weld along Width"</ENU>
    </Item>
    <Item TranslateID="TEXT_001947">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001948">
      <ENU>"R↓nf,l← ≥ R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001949">
      <ENU>ϕR↓nf,l← &amp; " ≥ " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001950">
      <ENU>"PASS - Flange Weld Strength exceeds force in Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001951">
      <ENU>"R↓nf,l← &lt; R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001952">
      <ENU>ϕR↓nf,l← &amp; " &lt; " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001953">
      <ENU>"FAIL - Force in Flange Weld exceeds Flange Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001955">
      <ENU>"HSS Column Weld along Height"</ENU>
    </Item>
    <Item TranslateID="TEXT_001959">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001960">
      <ENU>"R↓nw,l← ≥ R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001961">
      <ENU>ϕR↓nw,l← &amp; " ≥ " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001962">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001963">
      <ENU>"R↓nw,l← &lt; R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001964">
      <ENU>ϕR↓nw,l← &amp; " &lt; " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_001965">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001966">
      <ENU>"b↓eff← = " &amp; b↓eff←</ENU>
    </Item>
    <Item TranslateID="TEXT_001971">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001972">
      <ENU>"ϕR↓nw,t← ≥ R↓wt←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001973">
      <ENU>ϕR↓nw,t← &amp; " ≥ " &amp; R↓wt←</ENU>
    </Item>
    <Item TranslateID="TEXT_001974">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001975">
      <ENU>"ϕR↓nw,t← &lt; R↓wt←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001976">
      <ENU>ϕR↓nw,t← &amp; " &lt; " &amp; R↓wt←</ENU>
    </Item>
    <Item TranslateID="TEXT_001977">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001978">
      <ENU>"HSS Column Weld along Width"</ENU>
    </Item>
    <Item TranslateID="TEXT_001985">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_001986">
      <ENU>"R↓nf,l← ≥ R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001987">
      <ENU>ϕR↓nf,l← &amp; " ≥ " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001988">
      <ENU>"PASS - Flange Weld Strength exceeds force in Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_001989">
      <ENU>"R↓nf,l← &lt; R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001990">
      <ENU>ϕR↓nf,l← &amp; " &lt; " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_001991">
      <ENU>"FAIL - Force in Flange Weld exceeds Flange Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_001992">
      <ENU>"HSS Column Weld along Height"</ENU>
    </Item>
    <Item TranslateID="TEXT_002003">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_002004">
      <ENU>"R↓nw,l/←Ω ≥ R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002005">
      <ENU>R↓nw,l/←Ω &amp; " ≥ " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_002006">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_002007">
      <ENU>"R↓nw,l/←Ω &lt; R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002008">
      <ENU>R↓nw,l/←Ω &amp; " &lt; " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_002009">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_002018">
      <ENU>"HSS Column Weld along Width"</ENU>
    </Item>
    <Item TranslateID="TEXT_002023">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_002024">
      <ENU>"R↓nf,l/←Ω ≥ R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002025">
      <ENU>R↓nf,l/←Ω &amp; " ≥ " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_002026">
      <ENU>"PASS - Flange Weld Strength exceeds force in Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_002027">
      <ENU>"R↓nf,l/←Ω &lt; R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002028">
      <ENU>R↓nf,l/←Ω &amp; " &lt; " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_002029">
      <ENU>"FAIL - Force in Flange Weld exceeds Flange Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_002030">
      <ENU>"HSS Column Weld along Depth"</ENU>
    </Item>
    <Item TranslateID="TEXT_002034">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_002035">
      <ENU>"R↓nw,l← ≥ R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002036">
      <ENU>ϕR↓nw,l← &amp; " ≥ " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_002037">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_002038">
      <ENU>"R↓nw,l← &lt; R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002039">
      <ENU>ϕR↓nw,l← &amp; " &lt; " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_002040">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_002045">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_002046">
      <ENU>"ϕR↓nw,t← ≥ R↓wt←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002047">
      <ENU>ϕR↓nw,t← &amp; " ≥ " &amp; R↓wt←</ENU>
    </Item>
    <Item TranslateID="TEXT_002048">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_002049">
      <ENU>"ϕR↓nw,t← &lt; R↓wt←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002050">
      <ENU>ϕR↓nw,t← &amp; " &lt; " &amp; R↓wt←</ENU>
    </Item>
    <Item TranslateID="TEXT_002051">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_002052">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_002053">
      <ENU>"R↓nf,l/←Ω ≥ R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002054">
      <ENU>R↓nf,l/←Ω &amp; " ≥ " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_002055">
      <ENU>"PASS - Flange Weld Strength exceeds force in Flange Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_002056">
      <ENU>"R↓nf,l/←Ω &lt; R↓wf←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002057">
      <ENU>R↓nf,l/←Ω &amp; " &lt; " &amp; R↓wf←</ENU>
    </Item>
    <Item TranslateID="TEXT_002058">
      <ENU>"FAIL - Force in Flange Weld exceeds Flange Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_002061">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_002062">
      <ENU>"R↓nw,l/←Ω ≥ R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002063">
      <ENU>R↓nw,l/←Ω &amp; " ≥ " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_002064">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_002065">
      <ENU>"R↓nw,l/←Ω &lt; R↓ww←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002066">
      <ENU>R↓nw,l/←Ω &amp; " &lt; " &amp; R↓ww←</ENU>
    </Item>
    <Item TranslateID="TEXT_002067">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_002070">
      <ENU>"Design Verification:"</ENU>
    </Item>
    <Item TranslateID="TEXT_002071">
      <ENU>"R↓nw,t/←Ω ≥ R↓wt←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002072">
      <ENU>R↓nw,t/←Ω &amp; " ≥ " &amp; R↓wt←</ENU>
    </Item>
    <Item TranslateID="TEXT_002073">
      <ENU>"PASS - Web Weld Strength exceeds force in Web Weld"</ENU>
    </Item>
    <Item TranslateID="TEXT_002074">
      <ENU>"R↓nw,t/←Ω &lt; R↓wt←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002075">
      <ENU>R↓nw,t/←Ω &amp; " &lt; " &amp; R↓wt←</ENU>
    </Item>
    <Item TranslateID="TEXT_002076">
      <ENU>"FAIL - Force in Web Weld exceeds Web Weld Strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_002077">
      <ENU>"Minimmum Weld Size (Table J2.4)"</ENU>
    </Item>
    <Item TranslateID="TEXT_002078">
      <ENU>"Minimmum Weld Size (Table J2.4)"</ENU>
    </Item>
    <Item TranslateID="TEXT_002079">
      <ENU>"w↓tb← ≥ w↓tb,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002080">
      <ENU>w↓tf← &amp; " ≥ " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_002081">
      <ENU>"PASS - Flange Weld size exceeds minimum required"</ENU>
    </Item>
    <Item TranslateID="TEXT_002082">
      <ENU>"w↓tb← &lt; w↓tb,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002083">
      <ENU>w↓tb← &amp; " &lt; " &amp; w↓tf,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_002084">
      <ENU>"FAIL - Flange Weld size must be increased"</ENU>
    </Item>
    <Item TranslateID="TEXT_002085">
      <ENU>"HSS Column Weld along Height"</ENU>
    </Item>
    <Item TranslateID="TEXT_002086">
      <ENU>"t↓HSS← = " &amp; t↓w←</ENU>
    </Item>
    <Item TranslateID="TEXT_002091">
      <ENU>"w↓th← ≥ w↓th,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002092">
      <ENU>w↓th← &amp; " ≥ " &amp; w↓th,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_002093">
      <ENU>"PASS - Web Weld size exceeds minimum required"</ENU>
    </Item>
    <Item TranslateID="TEXT_002094">
      <ENU>"w↓th← &lt; w↓th,min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_002095">
      <ENU>w↓th← &amp; " &lt; " &amp; w↓th,min←</ENU>
    </Item>
    <Item TranslateID="TEXT_002096">
      <ENU>"FAIL - Web Weld size must be increased"</ENU>
    </Item>
  </Texts>
</Root>