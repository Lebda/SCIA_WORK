<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="170001" GUID="c166e1c4-b0ae-42fa-8ee0-99ab56dbd87b">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">// This file contains the calculation of beff according to EN 1994-1-1,Article 5.4.1.2 .
bool ValidateInput(object Input) { 
    span →KRS00014_000002= Input.Get("Span"); 
    position_dx →KRS00014_000003= Input.Get("d_x_beff"); 
    b↓0← →KRS00014_000004= Input.Get("b0_stud"); 
    L↓perp_left← →KRS00014_000005= Input.Get("L_left"); 
    L↓perp_right← →KRS00014_000006= Input.Get("L_right"); 
    L↓current← →KRS00014_000007= Input.Get("L"); 
    L↓left← →KRS00014_000008= Input.Get("L_previous"); 
    L↓right← →KRS00014_000016= Input.Get("L_next"); 
    Entity↓left← →KRS00014_000009= Input.Get("Entity_left"); 
    Entity↓right← →KRS00014_000010= Input.Get("Entity_right"); 
    Shapeofrib →KRS00014_000011= Input.Get("ShapeOfRib"); 
    b↓eff,l← →KRS00014_000012= Input.Get("beffCheck_left"); 
    b↓eff,r← →KRS00014_000013= Input.Get("beffCheck_right"); 
    
    return true; 
} 
object GetOutput() { 
    object Result →KRS00014_000017= new Structure(
    "flag_beff", flag_beff, 
    "b_eff", b↓eff←, 
    "L_e", L↓e←); 
    return Result; 
} 


→INI00400_000479TEXT("Determination of effective width of a concrete flange"); 
→INI00400_000926TEXT("in accordance with EN 1994-1-1, article 5.4.1.2"); 

// Definition of the current position:
//span = 0 -&gt; none - beam - none (L↓e0← = L↓1←; L↓e1← = L↓1←)
//span = 1 -&gt; none - beam - continuous (L↓e0← = 0.85*L↓1←; L↓e1← = 0.85*L↓1←; L↓e2← = 0.25*(L↓1←+L↓2←))
//span = 2 -&gt; none - beam - cantilever (L↓e0← = 0.85*L↓1←; L↓e1← = 0.85*L↓1←; L↓e2← = 2*L↓2←))
//span = 3 -&gt; continuous - beam - none (L↓e2← = 0.25*(L↓1←+L↓2←); L↓e1← = 0.85*L↓2←; L↓e0← = 0.85*L↓2←)
//span = 4 -&gt; continuous - beam - continuous (L↓e2← = 0.25*(L↓1←+L↓2←); L↓e1← = 0.7*L↓2←; L↓e2← = 0.25*(L↓2←+L↓3←))
//span = 5 -&gt; continuous - beam - cantilever (L↓e2← = 0.25*(L↓1←+L↓2←); L↓e1← = 0.7*L↓2←; L↓e2← = 2*L↓3←))
//span = 6 -&gt; cantilever - beam - none (L↓e2← = 2*L↓1←; L↓e1← = 0.85*L↓2←; L↓e0← = 0.85*L↓2←)
//span = 7 -&gt; cantilever - beam - continuous (L↓e2← = 2*L↓1←; L↓e1← = 0.7*L↓2←; L↓e2← = 2*(L↓2←+L↓3←))
//span = 8 -&gt; cantilever - beam - cantilever (L↓e2← = 2*L↓1←; L↓e1← = 0.7*L↓2←; L↓e2← = 2*L↓3←))
//span = 9 -&gt; cantilever (L↓e2← = 2*L↓1←))

position_rel →INI00400_000934= ROUND(position_dx/L↓current←, 5); // Position_dx is position on the span from the left

//Resetting flags at start of calculation
flag_beff →INI00400_001665= 0; 
flag_β →INI00400_001072= 0; //Flag for showing calculation of β↓1← and β↓2 ←on the output

//Flag for CASE used in the final calculation of beff
IF(COMPARE(position_rel, 0, 6) == 0) { //span = 0 -&gt; position at the end/internal support &lt;0&gt;
    flag_CASE →INI00400_001397= 0; 
} ELSE { 
    //span = 0 -&gt; position in the interval (0;0.25)
    IF(position_rel &gt; 0 &amp;&amp; position_rel &lt; 0.25) { 
        flag_CASE →INI00400_001411= 1; 
    } ELSE { 
        //span = 0 -&gt; position in the interval &lt;0.25;0.75&gt;
        IF(COMPARE(position_rel, 0.25, 6) &gt;= 0 &amp;&amp; COMPARE(position_rel, 0.75, 6) &lt;= 0) { 
            flag_CASE →INI00400_001412= 2; 
        } ELSE { 
            //span = 0 -&gt; position in the interval (0.75;1)
            IF(position_rel &gt; 0.75 &amp;&amp; position_rel &lt; 1) { 
                flag_CASE →INI00400_001413= 3; 
            } ELSE { 
                //span = 0 -&gt; position at the end support &lt;1&gt;
                flag_CASE →INI00400_001414= 4; 
            } 
        } 
    } 
} 

IF(position_rel &lt; 0 || position_rel &gt; 1) { // Test on current section position 
    →INI00400_001606TEXT("Error: Incorrect position of the section!"); 
    flag_beff →INI00400_001713= 1; 
    //Exit(); 
} 

L↓e0← →INI00400_001077= 0; //Initialization of ( L↓e0← / L↓e1← / L↓e2← )
L↓e1← →INI00400_001078= 0; 
L↓e2← →INI00400_001079= 0; 

// Determination of ( L↓e0← / L↓e1← / L↓e2← )
SWITCH(span) { 
    CASE 0 :  { // span = 0 
        L↓1← →INI00400_001599= L↓current←; //Renaming of the used lengths
        IF(COMPARE(L↓current←, 0, 6) &lt;= 0 || COMPARE(L↓left←, 0, 6) != 0 || COMPARE(L↓right←, 0, 6) != 0) { 
            →INI00400_001609TEXT("Error: Unexpected span length!"); 
            flag_beff →INI00400_001714= 1; 
            //Exit(); 
        } 
        //span = 0 -&gt; position at the end support &lt;0&gt;
        IF(COMPARE(position_rel, 0, 6) == 0) { 
            →INI00400_001551TEXT("The effective width at the end support"); 
            L↓e0← →INI00400_001000= L↓1←; 
            flag_β →INI00400_001073= 1; 
        } ELSE { 
            //span = 0 -&gt; position in the interval (0;0.25)
            IF(position_rel &gt; 0 &amp;&amp; position_rel &lt; 0.25) { 
                →INI00400_001552TEXT("The effective width in the interval (0;0.25)"); 
                L↓e0← →INI00400_001062= L↓1←; 
                L↓e1← →INI00400_001005= L↓1←; 
                flag_β →INI00400_001075= 1; 
            } ELSE { 
                //span = 0 -&gt; position in the interval &lt;0.25;0.75&gt;
                IF(COMPARE(position_rel, 0.25, 6) &gt;= 0 &amp;&amp; COMPARE(position_rel, 0.75, 6) &lt;= 0) { 
                    →INI00400_001553TEXT("The effective width in the interval &lt;0.25;0.75&gt;"); 
                    L↓e1← →INI00400_001007= L↓1←; 
                } ELSE { 
                    //span = 0 -&gt; position in the interval (0.75;1)
                    IF(position_rel &gt; 0.75 &amp;&amp; position_rel &lt; 1) { 
                        →INI00400_001554TEXT("The effective width in the interval (0.75;1)"); 
                        L↓e0← →INI00400_001063= L↓1←; 
                        L↓e1← →INI00400_001009= L↓1←; 
                        flag_β →INI00400_001076= 1; 
                    } ELSE { 
                        //span = 0 -&gt; position at the end support &lt;1&gt;
                        →INI00400_001555TEXT("The effective width at the end support"); 
                        L↓e0← →INI00400_001160= L↓1←; 
                        flag_β →INI00400_001161= 1; 
                    } 
                } 
            } 
        } 
    } 
    
    CASE 1 :  { // span = 1
        L↓1← →INI00400_001612= L↓current←; //Remaping of the used Lengths
        L↓2← →INI00400_001615= L↓right←; 
        
        IF(COMPARE(L↓current←, 0, 6) &lt;= 0 || COMPARE(L↓right←, 0, 6) &lt;= 0 || COMPARE(L↓left←, 0, 6) != 0) { 
            →INI00400_001613TEXT("Error: Unexpected span length!"); 
            flag_beff →INI00400_001715= 1; 
            //Exit(); 
        } 
        //span = 1 -&gt; position at the end support &lt;0&gt;
        IF(COMPARE(position_rel, 0, 6) == 0) { 
            →INI00400_001556TEXT("The effective width at the end support"); 
            L↓e0← →INI00400_001043= 0.85*L↓1←; 
            flag_β →INI00400_001080= 1; 
        } ELSE { 
            //span = 1 -&gt; position in the interval (0;0.25)
            IF(position_rel &gt; 0 &amp;&amp; position_rel &lt; 0.25) { 
                →INI00400_001559TEXT("The effective width in the interval (0;0.25)"); 
                L↓e0← →INI00400_001064= 0.85*L↓1←; 
                L↓e1← →INI00400_001056= 0.85*L↓1←; 
                flag_β →INI00400_001081= 1; 
            } ELSE { 
                //span = 1 -&gt; position in the interval &lt;0.25;0.75&gt;
                IF(COMPARE(position_rel, 0.25, 6) &gt;= 0 &amp;&amp; COMPARE(position_rel, 0.75, 6) &lt;= 0) { 
                    →INI00400_001570TEXT("The effective width in the interval &lt;0.25;0.75&gt;"); 
                    L↓e1← →INI00400_001058= 0.85*L↓1←; 
                    L↓e2← →INI00400_001683= 0.25*(L↓1←+L↓2←); 
                } ELSE { 
                    //span = 1 -&gt; position in the interval (0.75;1)
                    IF(position_rel &gt; 0.75 &amp;&amp; position_rel &lt; 1) { 
                        →INI00400_001578TEXT("The effective width in the interval (0.75;1)"); 
                        L↓e1← →INI00400_001060= 0.85*L↓1←; 
                        L↓e2← →INI00400_001065= 0.25*(L↓1←+L↓2←); 
                    } ELSE { 
                        //span = 1 -&gt; position at the internal support &lt;1&gt;
                        →INI00400_001586TEXT("The effective width at the internal support"); 
                        L↓e2← →INI00400_001110= 0.25*(L↓1←+L↓2←); 
                        
                    } 
                } 
            } 
        } 
    } 
    
    CASE 2 :  { // span = 2
        L↓1← →INI00400_001616= L↓current←; //Remaping of the used Lengths
        L↓2← →INI00400_001617= L↓right←; 
        
        
        IF(COMPARE(L↓current←, 0, 6) &lt;= 0 || COMPARE(L↓right←, 0, 6) &lt;= 0 || COMPARE(L↓left←, 0, 6) != 0) { 
            →INI00400_001618TEXT("Error: Unexpected span length!"); 
            flag_beff →INI00400_001716= 1; 
            //Exit(); 
        } 
        //span = 2 -&gt; position at the end support &lt;0&gt;
        IF(COMPARE(position_rel, 0, 6) == 0) { 
            →INI00400_001557TEXT("The effective width at the end support"); 
            L↓e0← →INI00400_001112= 0.85*L↓1←; 
            flag_β →INI00400_001113= 1; 
        } ELSE { 
            //span = 2 -&gt; position in the interval (0;0.25)
            IF(position_rel &gt; 0 &amp;&amp; position_rel &lt; 0.25) { 
                →INI00400_001560TEXT("The effective width in the interval (0;0.25)"); 
                L↓e0← →INI00400_001115= 0.85*L↓1←; 
                L↓e1← →INI00400_001116= 0.85*L↓1←; 
                flag_β →INI00400_001117= 1; 
            } ELSE { 
                //span = 2 -&gt; position in the interval &lt;0.25;0.75&gt;
                IF(COMPARE(position_rel, 0.25, 6) &gt;= 0 &amp;&amp; COMPARE(position_rel, 0.75, 6) &lt;= 0) { 
                    →INI00400_001571TEXT("The effective width in the interval &lt;0.25;0.75&gt;"); 
                    L↓e1← →INI00400_001119= 0.85*L↓1←; 
                    L↓e2← →INI00400_001684= 2*L↓2←; 
                } ELSE { 
                    //span = 2 -&gt; position in the interval (0.75;1)
                    IF(position_rel &gt; 0.75 &amp;&amp; position_rel &lt; 1) { 
                        →INI00400_001579TEXT("The effective width in the interval (0.75;1)"); 
                        L↓e1← →INI00400_001121= 0.85*L↓1←; 
                        L↓e2← →INI00400_001122= 2*L↓2←; 
                    } ELSE { 
                        //span = 2 -&gt; position at the internal support &lt;1&gt;
                        →INI00400_001587TEXT("The effective width at the internal support"); 
                        L↓e2← →INI00400_001124= 2*L↓2←; 
                    } 
                } 
            } 
        } 
    } 
    
    CASE 3 :  { // span = 3
        L↓1← →INI00400_001620= L↓left←; //Remaping of the used Lengths
        L↓2← →INI00400_001621= L↓current←; 
        
        IF(COMPARE(L↓current←, 0, 6) &lt;= 0 || COMPARE(L↓left←, 0, 6) &lt;= 0 || COMPARE(L↓right←, 0, 6) != 0) { 
            →INI00400_001622TEXT("Error: Unexpected span length!"); 
            flag_beff →INI00400_001717= 1; 
            //Exit(); 
        } 
        //span = 3 -&gt; position at the internal support &lt;0&gt;
        IF(COMPARE(position_rel, 0, 6) == 0) { 
            →INI00400_001593TEXT("The effective width at the internal support"); 
            L↓e2← →INI00400_001126= 0.25*(L↓1←+L↓2←); 
        } ELSE { 
            //span = 3 -&gt; position in the interval (0;0.25)
            IF(position_rel &gt; 0 &amp;&amp; position_rel &lt; 0.25) { 
                →INI00400_001561TEXT("The effective width in the interval (0;0.25)"); 
                L↓e1← →INI00400_001130= 0.85*L↓2←; 
                L↓e2← →INI00400_001139= 0.25*(L↓1←+L↓2←); 
            } ELSE { 
                //span = 3 -&gt; position in the interval &lt;0.25;0.75&gt;
                IF(COMPARE(position_rel, 0.25, 6) &gt;= 0 &amp;&amp; COMPARE(position_rel, 0.75, 6) &lt;= 0) { 
                    →INI00400_001572TEXT("The effective width in the interval &lt;0.25;0.75&gt;"); 
                    L↓e1← →INI00400_001133= 0.85*L↓2←; 
                    L↓e2← →INI00400_001685= 0.25*(L↓1←+L↓2←); 
                } ELSE { 
                    //span = 3 -&gt; position in the interval (0.75;1)
                    IF(position_rel &gt; 0.75 &amp;&amp; position_rel &lt; 1) { 
                        →INI00400_001580TEXT("The effective width in the interval (0.75;1)"); 
                        L↓e0← →INI00400_001140= 0.85*L↓2←; 
                        L↓e1← →INI00400_001135= 0.85*L↓2←; 
                        flag_β →KRS00014_000019= 1; 
                    } ELSE { 
                        //span = 3 -&gt; position at the end support &lt;1&gt;
                        →INI00400_001588TEXT("The effective width at the end support"); 
                        L↓e0← →INI00400_001141= 0.85*L↓2←; 
                        flag_β →KRS00014_000020= 1; 
                    } 
                } 
            } 
        } 
    } 
    
    CASE 4 :  { // span = 4
        L↓1← →INI00400_001624= L↓left←; //Remaping of the used Lengths
        L↓2← →INI00400_001625= L↓current←; 
        L↓3← →INI00400_001628= L↓right←; 
        
        IF(COMPARE(L↓current←, 0, 6) &lt;= 0 || COMPARE(L↓left←, 0, 6) &lt;= 0 || COMPARE(L↓right←, 0, 6) &lt;= 0) { 
            →INI00400_001626TEXT("Error: Unexpected span length!"); 
            flag_beff →INI00400_001718= 1; 
            //Exit(); 
        } 
        //span = 4 -&gt; position at the internal support &lt;0&gt;
        IF(COMPARE(position_rel, 0, 6) == 0) { 
            →INI00400_001594TEXT("The effective width at the internal support"); 
            L↓e2← →INI00400_001143= 0.25*(L↓1←+L↓2←); 
        } ELSE { 
            //span = 4 -&gt; position in the interval (0;0.25)
            IF(position_rel &gt; 0 &amp;&amp; position_rel &lt; 0.25) { 
                →INI00400_001562TEXT("The effective width in the interval (0;0.25)"); 
                L↓e1← →INI00400_001145= 0.7*L↓2←; 
                L↓e2← →INI00400_001146= 0.25*(L↓1←+L↓2←); 
            } ELSE { 
                //span = 4 -&gt; position in the interval &lt;0.25;0.75&gt;
                IF(COMPARE(position_rel, 0.25, 6) &gt;= 0 &amp;&amp; COMPARE(position_rel, 0.75, 6) &lt;= 0) { 
                    →INI00400_001573TEXT("The effective width in the interval &lt;0.25;0.75&gt;"); 
                    L↓e1← →INI00400_001149= 0.7*L↓2←; 
                    IF(COMPARE(position_rel, 0.5, 6) &lt; 0) { 
                        L↓e2← →INI00400_001686= 0.25*(L↓1←+L↓2←); 
                    } ELSE { 
                        L↓e2← →INI00400_001687= 0.25*(L↓2←+L↓3←); 
                    } 
                    IF(COMPARE(position_rel, 0.5, 6) == 0) { 
                        L↓e2← →INI00400_001688= MIN(0.25*(L↓1←+L↓2←), 0.25*(L↓2←+L↓3←)); 
                    } 
                } ELSE { 
                    //span = 4 -&gt; position in the interval (0.75;1)
                    IF(position_rel &gt; 0.75 &amp;&amp; position_rel &lt; 1) { 
                        →INI00400_001581TEXT("The effective width in the interval (0.75;1)"); 
                        L↓e1← →INI00400_001152= 0.7*L↓2←; 
                        L↓e2← →INI00400_001162= 0.25*(L↓2←+L↓3←); 
                    } ELSE { 
                        //span = 4 -&gt; position at the internal support &lt;1&gt;
                        →INI00400_001589TEXT("The effective width at the internal support"); 
                        L↓e2← →INI00400_001155= 0.25*(L↓2←+L↓3←); 
                    } 
                } 
            } 
        } 
    } 
    
    CASE 5 :  { // span = 5
        L↓1← →INI00400_001629= L↓left←; //Remaping of the used Lengths
        L↓2← →INI00400_001630= L↓current←; 
        L↓3← →INI00400_001631= L↓right←; 
        
        IF(COMPARE(L↓current←, 0, 6) &lt;= 0 || COMPARE(L↓left←, 0, 6) &lt;= 0 || COMPARE(L↓right←, 0, 6) &lt;= 0) { 
            →INI00400_001632TEXT("Error: Unexpected span length!"); 
            flag_beff →INI00400_001719= 1; 
            //Exit(); 
        } 
        //span = 5 -&gt; position at the internal support &lt;0&gt;
        IF(COMPARE(position_rel, 0, 6) == 0) { 
            →INI00400_001595TEXT("The effective width at the internal support"); 
            L↓e2← →INI00400_001164= 0.25*(L↓1←+L↓2←); 
        } ELSE { 
            //span = 5 -&gt; position in the interval (0;0.25)
            IF(position_rel &gt; 0 &amp;&amp; position_rel &lt; 0.25) { 
                →INI00400_001563TEXT("The effective width in the interval (0;0.25)"); 
                L↓e1← →INI00400_001166= 0.7*L↓2←; 
                L↓e2← →INI00400_001167= 0.25*(L↓1←+L↓2←); 
            } ELSE { 
                //span = 5 -&gt; position in the interval &lt;0.25;0.75&gt;
                IF(COMPARE(position_rel, 0.25, 6) &gt;= 0 &amp;&amp; COMPARE(position_rel, 0.75, 6) &lt;= 0) { 
                    →INI00400_001574TEXT("The effective width in the interval &lt;0.25;0.75&gt;"); 
                    L↓e1← →INI00400_001169= 0.7*L↓2←; 
                    IF(COMPARE(position_rel, 0.5, 6) &lt; 0) { 
                        L↓e2← →INI00400_001689= 0.25*(L↓1←+L↓2←); 
                    } ELSE { 
                        L↓e2← →INI00400_001692= 2*L↓3←; 
                    } 
                    IF(COMPARE(position_rel, 0.5, 6) == 0) { 
                        L↓e2← →INI00400_001691= MIN(0.25*(L↓1←+L↓2←), 2*L↓3←); 
                    } 
                } ELSE { 
                    //span = 5 -&gt; position in the interval (0.75;1)
                    IF(position_rel &gt; 0.75 &amp;&amp; position_rel &lt; 1) { 
                        →INI00400_001582TEXT("The effective width in the interval (0.75;1)"); 
                        L↓e1← →INI00400_001171= 0.7*L↓2←; 
                        L↓e2← →INI00400_001172= 2*L↓3←; 
                    } ELSE { 
                        //span = 5 -&gt; position at the internal support &lt;1&gt;
                        →INI00400_001590TEXT("The effective width at the internal support"); 
                        L↓e2← →INI00400_001175= 2*L↓3←; 
                    } 
                } 
            } 
        } 
    } 
    
    CASE 6 :  { // span = 6
        L↓1← →INI00400_001634= L↓left←; //Remaping of the used Lengths
        L↓2← →INI00400_001635= L↓current←; 
        
        IF(COMPARE(L↓current←, 0, 6) &lt;= 0 || COMPARE(L↓left←, 0, 6) &lt;= 0 || COMPARE(L↓right←, 0, 6) != 0) { 
            →INI00400_001637TEXT("Error: Unexpected span length!"); 
            flag_beff →INI00400_001720= 1; 
            //Exit(); 
        } 
        //span = 6 -&gt; position at the internal support &lt;0&gt;
        IF(COMPARE(position_rel, 0, 6) == 0) { 
            →INI00400_001596TEXT("The effective width at the internal support"); 
            L↓e2← →INI00400_001177= 2*L↓1←; 
        } ELSE { 
            //span = 6 -&gt; position in the interval (0;0.25)
            IF(position_rel &gt; 0 &amp;&amp; position_rel &lt; 0.25) { 
                →INI00400_001564TEXT("The effective width in the interval (0;0.25)"); 
                L↓e1← →INI00400_001179= 0.85*L↓2←; 
                L↓e2← →INI00400_001188= 2*L↓1←; 
            } ELSE { 
                //span = 6 -&gt; position in the interval &lt;0.25;0.75&gt;
                IF(COMPARE(position_rel, 0.25, 6) &gt;= 0 &amp;&amp; COMPARE(position_rel, 0.75, 6) &lt;= 0) { 
                    →INI00400_001575TEXT("The effective width in the interval &lt;0.25;0.75&gt;"); 
                    L↓e1← →INI00400_001182= 0.85*L↓2←; 
                    L↓e2← →INI00400_001693= 2*L↓1←; 
                } ELSE { 
                    //span = 6 -&gt; position in the interval (0.75;1)
                    IF(position_rel &gt; 0.75 &amp;&amp; position_rel &lt; 1) { 
                        →INI00400_001583TEXT("The effective width in the interval (0.75;1)"); 
                        L↓e0← →INI00400_001189= 0.85*L↓2←; 
                        L↓e1← →INI00400_001184= 0.85*L↓2←; 
                        flag_β →INI00400_001191= 1; 
                    } ELSE { 
                        //span = 6 -&gt; position at the end support &lt;1&gt;
                        →INI00400_001558TEXT("The effective width at the end support"); 
                        L↓e0← →INI00400_001190= 0.85*L↓2←; 
                        flag_β →INI00400_001192= 1; 
                    } 
                } 
            } 
        } 
    } 
    
    CASE 7 :  { // span = 7
        L↓1← →INI00400_001639= L↓left←; //Remaping of the used Lengths
        L↓2← →INI00400_001640= L↓current←; 
        L↓3← →INI00400_001641= L↓right←; 
        
        IF(COMPARE(L↓current←, 0, 6) &lt;= 0 || COMPARE(L↓left←, 0, 6) &lt;= 0 || COMPARE(L↓right←, 0, 6) &lt;= 0) { 
            →INI00400_001642TEXT("Error: Unexpected span length!"); 
            flag_beff →INI00400_001721= 1; 
            //Exit(); 
        } 
        //span = 7 -&gt; position at the internal support &lt;0&gt;
        IF(COMPARE(position_rel, 0, 6) == 0) { 
            →INI00400_001597TEXT("The effective width at the internal support"); 
            L↓e2← →INI00400_001194= 2*L↓1←; 
        } ELSE { 
            //span = 7 -&gt; position in the interval (0;0.25)
            IF(position_rel &gt; 0 &amp;&amp; position_rel &lt; 0.25) { 
                →INI00400_001565TEXT("The effective width in the interval (0;0.25)"); 
                L↓e1← →INI00400_001196= 0.7*L↓2←; 
                L↓e2← →INI00400_001197= 2*L↓1←; 
            } ELSE { 
                //span = 7 -&gt; position in the interval &lt;0.25;0.75&gt;
                IF(COMPARE(position_rel, 0.25, 6) &gt;= 0 &amp;&amp; COMPARE(position_rel, 0.75, 6) &lt;= 0) { 
                    →INI00400_001576TEXT("The effective width in the interval &lt;0.25;0.75&gt;"); 
                    L↓e1← →INI00400_001199= 0.7*L↓2←; 
                    IF(COMPARE(position_rel, 0.5, 6) &lt; 0) { 
                        L↓e2← →INI00400_001697= 2*L↓1←; 
                    } ELSE { 
                        L↓e2← →INI00400_001698= 0.25*(L↓2←+L↓3←); 
                    } 
                    IF(COMPARE(position_rel, 0.5, 6) == 0) { 
                        L↓e2← →INI00400_001696= MIN(2*L↓1←, 0.25*(L↓2←+L↓3←)); 
                    } 
                } ELSE { 
                    //span = 7 -&gt; position in the interval (0.75;1)
                    IF(position_rel &gt; 0.75 &amp;&amp; position_rel &lt; 1) { 
                        →INI00400_001584TEXT("The effective width in the interval (0.75;1)"); 
                        L↓e1← →INI00400_001202= 0.7*L↓2←; 
                        L↓e2← →INI00400_001206= 0.25*(L↓2←+L↓3←); 
                    } ELSE { 
                        //span = 7 -&gt; position at the internal support &lt;1&gt;
                        →INI00400_001591TEXT("The effective width at the internal support"); 
                        L↓e2← →INI00400_001207= 0.25*(L↓2←+L↓3←); 
                    } 
                } 
            } 
        } 
    } 
    
    CASE 8 :  { // span = 8
        L↓1← →INI00400_001644= L↓left←; //Remaping of the used Lengths
        L↓2← →INI00400_001645= L↓current←; 
        L↓3← →INI00400_001646= L↓right←; 
        
        IF(COMPARE(L↓current←, 0, 6) &lt;= 0 || COMPARE(L↓left←, 0, 6) &lt;= 0 || COMPARE(L↓right←, 0, 6) &lt;= 0) { 
            →INI00400_001647TEXT("Error: Unexpected span length!"); 
            flag_beff →INI00400_001722= 1; 
            //Exit(); 
        } 
        //span = 8 -&gt; position at the internal support &lt;0&gt;
        IF(COMPARE(position_rel, 0, 6) == 0) { 
            →INI00400_001598TEXT("The effective width at the internal support"); 
            L↓e2← →INI00400_001209= 2*L↓1←; 
        } ELSE { 
            //span = 8 -&gt; position in the interval (0;0.25)
            IF(position_rel &gt; 0 &amp;&amp; position_rel &lt; 0.25) { 
                →INI00400_001566TEXT("The effective width in the interval (0;0.25)"); 
                L↓e1← →INI00400_001211= 0.7*L↓2←; 
                L↓e2← →INI00400_001212= 2*L↓1←; 
            } ELSE { 
                //span = 8 -&gt; position in the interval &lt;0.25;0.75&gt;
                IF(COMPARE(position_rel, 0.25, 6) &gt;= 0 &amp;&amp; COMPARE(position_rel, 0.75, 6) &lt;= 0) { 
                    →INI00400_001577TEXT("The effective width in the interval &lt;0.25;0.75&gt;"); 
                    L↓e1← →INI00400_001214= 0.7*L↓2←; 
                    IF(COMPARE(position_rel, 0.5, 6) &lt; 0) { 
                        L↓e2← →INI00400_001699= 2*L↓1←; 
                    } ELSE { 
                        L↓e2← →INI00400_001702= 2*L↓3←; 
                    } 
                    IF(COMPARE(position_rel, 0.5, 6) == 0) { 
                        L↓e2← →INI00400_001701= MIN(2*L↓1←, 2*L↓3←); 
                    } 
                } ELSE { 
                    //span = 8 -&gt; position in the interval (0.75;1)
                    IF(position_rel &gt; 0.75 &amp;&amp; position_rel &lt; 1) { 
                        →INI00400_001585TEXT("The effective width in the interval (0.75;1)"); 
                        L↓e1← →INI00400_001216= 0.7*L↓2←; 
                        L↓e2← →INI00400_001217= 2*L↓3←; 
                    } ELSE { 
                        //span = 8 -&gt; position at the internal support &lt;1&gt;
                        →INI00400_001592TEXT("The effective width at the internal support"); 
                        L↓e2← →INI00400_001220= 2*L↓3←; 
                    } 
                } 
            } 
        } 
    } 
    
    CASE 9 :  { // span = 9
        L↓1← →INI00400_001649= L↓current←; //Remaping of the used Lengths
        
        IF(COMPARE(L↓current←, 0, 6) &lt;= 0 || L↓left← &lt; 0 || L↓right← &lt; 0) { 
            →INI00400_001652TEXT("Error: Unexpected span length!"); 
            flag_beff →INI00400_001723= 1; 
            //Exit(); 
        } 
        //span = 9 -&gt; position in the interval &lt;0;1&gt;
        →INI00400_001567TEXT("The effective width in the interval &lt;0;1&gt;"); 
        L↓e2← →INI00400_001225= 2*L↓1←; 
    } 
} 

IF(L↓perp_left← &lt; 0 || L↓perp_left← &lt; 0) { // Test on (L↓perp_left← / L↓perp_right←) input
    →INI00400_001655TEXT("Error: Perpendicular distance to a beam or to the slab edge cannot be nagative!"); 
    flag_beff →INI00400_001724= 1; 
    //Exit(); 
} 

IF(b↓0← &lt; 0) { // Test on b↓0← input
    →INI00400_001656TEXT("Error: The distance between the centres of the outstand shear connectors cannot be nagative!"); 
    flag_beff →INI00400_001725= 1; 
    //Exit(); 
} 

→INI00400_001728PAGEBREAK(); 

// Caculation of the parameters for ( b↓eff,0← / b↓eff,1← / b↓eff,2← )
→INI00400_000967BLOCK { 
    →INI00400_000951TEXT("Left side of the beam"); 
    IF(Shapeofrib != 4) { 
        →POR00106_000001TEXT("Manual input of effective width on the side."); 
        double b↓eff,l← →POR00106_000002= b↓eff,l←; 
    } ELSE { 
        IF(COMPARE(Entity↓left←, 0, 2) == 0) { 
            →INI00400_001734TEXT("No adjacent member or slab edge was found on the side."); 
            b↓1← →INI00400_001739= 0; 
            b↓e10← →INI00400_001731= L↓e0←/8; 
            b↓e11← →INI00400_001732= L↓e1←/8; 
            b↓e12← →INI00400_001733= L↓e2←/8; 
        } ELSE { 
            IF(COMPARE(Entity↓left←, 2, 2) == 0) { // Distinction between edge and mid span on the left
                b↓1← →INI00400_000938= L↓perp_left←-b↓0←/2; 
            } ELSE { 
                b↓1← →INI00400_000939= L↓perp_left←/2-b↓0←/2; 
            } 
            b↓e10← →INI00400_001066= MIN(L↓e0←/8, b↓1←); 
            b↓e11← →INI00400_000940= MIN(L↓e1←/8, b↓1←); 
            b↓e12← →INI00400_001067= MIN(L↓e2←/8, b↓1←); 
        } 
        
        IF(flag_β == 1) { // Calclation of β1
            IF(COMPARE(b↓e10←, 0, 6) == 0) { 
                β↓1,calc← →INI00400_001726= 0; 
            } ELSE { 
                β↓1,calc← →INI00400_000948= (0.55+0.025*L↓e0←/b↓e10←); 
            } 
            →INI00400_000947TEXT("β↓1,calc←" &amp; " &lt;= " &amp; "1.0"); 
            →INI00400_000950TEXT(β↓1,calc← &amp; " &lt;= " &amp; "1.0"); 
            
            IF(COMPARE(β↓1,calc←, 1, 6) &lt;= 0) { 
                →INI00400_000519TEXT("OK"); 
                β↓1← →INI00400_000953= β↓1,calc←; 
            } ELSE { 
                →INI00400_000955TEXT("NOT OK"); 
                β↓1← →INI00400_000956= 1; 
            } 
        } 
    } 
} 

→INI00400_001668PAGEBREAK(); 

→INI00400_001667BLOCK { 
    →INI00400_000952TEXT("Right side of the beam"); 
    IF(Shapeofrib != 4) { 
        →POR00106_000003TEXT("Manual input of effective width on the side."); 
        double b↓eff,r← →POR00106_000004= b↓eff,r←; 
    } ELSE { 
        IF(COMPARE(Entity↓right←, 0, 2) == 0) { 
            →INI00400_001735TEXT("No adjacent member or slab edge was found on the side."); 
            b↓2← →INI00400_001740= 0; 
            b↓e20← →INI00400_001736= L↓e0←/8; 
            b↓e21← →INI00400_001737= L↓e1←/8; 
            b↓e22← →INI00400_001738= L↓e2←/8; 
        } ELSE { 
            IF(COMPARE(Entity↓right←, 2, 2) == 0) { // Distinction between edge and mid span on the right
                b↓2← →INI00400_000942= L↓perp_right←-b↓0←/2; 
            } ELSE { 
                b↓2← →INI00400_000943= L↓perp_right←/2-b↓0←/2; 
            } 
            b↓e20← →INI00400_001068= MIN(L↓e0←/8, b↓2←); 
            b↓e21← →INI00400_000944= MIN(L↓e1←/8, b↓2←); 
            b↓e22← →INI00400_001069= MIN(L↓e2←/8, b↓2←); 
        } 
        
        IF(flag_β == 1) { // Calclation of β2
            IF(COMPARE(b↓e20←, 0, 6) == 0) { 
                β↓2,calc← →INI00400_001727= 0; 
            } ELSE { 
                β↓2,calc← →INI00400_000957= (0.55+0.025*L↓e0←/b↓e20←); 
            } 
            →INI00400_000958TEXT("β↓2,calc←" &amp; " &lt;= " &amp; "1.0"); 
            →INI00400_000959TEXT(β↓2,calc← &amp; " &lt;= " &amp; "1.0"); 
            
            IF(COMPARE(β↓2,calc←, 1, 6) &lt;= 0) { 
                →INI00400_000960TEXT("OK"); 
                β↓2← →INI00400_000961= β↓2,calc←; 
            } ELSE { 
                →INI00400_000962TEXT("NOT OK"); 
                β↓2← →INI00400_000963= 1; 
            } 
        } 
    } 
} 

→INI00400_001729PAGEBREAK(); 


→INI00400_001454BLOCK { 
    IF(span != 9) { //span != 9 -&gt; All except Cantilever
        →KRS00014_000018TEXT("Calculation of b↓eff←"); 
        SWITCH(flag_CASE) { 
            CASE 0 :  { //Calculation of b↓eff ←at the left support
                //position at the end support &lt;0&gt;
                IF(span == 0 || span == 1 || span == 2) { 
                    IF(Shapeofrib != 4) { 
                        //                        →POR00106_000005TEXT("Calculation of b↓eff←"); 
                        b↓eff← →POR00106_000006= b↓eff,l←+b↓eff,r←; 
                    } ELSE { 
                        //                        →INI00400_001357TEXT("Calculation of b↓eff,0←"); 
                        b↓eff,0← →INI00400_001358= b↓0←+b↓e10←*β↓1←+b↓e20←*β↓2←; 
                        //                        →INI00400_001379TEXT("Calculation of b↓eff←"); 
                        b↓eff← →INI00400_001380= b↓eff,0←; 
                    } 
                    //                    →INI00400_001533TEXT("Determination of L↓e←"); 
                    L↓e← →INI00400_001534= L↓e0←; 
                } ELSE { //position at the internal support &lt;0&gt; 
                    IF(Shapeofrib != 4) { 
                        //                        →POR00106_000007TEXT("Calculation of b↓eff←"); 
                        b↓eff← →POR00106_000008= b↓eff,l←+b↓eff,r←; 
                    } ELSE { 
                        //                        →INI00400_001377TEXT("Calculation of b↓eff,2←"); 
                        b↓eff,2← →INI00400_001378= b↓0←+b↓e12←+b↓e22←; 
                        //                        →INI00400_001381TEXT("Calculation of b↓eff←"); 
                        b↓eff← →INI00400_001382= b↓eff,2←; 
                    } 
                    //                    →INI00400_001535TEXT("Determination of L↓e←"); 
                    L↓e← →INI00400_001536= L↓e2←; 
                } 
            } //End of case
            
            CASE 1 :  { //Calculation of b↓eff ←in the interval (0;0.25)
                //End support at position &lt;0&gt;
                IF(span == 0 || span == 1 || span == 2) { 
                    IF(Shapeofrib != 4) { 
                        //                        →POR00106_000009TEXT("Calculation of b↓eff←"); 
                        b↓eff← →POR00106_000010= b↓eff,l←+b↓eff,r←; 
                    } ELSE { 
                        //                        →INI00400_001383TEXT("Calculation of b↓eff,0←"); 
                        b↓eff,0← →INI00400_001384= b↓0←+b↓e10←*β↓1←+b↓e20←*β↓2←; 
                        //                        →INI00400_001391TEXT("Calculation of b↓eff,1←"); 
                        b↓eff,1← →INI00400_001392= b↓0←+b↓e11←+b↓e21←; 
                        //                        →INI00400_001385TEXT("Calculation of b↓eff←"); 
                        
                        IF(COMPARE(b↓eff,0←, b↓eff,1←, 6) &lt;= 0) { 
                            b↓eff← →INI00400_001393= b↓eff,0←+position_rel*[b↓eff,1←-b↓eff,0←]/0.25; 
                        } ELSE { 
                            b↓eff← →INI00400_001394= b↓eff,0←-position_rel*[b↓eff,0←-b↓eff,1←]/0.25; 
                        } 
                    } 
                    //                    →INI00400_001537TEXT("Determination of L↓e←"); 
                    L↓e← →INI00400_001676= L↓e1←; 
                    
                } 
                //Internal support at position &lt;0&gt;
                ELSE { 
                    IF(Shapeofrib != 4) { 
                        //                        →POR00106_000011TEXT("Calculation of b↓eff←"); 
                        b↓eff← →POR00106_000012= b↓eff,l←+b↓eff,r←; 
                    } ELSE { 
                        //                        →INI00400_001415TEXT("Calculation of b↓eff,2←"); 
                        b↓eff,2← →INI00400_001416= b↓0←+b↓e12←+b↓e22←; 
                        //                        →INI00400_001417TEXT("Calculation of b↓eff,1←"); 
                        b↓eff,1← →INI00400_001418= b↓0←+b↓e11←+b↓e21←; 
                        //                        →INI00400_001419TEXT("Calculation of b↓eff←"); 
                        
                        IF(COMPARE(b↓eff,2←, b↓eff,1←, 6) &lt;= 0) { 
                            b↓eff← →INI00400_001420= b↓eff,2←+position_rel*[b↓eff,1←-b↓eff,2←]/0.25; 
                        } ELSE { 
                            b↓eff← →INI00400_001421= b↓eff,2←-position_rel*[b↓eff,2←-b↓eff,1←]/0.25; 
                        } 
                    } 
                    //                    →INI00400_001539TEXT("Determination of L↓e←"); 
                    L↓e← →INI00400_001678= L↓e2←; 
                } 
            } //End of case
            
            CASE 2 :  { //Calculation of b↓eff ←in the interval &lt;0.25;0.75&gt;
                IF(Shapeofrib != 4) { 
                    //                    →POR00106_000013TEXT("Calculation of b↓eff←"); 
                    b↓eff← →POR00106_000014= b↓eff,l←+b↓eff,r←; 
                } ELSE { 
                    //                    →INI00400_001424TEXT("Calculation of b↓eff,1←"); 
                    b↓eff,1← →INI00400_001425= b↓0←+b↓e11←+b↓e21←; 
                    //                    →INI00400_001426TEXT("Calculation of b↓eff←"); 
                    b↓eff← →INI00400_001428= b↓eff,1←; 
                } 
                //                →INI00400_001541TEXT("Determination of L↓e←"); 
                L↓e← →INI00400_001681= L↓e1←; 
                
            } //End of case
            
            CASE 3 :  { //Calculation of b↓eff ←in the interval (0.75;1)
                //End support at position &lt;1&gt;
                IF(span == 0 || span == 3 || span == 6) { 
                    IF(Shapeofrib != 4) { 
                        //                        →POR00106_000015TEXT("Calculation of b↓eff←"); 
                        b↓eff← →POR00106_000016= b↓eff,l←+b↓eff,r←; 
                    } ELSE { 
                        //                        →INI00400_001429TEXT("Calculation of b↓eff,0←"); 
                        b↓eff,0← →INI00400_001430= b↓0←+b↓e10←*β↓1←+b↓e20←*β↓2←; 
                        //                        →INI00400_001431TEXT("Calculation of b↓eff,1←"); 
                        b↓eff,1← →INI00400_001432= b↓0←+b↓e11←+b↓e21←; 
                        //                        →INI00400_001433TEXT("Calculation of b↓eff←"); 
                        IF(COMPARE(b↓eff,1←, b↓eff,0←, 6) &gt;= 0) { 
                            b↓eff← →INI00400_001434= b↓eff,1←-(position_rel-0.75)*[b↓eff,1←-b↓eff,0←]/0.25; 
                        } ELSE { 
                            b↓eff← →INI00400_001443= b↓eff,1←+(position_rel-0.75)*[b↓eff,0←-b↓eff,1←]/0.25; 
                        } 
                    } 
                    //                    →INI00400_001543TEXT("Determination of L↓e←"); 
                    L↓e← →INI00400_001544= L↓e1←; 
                } ELSE { //Internal support at position &lt;1&gt;
                    IF(Shapeofrib != 4) { 
                        //                        →POR00106_000017TEXT("Calculation of b↓eff←"); 
                        b↓eff← →POR00106_000018= b↓eff,l←+b↓eff,r←; 
                    } ELSE { 
                        //                        →INI00400_001436TEXT("Calculation of b↓eff,2←"); 
                        b↓eff,2← →INI00400_001437= b↓0←+b↓e12←+b↓e22←; 
                        //                        →INI00400_001438TEXT("Calculation of b↓eff,1←"); 
                        b↓eff,1← →INI00400_001439= b↓0←+b↓e11←+b↓e21←; 
                        //                        →INI00400_001440TEXT("Calculation of b↓eff←"); 
                        IF(COMPARE(b↓eff,1←, b↓eff,2←, 6) &gt;= 0) { 
                            b↓eff← →INI00400_001444= b↓eff,1←-(position_rel-0.75)*[b↓eff,1←-b↓eff,2←]/0.25; 
                        } ELSE { 
                            b↓eff← →INI00400_001445= b↓eff,1←+(position_rel-0.75)*[b↓eff,2←-b↓eff,1←]/0.25; 
                        } 
                    } 
                    //                    →INI00400_001545TEXT("Determination of L↓e←"); 
                    L↓e← →INI00400_001680= L↓e2←; 
                } 
            } //End of case
            
            CASE 4 :  { //Calculation of b↓eff ←at the right support
                //position at the end support &lt;1&gt;
                IF(span == 0 || span == 3 || span == 6) { 
                    IF(Shapeofrib != 4) { 
                        //                        →POR00106_000019TEXT("Calculation of b↓eff←"); 
                        b↓eff← →POR00106_000020= b↓eff,l←+b↓eff,r←; 
                    } ELSE { 
                        //                        →INI00400_001446TEXT("Calculation of b↓eff,0←"); 
                        b↓eff,0← →INI00400_001447= b↓0←+b↓e10←*β↓1←+b↓e20←*β↓2←; 
                        //                        →INI00400_001448TEXT("Calculation of b↓eff←"); 
                        b↓eff← →INI00400_001449= b↓eff,0←; 
                    } 
                    //                    →INI00400_001547TEXT("Determination of L↓e←"); 
                    L↓e← →INI00400_001548= L↓e0←; 
                } ELSE { //position at the internal support &lt;1&gt; 
                    IF(Shapeofrib != 4) { 
                        //                        →POR00106_000021TEXT("Calculation of b↓eff←"); 
                        b↓eff← →POR00106_000022= b↓eff,l←+b↓eff,r←; 
                    } ELSE { 
                        //                        →INI00400_001450TEXT("Calculation of b↓eff,2←"); 
                        b↓eff,2← →INI00400_001451= b↓0←+b↓e12←+b↓e22←; 
                        //                        →INI00400_001452TEXT("Calculation of b↓eff←"); 
                        b↓eff← →INI00400_001453= b↓eff,2←; 
                    } 
                    //                    →INI00400_001549TEXT("Determination of L↓e←"); 
                    L↓e← →INI00400_001550= L↓e2←; 
                } 
            } //End of case
        } //End of switch
    } ELSE { 
        //span = 9 -&gt; Cantilever
        IF(Shapeofrib != 4) { 
            //            →POR00106_000023TEXT("Calculation of b↓eff←"); 
            b↓eff← →POR00106_000024= b↓eff,l←+b↓eff,r←; 
        } ELSE { 
            //            →INI00400_001527TEXT("Calculation of b↓eff,2←"); 
            b↓eff,2← →INI00400_001528= b↓0←+b↓e12←+b↓e22←; 
            //            →INI00400_001529TEXT("Calculation of b↓eff←"); 
            b↓eff← →INI00400_001530= b↓eff,2←; 
        } 
        //        →INI00400_001532TEXT("Determination of L↓e←"); 
        L↓e← →INI00400_001531= L↓e2←; 
    } 
} 
→INI00400_001730PAGEBREAK(); 
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="-1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10400" Autor="" Autor2="" Version="39" EWNSource="" Icon="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">
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
      <Variable Modifier="Public" Name="b↓0←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>The distance between the centres of the outstand shear connectors</ENU>
        </Description>
        <LocalNames>
          <ENU>b↓0←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="b↓1←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓1←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓2←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓2←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓e10←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓e10←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓e11←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓e11←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓e12←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓e12←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓e20←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓e20←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓e21←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓e21←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓e22←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓e22←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓eff,0←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓eff,0←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓eff,1←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓eff,1←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓eff,2←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓eff,2←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓eff,l←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓eff,l←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓eff,r←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓eff,r←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓eff←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓eff←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="Entity↓left←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Type of entity on the left</ENU>
        </Description>
        <LocalNames>
          <ENU>Entity↓left←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Entity↓right←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Type of entity on the right</ENU>
        </Description>
        <LocalNames>
          <ENU>Entity↓right←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="flag_beff" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>flag_beff</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="flag_CASE" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>flag_CASE</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="flag_β" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>flag_β</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="L↓1←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Length of the 1st span </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓1←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓2←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Length of the 2nd span </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓2←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓3←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Length of the 3rd span </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓3←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓current←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Length of the current span </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓current←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓e←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓e←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓e0←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓e0←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓e1←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓e1←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓e2←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓e2←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓left←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Length of the span on the left</ENU>
        </Description>
        <LocalNames>
          <ENU>L↓left←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓perp_left←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Distance to a beam or to the edge on the left side of the beam </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓perp_left←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓perp_right←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Distance to a beam or to the edge on the right side of the beam</ENU>
        </Description>
        <LocalNames>
          <ENU>L↓perp_right←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓right←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Length of the span on the right</ENU>
        </Description>
        <LocalNames>
          <ENU>L↓right←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="position_dx" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Position of the section</ENU>
        </Description>
        <LocalNames>
          <ENU>position_dx</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="position_rel" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>position_rel</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Shapeofrib" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>Shapeofrib</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="span" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Type of the span</ENU>
        </Description>
        <LocalNames>
          <ENU>span</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="β↓1,calc←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>β↓1,calc←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="β↓1←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>β↓1←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="β↓2,calc←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>β↓2,calc←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="β↓2←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>β↓2←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
    </Variables>
    <DrawingGroups />
    <ResultTables />
    <ResultGroups />
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Detailed</ENU>
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
      <VC ID="INI00400_000479">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="11.2" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|20|5|2" Font2="Segoe UI|20|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="11.2" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|20|5|2" Font2="Segoe UI|20|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="11.2" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|20|5|2" Font2="Segoe UI|20|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="11.2" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|20|5|2" Font2="Segoe UI|20|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="11.2" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|20|5|2" Font2="Segoe UI|20|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="11.2" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|20|5|2" Font2="Segoe UI|20|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000519">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000926">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="31.6" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="31.6" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="31.6" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="31.6" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="31.6" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="31.6" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000934">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="647" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="647" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="647" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="647" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="647" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="647" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000938">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000939">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000940">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000942">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_000943">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000944">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000947">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000948">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000950">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000951">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000952">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000953">
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_000955">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000956">
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="INI00400_000950" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="INI00400_000957">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000958">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000959">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000960">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000961">
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_000962">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000963">
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="INI00400_000959" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="INI00400_000967">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001000">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001005">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001007">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001009">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001043">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001056">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001058">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001060">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001062">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001063">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001064">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001065">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001066">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001067">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001068">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001069">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001072">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="640" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="640" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="640" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="640" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="640" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="640" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001073">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001075">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001076">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001077">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="657" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="657" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="657" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="657" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="657" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="657" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001078">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="674" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="674" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="674" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="674" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="674" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="674" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001079">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="691" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="691" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="691" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="691" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="691" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="691" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001080">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001081">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001110">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001112">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001113">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001115">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001116">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001117">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001119">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001121">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001122">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001124">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001126">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001130">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001133">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001135">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001139">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001140">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001141">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001143">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001145">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001146">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001149">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001152">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001155">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001160">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001161">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001162">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001164">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001166">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001167">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001169">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001171">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001172">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001175">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001177">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001179">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001182">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001184">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001188">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001189">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001190">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001191">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001192">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001194">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001196">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001197">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001199">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001202">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001206">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001207">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001209">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001211">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001212">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001214">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001216">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001217">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001220">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001225">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001358">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001378">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001380">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001382">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001384">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001392">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001393">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001394">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001397">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001411">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001412">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001413">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001414">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001416">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001418">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001420">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001421">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001425">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001428">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001430">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001432">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001434">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001437">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001439">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001443">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001444">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001445">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001447">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001449">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001451">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001453">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001454">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001528">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001530">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001531">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001534">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001536">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001544">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001548">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001550">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001551">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001552">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001553">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001554">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001555">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001556">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001557">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001558">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001559">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001560">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001561">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001562">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001563">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001564">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001565">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001566">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001567">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001570">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001571">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001572">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001573">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001574">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001575">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001576">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001577">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001578">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001579">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001580">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001581">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001582">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001583">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001584">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001585">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001586">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001587">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001588">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001589">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001590">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001591">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001592">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001593">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001594">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001595">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001596">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001597">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001598">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001599">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001606">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001609">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001612">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001613">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001615">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001616">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001617">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001618">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001620">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001621">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001622">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001624">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001625">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001626">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001628">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001629">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001630">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001631">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001632">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001634">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001635">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001637">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001639">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001640">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001641">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001642">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001644">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001645">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001646">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001647">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001649">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001652">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001655">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001656">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001665">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001667">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001668">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001676">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001678">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001680">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001681">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="INI00400_001683">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001684">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001685">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001686">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001687">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001688">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001689">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001691">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001692">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001693">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001696">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001697">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001698">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001699">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001701">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001702">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001713">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001714">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001715">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001716">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001717">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001718">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001719">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001720">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001721">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001722">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001723">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001724">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001725">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001726">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="INI00400_001727">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="INI00400_001728">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001729">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001730">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001731">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001732">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001733">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001734">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001735">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001736">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001737">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001738">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001739">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="INI00400_001740">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000007">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000008">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000009">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000011">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000012">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000013">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000016">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000018">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000019">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000020">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="POR00106_000001">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="POR00106_000002">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="POR00106_000003">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="POR00106_000004">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="POR00106_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="POR00106_000008">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="POR00106_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="POR00106_000012">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="POR00106_000014">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="POR00106_000016">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="POR00106_000018">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="POR00106_000020">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="POR00106_000022">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="POR00106_000024">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="beff" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500" />
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="TEXT_INI00400_000479">
      <ENU>"Determination of effective width of a concrete flange"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_000519">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_000926">
      <ENU>"in accordance with EN 1994-1-1, article 5.4.1.2"</ENU>
    </Item>
    <Item ID="TEXT_INI00400_000947">
      <ENU>"β↓1,calc←" &amp; " &lt;= " &amp; "1.0"</ENU>
    </Item>
    <Item ID="TEXT_INI00400_000950">
      <ENU>β↓1,calc← &amp; " &lt;= " &amp; "1.0"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_000951">
      <ENU>"Left side of the beam"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_000952">
      <ENU>"Right side of the beam"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_000955">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item ID="TEXT_INI00400_000958">
      <ENU>"β↓2,calc←" &amp; " &lt;= " &amp; "1.0"</ENU>
    </Item>
    <Item ID="TEXT_INI00400_000959">
      <ENU>β↓2,calc← &amp; " &lt;= " &amp; "1.0"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_000960">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_000962">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001551">
      <ENU>"The effective width at the end support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001552">
      <ENU>"The effective width in the interval (0;0.25)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001553">
      <ENU>"The effective width in the interval &lt;0.25;0.75&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001554">
      <ENU>"The effective width in the interval (0.75;1)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001555">
      <ENU>"The effective width at the end support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001556">
      <ENU>"The effective width at the end support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001557">
      <ENU>"The effective width at the end support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001558">
      <ENU>"The effective width at the end support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001559">
      <ENU>"The effective width in the interval (0;0.25)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001560">
      <ENU>"The effective width in the interval (0;0.25)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001561">
      <ENU>"The effective width in the interval (0;0.25)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001562">
      <ENU>"The effective width in the interval (0;0.25)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001563">
      <ENU>"The effective width in the interval (0;0.25)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001564">
      <ENU>"The effective width in the interval (0;0.25)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001565">
      <ENU>"The effective width in the interval (0;0.25)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001566">
      <ENU>"The effective width in the interval (0;0.25)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001567">
      <ENU>"The effective width in the interval &lt;0;1&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001570">
      <ENU>"The effective width in the interval &lt;0.25;0.75&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001571">
      <ENU>"The effective width in the interval &lt;0.25;0.75&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001572">
      <ENU>"The effective width in the interval &lt;0.25;0.75&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001573">
      <ENU>"The effective width in the interval &lt;0.25;0.75&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001574">
      <ENU>"The effective width in the interval &lt;0.25;0.75&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001575">
      <ENU>"The effective width in the interval &lt;0.25;0.75&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001576">
      <ENU>"The effective width in the interval &lt;0.25;0.75&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001577">
      <ENU>"The effective width in the interval &lt;0.25;0.75&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001578">
      <ENU>"The effective width in the interval (0.75;1)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001579">
      <ENU>"The effective width in the interval (0.75;1)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001580">
      <ENU>"The effective width in the interval (0.75;1)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001581">
      <ENU>"The effective width in the interval (0.75;1)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001582">
      <ENU>"The effective width in the interval (0.75;1)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001583">
      <ENU>"The effective width in the interval (0.75;1)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001584">
      <ENU>"The effective width in the interval (0.75;1)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001585">
      <ENU>"The effective width in the interval (0.75;1)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001586">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001587">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001588">
      <ENU>"The effective width at the end support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001589">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001590">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001591">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001592">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001593">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001594">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001595">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001596">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001597">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001598">
      <ENU>"The effective width at the internal support"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001606">
      <ENU>"Error: Incorrect position of the section!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001609">
      <ENU>"Error: Unexpected span length!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001613">
      <ENU>"Error: Unexpected span length!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001618">
      <ENU>"Error: Unexpected span length!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001622">
      <ENU>"Error: Unexpected span length!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001626">
      <ENU>"Error: Unexpected span length!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001632">
      <ENU>"Error: Unexpected span length!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001637">
      <ENU>"Error: Unexpected span length!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001642">
      <ENU>"Error: Unexpected span length!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001647">
      <ENU>"Error: Unexpected span length!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001652">
      <ENU>"Error: Unexpected span length!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001655">
      <ENU>"Error: Perpendicular distance to a beam or to the slab edge cannot be nagative!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001656">
      <ENU>"Error: The distance between the centres of the outstand shear connectors cannot be nagative!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001734">
      <ENU>"No adjacent member or slab edge was found on the side."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001735">
      <ENU>"No adjacent member or slab edge was found on the side."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_000018">
      <ENU>"Calculation of b↓eff←"</ENU>
    </Item>
    <Item TranslateID="TEXT_POR00106_000001">
      <ENU>"Manual input of effective width on the side."</ENU>
    </Item>
    <Item TranslateID="TEXT_POR00106_000003">
      <ENU>"Manual input of effective width on the side."</ENU>
    </Item>
  </Texts>
</Root>