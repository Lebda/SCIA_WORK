<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="d6b1c3c3-fd35-4118-9ad6-45679b3ac0ec">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">IF(H1) { 
    →INI400_000073TEXT("Bearing capacity of foundation plate according to Eurocode 7, annex D"); 
} 
IF(H2) { 
    →INI400_000074TEXT(string Caption); 
} 
double π →INI400_000167= Math.PI; 
double e →INI400_000168= Math.E; 
IF(B1) { 
    →INI400_000175BLOCK("Pad and loading parameters") { 
        →INI400_000035TEXT("L = " &amp; L); 
        →INI400_000036TEXT("B = " &amp; B); 
        →INI400_000037TEXT("V↓Ed← = " &amp; V↓Ed←); 
        →INI400_000038TEXT("H↓L ←= " &amp; H↓L←); 
        →INI400_000039TEXT("H↓B ←= " &amp; H↓B←); 
        →INI400_000040TEXT("M↓L ←= " &amp; M↓L←); 
        →INI400_000041TEXT("M↓B ←= " &amp; M↓B←); 
        →INI400_000042IMG("pad"); 
        →INI400_000089TEXT("Excentricities"); 
        e↓L← →INI400_000030= M↓L←/V↓Ed←; 
        e↓B← →INI400_000031= M↓B←/V↓Ed←; 
        →INI400_000075TEXT("Effective values"); 
        L↓1← →INI400_000032= L-2*e↓L←; 
        B↓1← →INI400_000033= B-2*e↓B←; 
        A↓1← →INI400_000034= B↓1←*L↓1←; 
        α↓rad← →INI400_000064= α/57.29578; 
    } 
} ELSE { 
    e↓L← →INI400_000065= M↓L←/V↓Ed←; 
    e↓B← →INI400_000066= M↓B←/V↓Ed←; 
    L↓1← →INI400_000067= L-2*e↓L←; 
    B↓1← →INI400_000068= B-2*e↓B←; 
    A↓1← →INI400_000069= B↓1←*L↓1←; 
    α↓rad← →INI400_000070= α/57.29578; 
} 
IF(A↓1← &lt;= 0) { 
    →INI400_000174TEXT("The area is smaller the 0!"); 
    Exit(); 
} 
→INI400_000093PAGEBREAK(); 
IF(B2) { 
    →INI400_000176BLOCK("Bearing capacity coefficient") { 
        →INI400_000082TEXT("Coefficient for density"); 
        N↓γ← →INI400_000003= 2*[N↓q←-1]*TG(ϕ↓1←); 
        →INI400_000080TEXT("Coefficient for loading"); 
        N↓q← →INI400_000001= POWER(e, π*TG(ϕ↓1←))*[TG(45+ϕ↓1←/2)]↑2←; 
        →INI400_000081TEXT("Coefficient for cohesion"); 
        N↓c← →INI400_000002= [N↓q←-1]*COTG(ϕ↓1←); 
    } 
    →INI400_000094PAGEBREAK(); 
    →INI400_000177BLOCK("Coefficient of foundation base angle") { 
        →INI400_000084TEXT("Coefficient for density"); 
        b↓γ← →INI400_000004= [1-α↓rad←*TG(ϕ↓1←)]↑2←; 
        →INI400_000083TEXT("Coefficient for loading"); 
        b↓q← →INI400_000005= b↓γ←; 
        →INI400_000085TEXT("Coefficient for cohesion"); 
        b↓c← →INI400_000006= b↓q←-(1-b↓q←)/(N↓c←*TG(ϕ↓1←)); 
    } 
    →INI400_000095PAGEBREAK(); 
    →INI400_000178BLOCK("Coefficient of pad shape") { 
        →INI400_000086TEXT("Coefficient for density"); 
        s↓γ← →INI400_000008= 1-0.3*(B↓1←/L↓1←); 
        →INI400_000087TEXT("Coefficient for loading"); 
        s↓q← →INI400_000007= 1+SIN(ϕ↓1←)*(B↓1←/L↓1←); 
        →INI400_000088TEXT("Coefficient for cohesion"); 
        s↓c← →INI400_000009= (s↓q←*N↓q←-1)/(N↓q←-1); 
    } 
    →INI400_000096PAGEBREAK(); 
    →INI400_000179BLOCK("Exponents for calculation the coefficient of loading angle") { 
        H →INI400_000024= SQRT(H↓B←↑2←+H↓L←↑2←); 
        IF(H &gt; 0) { 
            cosθ →INI400_000025= H↓B←/H; 
            sinθ →INI400_000026= H↓L←/H; 
        } ELSE { 
            cosθ →INI400_000055= 0.707; 
            sinθ →INI400_000056= 0.707; 
        } 
        →INI400_000090TEXT("B direction"); 
        m↓B← →INI400_000027= [2+B↓1←/L↓1←]/[1+B↓1←/L↓1←]; 
        →INI400_000091TEXT("L direction"); 
        m↓L← →INI400_000028= [2+L↓1←/B↓1←]/[1+L↓1←/B↓1←]; 
        m →INI400_000029= m↓L←*[cosθ]↑2←+m↓B←*[sinθ]↑2←; 
    } 
    →INI400_000180BLOCK("Coefficient of loading angle") { 
        →INI400_000079TEXT("Coefficient for density"); 
        i↓γ← →INI400_000012= [1-H/(V↓Ed←+A↓1←*c↓1←*COTG(ϕ↓1←))]↑m+1←; 
        →INI400_000077TEXT("Coefficient for loading"); 
        i↓q← →INI400_000072= [1-H/(V↓Ed←+A↓1←*c↓1←*COTG(ϕ↓1←))]↑m←; 
        →INI400_000078TEXT("Coefficient for cohesion"); 
        i↓c← →INI400_000010= i↓q←-(1-i↓q←)/(N↓c←*TG(ϕ↓1←)); 
    } 
    →INI400_000097PAGEBREAK(); 
    →INI400_000181BLOCK("Foundation base bearing capacity") { 
        R↓Rd← →INI400_000013= c↓1←*N↓c←*b↓c←*s↓c←*i↓c←+q↓1←*N↓q←*b↓q←*s↓q←*i↓q←+0.5*γ↓1←*B↓1←*N↓γ←*b↓γ←*s↓γ←*i↓γ←; 
        →INI400_000048TEXT(" = " &amp; c↓1←*N↓c←*b↓c←*s↓c←*i↓c← &amp; " + "); 
        →INI400_000050TEXT("+" &amp; q↓1←*N↓q←*b↓q←*s↓q←*i↓q←+0.5*γ↓1←*B↓1←*N↓γ←*b↓γ←*s↓γ←*i↓γ← &amp; " = "); 
        →INI400_000052TEXT(Val(R↓Rd←*10↑-3←, 3) &amp; " kPa"); 
    } 
} ELSE { 
    →INI400_000098PAGEBREAK(); 
    →INI400_000182BLOCK("Bearing capacity coefficient") { 
        H →INI400_000169= SQRT(H↓B←↑2←+H↓L←↑2←); 
        b↓c← →INI400_000015= 1-(2*α↓rad←)/(π+2); 
        s↓c← →INI400_000016= 1+0.2*[B↓1←/L↓1←]; 
        IF(A↓1←*c↓u← &lt; H) { 
            →INI400_000170TEXT("Total cohesion is too low to carry horizontal forces."); 
            →INI400_000172TEXT('A↓1←*c↓u←' &amp; " = " &amp; A↓1←*c↓u← &amp; " = " &amp; Val(A↓1←*c↓u←, 0) &amp; " &lt; H = " &amp; H); 
            →INI400_000173TEXT('A↓1←*c↓u←' &amp; " have to be bigger than H"); 
            →INI400_000171TEXT("Increase total cohesion or effective area of pad."); 
            Exit(); 
        } 
        i↓c← →INI400_000017= (1/2)*[1+SQRT(1-H/(A↓1←*c↓u←))]; 
    } 
    →INI400_000099PAGEBREAK(); 
    →INI400_000071TEXT("Foundation base bearing capacity"); 
    R↓Rd← →INI400_000018= [π+2]*c↓u←*b↓c←*s↓c←*i↓c←+q; 
} 
→INI400_000100PAGEBREAK(); 
→INI400_000059TEXT("Check"); 
V↓Rd← →INI400_000057= A↓1←*R↓Rd←; 
s →INI400_000058= V↓Ed←/V↓Rd←; 
IF(s &lt; 1) { 
    →INI400_006313TEXT("&lt; 1"); 
    →INI400_000060TEXT("=&gt; Bearing capacity of foundation base is SUFFICIENT"); 
} ELSE { 
    →INI400_006314TEXT("&gt; 1"); 
    →INI400_000061TEXT("=&gt; Bearing capacity of foundation base is INSUFFICIENT!"); 
} 

//annex variables are none, annex independent calculation</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="-1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="18" EWNSource="" Icon="iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAZdEVYdFNvZnR3YXJlAEFkb2JlIEltYWdlUmVhZHlxyWU8AAADImlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpFMjlENTM3OThEN0ExMUUzODM5OUZDM0FFRURBNEE1RCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFMjlENTM3QThEN0ExMUUzODM5OUZDM0FFRURBNEE1RCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkUyOUQ1Mzc3OEQ3QTExRTM4Mzk5RkMzQUVFREE0QTVEIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkUyOUQ1Mzc4OEQ3QTExRTM4Mzk5RkMzQUVFREE0QTVEIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+HcNIjAAAA8ZJREFUOE+FlFtTU1cUgFd/QNvpc5/70ofO9Bd0fPQn9KUzjr3KyEUSCCQhgXBVQQSEkJsJuZ2cXImEWxQkNOMoRSeJ2DK1pfZBO53pDATQiiSray2JRQjtwzfZt/PttdfaO2B3eY5hc7rB6fZCQAmDokYgGIqcJrLEMnGKgLFxB+TyDwERYXt75y0gfWuxKguLmU9S03MzHl9we8IXREWNCh5vAL2B0GYkNpn6deO3j0ql0nHpq1f7x+Dd19d/Do/bnLi0nC3dXFjanfApZa9fKS/cXt5duJ0p89zjx7/oyuUqkRaL27Czs/sWLP0+eyd45uzXODwyuheLT/4xPTtfZKj955XBob2zX36Lq6sPmqoevzJYPDTIYysrq4H6C1psatbjdzW1GFTUfY/Ht3+upo7GWlGjbcF84eEx6dZWEWBzc0skz5+/kKgr0nssbdBge0cXNuv0aLO78NqoFVtajWhu78RGTTPm8/9KKyfmPtCuLJBOqVSWycNSFrDU5fKgddxRVcrRvXy5J99tbDwBoGPA+doG8PsVmeQJ5u7dlf+V5vIFkVaYnUtDXb0GoMPSDSZzJ1CugI4K9x/kZEE+X/DX1l04UdpA+f7xp3Utr3369BnQbYCvvjkHrXoTiIjF3T0XJRVUVUgmp+CH1fuqtqnlRCkXcG3tUWMuV4C6Bg3U1jeCpbNHfEALwGg0CzzQ2d13+uLlwVQ4EkOT2XKilAQYUNRnpnZLfau+7X1aC3qDiU5tAW6809N76Ysxq32OXssWv5rUbBrjiRtIi99U/6iUN1RCEaSXhb5AqOxwedb6B672mkwdH/K7/itGgtjklCwIhWMYjSdxZnYetVqdFITvpev6BI7bHKhrMdCYTuTRWALVaALDBDvi5FAjcQSH043+oCpSlnGk3J+ZSyOnwGZ3IuUMR0bGcGDgKnKe7XRnVdp88sa0rGVRPJmSgK57fAi8Mx9laHgU+Y+DxQy9c0xOzWBmOUuvKYyRaByDJODfpUwWEyRkCUdIp5XH0dXdJyfgymObqUPyZ2xrx0v9g+ie8IuY08EbJSiK9M1FnE/fEgn9Jco8y4avWSXv/L3BaJY2V7yR+Js7XICKvLfvsuzOYs6Vj6JU1Ji0eaOBK0OvZRQZB8XtA6JyjYj3iDPEI468ItcTdDNw1GqXqFxuL/aTjCosBTskKxGDxMfE68t/hM+JDCEfGAwmiYbvJUs4Z1wD3pzmfycsxAfEG8dh2VE+JdKEyFnIJzjoPyFqiGrf/ae0wruEnXhBFIjPiGrrDuiCfwAsfU5JUwNTkgAAAABJRU5ErkJggg==">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Geotechnics_bearing_cap_plate_foundation.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Bearing capacity of foundation plate according to EN 1997-1, annex D</ENU>
      </CalculationName>
    </Header>
    <Styles />
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="A↓1←" ESA_ID="" Type="Double" Value="1.777778" Precision="2">
        <Description TranslateID="VARIABLE_A↓1←">
          <ENU>Effective area</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="B" ESA_ID="" Type="Double" Value="1.2" Precision="2">
        <Description TranslateID="VARIABLE_B">
          <ENU>Foundation width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="B↓1←" ESA_ID="" Type="Double" Value="1.066667" Precision="2">
        <Description TranslateID="VARIABLE_B↓1←">
          <ENU>Effective width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓c←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="b↓q←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="b↓γ←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="B1" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_B1">
          <ENU>Print scheme of pad and loading</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="B2" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_B2">
          <ENU>Conditions without water</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="c↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_c↓1←">
          <ENU>Effective cohesion</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kPa" />
      </Variable>
      <Variable Modifier="Public" Name="c↓u←" ESA_ID="" Type="Double" Value="60000" Precision="2">
        <Description TranslateID="VARIABLE_c↓u←">
          <ENU>Total cohesion</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kPa" />
      </Variable>
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="cosθ" ESA_ID="" Type="Double" Value="707.1068e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="e" ESA_ID="" Type="Double" Value="2.718282" Precision="2">
        <Description>
          <ENU>Euler´s number </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="e↓B←" ESA_ID="Result.05" Type="Double" Value="66.66667e-3" Precision="2">
        <Description TranslateID="VARIABLE_e↓B←">
          <ENU>Load excentricity in B direction</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="e↓L←" ESA_ID="Result.04" Type="Double" Value="166.6667e-3" Precision="2">
        <Description TranslateID="VARIABLE_e↓L←">
          <ENU>Load excentricity in L direction</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="H" ESA_ID="" Type="Double" Value="70710.68" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="H↓B←" ESA_ID="" Type="Double" Value="50000" Precision="2">
        <Description TranslateID="VARIABLE_H↓B←">
          <ENU>Horizontal force in B direction</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="H↓L←" ESA_ID="" Type="Double" Value="50000" Precision="2">
        <Description TranslateID="VARIABLE_H↓L←">
          <ENU>Horizontal force in L direction</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="H1" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_H1">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="H2" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_H2">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="i↓c←" ESA_ID="" Type="Double" Value="790.2961e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="i↓q←" ESA_ID="" Type="Double" Value="930.1293e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="i↓γ←" ESA_ID="" Type="Double" Value="886.2826e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="L" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_L">
          <ENU>Foundation length</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓1←" ESA_ID="" Type="Double" Value="1.666667" Precision="2">
        <Description TranslateID="VARIABLE_L↓1←">
          <ENU>Effective length</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="m" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="m↓B←" ESA_ID="" Type="Double" Value="1.609756" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓B←" ESA_ID="" Type="Double" Value="100000" Precision="2">
        <Description TranslateID="VARIABLE_M↓B←">
          <ENU>Bending moment in B direction</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="m↓L←" ESA_ID="" Type="Double" Value="1.390244" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓L←" ESA_ID="" Type="Double" Value="250000" Precision="2">
        <Description TranslateID="VARIABLE_M↓L←">
          <ENU>Bending moment in L direction</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="N↓c←" ESA_ID="" Type="Double" Value="20.72053" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓q←" ESA_ID="" Type="Double" Value="10.66214" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓γ←" ESA_ID="" Type="Double" Value="9.011062" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NA" ESA_ID="" Type="String" Value="annex D">
        <Description TranslateID="VARIABLE_NA">
          <ENU>National code</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="q" ESA_ID="" Type="Double" Value="150000" Precision="2">
        <Description TranslateID="VARIABLE_q">
          <ENU>Soil pressure and loading in found. base</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kPa" />
      </Variable>
      <Variable Modifier="Public" Name="q↓1←" ESA_ID="" Type="Double" Value="150000" Precision="2">
        <Description TranslateID="VARIABLE_q↓1←">
          <ENU>Design value of eff. compression in foundation base</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kPa" />
      </Variable>
      <Variable Modifier="Public" Name="R↓Rd←" ESA_ID="Result.03" Type="Double" Value="425009.6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kPa" />
      </Variable>
      <Variable Modifier="Public" Name="s" ESA_ID="Result.01" Type="Double" Value="1.985249" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="s↓c←" ESA_ID="" Type="Double" Value="1.128" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="s↓q←" ESA_ID="" Type="Double" Value="1.270476" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="s↓γ←" ESA_ID="" Type="Double" Value="808e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="sinθ" ESA_ID="" Type="Double" Value="707.1068e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Ed←" ESA_ID="" Type="Double" Value="1.5e6" Precision="2">
        <Description TranslateID="VARIABLE_V↓Ed←">
          <ENU>Axial force (compression is positive)</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Rd←" ESA_ID="Result.02" Type="Double" Value="755572.6" Precision="2">
        <Description TranslateID="VARIABLE_V↓Rd←">
          <ENU>Bearing capacity of foundation pad</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="α" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_α">
          <ENU>Angle of foundation base</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="α↓rad←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓1←" ESA_ID="" Type="Double" Value="20000" Precision="2">
        <Description TranslateID="VARIABLE_γ↓1←">
          <ENU>Effective density</ENU>
        </Description>
        <Unit m="-2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="π" ESA_ID="" Type="Double" Value="3.141593" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓1←" ESA_ID="" Type="Double" Value="25" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓1←">
          <ENU>Effective angle of inner friction</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
    </Variables>
    <DrawingGroups />
    <ResultTables />
    <ResultGroups />
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Full</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Standard</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_2">
          <ENU>Brief</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_3">
          <ENU>Layout 4</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_4">
          <ENU>Layout 5</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_5">
          <ENU>Layout 6</ENU>
        </Names>
      </Layout>
    </Layouts>
    <VisualComponents>
      <VC ID="INI400_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="536" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="549" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="99.9" Y="243" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="240" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="240" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="240" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="603" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="574" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="183" Y="243" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="274" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="274" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="274" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="506" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="520" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="243" Hor="0" Ver="4" SpX="30" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="303" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="303" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="303" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="652" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="629" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="273" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="674" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="650" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="97.8" Y="273" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="287" Y="362" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="287" Y="362" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="287" Y="362" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
      </VC>
      <VC ID="INI400_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="698" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="678" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="186" Y="273" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="395" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="395" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="395" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000007">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="782" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="774" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="83.1" Y="303" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="461" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="461" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="461" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000008">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="755" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="745" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="303" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="494" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="494" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="494" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000009">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="813" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="809" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="164" Y="303" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="295" Y="494" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="295" Y="494" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="295" Y="494" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1220" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="293" Y="1016" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="178" Y="357" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="655" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="655" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="655" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000012">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1083" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="965" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="357" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="733" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="733" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="733" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000013">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1278" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|5|2" EqStyle="9" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1073" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="1" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="406" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="1" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="794" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="1" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="794" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="1" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="794" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="1" />
      </VC>
      <VC ID="INI400_000015">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="547" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="517" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="233" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="37" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="37" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="37" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000016">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="583" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="548" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="97.8" Y="233" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="84" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="186" Y="29" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="123" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="123" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="123" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000018">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="684" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="144" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="53" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="183" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="183" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="183" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000024">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="874" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000025">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="656" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="656" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="656" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="656" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="656" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="656" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000026">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="690" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="690" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="690" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="690" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="690" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="690" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000027">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="924" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="894" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="333" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="575" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="575" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="575" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000028">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="989" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="157" Y="894" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="88.7" Y="333" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="272" Y="575" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="272" Y="575" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="272" Y="575" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000029">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1039" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="303" Y="894" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="166" Y="333" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="623" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="623" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="623" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000030">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="328" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="342" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="149" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="36" Hor="0" Ver="1" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="36" Hor="0" Ver="1" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="36" Hor="0" Ver="1" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000031">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="363" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="378" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="99.8" Y="149" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="75" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="75" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="75" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000032">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="414" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="429" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="104" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="104" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="104" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000033">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="434" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="448" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="99.8" Y="194" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="126" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="126" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="126" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000034">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="456" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="470" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="194" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="151" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="151" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="151" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000035">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="50.4" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="64.5" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="64.5" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="70" Y="173" Hor="1" Ver="4" SpX="50" SpY="-39" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="70" Y="173" Hor="1" Ver="4" SpX="50" SpY="-39" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="70" Y="173" Hor="1" Ver="4" SpX="50" SpY="-39" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000036">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="99.8" Y="50.4" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="99.8" Y="64.5" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="99.8" Y="64.5" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="235" Y="137" Hor="1" Ver="4" SpX="215" SpY="-75" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="235" Y="137" Hor="1" Ver="4" SpX="215" SpY="-75" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="235" Y="137" Hor="1" Ver="4" SpX="215" SpY="-75" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000037">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="69.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="130" Y="31" Hor="1" Ver="1" SpX="110" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="130" Y="31" Hor="1" Ver="1" SpX="110" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="130" Y="31" Hor="1" Ver="1" SpX="110" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000038">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="100" Y="69.9" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="100" Y="84" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="100" Y="84" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="86" Hor="3" Ver="1" SpX="-191" SpY="60" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="86" Hor="3" Ver="1" SpX="-191" SpY="60" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="86" Hor="3" Ver="1" SpX="-191" SpY="60" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000039">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="90.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="170" Y="56" Hor="1" Ver="1" SpX="150" SpY="30" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="170" Y="56" Hor="1" Ver="1" SpX="150" SpY="30" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="170" Y="56" Hor="1" Ver="1" SpX="150" SpY="30" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000040">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="100" Y="90.3" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="100" Y="104" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="100" Y="104" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="54" Y="126" Hor="1" Ver="4" SpX="34" SpY="-86" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="54" Y="126" Hor="1" Ver="4" SpX="34" SpY="-86" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="54" Y="126" Hor="1" Ver="4" SpX="34" SpY="-86" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000041">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="90.3" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="104" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="104" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="35" Y="55" Hor="3" Ver="1" SpX="-158" SpY="29" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="35" Y="55" Hor="3" Ver="1" SpX="-158" SpY="29" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="35" Y="55" Hor="3" Ver="1" SpX="-158" SpY="29" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000042">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="193" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="207" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="20" Y="200" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="112" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="112" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="112" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000048">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="368" Y="1278" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="9" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="378" Y="1073" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="378" Y="406" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="794" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="794" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="320" Y="794" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000050">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1295" Hor="0" Ver="4" SpX="36" SpY="3" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="9" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1089" Hor="0" Ver="4" SpX="10" SpY="2" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="422" Hor="0" Ver="4" SpX="36" SpY="2" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="46" Y="813" Hor="1" Ver="4" SpX="36" SpY="2" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="46" Y="813" Hor="1" Ver="4" SpX="36" SpY="2" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="46" Y="813" Hor="1" Ver="4" SpX="36" SpY="2" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000052">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="461" Y="1295" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="471" Y="1089" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="471" Y="422" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="568" Y="813" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="568" Y="813" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="568" Y="813" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000055">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000056">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000057">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="1343" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="1137" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="470" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="856" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="856" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="856" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000058">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1371" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="1165" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="498" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="888" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="888" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="888" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000059">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1324" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1118" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="451" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000060">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="173" Y="1371" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|1|2" Font2="Tahoma|12.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="183" Y="1165" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|1|2" Font2="Tahoma|12.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="183" Y="498" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|1|2" Font2="Tahoma|12.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="193" Y="960" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="193" Y="960" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="193" Y="960" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000061">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="169" Y="1385" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|1|2" Font2="Tahoma|12.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="177" Y="558" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|1|2" Font2="Tahoma|12.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="177" Y="276" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|12.6|1|2" Font2="Tahoma|12.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="225" Y="888" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="225" Y="888" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="225" Y="888" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000064">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="330" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="330" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="330" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="330" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="330" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="330" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000065">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000066">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000067">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000068">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000069">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000070">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000071">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="665" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="122" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="264" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="161" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="161" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="161" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000072">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1149" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1016" Hor="0" Ver="4" SpX="20" SpY="15" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="93.6" Y="357" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="693" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="693" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="693" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000073">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.04" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.04" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.04" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000074">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000075">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="395" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="409" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="174" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000077">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1149" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="645" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000078">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1220" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="696" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000079">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1083" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="694" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000080">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="536" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="285" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000081">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="603" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="319" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000082">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="506" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="260" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000083">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="674" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="390" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000084">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="652" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="372" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000085">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="698" Hor="0" Ver="4" SpX="0" SpY="9" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="261" Y="428" Hor="4" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000086">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="755" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="146" Y="428" Hor="4" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000087">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="782" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="484" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000088">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="813" Hor="0" Ver="4" SpX="0" SpY="9" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="512" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000089">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="300" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="315" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="130" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000090">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="924" Hor="0" Ver="4" SpX="0" SpY="35" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="512" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000091">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="989" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="512" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="528" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000093">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="469" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="483" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="207" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000094">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="616" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="587" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="183" Y="256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000095">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="719" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="700" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="186" Y="286" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000096">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="833" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="829" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="164" Y="316" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000097">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1242" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="293" Y="1036" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="178" Y="370" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000098">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="488" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="488" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000099">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="648" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000100">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="461" Y="1307" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="471" Y="1101" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="471" Y="434" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000167">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="40.4" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000168">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="59.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000169">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="519" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|0|2" Font2="Tahoma|12.6|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000170">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="576" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="258" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000171">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="672" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="637" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="318" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000172">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="631" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="596" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="277" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000173">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="651" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="616" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="298" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000174">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="496" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="496" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="219" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000175">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000176">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000177">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000178">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000179">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000180">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000181">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000182">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000183">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="173" Y="955" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="183" Y="798" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="183" Y="390" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="447" Y="571" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="447" Y="571" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="447" Y="571" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000184">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="169" Y="781" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="450" Y="717" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="450" Y="717" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="454" Y="690" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="454" Y="690" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="454" Y="690" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|11.7|1|2" Font2="Tahoma|11.7|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006313">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006314">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="pad" Content="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" />
      <Image Name="plate" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TGroupBox Name="" ID="30" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="29" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000030">
            <ENU>Soil parameters</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="q↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="c↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="ϕ↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="γ↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="20" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="q" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="18" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="c↓u←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="29" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="28" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000029">
            <ENU>Pad geometry</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="α" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="B" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="L" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="28" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000028">
            <ENU>Loading</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H↓B←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="7" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H↓L←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="M↓B←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="M↓L←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="V↓Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TPanel Name="" ID="27" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
          <Texts>
            <ENU>
            </ENU>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="B2" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000002">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="B1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000001">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TStringInput Name="TStringInput" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H2" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000003">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000002">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TPanel>
      </TPanel>
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_INI400_000175">
      <ENU>"Pad and loading parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_000176">
      <ENU>"Bearing capacity coefficient"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_000177">
      <ENU>"Coefficient of foundation base angle"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_000178">
      <ENU>"Coefficient of pad shape"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_000179">
      <ENU>"Exponents for calculation the coefficient of loading angle"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_000180">
      <ENU>"Coefficient of loading angle"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_000181">
      <ENU>"Foundation base bearing capacity"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_000182">
      <ENU>"Bearing capacity coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000019">
      <ENU>"Coefficient of foundation base angle"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000020">
      <ENU>"Coefficient of pad shape"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000021">
      <ENU>"Exponents for calculation the coefficient of loading angle"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000022">
      <ENU>"Bearing capacity coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000023">
      <ENU>"Foundation base bearing capacity"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000035">
      <ENU>"L = " &amp; L</ENU>
    </Item>
    <Item ID="TEXT_INI400_000036">
      <ENU>"B = " &amp; B</ENU>
    </Item>
    <Item ID="TEXT_INI400_000037">
      <ENU>"V↓Ed← = " &amp; V↓Ed←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000038">
      <ENU>"H↓L ←= " &amp; H↓L←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000039">
      <ENU>"H↓B ←= " &amp; H↓B←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000040">
      <ENU>"M↓L ←= " &amp; M↓L←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000041">
      <ENU>"M↓B ←= " &amp; M↓B←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000048">
      <ENU>" = " &amp; c↓1←*N↓c←*b↓c←*s↓c←*i↓c← &amp; " + "</ENU>
    </Item>
    <Item ID="TEXT_INI400_000050">
      <ENU>"+" &amp; q↓1←*N↓q←*b↓q←*s↓q←*i↓q←+0.5*γ↓1←*B↓1←*N↓γ←*b↓γ←*s↓γ←*i↓γ← &amp; " = "</ENU>
    </Item>
    <Item ID="TEXT_INI400_000052">
      <ENU>Val(R↓Rd←*10↑-3←, 3) &amp; " kPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000053">
      <ENU>"Pad and loading parameters"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000059">
      <ENU>"Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000060">
      <ENU>"=&gt; Bearing capacity of foundation base is SUFFICIENT"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000061">
      <ENU>"=&gt; Bearing capacity of foundation base is INSUFFICIENT!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000062">
      <ENU>"Bearing capacity coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000071">
      <ENU>"Foundation base bearing capacity"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000073">
      <ENU>"Bearing capacity of foundation plate according to Eurocode 7, annex D"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000074">
      <ENU>string Caption</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000075">
      <ENU>"Effective values"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000076">
      <ENU>"Coefficient of loading angle"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000077">
      <ENU>"Coefficient for loading"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000078">
      <ENU>"Coefficient for cohesion"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000079">
      <ENU>"Coefficient for density"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000080">
      <ENU>"Coefficient for loading"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000081">
      <ENU>"Coefficient for cohesion"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000082">
      <ENU>"Coefficient for density"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000083">
      <ENU>"Coefficient for loading"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000084">
      <ENU>"Coefficient for density"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000085">
      <ENU>"Coefficient for cohesion"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000086">
      <ENU>"Coefficient for density"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000087">
      <ENU>"Coefficient for loading"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000088">
      <ENU>"Coefficient for cohesion"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000089">
      <ENU>"Excentricities"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000090">
      <ENU>"B direction"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000091">
      <ENU>"L direction"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000092">
      <ENU>NA</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000170">
      <ENU>"Total cohesion is too low to carry horizontal forces."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000171">
      <ENU>"Increase total cohesion or effective area of pad."</ENU>
    </Item>
    <Item ID="TEXT_INI400_000172">
      <ENU>'A↓1←*c↓u←' &amp; " = " &amp; A↓1←*c↓u← &amp; " = " &amp; Val(A↓1←*c↓u←, 0) &amp; " &lt; H = " &amp; H</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000173">
      <ENU>'A↓1←*c↓u←' &amp; " have to be bigger than H"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000174">
      <ENU>"The area is smaller the 0!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006313">
      <ENU>"&lt; 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006314">
      <ENU>"&gt; 1"</ENU>
    </Item>
  </Texts>
</Root>