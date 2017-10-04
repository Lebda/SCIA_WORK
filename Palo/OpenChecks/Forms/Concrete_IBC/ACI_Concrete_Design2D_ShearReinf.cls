<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="101948f4-adb9-47d6-8b06-a2a29dd03c95">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="526">//------------------------------------------------------------
//@VARIABLES

→UNK000_014696BLOCK("@EXTERNS") { 
    →UNK000_014690object FONTS_COLORS; 
    →UNK000_014692object FUNCT_2D; 
    →UNK000_014694object FUNCT_EWN; 
    →UNK000_014695object FUNCT_2D_DEFAULTS; 
    →REZ006_000108object FUNCT_BAR; 
} 

→UNK000_014713BLOCK("@VARIABLES") { 
    →UNK000_014989object obEWN →UNK000_020873= new object[]; 
    →UNK000_014990object IndexEWN; 
    →UNK000_014697object _dialog_BasicForces; 
    →UNK000_014698object _dialog_RecalcForcesPOD; 
    →UNK000_014699object _dialog_DesignReinf; 
    →UNK000_014700bool _dialog_AutoTheta; 
    →UNK000_014701double ElementID; 
    →UNK000_014702double CssID; 
    →UNK000_014703double MemberType; 
    →UNK000_014704double h; 
    →UNK000_014705object[] BasicForces; 
    →UNK000_014706object[] RecalcForcesPOD; 
    →UNK000_014707object[] DesignReinf; 
    →UNK000_014708double CombiID; 
    →UNK000_014709double ID_ShearReinf; 
    →UNK000_014710double ID_ShearCapacity; 
    →UNK000_014711double ID_ConcreteCapacity; 
    →UNK000_020872double DshearReinf; 
    →REZ006_000015double A↓v,prov←; 
    →REZ006_000029double A↓v,prov,max←; 
    →REZ006_000039double UCmax_VR; 
    //output
    →UNK000_014712object DesignShear; 
    →UNK000_020865string comboID; 
    →UNK000_020866string comboIDmax; 
    →REZ006_000118string ShearInfo; 
    →UNK006_000007object T_Table; 
    
    →RLF098_000004bool Imperialunit; 
} 

//------------------------------------------------------------
//@FUNCTIONS

bool ValidateInput(object Input) { 
    MemberType →UNK000_014714= Input.Get("MemberType"); 
    h →UNK000_014715= Input.Get("h"); //@height of member  
    Imperialunit →RLF098_000025= Input.Get("Imperialunit"); 
    obEWN →UNK000_014716= Input.Get("obEWN"); 
    IndexEWN →UNK000_014717= Input.Get("IndexEWN"); // index of EWN
    ElementID →UNK000_014718= Input.Get("ElementID"); //ID of element
    CssID →UNK000_014719= Input.Get("CssID"); //ID of cross-section for determination material of the element
    RecalcForcesPOD →UNK000_014720= Input.Get("RecalcForcesPOD"); // object of parametres for calculation z
    BasicForces →UNK000_014721= Input.Get("BasicForces"); // object with forces for calculation shear
    DesignReinf →UNK000_014722= Input.Get("DesignReinf"); // longitudinal reinforcement data
    DesignDefaults →UNK000_014723= Input.Get("DesignDefaults"); 
    return true; 
} 

object GetOutput() { 
    return new Structure(
    "Aswm_req", A↓v,req←, 
    "Aswm_prov", A↓v,prov←, 
    "Aswm_pract", 0, 
    "Fsd", 0, 
    "obEWN", obEWN, 
    "bPOD", False, 
    "vRdc", V↓c←, 
    "vRdmax", v↓Rd,max←, 
    "Info", ShearInfo
    
    ); 
} 

private void LoadExterns() { 
    FONTS_COLORS →UNK000_014725= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\FontsAndColors.CLC"); 
    FUNCT_EWN →UNK000_014729= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\Functions1D_EWN.clc"); 
    FUNCT_2D →UNK000_014727= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\ACI_Functions2D.clc"); 
    FUNCT_2D_DEFAULTS →UNK000_014730= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\ACI_Functions2D_DesignDefaults.clc"); 
    FUNCT_BAR →REZ006_000109= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\ACI_Functions2D_RebarInfo.clc"); 
} 

private void LoadDialogInputs() { 
    object CS_Material →UNK000_014731= IO.CONCRETE.IBC; 
    →UNK000_014732FUNCT_2D.WriteSectionToDataCache(h, CS_Material); 
    RecalcForcesPOD →UNK000_014733= _dialog_RecalcForcesPOD; 
    BasicForces →UNK000_014734= _dialog_BasicForces; 
    DesignReinf →UNK000_014735= _dialog_DesignReinf; 
    IF(COMPARE(MOD(10^6*h, 3175), 0, 2) == 0) { 
        Imperialunit →RLF098_000037= true; 
    } ELSE { 
        Imperialunit →RLF098_000038= false; 
    } 
    →UNK006_000003object Designdefaultinput →UNK006_000006= new Structure(); 
    →RLF098_000023Designdefaultinput.Add("MemberType", MemberType); 
    →RLF098_000015Designdefaultinput.Add("Imperialunit", Imperialunit); 
    DesignDefaults →UNK000_014736= FUNCT_2D_DEFAULTS.GetDesignDefaults(→RLF098_000024Designdefaultinput); 
    bool bAutoTheta →UNK000_014737= _dialog_AutoTheta; 
    →UNK000_014738DesignDefaults.Solver.Set("bAuto_θ", bAutoTheta); 
    obEWN →UNK000_014739= new object[]; 
    double IndexEWN →UNK000_014740= 1; 
} 

private void GetLongReinfInLCS(object DesignReinf, out double A↓sl,x←, out double A↓sl,y←) { 
    →UNK000_014741double&lt;in↑2←,2&gt; A↓sl,x←; 
    →UNK000_014742double&lt;in↑2←,2&gt; A↓sl,y←; 
    FOR(j, 0, 3) { 
        IF(MemberType == 16 || MemberType == 64) { 
            IF(DesignReinf[j].Tensile != 0 &amp;&amp; DesignReinf[j].MainVert) { 
                A↓sl,x← →UNK000_014743= A↓sl,x←+DesignReinf[j].As_req*[COS(DesignReinf[j].α)]↑2←; 
                A↓sl,y← →UNK000_014744= A↓sl,y←+DesignReinf[j].As_req*[COS(90-DesignReinf[j].α)]↑2←; 
            } 
        } ELSE { 
            IF(DesignReinf[j].Tensile != 0) { 
                A↓sl,x← →UNK000_014745= A↓sl,x←+DesignReinf[j].As_req*[COS(DesignReinf[j].α)]↑2←; 
                A↓sl,y← →UNK000_014746= A↓sl,y←+DesignReinf[j].As_req*[COS(90-DesignReinf[j].α)]↑2←; 
            } 
        } 
    } 
    IF(Imperialunit) { 
        →UNK000_014748TEXT("A↓sl,x← = " &amp; CUnit(A↓sl,x←, "in↑2←") &amp; " in↑2←/ft") @REF("Longitudinal reinforcement area in x direction"); 
        →UNK000_014749TEXT("A↓sl,y← = " &amp; CUnit(A↓sl,y←, "in↑2←") &amp; " in↑2←/ft") @REF("Longitudinal reinforcement area in y direction"); 
    } ELSE { 
        →RLF098_000056TEXT("A↓sl,x← = " &amp; CUnit(A↓sl,x←, "mm↑2←") &amp; " mm↑2←/m") @REF("Longitudinal reinforcement area in x direction"); 
        →RLF098_000057TEXT("A↓sl,y← = " &amp; CUnit(A↓sl,y←, "mm↑2←") &amp; " mm↑2←/m") @REF("Longitudinal reinforcement area in y direction"); 
    } 
} 
private void NShearLinks(double A↓v,req←, double ϕ↓s,req←, object Result) { 
    double A↓v1← →REZ006_000097= (0.25*Math.PI*ϕ↓s,req←↑2←); 
    s↓l,req← →REZ006_000096= A↓v1←/(b*A↓v,req←); 
    n↓s,req← →UNK000_014774= ROUNDUP(1/s↓l,req←, 0); 
    →UNK000_020818TEXT("n↓s,req←= " &amp; 'A↓v,req←/(0.25*π*ϕ↓s,req←↑2←)' &amp; " = " &amp; n↓s,req← &amp; "  /ft") @REF("Number of Rebars/ft"); 
    IF(COMPARE(n↓s,req←, 0, 3) != 0) { 
        s↓l,req← →UNK000_014775= PhysConst(1, "ft")/(n↓s,req←); 
    } 
    double A↓v,prov← →REZ006_000016= n↓s,req←*(0.25*Math.PI*ϕ↓s,req←↑2←); 
    double Barno →REZ006_000116= FUNCT_BAR.BarNoCalculation(ϕ↓s,req←); 
    IF(Imperialunit) { 
        ShearInfo →REZ006_000119= "#" &amp; Barno &amp; "@" &amp; CUnit(s↓l,req←, "in"); 
    } ELSE { 
        ShearInfo →RLF098_000036= "ϕ" &amp; 1000*ϕ↓s,req← &amp; "@" &amp; CUnit(s↓l,req←, "mm"); 
    } 
    →REZ006_000071TEXT("A↓v,prov← = " &amp; 'n↓s,req←*(1/4*π*ϕ↑2←)' &amp; " = " &amp; CUnit(A↓v,prov←, "in↑2←") &amp; " in↑2←/ft") @REF("Provided area of rebars"); 
    →UNK000_014776Result.Set("ns_req", n↓s,req←); 
    →UNK000_014777Result.Set("sl_req", s↓l,req←); 
    →REZ006_000017Result.Set("A↓v,prov←", A↓v,prov←); 
    →REZ006_000117Result.Set("info", ShearInfo); 
} 

private string ReqShearReinf(double A↓v,req←, double ϕ↓s,req←, double s↓l,req←, double α↓s,req←, double n↓s,req←) { 
    double Barno →UNK000_020821= FUNCT_BAR.BarNoCalculation(ϕ↓s,req←); 
    IF(COMPARE(α↓s,req←, 90, 3) == 0) { 
        return n↓s,req← &amp; "#" &amp; Barno &amp; "/ft↑2←, a = " &amp; (12*s↓l,req←) &amp; " in  =&gt; A↓v,req← = " &amp; (A↓v,req←) &amp; " in↑2←/ft↑2←"; 
    } ELSE { 
        return n↓s,req← &amp; "#" &amp; Barno &amp; "(" &amp; Val(ROUND(α↓s,req←, 0), 0) &amp; "°)/ft↑2←, a = " &amp; (12*s↓l,req←) &amp; " in  =&gt; A↓v,req← = " &amp; (A↓v,req←) &amp; " in↑2←/ft↑2←"; 
    } 
} 

private void GetVRdc(double d, double b, double f↓cd←, double ρ↓1←, double σ↓cp←, bool isAccidentalCombi, double N↓n←, double V↓n←, double M↓n←, out double V↓c←, out double V↓Rdmax←) { 
    double ConstrType →UNK000_014799= 1; 
    IF(M↓n← &gt; 0) { 
        double d →REZ006_000087= DesignReinf[0].d; 
    } ELSE { 
        double d →REZ006_000088= DesignReinf[2].d; 
    } 
    →UNK000_011391double ConcreteType; 
    ConcreteType →UNK000_020727= 0; 
    SWITCH(ConcreteType) { 
        CASE 0 :  { 
            λ →REZ006_000110= 1.0; 
            string ConcType →REZ006_000111= TR("Normal Weight"); 
        } 
        CASE 1 :  { 
            λ →REZ006_000112= 0.85; 
            string ConcType →REZ006_000113= TR("Sand Lightweight"); 
        } 
        CASE 2 :  { 
            λ →REZ006_000114= 0.75; 
            string ConcType →REZ006_000115= TR("Other Lightweight"); 
        } 
    } 
    double A↓g← →UNK000_020891= b*d*1000000; // Use mm in the equations Appendix B of ACI
    IF(Imperialunit) { 
        →UNK000_020910TEXT("Design Forces:  N↓n← = " &amp; CUnit(N↓n←, "kip") &amp; "   V↓n ←= " &amp; CUnit(V↓n←, "kip") &amp; " ) "); 
    } ELSE { 
        →RLF098_000058TEXT("Design Forces:  N↓n← = " &amp; CUnit(N↓n←, "kN") &amp; "   V↓n ←= " &amp; CUnit(V↓n←, "kN") &amp; " ) "); 
    } 
    IF(N↓n← &gt; 0) { // Tension
        →UNK000_020892TEXT("- Shear with Tension"); 
        →REZ006_000104TEXT("- Nominal shear strength provided by concrete"); 
        double v↓c1← →UNK000_008836= 0.17*(1-0.29*N↓n←/A↓g←)*λ*SQRT(f↓cd←/1000000)*1000000; //  2*λ*SQRT(CUnit(double f↓cd←, "psi")); 
        IF(Imperialunit) { 
            →UNK000_020810TEXT("v↓c1 ←= " &amp; '2*(1+N↓n←/(500*A↓g←))*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "psi") &amp; " psi") @REF("(ACI 22.5.7.1)"); 
        } ELSE { 
            →RLF098_000059TEXT("v↓c1 ←= " &amp; '2*(1+N↓n←/(500*A↓g←))*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "MPa") &amp; " MPa") @REF("(ACI 22.5.7.1)"); 
        } 
        IF(COMPARE(ABS(M↓n←), 0, 5) == 0) { 
            double v↓c2← →UNK000_020893= (0.05*λ*SQRT(f↓cd←/1000000)+4.8)*1000000; 
            IF(Imperialunit) { 
                →UNK000_020894TEXT("v↓c2 ←= " &amp; '(0.6*λ*SQRT(f↓cd←)+700*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi") @REF("(ACI 22.5.8.2(b))"); 
            } ELSE { 
                →RLF098_000060TEXT("v↓c2 ←= " &amp; '(0.6*λ*SQRT(f↓cd←)+700*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa") @REF("(ACI 22.5.8.2(b))"); 
            } 
        } ELSE { 
            double v↓c2← →UNK000_008851= (0.05*λ*SQRT(f↓cd←/1000000)+4.8*V↓n←*d/M↓n←)*1000000; 
            IF(Imperialunit) { 
                →UNK000_020812TEXT("v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi") @REF("(ACI 22.5.8.2(a))"); 
            } ELSE { 
                →RLF098_000061TEXT("v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa") @REF("(ACI 22.5.8.2(a))"); 
            } 
        } 
        double v↓c3← →UNK000_020728= (0.05*λ*SQRT(f↓cd←/1000000)+4.8)*1000000; 
        IF(Imperialunit) { 
            →UNK000_020813TEXT("v↓c3 ←= " &amp; '(0.6*λ*SQRT(f↓cd←)+700*V↓n←*d/M↓n←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi") @REF("(ACI 22.5.8.2(b))"); 
        } ELSE { 
            →RLF098_000062TEXT("v↓c3 ←= " &amp; '(0.6*λ*SQRT(f↓cd←)+700*V↓n←*d/M↓n←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa") @REF("(ACI 22.5.8.2(b))"); 
        } 
        double v↓c4← →UNK000_020768= 0.42*λ*SQRT(f↓cd←/1000000)*1000000; 
        IF(Imperialunit) { 
            →UNK000_020814TEXT("v↓c4 ←= " &amp; '5*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c4←, "psi") &amp; "psi") @REF("(ACI 22.5.8.2(c))"); 
        } ELSE { 
            →RLF098_000063TEXT("v↓c4 ←= " &amp; '5*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c4←, "MPa") &amp; "MPa") @REF("(ACI 22.5.8.2(c))"); 
        } 
    } ELSE { 
        IF(N↓n← &lt; 0) { // Compression
            →UNK000_020895TEXT("- Shear with Compression"); 
            →REZ006_000106TEXT("- Nominal shear strength provided by concrete"); 
            double v↓c1← →UNK000_020896= 0.17*(1-N↓n←/(14*A↓g←))*λ*SQRT(f↓cd←/1000000)*1000000; //  2*λ*SQRT(CUnit(double f↓cd←, "psi")); 
            IF(Imperialunit) { 
                →UNK000_020897TEXT("v↓c1 ←= " &amp; '2*(1+N↓n←/(2000*A↓g←))*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "psi") &amp; " psi") @REF("(ACI 22.5.6.1)"); 
            } ELSE { 
                →RLF098_000064TEXT("v↓c1 ←= " &amp; '2*(1+N↓n←/(2000*A↓g←))*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "MPa") &amp; " MPa") @REF("(ACI 22.5.6.1)"); 
            } 
            IF(COMPARE(ABS(M↓n←+N↓n←*(4*h-d)/8), 0, 5) == 0) { 
                double v↓c2← →UNK000_020906= (0.16*λ*SQRT(f↓cd←/1000000)+17*ρ↓1←)*1000000; 
                IF(Imperialunit) { 
                    →UNK000_020899TEXT("v↓c2 ←= " &amp; '(1.9*λ*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi") @REF("(ACI 22.5.6.1(b))"); 
                } ELSE { 
                    →RLF098_000065TEXT("v↓c2 ←= " &amp; '(1.9*λ*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " MPa") @REF("(ACI 22.5.6.1(b))"); 
                } 
            } ELSE { 
                v↓c2← →UNK000_020907= (0.16*λ*SQRT(f↓cd←/1000000)+17*ρ↓1←*V↓n←*d/(M↓n←+N↓n←*(4*h-d)/8))*1000000; 
                IF(Imperialunit) { 
                    →UNK000_020901TEXT("v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←V↓u←*d/(M↓u←-N↓u←*(4*h-d)/8))' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi") @REF("(ACI 22.5.6.1(a))"); 
                } ELSE { 
                    →RLF098_000066TEXT("v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←V↓u←*d/(M↓u←-N↓u←*(4*h-d)/8))' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa") @REF("(ACI 22.5.6.1(a))"); 
                } 
            } 
            IF(Imperialunit) { 
                double v↓c3← →UNK000_020908= (0.16*λ*SQRT(f↓cd←/1000000)+17*ρ↓1←)*1000000; 
                →UNK000_020903TEXT("v↓c3 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi") @REF("(ACI 22.5.8.2(b))"); 
                double v↓c4← →UNK000_020904= 0.29*λ*SQRT(f↓cd←/1000000)*SQRT(1-0.29*N↓n←/A↓g←)*1000000; 
                →UNK000_020905TEXT("v↓c4 ←= " &amp; '3.5*λ*SQRT(f↓cd←)*SQRT(1+0.29*N↓u←/A↓g←)' &amp; " = " &amp; CUnit(v↓c4←, "psi") &amp; " psi") @REF("(ACI 22.5.8.2(c))"); 
            } ELSE { 
                double v↓c3← →RLF098_000067= (0.16*λ*SQRT(f↓cd←/1000000)+17*ρ↓1←)*1000000; 
                →RLF098_000068TEXT("v↓c3 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa") @REF("(ACI 22.5.8.2(b))"); 
                double v↓c4← →RLF098_000069= 0.29*λ*SQRT(f↓cd←/1000000)*SQRT(1-0.29*N↓n←/A↓g←)*1000000; 
                →RLF098_000070TEXT("v↓c4 ←= " &amp; '3.5*λ*SQRT(f↓cd←)*SQRT(1+0.29*N↓u←/A↓g←)' &amp; " = " &amp; CUnit(v↓c4←, "MPa") &amp; " MPa") @REF("(ACI 22.5.8.2(c))"); 
            } 
        } ELSE { 
            →UNK000_020909TEXT("- Shear with No Axial load"); 
            →REZ006_000107TEXT("- Nominal shear strength provided by concrete"); 
            double v↓c1← →UNK000_020877= 0.17*λ*SQRT(f↓cd←/1000000)*1000000; //  2*λ*SQRT(CUnit(double f↓cd←, "psi")); 
            IF(Imperialunit) { 
                →UNK000_020878TEXT("v↓c1 ←= " &amp; '2*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "psi") &amp; " psi") @REF("(ACI 22.5.5.1)"); 
            } ELSE { 
                →RLF098_000071TEXT("v↓c1 ←= " &amp; '2*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "MPa") &amp; " MPa") @REF("(ACI 22.5.5.1)"); 
            } 
            IF(COMPARE(ABS(M↓n←), 0, 5) == 0) { 
                double v↓c2← →UNK000_020879= (0.16*λ*SQRT(f↓cd←/1000000)+17*ρ↓1←)*1000000; 
                IF(Imperialunit) { 
                    →UNK000_020880TEXT("v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi") @REF("(ACI 22.5.5.1(b))"); 
                } ELSE { 
                    →RLF098_000072TEXT("v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa") @REF("(ACI 22.5.5.1(b))"); 
                } 
            } ELSE { 
                double v↓c2← →UNK000_020881= (0.16*λ*SQRT(f↓cd←/1000000)+17*ρ↓1←*V↓n←*d/M↓n←)*1000000; 
                IF(Imperialunit) { 
                    →UNK000_020882TEXT("v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi") @REF("(ACI 22.5.5.1(a))"); 
                } ELSE { 
                    →RLF098_000073TEXT("v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa") @REF("(ACI 22.5.5.1(a))"); 
                } 
            } 
            IF(Imperialunit) { 
                double v↓c3← →UNK000_020883= (0.16*λ*SQRT(f↓cd←/1000000)+17*ρ↓1←)*1000000; 
                →UNK000_020884TEXT("v↓c3 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c3←, "psi") &amp; " psi") @REF("(ACI 22.5.5.1(b))"); 
                double v↓c4← →UNK000_020885= 0.29*λ*SQRT(f↓cd←/1000000)*1000000; 
                →UNK000_020886TEXT("v↓c4 ←= " &amp; '3.5*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c4←, "psi") &amp; " psi") @REF("(ACI 22.5.5.1(c))"); 
            } ELSE { 
                double v↓c3← →RLF098_000074= (0.16*λ*SQRT(f↓cd←/1000000)+17*ρ↓1←)*1000000; 
                →RLF098_000075TEXT("v↓c3 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c3←, "MPa") &amp; " MPa") @REF("(ACI 22.5.5.1(b))"); 
                double v↓c4← →RLF098_000076= 0.29*λ*SQRT(f↓cd←/1000000)*1000000; 
                →RLF098_000077TEXT("v↓c4 ←= " &amp; '3.5*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c4←, "MPa") &amp; " MPa") @REF("(ACI 22.5.5.1(c))"); 
            } 
        } 
    } 
    IF(Imperialunit) { 
        double v↓c← →UNK000_020725= PARMAX(v↓c1←, MIN(v↓c2←, v↓c3←, v↓c4←)); 
        →UNK000_020844TEXT("v↓c← =" &amp; 'PARMAX(v↓c1←, MIN(v↓c2←, v↓c3←, v↓c4←))' &amp; "= " &amp; CUnit(v↓c←, "psi") &amp; " psi") @REF("(ACI 22.5.5.1)"); 
        double V↓c← →UNK000_020726= v↓c←*b*d; 
        →UNK000_020809TEXT("V↓c← = " &amp; 'v↓c←*b*d' &amp; " = " &amp; CUnit(V↓c←, "kip") &amp; " kip") @REF("Nominal shear strength"); 
        double V↓Rdmax← →UNK000_020769= V↓c←+0.66*λ*SQRT(f↓cd←/1000000)*b*d*1000000; 
        →UNK000_020815TEXT("V↓max← = " &amp; 'V↓c←+8*λ*SQRT(f↓cd←)*b*d' &amp; " = " &amp; CUnit(V↓Rdmax←, "kip") &amp; " kip") @REF("Maximum nominal shear strength of section"); 
    } ELSE { 
        double v↓c← →RLF098_000078= PARMAX(v↓c1←, MIN(v↓c2←, v↓c3←, v↓c4←)); 
        →RLF098_000079TEXT("v↓c← =" &amp; 'PARMAX(v↓c1←, MIN(v↓c2←, v↓c3←, v↓c4←))' &amp; "= " &amp; CUnit(v↓c←, "MPa") &amp; " MPa") @REF("(ACI 22.5.5.1)"); 
        double V↓c← →RLF098_000080= v↓c←*b*d; 
        →RLF098_000081TEXT("V↓c← = " &amp; 'v↓c←*b*d' &amp; " = " &amp; CUnit(V↓c←, "kN") &amp; " kN") @REF("Nominal shear strength"); 
        double V↓Rdmax← →RLF098_000082= V↓c←+0.66*λ*SQRT(f↓cd←/1000000)*b*d*1000000; 
        →RLF098_000083TEXT("V↓max← = " &amp; 'V↓c←+8*λ*SQRT(f↓cd←)*b*d' &amp; " = " &amp; CUnit(V↓Rdmax←, "kN") &amp; " kN") @REF("Maximum nominal shear strength of section"); 
    } 
    
} 

private void DesignAsw(double d, double b, double V↓s←, double z, double f↓ywd,req←, double θ, double α↓s,req←, double ϕ↓s,req←, object Result) { 
    →UNK000_020734double&lt;psi,0&gt; f↓ywd,req←; 
    →REZ006_000075double&lt;psi,0&gt; f↓yt← →REZ006_000076= f↓ywd,req←; 
    →UNK000_020735double&lt;kip,-1&gt; V↓n←; 
    double Barno →REZ006_000077= FUNCT_BAR.BarNoCalculation(ϕ↓s,req←); 
    IF(Imperialunit) { 
        →UNK000_020786TEXT("Rebar#" &amp; Barno &amp; "  f↓yt←= " &amp; CUnit(f↓ywd,req←, "psi") &amp; "psi   d=" &amp; CUnit(d, "in") &amp; "in   V↓s←= " &amp; CUnit(V↓s←, "kip") &amp; "kip"); 
        A↓v,req← →UNK000_020736= V↓s←/(d*f↓ywd,req←); 
        →UNK000_020817TEXT("A↓v,req←= " &amp; 'V↓s←/(d*f↓yt←)' &amp; " = " &amp; CUnit(A↓v,req←, "in↑2←/ft") &amp; "in↑2←/ft") @REF("Required Area of shear Rebar"); 
        →UNK000_020738Result.Set("Aswm_req", A↓v,req←); 
    } ELSE { 
        →RLF098_000084TEXT("Rebar#" &amp; Barno &amp; "  f↓yt←= " &amp; CUnit(f↓ywd,req←, "MPa") &amp; "MPa   d=" &amp; CUnit(d, "mm") &amp; "mm   V↓s←= " &amp; CUnit(V↓s←, "kN") &amp; "kN"); 
        A↓v,req← →RLF098_000085= V↓s←/(d*f↓ywd,req←); 
        →RLF098_000086TEXT("A↓v,req←= " &amp; 'V↓s←/(d*f↓yt←)' &amp; " = " &amp; CUnit(A↓v,req←, "mm↑2←/m") &amp; "mm↑2←/m") @REF("Required Area of shear Rebar"); 
        →RLF098_000087Result.Set("Aswm_req", A↓v,req←); 
    } 
} 
private void MinimumAsw(double d, double b, double f↓cd←, double f↓ywk,req←, out double A↓swm,min←) { 
    A↓swm,min← →UNK000_020781= PARMIN(0.35*b*1000000/f↓ywk,req←, 0.062*SQRT(f↓cd←/1000000)*b*1000000/f↓ywk,req←); 
    IF(Imperialunit) { 
        →UNK000_016860TEXT("A↓v,min ←= " &amp; 'PARMAX(50*b↓w←/f↓yt←, 0.75*SQRT(f↓cd←/1000000)*b/f↓yt←)' &amp; " =  " &amp; CUnit(A↓swm,min←, "in*in/ft") &amp; " in↑2←/ft") @REF("(ACI 8.7.5.6.3.1)"); 
    } ELSE { 
        →RLF098_000088TEXT("A↓v,min ←= " &amp; 'PARMAX(50*b↓w←/f↓yt←, 0.75*SQRT(f↓cd←/1000000)*b/f↓yt←)' &amp; " =  " &amp; CUnit(A↓swm,min←, "mm*mm/m") &amp; " mm↑2←/m") @REF("(ACI 8.7.5.6.3.1)"); 
    } 
} 

private void CalcShearDesign(double ForceID, out object DesignShear) { 
    object ForceSet →UNK000_014829= BasicForces[ForceID]; 
    object ForcePOD →UNK000_014830= RecalcForcesPOD[ForceID]; 
    double f↓yk,req← →UNK000_014832= DesignDefaults.ReinfLong.Material.IBC.fy; 
    double ϕ →UNK000_020773= 0.75; // Strength reduction factor
    comboID →UNK000_020870= ForceSet.CombiID; 
    →UNK000_020834TEXT("Strength Reduction Factor= " &amp; ϕ); 
    →UNK000_020833TEXT("Shear reinforcement yield stress fy=" &amp; CUnit(f↓yk,req←, "psi") &amp; " psi"); 
    double&lt;in,2&gt; d →UNK000_014837= ForcePOD.d; 
    double&lt;in,2&gt; z →UNK000_014839= ForcePOD.z; 
    →UNK000_014836TEXT("(" &amp; "d=" &amp; CUnit(d, "in") &amp; "in  , " &amp; "z=" &amp; CUnit(z, "in") &amp; "in )"); 
    →UNK000_014833TEXT("Design Forces:"); 
    double qx →UNK000_020791= ForceSet.qx; 
    double qy →UNK000_020792= ForceSet.qy; 
    double mx →UNK000_020800= ForceSet.mx; 
    double my →UNK000_020801= ForceSet.my; 
    double nx →UNK000_020875= ForceSet.nx; 
    double ny →UNK000_020876= ForceSet.ny; 
    IF(Imperialunit) { 
        →UNK000_020788TEXT("v↓x←=" &amp; CUnit(qx, "kip/ft") &amp; "kip/ft" &amp; "   v↓y←=" &amp; CUnit(qy, "kip/ft") &amp; "kip/ft"); 
    } ELSE { 
        →RLF098_000055TEXT("v↓x←=" &amp; CUnit(qx, "kN/m") &amp; "kN/m" &amp; "   v↓y←=" &amp; CUnit(qy, "kN/m") &amp; "kN/m"); 
    } 
    double&lt;kip,-1&gt; V↓n← →UNK000_014834= b*SQRT(ForceSet.qx↑2←+ForceSet.qy↑2←)/ϕ; // Find the shear force in width of b
    double&lt;kip*ft,-1&gt; M↓n← →UNK000_020767= b*SQRT(ForceSet.mx↑2←+ForceSet.my↑2←)/ϕ; // Find the shear force in width of b
    double&lt;kip,-1&gt; N↓n← →UNK000_020874= b*SQRT(ForceSet.nx↑2←+ForceSet.ny↑2←)/ϕ; // Find the shear force in width of b
    IF(ABS(ForceSet.nx) &gt; ABS(ForceSet.ny)) { 
        IF(COMPARE(ABS(ForceSet.nx), 0, 5) == 1) { 
            N↓n← →UNK000_020911= N↓n←*ForceSet.nx/ABS(ForceSet.nx); 
        } ELSE { 
            N↓n← →REZ006_000006= 0; 
        } 
    } ELSE { 
        IF(COMPARE(ABS(ForceSet.ny), 0, 5) == 1) { 
            N↓n← →UNK000_020912= N↓n←*ForceSet.ny/ABS(ForceSet.ny); 
        } ELSE { 
            N↓n← →REZ006_000007= 0; 
        } 
    } 
    →UNK000_020798TEXT("V↓n← =" &amp; 'b*SQRT(qx↑2←+qy↑2←)/ϕ' &amp; " = " &amp; CUnit(V↓n←, "kip") &amp; " kip"); 
    →UNK000_020799TEXT("M↓n← =" &amp; 'b*SQRT(mx↑2←+my↑2←)/ϕ' &amp; " = " &amp; CUnit(M↓n←, "kip*ft") &amp; " kip.ft"); 
    →UNK000_014850TEXT("Longitudinal Reinforcement Ratio:"); 
    →UNK000_014851double&lt;in↑2←,0&gt; A↓sl,x←; 
    →UNK000_014852double&lt;in↑2←,0&gt; A↓sl,y←; 
    →UNK000_014853GetLongReinfInLCS(DesignReinf, out A↓sl,x←, out A↓sl,y←); 
    double&lt;,2&gt; ρ↓lx← →UNK000_014854= A↓sl,x←/(b*d); 
    double&lt;,2&gt; ρ↓ly← →UNK000_014855= A↓sl,y←/(b*d); 
    →UNK000_020803TEXT("ρ↓lx← = " &amp; ρ↓lx← &amp; " , ρ↓ly← = " &amp; ρ↓ly←) @REF("Area of reinforcement to area of section"); 
    →UNK000_014856double&lt;,2&gt; ρ↓1←; 
    IF(ρ↓lx←*ρ↓ly← &gt; 0) { 
        ρ↓1← →UNK000_014857= MIN(SQRT(ρ↓lx←*ρ↓ly←), 0.02) @REF("(ACI 2.2)"); 
    } 
    ELSE { 
        ρ↓1← →UNK000_014858= (ρ↓lx← &gt; 0) ? MIN(ρ↓lx←, 0.02) : MIN(ρ↓ly←, 0.02); 
    } 
    →UNK000_014859PAGEBREAK(); 
    →UNK000_014860TEXT("Calculate Shear Resistance of Section : "); 
    double A↓c← →UNK000_014861= b*h; 
    →UNK000_020804TEXT("A↓c←=" &amp; 'b*h' &amp; " = " &amp; CUnit(A↓c←, "in↑2←") &amp; "in↑2←"); 
    double N↓n,x← →UNK000_014862= BasicForces[ForceID].nx; 
    double N↓n,y← →UNK000_014863= BasicForces[ForceID].ny; 
    double M↓n,x← →UNK000_020765= BasicForces[ForceID].mx; 
    double M↓n,y← →UNK000_020766= BasicForces[ForceID].my; 
    →UNK000_014868double&lt;kip,2&gt; V↓c←; 
    →UNK000_020770double&lt;kip,2&gt; V↓Rdmax←; 
    →UNK000_014869double k↓1←; 
    →REZ006_000002GetVRdc(d, b, f↓cd←, ρ↓1←, σ↓cp←, isAccidentalCombi, N↓n←, V↓n←, M↓n←, out V↓c←, out V↓Rdmax←); 
    UC_VRdc →UNK000_020787= V↓n←/V↓c←; 
    UC_VR →REZ006_000047= UC_VRdc; 
    IF(UC_VRdc &gt; 0.5) { 
        IF(UC_VRdc &gt; 1) { 
            →UNK000_020816TEXT("UC↓v← = " &amp; 'V↓n←/V↓c←' &amp; " = " &amp; UC_VRdc &amp; " &gt; 1 ") @REF("Shear Reinforcement is needed"); 
        } ELSE { 
            →REZ006_000009TEXT("UC↓v← = " &amp; 'V↓n←/V↓c←' &amp; " = " &amp; UC_VRdc &amp; " &gt; 0.5") @REF("Shear Reinforcement is needed"); 
        } 
    } ELSE { 
        →REZ006_000008TEXT("UC↓v← = " &amp; 'V↓n←/V↓c←' &amp; " = " &amp; UC_VRdc &amp; " &lt; 1") @REF("No Shear Reinforcement is needed"); 
    } 
    
    →UNK000_014871PAGEBREAK(); 
    →UNK000_014951BLOCK { 
        double&lt;in↑2←/ft,2&gt; A↓v,req← →UNK000_014932= 0; 
        double&lt;in↑2←/ft,2&gt; A↓swm,min← →UNK000_020783= 0; 
        double n↓s,req← →UNK000_014933= 0; 
        double&lt;in,2&gt; s↓l,req← →UNK000_014934= 0; 
        double&lt;psi,2&gt; f↓ywk,req← →UNK000_020775= DesignDefaults.ReinfShear.Material.IBC.fy; 
        IF(ABS(V↓n←) &gt; V↓Rdmax←) { 
            →UNK000_020771TEXT("* Shear load exceeds the maximum capacity of Section"); 
            →UNK000_020772TEXT("* Section height increase is necessary"); 
        } ELSE { 
            IF(ABS(V↓n←) &gt; V↓c←/2) { 
                →UNK000_020849TEXT("- Design shear reinforcement"); 
                double V↓s← →UNK000_020774= ABS(V↓n←)-V↓c←; 
                →UNK000_020836TEXT("V↓s← = |V↓n←|" &amp; '-V↓c←' &amp; " = " &amp; CUnit(V↓s←, "kip") &amp; "  kip") @REF("Shear reinforcement part"); 
                →UNK000_020782MinimumAsw(d, b, f↓cd←, f↓ywk,req←, out A↓swm,min←); 
                double&lt;in,4&gt; ϕ↓s,req← →UNK000_014938= DesignDefaults.ReinfShear.d; 
                double Barno →UNK000_020837= FUNCT_BAR.BarNoCalculation(ϕ↓s,req←); 
                →UNK000_014935TEXT("- Statically required shear reinforcement: "); 
                IF(V↓s← &gt; 0) { 
                    object Result →UNK000_014937= new Structure(); 
                    →UNK000_014939DesignAsw(d, b, V↓s←, z, f↓ywk,req←, θ, α↓s,req←, ϕ↓s,req←, Result); 
                    A↓v,req← →UNK000_014940= Result.Aswm_req; 
                } ELSE { 
                    A↓v,req← →UNK000_020784= A↓swm,min←; 
                } 
                IF(A↓swm,min← &gt; A↓v,req←) { A↓v,req← →REZ006_000014= A↓swm,min←; } 
                object Result →UNK000_014941= new Structure(); 
                IF(UC_VRdc &gt; 0.5) { 
                    →UNK000_014942NShearLinks(A↓v,req←, ϕ↓s,req←, Result); 
                    n↓s,req← →UNK000_014943= Result.ns_req; 
                    s↓l,req← →UNK000_014944= Result.sl_req; 
                    A↓v,prov← →REZ006_000018= Result.A↓v,prov←; 
                    V↓s← →REZ006_000020= A↓v,prov←*(d*f↓ywk,req←)/b; 
                    →REZ006_000022TEXT("V↓c← = " &amp; CUnit(V↓c←, "kip") &amp; "kip  V↓s← = " &amp; CUnit(V↓s←, "kip") &amp; "kip") @REF("Concrete and rebar resistance"); 
                    v↓Rd← →REZ006_000021= V↓c←+V↓s←; 
                    UC_VR →REZ006_000023= V↓n←/v↓Rd←; 
                    →REZ006_000074TEXT("V↓n← = V↓c←+V↓s← = " &amp; CUnit(v↓Rd←, "kip") &amp; "    UC↓t←= " &amp; 'V↓u←/ϕV↓n←' &amp; " = " &amp; UC_VR) @REF("Final unity ratio for the section"); 
                } 
                string AswReq →UNK000_014946= ReqShearReinf(A↓v,req←, ϕ↓s,req←, s↓l,req←, α↓s,req←, n↓s,req←); 
                IF(h &lt;= 0.127) { 
                    string DescriptionN →UNK000_014948= TR("Thickness of 2D member should have minimal 5 in for design required shear reinforcement"); 
                    string SolutionN →UNK000_014949= TR("Increase thickness of 2D member."); 
                    →UNK000_014950FUNCT_EWN.AddWarningToEWN(obEWN, IndexEWN, DescriptionN &amp; SolutionN, (IO.LayoutIndex == 2)); 
                } 
            } 
        } 
    } 
    
    DesignShear →UNK000_014952= new Structure(
    "UC_VRdmax", UC_VRdmax, 
    "UC_VRdc", UC_VRdc, 
    "UC_VR", UC_VR, 
    "Aswm_req", A↓v,req←, 
    "vRdc", V↓c←, 
    "vRd_max", v↓Rd,max←, 
    "f↓ywd,req←", f↓ywd,req←, 
    "d", d, 
    "vEd", V↓n←, 
    "z", z, 
    "Theta", θ, 
    "comboID", comboID
    ); 
} 

//------------------------------------------------------------
//@SCRIPT



→UNK000_014954LoadExterns(); 
IF(!IO.IsExternCLC) { →UNK000_014955LoadDialogInputs(); } 
→UNK000_014963BLOCK { //@GLOBAL VARIABLES
    object FontsAndColors →UNK000_014956= FONTS_COLORS.GetFontsAndColors(); 
    IF(Imperialunit) { 
        b →RLF098_000053= PhysConst(1, "ft"); 
    } ELSE { 
        b →RLF098_000054= PhysConst(1, "m"); 
    } 
    UC_lim →UNK000_014958= 3; 
    object CS_Material →UNK000_017133= DesignDefaults.CONCRETE.IBC; 
    object ReinfMat →UNK000_017135= DesignDefaults.ReinfLong.Material; 
    object ReqReinfMat →UNK000_017134= DesignDefaults.ReinfShear.Material; 
    double f↓c← →UNK000_014961= CS_Material.f↓c←; 
    double f↓cd← →UNK000_014962= CS_Material.f↓c←; 
} 

IF(!IO.IsExternCLC) { 
    →REZ006_000091object ForcePOD; 
    FOR(i, 0, 3) { 
        ForcePOD →REZ006_000090= RecalcForcesPOD[0]; 
        →REZ006_000089DesignReinf[i].Add("d", ForcePOD.d); 
    } 
} 

→REZ006_000054PAGEBREAK(); 
→UNK000_014964TEXT("Design of Shear Reinforcement"); 
double A↓v,req,max← →UNK000_014965= 0; 
double A↓v,prov,max← →REZ006_000027= 0; 
double UCmax_VRdmax →UNK000_014966= 0; 
double UCmax_VRdc →UNK000_014967= 0; 
double UCmax_VR →REZ006_000033= 0; 
ShearInfo →REZ006_000123= "(no reinf.)"; 
FOR(i, 0, BasicForces.Count-1) { 
    double V↓n← →REZ006_000072= 0; 
    →REZ006_000056CalcShearDesign(i, out DesignShear); 
    A↓v,req← →UNK000_014969= DesignShear.Aswm_req; 
    V↓c← →UNK000_014970= DesignShear.vRdc; 
    v↓Rd,max← →UNK000_014971= DesignShear.vRd_max; 
    V↓n← →UNK000_020860= DesignShear.vEd; 
    comboID →UNK000_020864= DesignShear.comboID; 
    
    double UC_VRdmax →UNK000_014972= DesignShear.UC_VRdmax; 
    double UC_VRdc →UNK000_014973= DesignShear.UC_VRdc; 
    double UC_VR →REZ006_000040= DesignShear.UC_VR; 
    IF(A↓v,req← &gt; A↓v,req,max← &amp;&amp; A↓v,req← &gt; 0) { 
        A↓v,req,max← →UNK000_014974= A↓v,req←; 
        A↓v,prov,max← →REZ006_000024= A↓v,prov←; 
        V↓n,max← →UNK000_020861= V↓n←; 
        comboIDmax →UNK000_020867= comboID; 
        ID_ShearReinf →UNK000_014975= i; 
    } 
    IF(UC_VRdmax &gt; UCmax_VRdmax) { 
        UCmax_VRdmax →UNK000_014976= UC_VRdmax; 
        V↓n,max← →UNK000_020862= V↓n←; 
        comboIDmax →UNK000_020868= comboID; 
        ID_ConcreteCapacity →UNK000_014977= i; 
    } 
    IF(UC_VRdc &gt;= UCmax_VRdc) { 
        UCmax_VRdc →UNK000_014978= UC_VRdc; 
        UCmax_VR →REZ006_000038= UC_VR; 
        V↓n,max← →UNK000_020863= V↓n←; 
        comboIDmax →UNK000_020869= comboID; 
        ID_ShearCapacity →UNK000_014979= i; 
    } 
} 

CombiID →UNK000_014980= ID_ShearReinf; 
IF(A↓v,req,max← == 0) { 
    IF(UCmax_VRdmax &gt; 1) { 
        CombiID →UNK000_014981= ID_ConcreteCapacity; 
    } ELSE { 
        CombiID →UNK000_014982= ID_ShearCapacity; 
    } 
} 


private void DrawDesignReqReinfInStandard() { 
    double fy →UNK000_017077= DesignDefaults.ReinfLong.Material.IBC.fy; 
    double fc →UNK000_017078= DesignDefaults.CONCRETE.IBC.f↓c←; 
    double fcd →UNK000_017079= DesignDefaults.CONCRETE.IBC.f↓c←; 
    object ConMat →UNK000_017112= DesignDefaults.CONCRETE.IBC; 
    object ReqReinfMat →UNK000_017113= DesignDefaults.ReinfLong.Material.IBC; 
    object FontsAndColors →UNK000_017001= FONTS_COLORS.GetFontsAndColors(); 
    →UNK000_017041BLOCK { 
        object CombiIDs →UNK000_017032= new object[]; 
        →UNK000_017033TEXT("Combinations"); 
    } 
} 


private void DrawDesignReinfSumTable() { 
    double Ncolumns →UNK000_016891= 9; 
    double Nrows →UNK000_016892= 1; 
    object T_Area →UNK000_016893= new Table(Ncolumns); 
    T_Table →UNK006_000008= T_Area; 
    //header
    T_Area[0][0].Value →UNK000_016967= TR("Reinf."); 
    T_Area[0][1].Value →UNK000_016969= "Θ [°]"; 
    T_Area[0][2].Value →UNK000_016970= TR("Case"); 
    IF(Imperialunit) { 
        T_Area[0][3].Value →UNK000_016971= "V↓U ←[kip/ft]"; 
        T_Area[0][4].Value →UNK000_016972= "V↓c ←[kip/ft]"; 
        T_Area[0][5].Value →REZ006_000012= "U↓C ←"; 
        T_Area[0][6].Value →UNK000_016975= "A↓v,req ←[in↑2←/ft]"; 
        T_Area[0][7].Value →REZ006_000025= "A↓v,prov ←[in↑2←/ft]"; 
    } ELSE { 
        T_Area[0][3].Value →RLF098_000026= "V↓U ←[kN/m]"; 
        T_Area[0][4].Value →RLF098_000027= "V↓c ←[kN/m]"; 
        T_Area[0][5].Value →RLF098_000028= "U↓C ←"; 
        T_Area[0][6].Value →RLF098_000029= "A↓v,req ←[mm↑2←/m]"; 
        T_Area[0][7].Value →RLF098_000030= "A↓v,prov ←[mm↑2←/m]"; 
    } 
    T_Area[0][8].Value →REZ006_000031= "Uc↓t←"; 
    //values
    double RowID →UNK000_016903= 0; 
    T_Area[RowID+1][0].Value →UNK000_016904= TR("Shear"); 
    T_Area[RowID+1][1].Value →UNK000_016906= DesignDefaults.ReinfShear.Alpha; //angle
    T_Area[RowID+1][2].Value →UNK000_016907= comboIDmax; 
    IF(Imperialunit) { 
        T_Area[RowID+1][3].Value →UNK000_016908= CUnit(V↓n,max←, "kip"); 
        T_Area[RowID+1][4].Value →UNK000_016909= CUnit(V↓c←, "kip"); 
    } ELSE { 
        T_Area[RowID+1][3].Value →RLF098_000031= CUnit(V↓n,max←, "kN"); 
        T_Area[RowID+1][4].Value →RLF098_000032= CUnit(V↓c←, "kN"); 
    } 
    T_Area[RowID+1][5].Value →REZ006_000013= UCmax_VRdc; 
    IF(UCmax_VRdc &lt; 1) { 
        T_Area[RowID+1][6].BackColor →UNK000_017396= FontsAndColors.ColorOK(); 
    } ELSE { 
        T_Area[RowID+1][6].BackColor →REZ006_000041= FontsAndColors.ColorNotOK(); 
    } 
    IF(Imperialunit) { 
        T_Area[RowID+1][6].Value →UNK000_016912= CUnit(A↓v,req,max←, "in↑2←/ft"); 
        T_Area[RowID+1][7].Value →REZ006_000026= CUnit(A↓v,prov,max←, "in↑2←"); 
    } ELSE { 
        T_Area[RowID+1][6].Value →RLF098_000033= CUnit(A↓v,req,max←, "mm↑2←/m"); 
        T_Area[RowID+1][7].Value →RLF098_000034= 3.28084*CUnit(A↓v,prov,max←, "mm↑2←"); 
    } 
    T_Area[RowID+1][8].Value →REZ006_000032= UCmax_VR; 
    
    IF(UCmax_VR &lt; 1) { 
        T_Area[RowID+1][8].BackColor →REZ006_000042= FontsAndColors.ColorOK(); 
    } ELSE { 
        T_Area[RowID+1][8].BackColor →REZ006_000043= FontsAndColors.ColorNotOK(); 
    } 
    //format 
    T_Area[0][0].Alignment →UNK000_016913= ContentAlignment.MiddleCenter; 
    T_Area.Columns[0].Width →UNK000_016914= 40; 
    T_Area.Columns[1].Width →UNK000_016915= 60; 
    T_Area.Columns[2].Width →UNK000_016916= 50; 
    T_Area.Columns[Ncolumns-1].Width →UNK000_016917= 40; 
    FOR(i, 3, Ncolumns-2) { 
        T_Area.Columns[i].Width →UNK000_016918= Convert.ToSingle((FontsAndColors.TableWidth()-230)/(Ncolumns-5)); 
    } 
    T_Area.Columns[5].Width →RLF098_000035= 40; 
    FOR(i, 1, 1) { 
        T_Area[i][0].BackColor →UNK000_016919= FontsAndColors.ColorTableRow(); 
        T_Area[i][1].BackColor →UNK000_016920= FontsAndColors.ColorTableRow(); 
        T_Area[i][2].BackColor →UNK000_016921= FontsAndColors.ColorTableRow(); 
        T_Area[i][Ncolumns-3].BackColor →UNK000_016923= FontsAndColors.ColorTableRow(); 
    } 
    T_Area.Padding.All →UNK000_016924= 5; 
    T_Area.Padding.Top →UNK000_016925= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
    T_Area.Padding.Bottom →UNK000_016926= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
    T_Area.Font →UNK000_016927= FontsAndColors.TableCellsFont(); 
    T_Area[0].Font →UNK000_016928= FontsAndColors.TableHeaderFont(); 
    T_Area.BorderPen →UNK000_016929= FontsAndColors.TableBorderPen(); 
    T_Area.GridPen →UNK000_016930= FontsAndColors.TableGridPen(); 
    T_Area[0].BorderPen →UNK000_016931= FontsAndColors.TableBorderPen(); 
    T_Area.Rows[0].BackColor →UNK000_016932= FontsAndColors.ColorTableHeader(); 
    →REZ006_000079TEXT("Summary of Shear Check "); 
    →UNK000_017159TEXT("Table2- Shear reinforcement information"); 
    →UNK000_016937T_Area.Draw(); 
    
    //description
    object T_reqExplanation →UNK000_016938= new Table(1); 
    T_reqExplanation.Font →UNK000_016939= FontsAndColors.TableCellsFontSmall(); 
    T_reqExplanation.BorderPen →UNK000_016940= FontsAndColors.WhitePen(); 
    T_reqExplanation.Padding.All →UNK000_016941= 1; 
    T_reqExplanation.Columns[0].Width →UNK000_016942= FontsAndColors.TableWidth(); 
    T_reqExplanation.Columns[0].Wrap →UNK000_016943= True; 
    T_reqExplanationString →UNK000_016944= "Θ - " &amp; TR("Angle of compression strut") &amp; 
    ", V↓c← - " &amp; TR("Shear resistance without shear reinforcement") &amp; 
    ", V↓c,max← - " &amp; TR("Maximum concrete shear resistance") &amp; 
    ", A↓v.req← - " &amp; TR("Required shear reinforcement"); 
    T_reqExplanation[0][0].Value →UNK000_016945= T_reqExplanationString; 
    →UNK000_016946T_reqExplanation.Draw(); 
    →UNK000_016947PAGEBREAK(); 
} 

IF(IO.IsDrawing) { 
    →REZ006_000062DrawDesignReinfSumTable(); 
} 


</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="RLF" Autor2="" Version="14" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English " />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://designforms.net</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>ShearDesign</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Note" X="0" Y="547" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" />
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
      <Style Key="Text 5" X="50" Y="0" Hor="1" Ver="4" SpX="15" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 6" X="175" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 3 (bold)" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="_dialog_AutoTheta" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="_dialog_BasicForces" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="_dialog_DesignReinf" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="_dialog_RecalcForcesPOD" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="A↓c←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="A↓g←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sl,x←" ESA_ID="" Type="Double" Precision="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sl,y←" ESA_ID="" Type="Double" Precision="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓swm,min←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="2.116667e-3" Dim="in↑2←/ft" />
      </Variable>
      <Variable Modifier="Public" Name="A↓v,prov,max←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="A↓v,prov←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="A↓v,req,max←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="A↓v,req←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="2.116667e-3" Dim="in↑2←/ft" />
      </Variable>
      <Variable Modifier="Public" Name="AswReq" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="b↓w←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Barno" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="BasicForces" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="bAutoTheta" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CombiID" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="comboID" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="comboIDmax" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ConcreteType" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ConcType" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ConstrType" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CS_Material" ESA_ID="" Type="Object">
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
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="DescriptionN" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Designdefaultinput" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Designdefaultinput">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="DesignDefaults" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="DesignReinf" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="DesignShear" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="DshearReinf" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ElementID" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f↓c←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f↓cd←" ESA_ID="" Type="Double" Precision="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yk,req←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ywd,req←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6894.758" Dim="psi" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ywk,req←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6894.758" Dim="psi" />
      </Variable>
      <Variable Modifier="Public" Name="FONTS_COLORS" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FontsAndColors" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ForcePOD" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FUNCT_2D" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FUNCT_2D_DEFAULTS" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FUNCT_BAR" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FUNCT_EWN" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ID_ConcreteCapacity" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ID_ShearCapacity" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ID_ShearReinf" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Imperialunit" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_Imperialunit">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="IndexEWN" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="isAccidentalCombi" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="j" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓1←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓n,x←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓n,x←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓n,y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_M↓n,y←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓u←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="MemberType" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="mx" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="my" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓n,x←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_N↓n,x←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓n,y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_N↓n,y←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓s,req←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓u←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="nx" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ny" ESA_ID="" Type="Double" Precision="2">
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
      <Variable Modifier="Public" Name="qx" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="qy" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="RecalcForcesPOD" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ReinfMat" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ReqReinfMat" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Result" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="s↓l,req←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="ShearInfo" ESA_ID="" Type="String">
        <Description TranslateID="VARIABLE_ShearInfo">
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
      <Variable Modifier="Public" Name="T_Table" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="UC_lim" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC_VR" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC_VRdc" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC_VRdmax" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UCmax_VR" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UCmax_VRdc" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UCmax_VRdmax" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="v↓c←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="V↓c←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="v↓c1←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="v↓c2←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="v↓c3←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="v↓c4←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="V↓n,max←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="V↓n←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="v↓Rd,max←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m" />
      </Variable>
      <Variable Modifier="Public" Name="v↓Rd←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_v↓Rd←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Rdmax←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓s←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="V↓u←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="z" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="α↓s,req←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="θ" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="λ" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="π" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓1←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓1←V↓u←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓lx←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓ly←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="σ↓cp←" ESA_ID="" Type="Double" Precision="-1">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓s,req←" ESA_ID="" Type="Double" Precision="4">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="ϕV↓n←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n←">
          <ENU>
          </ENU>
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
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000006">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000007">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000008">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000009">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000012">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000013">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000014">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000016">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000017">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000018">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000020">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000021">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000022">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000023">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000024">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000025">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000026">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000027">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000031">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000032">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000033">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000038">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000040">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000041">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000042">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000043">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000047">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000054">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000056">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000062">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000071">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000072">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000074">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000076">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000077">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000079">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000087">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000088">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000089">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000090">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000096">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000097">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000104">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000106">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000107">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000109">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000110">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000111">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000112">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000113">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000114">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|12|0|2" Font2="Arial|12|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000115">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000116">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000117">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000119">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000123">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000015">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000023">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000025">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000026">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000027">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000028">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000029">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000030">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000031">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000032">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000033">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000034">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000035">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000036">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000037">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000038">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000053">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000054">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000055">
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000056">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000057">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000058">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000059">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000060">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000061">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000062">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000063">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000064">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000065">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000066">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000067">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000068">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000069">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000070">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000071">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000072">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000073">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000074">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000075">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000076">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000077">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000078">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000079">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000080">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000081">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000082">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000083">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000084">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000085">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000086">
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000087">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="RLF098_000088">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_008836">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_008851">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014696">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014713">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014714">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014715">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014716">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014717">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014718">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014719">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014720">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014721">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014722">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014723">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014725">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014727">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014729">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014730">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014731">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014732">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014733">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014734">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014735">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014736">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014737">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014738">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014739">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014740">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014743">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014744">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014745">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014746">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014748">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014749">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014774">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014775">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014776">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014777">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014799">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014829">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014830">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014832">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014833">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014834">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014836">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 6" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014837">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014839">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014850">
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014853">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014854">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014855">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014857">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014858">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014859">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014860">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014861">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014862">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014863">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014871">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014932">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014933">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014934">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014935">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014937">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014938">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="21" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014939">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014940">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014941">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014942">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014943">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014944">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014946">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014948">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="17" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014949">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="17" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014950">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014951">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014952">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014954">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014955">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014956">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014957">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014958">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014961">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014962">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014963">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014964">
        <Set Vis="0" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014965">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014966">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014967">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014969">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014970">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014971">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014972">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014973">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014974">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014975">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014976">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014977">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014978">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014979">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014980">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014981">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014982">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016860">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016891">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016892">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016893">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016903">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016904">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016906">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016907">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016908">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016909">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016912">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016913">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016914">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016915">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016916">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016917">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016918">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016919">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016920">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016921">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016923">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016924">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016925">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016926">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016927">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016928">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016929">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016930">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016931">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016932">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016937">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016938">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016939">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016940">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016941">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016942">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016943">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016944">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016945">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016946">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016947">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016967">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016969">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016970">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016971">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016972">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016975">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017001">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017032">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017033">
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017041">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017077">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017078">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017079">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017112">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017113">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017133">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017134">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017135">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017159">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017396">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020725">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020726">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020727">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020728">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020736">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020738">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020765">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020766">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020767">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020768">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020769">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020771">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020772">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020773">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020774">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020775">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020781">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020782">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020783">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020784">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020786">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020787">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|4|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020788">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020791">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020792">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020798">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020799">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020800">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020801">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020803">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020804">
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020809">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020810">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020812">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020813">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020814">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020815">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020816">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020817">
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020818">
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020821">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020833">
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020834">
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020836">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020837">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020844">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020849">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020860">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020861">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020862">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020863">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020864">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="21" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020867">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020868">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020869">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020870">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020873">
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020874">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020875">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020876">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020877">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020878">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020879">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020880">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020881">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020882">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020883">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020884">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020885">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020886">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020891">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020892">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020893">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020894">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020895">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020896">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020897">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020899">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020901">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020903">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020904">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020905">
        <Set Vis="0" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020906">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020907">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020908">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020909">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020910">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020911">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_020912">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK006_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK006_000008">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="598">
      <TTabControl Name="" ID="158" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="32" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" Index="0" TabBG="-657931" SelTab="-1842205" Alignment="0">
        <Texts>
          <ENU>LONGITUDINAL|SHEAR</ENU>
        </Texts>
        <Tabs>
          <Tab Text="LONGITUDINAL">
            <TTableInput Name="" ID="159" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="29" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|120" MaxSize="320|120" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|0|3" VarName="_dialog_DesignReinf" Value="[1-]|0|4|1|True║[2-]|90|4|1|True║[1+]|0|0|0|True║[2+]|90|0|0|True" CellBG="-1" HeaderBG="-986896" FixedRows="4">
              <Texts>
                <ENU>Layer|Alpha [°]|As,req [in2/ft]|Tensile|MainVert</ENU>
              </Texts>
              <Columns>
                <Column Sort="False" Name="Descript" Description="Layer" Type="String" />
                <Column Sort="False" Name="α" Description="Alpha [°]" Type="Numeric">
                  <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
                </Column>
                <Column Sort="False" Name="As_req" Description="As,req [in2/ft]" Type="Numeric">
                  <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="2.116667e-3" Dim="in↑2←/ft" />
                </Column>
                <Column Sort="False" Name="Tensile" Description="Tensile" Type="Numeric">
                  <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
                </Column>
                <Column Sort="False" Name="MainVert" Description="MainVert" Type="Bool" />
              </Columns>
            </TTableInput>
          </Tab>
          <Tab Text="SHEAR" />
        </Tabs>
      </TTabControl>
      <TTabControl Name="" ID="154" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|120" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" Index="0" TabBG="-657931" SelTab="-1842205" Alignment="0">
        <Texts>
          <ENU>BASIC|RECALC_POD</ENU>
        </Texts>
        <Tabs>
          <Tab Text="BASIC">
            <TLabel Name="" ID="160" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="28" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
              <Texts>
                <ENU>REINFORCEMENT</ENU>
              </Texts>
            </TLabel>
            <TTableInput Name="" ID="155" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|0|3" VarName="_dialog_BasicForces" Value="CO1/1|LC1|-1|0|0|0|0|0|0|1║CO1/2|LC2|-1|0|0|0|0|0|1|1" CellBG="-1" HeaderBG="-986896" FixedRows="2">
              <Texts>
                <ENU>CombiID|CombiKey|nx [kip/ft]|ny [kip/ft]|nxy [kip/ft]|mx [kip*ft/ft]|my [kip*ft/ft]|mxy [kip*ft/ft]|qx [kip/ft]|qy [kip/ft]</ENU>
              </Texts>
              <Columns>
                <Column Sort="True" Name="CombiID" Description="CombiID" Type="String" />
                <Column Sort="True" Name="CombiKey" Description="CombiKey" Type="String" />
                <Column Sort="True" Name="nx" Description="nx [kip/ft]" Type="Numeric">
                  <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="14593.9" Dim="kip/ft" />
                </Column>
                <Column Sort="True" Name="ny" Description="ny [kip/ft]" Type="Numeric">
                  <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="14593.9" Dim="kip/ft" />
                </Column>
                <Column Sort="True" Name="nxy" Description="nxy [kip/ft]" Type="Numeric">
                  <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="14593.9" Dim="kip/ft" />
                </Column>
                <Column Sort="True" Name="mx" Description="mx [kip*ft/ft]" Type="String" />
                <Column Sort="True" Name="my" Description="my [kip*ft/ft]" Type="Numeric">
                  <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip∙ft/ft" />
                </Column>
                <Column Sort="True" Name="mxy" Description="mxy [kip*ft/ft]" Type="Numeric">
                  <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip∙ft/ft" />
                </Column>
                <Column Sort="True" Name="qx" Description="qx [kip/ft]" Type="Numeric">
                  <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="14593.9" Dim="kip/ft" />
                </Column>
                <Column Sort="True" Name="qy" Description="qy [kip/ft]" Type="Numeric">
                  <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="14593.9" Dim="kip/ft" />
                </Column>
              </Columns>
            </TTableInput>
          </Tab>
          <Tab Text="RECALC_POD">
            <TTableInput Name="" ID="156" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|0|3" VarName="_dialog_RecalcForcesPOD" Value="1|6|5|0|5|0║1|6|5|0|5|0" CellBG="-1" HeaderBG="-986896" FixedRows="2">
              <Texts>
                <ENU>x [in]|d [in]|z [in]|nz [kip/ft]|mz [kip*ft/ft]|Alpha_z [°]</ENU>
              </Texts>
              <Columns>
                <Column Sort="True" Name="x" Description="x [in]" Type="Numeric">
                  <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
                </Column>
                <Column Sort="True" Name="d" Description="d [in]" Type="Numeric">
                  <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
                </Column>
                <Column Sort="True" Name="z" Description="z [in]" Type="Numeric">
                  <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
                </Column>
                <Column Sort="True" Name="nz" Description="nz [kip/ft]" Type="Numeric">
                  <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="14593.9" Dim="kip/ft" />
                </Column>
                <Column Sort="True" Name="mz" Description="mz [kip*ft/ft]" Type="Numeric">
                  <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip∙ft/ft" />
                </Column>
                <Column Sort="True" Name="Alpha_z" Description="Alpha_z [°]" Type="Numeric">
                  <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
                </Column>
              </Columns>
            </TTableInput>
            <TLabel Name="" ID="157" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
              <Texts>
                <ENU>RECALC_FORCES_POD</ENU>
              </Texts>
            </TLabel>
          </Tab>
        </Tabs>
      </TTabControl>
      <TCustomLibrary Name="" ID="153" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SREINF.IBC" DataFile="US\US_Reinf.xml" Collapsed="True" UseCombo="False" Category="ASTM A615 Gr. 40" Item="#5 ">
        <Data>
          <Header>
            <PropertySet Symbol="d↓b←" ESA_ID="d↓b←" Unit="in" Type="Numeric" />
            <PropertySet Symbol="A↓s←" ESA_ID="A↓s←" Unit="in↑2←" Type="Numeric" />
            <PropertySet Symbol="w↓s←" ESA_ID="w↓s←" Unit="lb/ft" Type="Numeric" />
            <PropertySet Symbol="fy" ESA_ID="fy" Unit="ksi" Type="Numeric" />
            <PropertySet Symbol="E" ESA_ID="E" Unit="ksi" Type="Numeric" />
          </Header>
          <Items>
            <Item>
              <P>ASTM A615 Gr. 40</P>
              <P>#5 </P>
              <P>0.625</P>
              <P>0.307</P>
              <P>1.043</P>
              <P>40</P>
              <P>29000</P>
            </Item>
          </Items>
        </Data>
      </TCustomLibrary>
      <TComboBox Name="" ID="149" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="MemberType" VarNameVisible="True" InputColor="-1" DescPos="1" InputWidth="150" Values="16|32|64|256|528" Index="-1">
        <Texts>
          <ENU>Plate|Wall|Shell(Plate)|Shell(Wall)|Deep beam</ENU>
        </Texts>
      </TComboBox>
      <TDoubleInput Name="" ID="148" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="33" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-1" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
      <TLabel Name="" ID="146" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
        <Texts>
          <ENU>INTERNAL_FORCES</ENU>
        </Texts>
      </TLabel>
      <TLabel Name="" ID="145" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
        <Texts>
          <ENU>RECALC_FORCES_POD</ENU>
        </Texts>
      </TLabel>
      <TCustomLibrary Name="" ID="150" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="CONCRETE.IBC" DataFile="US\US_Concrete.xml" Collapsed="True" UseCombo="False" Category="Normal Weight Concrete" Item="C5000">
        <Data>
          <Header>
            <PropertySet Symbol="w↓c←" ESA_ID="w↓c←" Unit="lb/ft↑3←" Type="Numeric" />
            <PropertySet Symbol="α" ESA_ID="α" Unit="in/in*°F" Type="Numeric" />
            <PropertySet Symbol="ν" ESA_ID="ν" Unit="" Type="Numeric" />
            <PropertySet Symbol="E↓c←" ESA_ID="E↓c←" Unit="ksi" Type="Numeric" />
            <PropertySet Symbol="G" ESA_ID="G" Unit="ksi" Type="Numeric" />
            <PropertySet Symbol="f↓c←" ESA_ID="f↓c←" Unit="psi" Type="Numeric" />
            <PropertySet Symbol="f↓r←" ESA_ID="f↓r←" Unit="psi" Type="Numeric" />
            <PropertySet Symbol="β↓1←" ESA_ID="β↓1←" Unit="" Type="Numeric" />
            <PropertySet Symbol="f↓cd←" ESA_ID="f↓cd←" Unit="psi" Type="Numeric" />
            <PropertySet Symbol="√f↓c←" ESA_ID="√f↓c←" Unit="psi" Type="Numeric" />
            <PropertySet Symbol="ε↓o←" ESA_ID="ε↓o←" Unit="" Type="Numeric" />
            <PropertySet Symbol="ε↓cu←" ESA_ID="ε↓cu←" Unit="" Type="Numeric" />
          </Header>
          <Items>
            <Item>
              <P>Normal Weight Concrete</P>
              <P>C5000</P>
              <P>155</P>
              <P>5.50E-06</P>
              <P>0.15</P>
              <P>4502.94</P>
              <P>1957.80</P>
              <P>5000</P>
              <P>530.33</P>
              <P>0.80</P>
              <P>4000</P>
              <P>70.71</P>
              <P>0.00178</P>
              <P>0.003</P>
            </Item>
          </Items>
        </Data>
      </TCustomLibrary>
      <TCustomLibrary Name="" ID="151" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="LREINF.IBC" DataFile="US\US_Reinf.xml" Collapsed="True" UseCombo="False" Category="ASTM A615 Gr. 40" Item="#7 ">
        <Data>
          <Header>
            <PropertySet Symbol="d↓b←" ESA_ID="d↓b←" Unit="in" Type="Numeric" />
            <PropertySet Symbol="A↓s←" ESA_ID="A↓s←" Unit="in↑2←" Type="Numeric" />
            <PropertySet Symbol="w↓s←" ESA_ID="w↓s←" Unit="lb/ft" Type="Numeric" />
            <PropertySet Symbol="fy" ESA_ID="fy" Unit="ksi" Type="Numeric" />
            <PropertySet Symbol="E" ESA_ID="E" Unit="ksi" Type="Numeric" />
          </Header>
          <Items>
            <Item>
              <P>ASTM A615 Gr. 40</P>
              <P>#7 </P>
              <P>0.875</P>
              <P>0.601</P>
              <P>2.044</P>
              <P>40</P>
              <P>29000</P>
            </Item>
          </Items>
        </Data>
      </TCustomLibrary>
    </Main>
    <MemberData Width="400" />
    <Setup Width="400" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item ID="BLOCK_UNK000_014696">
      <ENU>"@EXTERNS"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_014713">
      <ENU>"@VARIABLES"</ENU>
    </Item>
    <Item TranslateID="STRING_0185E587">
      <ENU>"Normal Weight"</ENU>
    </Item>
    <Item TranslateID="STRING_02751C9D">
      <ENU>"Shear"</ENU>
    </Item>
    <Item TranslateID="STRING_138C193B">
      <ENU>"Reinf."</ENU>
    </Item>
    <Item TranslateID="STRING_1E5150B2">
      <ENU>"Thickness of 2D member should have minimal 5 in for design required shear reinforcement"</ENU>
    </Item>
    <Item TranslateID="STRING_34CFBDC0">
      <ENU>"Shear resistance without shear reinforcement"</ENU>
    </Item>
    <Item TranslateID="STRING_56200E15">
      <ENU>"Other Lightweight"</ENU>
    </Item>
    <Item TranslateID="STRING_5E3D0C5C">
      <ENU>"Maximum concrete shear resistance"</ENU>
    </Item>
    <Item TranslateID="STRING_6FA4C315">
      <ENU>"Increase thickness of 2D member."</ENU>
    </Item>
    <Item TranslateID="STRING_90889E59">
      <ENU>"Required shear reinforcement"</ENU>
    </Item>
    <Item TranslateID="STRING_B9BC109B">
      <ENU>"Sand Lightweight"</ENU>
    </Item>
    <Item TranslateID="STRING_D0BEFEBD">
      <ENU>"Angle of compression strut"</ENU>
    </Item>
    <Item TranslateID="STRING_FEF1B86E">
      <ENU>"Case"</ENU>
    </Item>
    <Item TranslateID="TEXT_">
      <ENU>"A↓v,min ←= " &amp; 'PARMAX(50*b↓w←/f↓yt←, 0.75*SQRT(f↓cd←/1000000)*b/f↓yt←)' &amp; " =  " &amp; CUnit(A↓swm,min←, "mm*mm/m") &amp; " mm↑2←/m"</ENU>
    </Item>
    <Item ID="TEXT_REZ006_000008">
      <ENU>"UC↓v← = " &amp; 'V↓n←/V↓c←' &amp; " = " &amp; UC_VRdc &amp; " &lt; 1"</ENU>
    </Item>
    <Item ID="TEXT_REZ006_000009">
      <ENU>"UC↓v← = " &amp; 'V↓n←/V↓c←' &amp; " = " &amp; UC_VRdc &amp; " &gt; 0.5"</ENU>
    </Item>
    <Item ID="TEXT_REZ006_000022">
      <ENU>"V↓c← = " &amp; CUnit(V↓c←, "kip") &amp; "kip  V↓s← = " &amp; CUnit(V↓s←, "kip") &amp; "kip"</ENU>
    </Item>
    <Item ID="TEXT_REZ006_000071">
      <ENU>"A↓v,prov← = " &amp; 'n↓s,req←*(1/4*π*ϕ↑2←)' &amp; " = " &amp; CUnit(A↓v,prov←, "in↑2←") &amp; " in↑2←/ft"</ENU>
    </Item>
    <Item ID="TEXT_REZ006_000074">
      <ENU>"V↓n← = V↓c←+V↓s← = " &amp; CUnit(v↓Rd←, "kip") &amp; "    UC↓t←= " &amp; 'V↓u←/ϕV↓n←' &amp; " = " &amp; UC_VR</ENU>
    </Item>
    <Item TranslateID="TEXT_REZ006_000079">
      <ENU>"Summary of Shear Check "</ENU>
    </Item>
    <Item ID="TEXT_REZ006_000104">
      <ENU>"- Nominal shear strength provided by concrete"</ENU>
    </Item>
    <Item ID="TEXT_REZ006_000106">
      <ENU>"- Nominal shear strength provided by concrete"</ENU>
    </Item>
    <Item ID="TEXT_REZ006_000107">
      <ENU>"- Nominal shear strength provided by concrete"</ENU>
    </Item>
    <Item ID="TEXT_RLF098_000055">
      <ENU>"v↓x←=" &amp; CUnit(qx, "kN/m") &amp; "kN/m" &amp; "   v↓y←=" &amp; CUnit(qy, "kN/m") &amp; "kN/m"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000056">
      <ENU>"A↓sl,x← = " &amp; CUnit(A↓sl,x←, "mm↑2←") &amp; " mm↑2←/m"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000057">
      <ENU>"A↓sl,y← = " &amp; CUnit(A↓sl,y←, "mm↑2←") &amp; " mm↑2←/m"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000058">
      <ENU>"Design Forces:  N↓n← = " &amp; CUnit(N↓n←, "kN") &amp; "   V↓n ←= " &amp; CUnit(V↓n←, "kN") &amp; " ) "</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000059">
      <ENU>"v↓c1 ←= " &amp; '2*(1+N↓n←/(500*A↓g←))*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000060">
      <ENU>"v↓c2 ←= " &amp; '(0.6*λ*SQRT(f↓cd←)+700*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000061">
      <ENU>"v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000062">
      <ENU>"v↓c3 ←= " &amp; '(0.6*λ*SQRT(f↓cd←)+700*V↓n←*d/M↓n←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000063">
      <ENU>"v↓c4 ←= " &amp; '5*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c4←, "MPa") &amp; "MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000064">
      <ENU>"v↓c1 ←= " &amp; '2*(1+N↓n←/(2000*A↓g←))*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000065">
      <ENU>"v↓c2 ←= " &amp; '(1.9*λ*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000066">
      <ENU>"v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←V↓u←*d/(M↓u←-N↓u←*(4*h-d)/8))' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000068">
      <ENU>"v↓c3 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000070">
      <ENU>"v↓c4 ←= " &amp; '3.5*λ*SQRT(f↓cd←)*SQRT(1+0.29*N↓u←/A↓g←)' &amp; " = " &amp; CUnit(v↓c4←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000071">
      <ENU>"v↓c1 ←= " &amp; '2*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000072">
      <ENU>"v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000073">
      <ENU>"v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000075">
      <ENU>"v↓c3 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c3←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000077">
      <ENU>"v↓c4 ←= " &amp; '3.5*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c4←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000079">
      <ENU>"v↓c← =" &amp; 'PARMAX(v↓c1←, MIN(v↓c2←, v↓c3←, v↓c4←))' &amp; "= " &amp; CUnit(v↓c←, "MPa") &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000081">
      <ENU>"V↓c← = " &amp; 'v↓c←*b*d' &amp; " = " &amp; CUnit(V↓c←, "kN") &amp; " kN"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000083">
      <ENU>"V↓max← = " &amp; 'V↓c←+8*λ*SQRT(f↓cd←)*b*d' &amp; " = " &amp; CUnit(V↓Rdmax←, "kN") &amp; " kN"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000084">
      <ENU>"Rebar#" &amp; Barno &amp; "  f↓yt←= " &amp; CUnit(f↓ywd,req←, "MPa") &amp; "MPa   d=" &amp; CUnit(d, "mm") &amp; "mm   V↓s←= " &amp; CUnit(V↓s←, "kN") &amp; "kN"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000086">
      <ENU>"A↓v,req←= " &amp; 'V↓s←/(d*f↓yt←)' &amp; " = " &amp; CUnit(A↓v,req←, "mm↑2←/m") &amp; "mm↑2←/m"</ENU>
    </Item>
    <Item TranslateID="TEXT_RLF098_000088">
      <ENU>"A↓v,min ←= " &amp; 'PARMAX(50*b↓w←/f↓yt←, 0.75*SQRT(f↓cd←/1000000)*b/f↓yt←)' &amp; " =  " &amp; CUnit(A↓swm,min←, "mm*mm/m") &amp; " mm↑2←/m"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_014748">
      <ENU>"A↓sl,x← = " &amp; CUnit(A↓sl,x←, "in↑2←") &amp; " in↑2←/ft"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_014749">
      <ENU>"A↓sl,y← = " &amp; CUnit(A↓sl,y←, "in↑2←") &amp; " in↑2←/ft"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_014833">
      <ENU>"Design Forces:"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_014836">
      <ENU>"(" &amp; "d=" &amp; CUnit(d, "in") &amp; "in  , " &amp; "z=" &amp; CUnit(z, "in") &amp; "in )"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_014850">
      <ENU>"Longitudinal Reinforcement Ratio:"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_014860">
      <ENU>"Calculate Shear Resistance of Section : "</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_014935">
      <ENU>"- Statically required shear reinforcement: "</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_014964">
      <ENU>"Design of Shear Reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_016860">
      <ENU>"A↓v,min ←= " &amp; 'PARMAX(50*b↓w←/f↓yt←, 0.75*SQRT(f↓cd←/1000000)*b/f↓yt←)' &amp; " =  " &amp; CUnit(A↓swm,min←, "in*in/ft") &amp; " in↑2←/ft"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_017033">
      <ENU>"Combinations"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_017159">
      <ENU>"Table2- Shear reinforcement information"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_020771">
      <ENU>"* Shear load exceeds the maximum capacity of Section"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_020772">
      <ENU>"* Section height increase is necessary"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020786">
      <ENU>"Rebar#" &amp; Barno &amp; "  f↓yt←= " &amp; CUnit(f↓ywd,req←, "psi") &amp; "psi   d=" &amp; CUnit(d, "in") &amp; "in   V↓s←= " &amp; CUnit(V↓s←, "kip") &amp; "kip"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020788">
      <ENU>"v↓x←=" &amp; CUnit(qx, "kip/ft") &amp; "kip/ft" &amp; "   v↓y←=" &amp; CUnit(qy, "kip/ft") &amp; "kip/ft"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020798">
      <ENU>"V↓n← =" &amp; 'b*SQRT(qx↑2←+qy↑2←)/ϕ' &amp; " = " &amp; CUnit(V↓n←, "kip") &amp; " kip"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020799">
      <ENU>"M↓n← =" &amp; 'b*SQRT(mx↑2←+my↑2←)/ϕ' &amp; " = " &amp; CUnit(M↓n←, "kip*ft") &amp; " kip.ft"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020803">
      <ENU>"ρ↓lx← = " &amp; ρ↓lx← &amp; " , ρ↓ly← = " &amp; ρ↓ly←</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020804">
      <ENU>"A↓c←=" &amp; 'b*h' &amp; " = " &amp; CUnit(A↓c←, "in↑2←") &amp; "in↑2←"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020809">
      <ENU>"V↓c← = " &amp; 'v↓c←*b*d' &amp; " = " &amp; CUnit(V↓c←, "kip") &amp; " kip"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020810">
      <ENU>"v↓c1 ←= " &amp; '2*(1+N↓n←/(500*A↓g←))*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020812">
      <ENU>"v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020813">
      <ENU>"v↓c3 ←= " &amp; '(0.6*λ*SQRT(f↓cd←)+700*V↓n←*d/M↓n←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020814">
      <ENU>"v↓c4 ←= " &amp; '5*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c4←, "psi") &amp; "psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020815">
      <ENU>"V↓max← = " &amp; 'V↓c←+8*λ*SQRT(f↓cd←)*b*d' &amp; " = " &amp; CUnit(V↓Rdmax←, "kip") &amp; " kip"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020816">
      <ENU>"UC↓v← = " &amp; 'V↓n←/V↓c←' &amp; " = " &amp; UC_VRdc &amp; " &gt; 1 "</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020817">
      <ENU>"A↓v,req←= " &amp; 'V↓s←/(d*f↓yt←)' &amp; " = " &amp; CUnit(A↓v,req←, "in↑2←/ft") &amp; "in↑2←/ft"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020818">
      <ENU>"n↓s,req←= " &amp; 'A↓v,req←/(0.25*π*ϕ↓s,req←↑2←)' &amp; " = " &amp; n↓s,req← &amp; "  /ft"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_020833">
      <ENU>"Shear reinforcement yield stress fy=" &amp; CUnit(f↓yk,req←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_020834">
      <ENU>"Strength Reduction Factor= " &amp; ϕ</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020836">
      <ENU>"V↓s← = |V↓n←|" &amp; '-V↓c←' &amp; " = " &amp; CUnit(V↓s←, "kip") &amp; "  kip"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020844">
      <ENU>"v↓c← =" &amp; 'PARMAX(v↓c1←, MIN(v↓c2←, v↓c3←, v↓c4←))' &amp; "= " &amp; CUnit(v↓c←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_020849">
      <ENU>"- Design shear reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020878">
      <ENU>"v↓c1 ←= " &amp; '2*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020880">
      <ENU>"v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020882">
      <ENU>"v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020884">
      <ENU>"v↓c3 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c3←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020886">
      <ENU>"v↓c4 ←= " &amp; '3.5*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c4←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_020892">
      <ENU>"- Shear with Tension"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020894">
      <ENU>"v↓c2 ←= " &amp; '(0.6*λ*SQRT(f↓cd←)+700*V↓u←*d/M↓u←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_020895">
      <ENU>"- Shear with Compression"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020897">
      <ENU>"v↓c1 ←= " &amp; '2*(1+N↓n←/(2000*A↓g←))*λ*SQRT(f↓cd←)' &amp; " = " &amp; CUnit(v↓c1←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020899">
      <ENU>"v↓c2 ←= " &amp; '(1.9*λ*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020901">
      <ENU>"v↓c2 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←V↓u←*d/(M↓u←-N↓u←*(4*h-d)/8))' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020903">
      <ENU>"v↓c3 ←= " &amp; '(1.9*SQRT(f↓cd←)+2500*ρ↓1←)' &amp; " = " &amp; CUnit(v↓c2←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_020905">
      <ENU>"v↓c4 ←= " &amp; '3.5*λ*SQRT(f↓cd←)*SQRT(1+0.29*N↓u←/A↓g←)' &amp; " = " &amp; CUnit(v↓c4←, "psi") &amp; " psi"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_020909">
      <ENU>"- Shear with No Axial load"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_020910">
      <ENU>"Design Forces:  N↓n← = " &amp; CUnit(N↓n←, "kip") &amp; "   V↓n ←= " &amp; CUnit(V↓n←, "kip") &amp; " ) "</ENU>
    </Item>
  </Texts>
</Root>