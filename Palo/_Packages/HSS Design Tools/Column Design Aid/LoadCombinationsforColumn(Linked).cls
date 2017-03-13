<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="152003" GUID="88e3f437-7616-4082-acc9-debf0b6a24f5">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">//Load Combinations Using ASCE 7-10

SWITCH(DesignMethod) { 
    CASE 0 :  { //LRFD
        →014719TEXT("Dead Load (D↓L←) = " &amp; D↓L←); 
        →014720TEXT("Live Load (L↓L←) = " &amp; L↓L←); 
        →014721TEXT("Roof Live Load (L↓LR←) = " &amp; L↓LR←); 
        →014722TEXT("Snow Load (S↓L←) = " &amp; S↓L←); 
        →014723TEXT("Rain Load (R↓L←) = " &amp; R↓L←); 
        →014724TEXT("Wind Load (W↓L←) = " &amp; W↓L←); 
        →014725TEXT("Earthquake Load (E↓L←) = " &amp; E↓L←); 
        
        
        LRFD↓1← →014712= 1.4*D↓L←; 
        →014726BLOCK { 
            a →014727= 1.2*D↓L←+1.6*L↓L←+0.5*L↓LR←; 
            b →014728= 1.2*D↓L←+1.6*L↓L←+0.5*S↓L←; 
            c →014729= 1.2*D↓L←+1.6*L↓L←+0.5*R↓L←; 
            
            LRFD↓2← →014713= max(a, b, c); 
        } 
        →014742BLOCK { 
            a →014736= 1.2*D↓L←+1.6*L↓LR←+L↓L←; 
            b →014737= 1.2*D↓L←+1.6*S↓L←+L↓L←; 
            c →014738= 1.2*D↓L←+1.6*R↓L←+L↓L←; 
            d →014739= 1.2*D↓L←+1.6*L↓LR←+0.5*W↓L←; 
            e →014740= 1.2*D↓L←+1.6*S↓L←+0.5*W↓L←; 
            f →014741= 1.2*D↓L←+1.6*R↓L←+0.5*W↓L←; 
            
            LRFD↓3← →014714= max(a, b, c, d, e, f); 
        } 
        →014747BLOCK { 
            a →014744= 1.2*D↓L←+1.0*W↓L←+L↓L←+0.5*L↓LR←; 
            b →014745= 1.2*D↓L←+1.0*W↓L←+L↓L←+0.5*S↓L←; 
            c →014746= 1.2*D↓L←+1.0*W↓L←+L↓L←+0.5*R↓L←; 
            
            LRFD↓4← →014715= max(a, b, c); 
        } 
        LRFD↓5← →014716= 1.2*D↓L←+1.0*E↓L←+L↓L←+0.2*S↓L←; 
        LRFD↓6← →014717= 0.9*D↓L←+1.0*W↓L←; 
        LRFD↓7← →014718= 0.9*D↓L←+1.0*E↓L←; 
        
        
        LC↓1← →007111= LRFD↓1←; 
        LC↓2← →014764= LRFD↓2←; 
        LC↓3← →007113= LRFD↓3←; 
        LC↓4← →007114= LRFD↓4←; 
        LC↓5← →007115= LRFD↓5←; 
        LC↓6← →007116= LRFD↓6←; 
        LC↓6a← →014778= 0; 
        LC↓6b← →014732= 0; 
        LC↓7← →007117= LRFD↓7←; 
        LC↓8← →014730= 0; 
    } 
    CASE 1 :  { //ASD

        
        →012534TEXT("Dead Load (D↓L←) = " &amp; D↓L←); 
        →012535TEXT("Live Load (L↓L←) = " &amp; L↓L←); 
        →012536TEXT("Roof Live Load (L↓LR←) = " &amp; L↓LR←); 
        →012537TEXT("Snow Load (S↓L←) = " &amp; S↓L←); 
        →012538TEXT("Rain Load (R↓L←) = " &amp; R↓L←); 
        →012539TEXT("Wind Load (W↓L←) = " &amp; W↓L←); 
        →012540TEXT("Earthquake Load (E↓L←) = " &amp; E↓L←); 
        
        
        
        ASD↓1← →012525= D↓L←; 
        ASD↓2← →012526= D↓L←+L↓L←; 
        →014754BLOCK { 
            a →014751= D↓L←+L↓LR←; 
            b →014752= D↓L←+S↓L←; 
            c →014753= D↓L←+R↓L←; 
            
            ASD↓3← →012527= max(a, b, c); 
        } 
        →014759BLOCK { 
            a →014755= D↓L←+0.75*L↓L←+0.75*L↓LR←; 
            b →014756= D↓L←+0.75*L↓L←+0.75*S↓L←; 
            c →014757= D↓L←+0.75*L↓L←+0.75*R↓L←; 
            
            ASD↓4← →012528= max(a, b, c); 
        } 
        →014760BLOCK { 
            a →014761= D↓L←+0.6*W↓L←; 
            b →014762= D↓L←+0.7*E↓L←; 
            
            ASD↓5← →012529= max(a, b); 
        } 
        →014772BLOCK { 
            a →014769= D↓L←+0.75*L↓L←+0.75*(0.6*W↓L←)+0.75*L↓LR←; 
            b →014770= D↓L←+0.75*L↓L←+0.75*(0.6*W↓L←)+0.75*S↓L←; 
            c →014771= D↓L←+0.75*L↓L←+0.75*(0.6*W↓L←)+0.75*R↓L←; 
            
            ASD↓6a← →012530= max(a, b, c); 
            
        } 
        ASD↓6b← →012531= D↓L←+0.75*L↓L←+0.75*(0.7*E↓L←)+0.75*S↓L←; 
        ASD↓7← →012532= 0.6*D↓L←+0.6*W↓L←; 
        ASD↓8← →012533= 0.6*D↓L←+0.7*E↓L←; 
        
        
        
        LC↓1← →008201= ASD↓1←; 
        LC↓2← →008202= ASD↓2←; 
        LC↓3← →014765= ASD↓3←; 
        LC↓4← →014767= ASD↓4←; 
        LC↓5← →008205= ASD↓5←; 
        LC↓6← →012541= 0; 
        LC↓6a← →008206= ASD↓6a←; 
        LC↓6b← →008207= ASD↓6b←; 
        LC↓7← →008208= ASD↓7←; 
        LC↓8← →008209= ASD↓8←; 
    } 
    
} 
→014691BLOCK { 
    LC↓max← →014687= parmax(LC↓1←, LC↓2←, LC↓3←, LC↓3n←, LC↓4←, LC↓5←, LC↓6←, LC↓6a←, LC↓6b←, LC↓7←, LC↓8←); 
    //LC↓abs← →014688= PARMAX(ABS(LC↓1←), ABS(LC↓2←), ABS(LC↓3←), ABS(LC↓4←), ABS(LC↓5←), ABS(LC↓6←), ABS(LC↓6a←), ABS(LC↓6b←), ABS(LC↓7←), ABS(LC↓8←)); 
    
    
    
    IF(LC↓max← == LC↓1←) { 
        LC →014692= "1"; 
    } 
    IF(LC↓max← == LC↓2←) { 
        LC →014693= "2"; 
    } 
    IF(LC↓max← == LC↓3←) { 
        LC →014694= "3"; 
    } 
    IF(LC↓max← == LC↓4←) { 
        LC →014695= "4"; 
    } 
    IF(LC↓max← == LC↓5←) { 
        LC →014696= "5"; 
    } 
    IF(LC↓max← == LC↓6←) { 
        LC →014697= "6"; 
    } 
    IF(LC↓max← == LC↓6a←) { 
        LC →014698= "6a"; 
    } 
    IF(LC↓max← == LC↓6b←) { 
        LC →014699= "6b"; 
    } 
    IF(LC↓max← == LC↓7←) { 
        LC →014700= "7"; 
    } 
    IF(LC↓max← == LC↓8←) { 
        LC →014701= "8"; 
    } 
    
    
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" NAD="" LicenceID="50320" Autor="" Autor2="" Version="1" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://designforms.net</ENU>
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
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|1|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|11|0|2" Font2="Tahoma|11|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11|0|2" Font2="Tahoma|11|2|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11|0|2" Font2="Tahoma|11|0|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" />
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|5|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11|0|2" Font2="Tahoma|11|0|2" />
      <Style Key="Text 1" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11|0|2" Font2="Tahoma|11|0|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11|0|2" Font2="Tahoma|11|0|2" />
      <Style Key="Limit State Body" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body - dy 8 " X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="8" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Outcome Text dy 12" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" />
      <Style Key="Limit State Outcome" X="400" Y="0" Hor="0" Ver="2" SpX="20" SpY="-8" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Limit State Body - Wrap dy 25" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body Label" X="400" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Limit State Title" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Title" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Result" X="5" Y="0" Hor="1" Ver="4" SpX="15" SpY="5" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" />
      <Style Key="Label Italics" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Title2" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="DesignVerify" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Limit State Body- Wrap dy 50" X="5" Y="0" Hor="0" Ver="4" SpX="5" SpY="60" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body Right" X="215" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="tab loads" X="40" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Label Left" X="200" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Label Right" X="550" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="=" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="= value" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body2" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body1" X="350" Y="0" Hor="0" Ver="2" SpX="350" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="___" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="-19" Font1="Tahoma|18|0|2" Font2="Tahoma|18|1|2" />
      <Style Key="Limit State Body3" X="405" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Outcome Dim" X="400" Y="0" Hor="1" Ver="2" SpX="315" SpY="-8" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Limit State tab" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Outcome Text dy 12 R" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" />
      <Style Key="Limit State Body2.5" X="355" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="FactoredLoadsSummary" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="8" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
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
      <Variable Modifier="Public" Name="a" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_a">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓3,max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓3,max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓3,min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓3,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓3←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓3←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓4,max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓4,max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓4,min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓4,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓4←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓4←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓5,max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓5,max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓5,min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓5,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓5←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓5←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓6a,max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓6a,max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓6a,min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓6a,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓6a←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓6a←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓6b←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓6b←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓7←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓7←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ASD↓8←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓8←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_c">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="D↓L←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_D↓L←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DesignMethod" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_DesignMethod">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="e" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_e">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="E↓L←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_E↓L←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_f">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="L↓L←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_L↓L←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="L↓LR←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_L↓LR←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC" ESA_ID="" Type="String" Value="8">
        <Description TranslateID="VARIABLE_LC">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="LC↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓2n←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓2n←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓2p←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓2p←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓3←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓3←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓3n←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓3n←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓3p←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓3p←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓4←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓4←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓4n←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓4n←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓4p←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓4p←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓5←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓5←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓5n←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓5n←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓5p←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓5p←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓6←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓6←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓6a←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓6a←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓6an←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓6an←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓6ap←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓6ap←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓6b←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓6b←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓7←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓7←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓8←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓8←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓abs←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓abs←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓absmax←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓absmax←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LC↓min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LC↓min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Loading" ESA_ID="" Type="String" Value="">
        <Description TranslateID="VARIABLE_Loading">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓2,max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓2,max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓2,min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓2,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓3,max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓3,max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓3,min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓3,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓3←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓3←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓4,max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓4,max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓4,min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓4,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓4←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓4←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓5←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓5←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓6←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓6←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LRFD↓7←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓7←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="R↓L←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_R↓L←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="S↓L←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_S↓L←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="W↓L←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_W↓L←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
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
      <VC ID="007090">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007091">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007092">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007093">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007094">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007095">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007096">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007111">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007112">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007113">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007114">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007115">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007116">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007117">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007785">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007786">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007787">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007788">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007789">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007790">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="007791">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008176">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008177">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008178">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008179">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008180">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008181">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008182">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008201">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008202">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008203">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008204">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008205">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008206">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008207">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008208">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008209">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011949">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011950">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011951">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011952">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011953">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011954">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011955">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012210">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012211">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012212">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012213">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012214">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012215">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012216">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012217">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012218">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012219">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012220">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012221">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012222">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012223">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012224">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012225">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012226">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012227">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012228">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012229">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012230">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012231">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012232">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012233">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012234">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012235">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012236">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012525">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012526">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012527">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012528">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012529">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012530">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012531">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012532">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012533">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012534">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012535">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012536">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012537">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012538">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012539">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012540">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012541">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014687">
        <Set Vis="0" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014688">
        <Set Vis="0" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="250" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014689">
        <Set Vis="0" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014690">
        <Set Vis="0" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="FactoredLoadsSummary" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014691">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014692">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014693">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014694">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014695">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014696">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014697">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014698">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014699">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014700">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014701">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014702">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014703">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014704">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014705">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014706">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014707">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014708">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014709">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014710">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014711">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014712">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014713">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014714">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014715">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014716">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014717">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014718">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014719">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014720">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014721">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014722">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014723">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014724">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014725">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014726">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014727">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014728">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014729">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014730">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014731">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014732">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014733">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014734">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014735">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014736">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014737">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014738">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014739">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014740">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014741">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014742">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014743">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014744">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014745">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014746">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014747">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014748">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014749">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014750">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014751">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014752">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014753">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014754">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014755">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014756">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014757">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014758">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014759">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014760">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014761">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014762">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014763">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014764">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014765">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014766">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014767">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014768">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014769">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014770">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014771">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014772">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014773">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014774">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014775">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014776">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014777">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014778">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014779">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014780">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014781">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014782">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014783">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014784">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014785">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014786">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014787">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014788">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014789">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014790">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014791">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014792">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014793">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014794">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014795">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014796">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014797">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014798">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014799">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014800">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="014801">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
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
    <Item TranslateID="TEXT_012210">
      <ENU>"ASD↓1← = " &amp; 'D↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_012211">
      <ENU>→012212" = " &amp; D↓L← &amp; " = " &amp; ASD↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_012213">
      <ENU>"ASD↓2 ←= " &amp; 'D↓L←+L↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_012214">
      <ENU>→012215" = " &amp; D↓L←+L↓L← &amp; " = " &amp; ASD↓2←</ENU>
    </Item>
    <Item TranslateID="TEXT_012216">
      <ENU>"ASD↓3← = " &amp; 'D↓L←+MAX(L↓LR←, S↓L←, R↓L←)'</ENU>
    </Item>
    <Item TranslateID="TEXT_012217">
      <ENU>→012218" = " &amp; D↓L←+LSR &amp; " = " &amp; ASD↓3←</ENU>
    </Item>
    <Item TranslateID="TEXT_012219">
      <ENU>"ASD↓4← = " &amp; 'D↓L←+0.75*L↓L←+0.75*MAX(L↓LR←, S↓L←, R↓L←)'</ENU>
    </Item>
    <Item TranslateID="TEXT_012220">
      <ENU>→012221" = " &amp; D↓L←+0.75*L↓L←+0.75*LSR &amp; " = " &amp; ASD↓4←</ENU>
    </Item>
    <Item TranslateID="TEXT_012222">
      <ENU>"ASD↓5← = " &amp; 'D↓L←+MAX(0.6*W↓L←, 0.7*E↓L←)'</ENU>
    </Item>
    <Item TranslateID="TEXT_012223">
      <ENU>→012224" = " &amp; D↓L←+WE &amp; " = " &amp; ASD↓5←</ENU>
    </Item>
    <Item TranslateID="TEXT_012225">
      <ENU>"ASD↓6a←= " &amp; 'D↓L←+0.75*L↓L←+0.75*[0.6*W↓L←]+0.75*MAX(L↓LR←, S↓L←, R↓L←)'</ENU>
    </Item>
    <Item TranslateID="TEXT_012226">
      <ENU>→012227" = " &amp; D↓L←+0.75*L↓L←+0.75*[0.6*W↓L←]+0.75*LSR &amp; " = " &amp; ASD↓6a←</ENU>
    </Item>
    <Item TranslateID="TEXT_012228">
      <ENU>"ASD↓6b←= " &amp; 'D↓L←+0.75*L↓L←+0.75*[0.7*E↓L←]+0.75*S↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_012229">
      <ENU>→012230" = " &amp; D↓L←+0.75*L↓L←+0.75*[0.7*E↓L←]+0.75*S↓L← &amp; " = " &amp; ASD↓6b←</ENU>
    </Item>
    <Item TranslateID="TEXT_012231">
      <ENU>"ASD↓7 ←= " &amp; '0.6*D↓L←+0.6*W↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_012232">
      <ENU>→012233" = " &amp; 0.6*D↓L←+0.6*W↓L← &amp; " = " &amp; ASD↓7←</ENU>
    </Item>
    <Item TranslateID="TEXT_012234">
      <ENU>"ASD↓8← = " &amp; '0.6*D↓L←+0.7*E↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_012235">
      <ENU>→012236" = " &amp; 0.6*D↓L←+0.7*E↓L← &amp; " = " &amp; ASD↓8←</ENU>
    </Item>
    <Item TranslateID="TEXT_012534">
      <ENU>"Dead Load (D↓L←) = " &amp; D↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_012535">
      <ENU>"Live Load (L↓L←) = " &amp; L↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_012536">
      <ENU>"Roof Live Load (L↓LR←) = " &amp; L↓LR←</ENU>
    </Item>
    <Item TranslateID="TEXT_012537">
      <ENU>"Snow Load (S↓L←) = " &amp; S↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_012538">
      <ENU>"Rain Load (R↓L←) = " &amp; R↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_012539">
      <ENU>"Wind Load (W↓L←) = " &amp; W↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_012540">
      <ENU>"Earthquake Load (E↓L←) = " &amp; E↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_014702">
      <ENU>"Load Combination 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_014703">
      <ENU>"Load Combination 2"</ENU>
    </Item>
    <Item TranslateID="TEXT_014704">
      <ENU>"Load Combination 3"</ENU>
    </Item>
    <Item TranslateID="TEXT_014705">
      <ENU>"Load Combination 4"</ENU>
    </Item>
    <Item TranslateID="TEXT_014706">
      <ENU>"Load Combination 5"</ENU>
    </Item>
    <Item TranslateID="TEXT_014707">
      <ENU>"Load Combination 6"</ENU>
    </Item>
    <Item TranslateID="TEXT_014708">
      <ENU>"Load Combination 6a"</ENU>
    </Item>
    <Item TranslateID="TEXT_014709">
      <ENU>"Load Combination 6b"</ENU>
    </Item>
    <Item TranslateID="TEXT_014710">
      <ENU>"Load Combination 7"</ENU>
    </Item>
    <Item TranslateID="TEXT_014711">
      <ENU>"Load Combination 8"</ENU>
    </Item>
    <Item TranslateID="TEXT_014719">
      <ENU>"Dead Load (D↓L←) = " &amp; D↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_014720">
      <ENU>"Live Load (L↓L←) = " &amp; L↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_014721">
      <ENU>"Roof Live Load (L↓LR←) = " &amp; L↓LR←</ENU>
    </Item>
    <Item TranslateID="TEXT_014722">
      <ENU>"Snow Load (S↓L←) = " &amp; S↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_014723">
      <ENU>"Rain Load (R↓L←) = " &amp; R↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_014724">
      <ENU>"Wind Load (W↓L←) = " &amp; W↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_014725">
      <ENU>"Earthquake Load (E↓L←) = " &amp; E↓L←</ENU>
    </Item>
  </Texts>
</Root>