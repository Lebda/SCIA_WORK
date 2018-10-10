<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      </head>
      <body>
        <!--<xsl:value-of select="position()"/>-->
        <div class="container">
          <h2>Result CDD 2D</h2>
          <p></p>
          <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>ElemID</th>
                  <th>#</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="CddCalcResult/ElemInput">
                  <tr>
                    <td>
                      <span class="label label-danger">
                        <xsl:value-of select="@elemID"/>
                      </span>
                    </td>
                    <td>
                      <button class="btn btn-primary btn-xs" type="button" data-toggle="collapse" aria-expanded="false">
                        <xsl:attribute name="data-target">
                          <xsl:text>#collapseINPUT</xsl:text>
                          <xsl:value-of select="@elemID"/>
                        </xsl:attribute>
                          INPUT
                      </button>
                      <xsl:for-each select="Result2D">
                        <button class="btn btn-primary btn-xs" type="button" data-toggle="collapse" aria-expanded="false">
                          <xsl:attribute name="data-target">
                            <xsl:text>#collapse</xsl:text>
                            <xsl:value-of select="../@elemID"/>
                            <xsl:value-of select="@eCalculatorCddType"/>
                          </xsl:attribute>
                          Result => <xsl:value-of select="@eCalculatorCddType"/>
                        </button>
                      </xsl:for-each>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                      <div>
                        <xsl:attribute name="class">
                          <xsl:text>collapse</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="id">
                          <xsl:text>collapseINPUT</xsl:text>
                          <xsl:value-of select="@elemID"/>
                        </xsl:attribute>
                        <div class="well">
                          <span class="label label-info">
                            INPUT
                          </span>
                          <h5>Cross section</h5>
                          <span class="label label-warning">
                            B =  <xsl:value-of select="StiffnessInput2D/InputRect2D/@B"/>
                          </span>
                          <span class="label label-warning">
                            H =  <xsl:value-of select="StiffnessInput2D/InputRect2D/@H"/>
                          </span>
                          <span class="label label-warning">
                            femElemID =  <xsl:value-of select="StiffnessInput2D/InputRect2D/@FemElemID"/>
                          </span>
                          <span class="label label-warning">
                            elemX =  <xsl:value-of select="StiffnessInput2D/InputRect2D/@ElemCentreX"/>
                          </span>
                          <span class="label label-warning">
                            elemY =  <xsl:value-of select="StiffnessInput2D/InputRect2D/@ElemCentreY"/>
                          </span>
                          <span class="label label-warning">
                            elemZ =  <xsl:value-of select="StiffnessInput2D/InputRect2D/@ElemCentreZ"/>
                          </span>
                          <h5>Add data</h5>
                          <span class="label label-danger">
                            eCalcPosCdd =  <xsl:value-of select="StiffnessInput2D/InputRect2D/@eCalcPosCdd"/>
                          </span>
                          <span class="label label-warning">
                            SigmaCr =  <xsl:value-of select="StiffnessInput2D/@SigmaCr"/>
                          </span>
                          <span class="label label-warning">
                            Zcalc =  <xsl:value-of select="StiffnessInput2D/InputRect2D/@Zcalc"/>
                          </span>
                          <span class="label label-warning">
                            LocalAxisAlpha =  <xsl:value-of select="StiffnessInput2D/InputRect2D/@LocalAxisAlpha"/>
                          </span>
                          <span class="label label-warning">
                            CreepCoeffAutoCalc =  <xsl:value-of select="StiffnessInput2D/@CreepCoeffAutoCalc"/>
                          </span>
                          <span class="label label-warning">
                            CreepCoeff =  <xsl:value-of select="StiffnessInput2D/@CreepCoefficient"/>
                          </span>
                          <h5>Material</h5>
                          <span class="label label-warning">
                            Emodulus =  <xsl:value-of select="StiffnessInput2D/InputRect2D/Material/@E"/>
                          </span>
                          <span class="label label-warning">
                            Gmodulus =  <xsl:value-of select="StiffnessInput2D/InputRect2D/Material/@G"/>
                          </span>
                          <span class="label label-warning">
                            Gmodulus =  <xsl:value-of select="StiffnessInput2D/InputRect2D/Material/@G"/>
                          </span>
                          <span class="label label-warning">
                            Fck =  <xsl:value-of select="StiffnessInput2D/InputRect2D/Material/@Fk"/>
                          </span>
                          <span class="label label-warning">
                            PoissonCoeff =  <xsl:value-of select="StiffnessInput2D/InputRect2D/Material/@PoissonCoeff"/>
                          </span>
                          <xsl:if test ="(StiffnessInput2D/@CreepCoeffAutoCalc = 'True')">
                            <h5>CreepCoeff auto calculation input</h5>
                            <span class="label label-warning">
                              Code =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@Code"/>
                            </span>
                            <span class="label label-warning">
                              Ac =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@Ac"/>
                            </span>
                            <span class="label label-warning">
                              AtmoPeriMeter =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@AtmoPeriMeter"/>
                            </span>
                            <span class="label label-warning">
                              Cement =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@Cement"/>
                            </span>
                            <span class="label label-warning">
                              ConsideredTime_t =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@ConsideredTime_t"/>
                            </span>
                            <span class="label label-warning">
                              LoadingTime_t0 =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@LoadingTime_t0"/>
                            </span>
                            <span class="label label-warning">
                              Fcm =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@Fcm"/>
                            </span>
                            <span class="label label-warning">
                              Fck =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@Fck"/>
                            </span>
                            <span class="label label-warning">
                              Relative humidity =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@RH"/>
                            </span>
                            <span class="label label-warning">
                              Meantemperature =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@dTemp"/>
                            </span>
                            <span class="label label-warning">
                              SigmaC =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@SigmaC"/>
                            </span>
                            <h5>CreepCoeff auto calculation results</h5>
                            <span class="label label-danger">
                              CreepCoeff =  <xsl:value-of select="StiffnessInput2D/CreepCoeffRes/@CreepCoeff"/>
                            </span>
                            <span class="label label-warning">
                              NotionalCreepCoeff =  <xsl:value-of select="StiffnessInput2D/CreepCoeffRes/@NotionalCreepCoeff"/>
                            </span>
                            <span class="label label-warning">
                              BetaC =  <xsl:value-of select="StiffnessInput2D/CreepCoeffRes/@BetaC"/>
                            </span>
                            <span class="label label-warning">
                              T0Recalc =  <xsl:value-of select="StiffnessInput2D/CreepCoeffRes/@T0Recalc"/>
                            </span>
                            <span class="label label-warning">
                              H0 =  <xsl:value-of select="StiffnessInput2D/CreepCoeffRes/@H0"/>
                            </span>
                            <span class="label label-warning">
                              SIA_dPhiRH =  <xsl:value-of select="StiffnessInput2D/CreepCoeffRes/@SIA_dPhiRH"/>
                            </span>
                            <span class="label label-warning">
                              SIA_dBetaFc =  <xsl:value-of select="StiffnessInput2D/CreepCoeffRes/@SIA_dBetaFc"/>
                            </span>
                            <span class="label label-warning">
                              SIA_dBetaT0 =  <xsl:value-of select="StiffnessInput2D/CreepCoeffRes/@SIA_dBetaT0"/>
                            </span>
                            <span class="label label-warning">
                              SIA_dBeta_TminusT0 =  <xsl:value-of select="StiffnessInput2D/CreepCoeffRes/@SIA_dBeta_TminusT0"/>
                            </span>
                            <span class="label label-warning">
                              SIA_dBetaSigmaC =  <xsl:value-of select="StiffnessInput2D/CreepCoeffRes/@SIA_dBetaSigmaC"/>
                            </span>
                          </xsl:if>
                          <h5>Reinforcement</h5>
                          <xsl:for-each select="StiffnessInput2D/ReinfLayer2D">
                            <span class="label label-danger">
                              Layer2D
                            </span>
                            <span class="label label-warning">
                              Zs =  <xsl:value-of select="@Zs"/>
                            </span>
                            <span class="label label-warning">
                              AsLayer =  <xsl:value-of select="@AsLayer"/>
                            </span>
                            <span class="label label-warning">
                              DsBarInLayer =  <xsl:value-of select="@DBarInLayer"/>
                            </span>
                            <span class="label label-warning">
                              AlphaS =  <xsl:value-of select="@AlphaS"/>
                            </span>
                            <span class="label label-warning">
                              Offset =  <xsl:value-of select="@Offset"/>
                            </span>
                            <span class="label label-warning">
                              DistSs =  <xsl:value-of select="@DistSs"/>
                            </span>
                            <span class="label label-warning">
                              IncreaseCoeff =  <xsl:value-of select="@IncreaseCoeff"/>
                            </span>
                            <span class="label label-warning">
                              Emodulus =  <xsl:value-of select="@E"/>
                            </span>
                            <span class="label label-warning">
                              Fyk =  <xsl:value-of select="@Fk"/>
                            </span>
                          </xsl:for-each>
                          <h5>Ribs</h5>
                          <xsl:for-each select="StiffnessInput2D/InputRect2D/RibInfo">
                            <span class="label label-Danger">
                              RibInfo
                            </span>
                            <span class="label label-warning">
                              ribID =  <xsl:value-of select="@ribID"/>
                            </span>
                            <span class="label label-warning">
                              dx =  <xsl:value-of select="@dx"/>
                            </span>
                            <span class="label label-warning">
                              distance =  <xsl:value-of select="@distance"/>
                            </span>
                            <span class="label label-warning">
                              angle =  <xsl:value-of select="@angle"/>
                            </span>
                            <span class="label label-warning">
                              element =  <xsl:value-of select="@element"/>
                            </span>
                            <div class="well well-sm">
                              <xsl:for-each select="ReinfLayer2D">
                                <span class="label label-danger">
                                  Layer2D
                                </span>
                                <span class="label label-warning">
                                  Zs =  <xsl:value-of select="@Zs"/>
                                </span>
                                <span class="label label-warning">
                                  AsLayer =  <xsl:value-of select="@AsLayer"/>
                                </span>
                                <span class="label label-warning">
                                  DsBarInLayer =  <xsl:value-of select="@DBarInLayer"/>
                                </span>
                                <span class="label label-warning">
                                  AlphaS =  <xsl:value-of select="@AlphaS"/>
                                </span>
                                <span class="label label-warning">
                                  Offset =  <xsl:value-of select="@Offset"/>
                                </span>
                                <span class="label label-warning">
                                  DistSs =  <xsl:value-of select="@DistSs"/>
                                </span>
                                <span class="label label-warning">
                                  IncreaseCoeff =  <xsl:value-of select="@IncreaseCoeff"/>
                                </span>
                                <span class="label label-warning">
                                  Emodulus =  <xsl:value-of select="@E"/>
                                </span>
                                <span class="label label-warning">
                                  Fyk =  <xsl:value-of select="@Fk"/>
                                </span>
                                <br/>
                                <br/>
                              </xsl:for-each>
                            </div>
                          </xsl:for-each>
                        </div>
                      </div>
                      <xsl:for-each select="Result2D">
                        <div>
                          <xsl:attribute name="class">
                            <xsl:text>collapse</xsl:text>
                          </xsl:attribute>
                          <xsl:attribute name="id">
                            <xsl:text>collapse</xsl:text>
                            <xsl:value-of select="../@elemID"/>
                            <xsl:value-of select="@eCalculatorCddType"/>
                          </xsl:attribute>
                          <div>
                            <span class="label label-danger">
                              <xsl:value-of select="@eCalculatorCddType"/>
                            </span>
                            <!--FORCES2D-->
                            <button class="btn btn-info btn-xs" type="button" data-toggle="collapse" aria-expanded="false">
                              <xsl:attribute name="data-target">
                                <xsl:text>#collapseFORCES2D</xsl:text>
                                <xsl:value-of select="../@elemID"/>
                                <xsl:value-of select="@eCalculatorCddType"/>
                              </xsl:attribute>
                              FORCES 2D
                            </button>
                            <!--FORCES2D-->
                            <!--STIFFNESS-->
                            <button class="btn btn-info btn-xs" type="button" data-toggle="collapse" aria-expanded="false">
                              <xsl:attribute name="data-target">
                                <xsl:text>#collapseSTIFFNESS2D</xsl:text>
                                <xsl:value-of select="../@elemID"/>
                                <xsl:value-of select="@eCalculatorCddType"/>
                              </xsl:attribute>
                              STIFFNESS 2D
                            </button>
                            <!--STIFFNESS-->
                            <!--SOLVER LINK-->
                            <button class="btn btn-info btn-xs" type="button" data-toggle="collapse" aria-expanded="false">
                              <xsl:attribute name="data-target">
                                <xsl:text>#collapseSOLVERLINKSTIFFNESS2D</xsl:text>
                                <xsl:value-of select="../@elemID"/>
                                <xsl:value-of select="@eCalculatorCddType"/>
                              </xsl:attribute>
                              SOLVER LINK STIFFNESS 2D
                            </button>
                            <!--SOLVER LINK-->
                            <!--CALCULATIONS1D-->
                            <xsl:for-each select="CStiffness4Deflection2D/CRectAverageStiffness2D/Calculation">
                              <button class="btn btn-info btn-xs" type="button" data-toggle="collapse" aria-expanded="false">
                                <xsl:attribute name="data-target">
                                  <xsl:text>#collapseCALCULATIONS1D</xsl:text>
                                  <xsl:value-of select="../../../../@elemID"/>
                                  <xsl:value-of select="../../../@eCalculatorCddType"/>
                                  <xsl:value-of select="@Direction"/>
                                </xsl:attribute>
                                <xsl:value-of select="@Direction"/> DIRECTION
                              </button>                             
                            </xsl:for-each>
                            <!--CALCULATIONS1D-->
                            <!--FORCES2D-->
                            <div>
                              <xsl:attribute name="class">
                                <xsl:text>collapse</xsl:text>
                              </xsl:attribute>
                              <xsl:attribute name="id">
                                <xsl:text>collapseFORCES2D</xsl:text>
                                <xsl:value-of select="../@elemID"/>
                                <xsl:value-of select="@eCalculatorCddType"/>
                              </xsl:attribute>
                              <div class="well">
                                <h4>
                                  Forces for <xsl:value-of select="@eCalculatorCddType"/> CDD calculation type
                                </h4>
                                <h6>Stiffness [N]</h6>
                                <span class="label label-warning">
                                  Nx =  <xsl:value-of select="floor(Forces2D/@Nx_stiffness)"/>
                                </span>
                                <span class="label label-warning">
                                  Ny =  <xsl:value-of select="floor(Forces2D/@Ny_stiffness)"/>
                                </span>
                                <span class="label label-warning">
                                  Nxy =  <xsl:value-of select="floor(Forces2D/@Nxy_stiffness)"/>
                                </span>
                                <span class="label label-warning">
                                  Mx =  <xsl:value-of select="floor(Forces2D/@Mx_stiffness)"/>
                                </span>
                                <span class="label label-warning">
                                  My =  <xsl:value-of select="floor(Forces2D/@My_stiffness)"/>
                                </span>
                                <span class="label label-warning">
                                  Mxy =  <xsl:value-of select="floor(Forces2D/@Mxy_stiffness)"/>
                                </span>
                                <h6>Crack [N]</h6>
                                <span class="label label-warning">
                                  Nx =  <xsl:value-of select="floor(Forces2D/@Nx_crack)"/>
                                </span>
                                <span class="label label-warning">
                                  Ny =  <xsl:value-of select="floor(Forces2D/@Ny_crack)"/>
                                </span>
                                <span class="label label-warning">
                                  Nxy =  <xsl:value-of select="floor(Forces2D/@Nxy_crack)"/>
                                </span>
                                <span class="label label-warning">
                                  Mx =  <xsl:value-of select="floor(Forces2D/@Mx_crack)"/>
                                </span>
                                <span class="label label-warning">
                                  My =  <xsl:value-of select="floor(Forces2D/@My_crack)"/>
                                </span>
                                <span class="label label-warning">
                                  Mxy =  <xsl:value-of select="floor(Forces2D/@Mxy_crack)"/>
                                </span>
                                <span class="label label-warning">
                                  SlsCharCombiIndex = <xsl:value-of select="Forces2D/@SlsCharCombiIndex"/>
                                </span>
                                <h6>Immediate stress [N]</h6>
                                <span class="label label-warning">
                                  Nx =  <xsl:value-of select="floor(Forces2D/@Nx_immediate)"/>
                                </span>
                                <span class="label label-warning">
                                  Ny =  <xsl:value-of select="floor(Forces2D/@Ny_immediate)"/>
                                </span>
                                <span class="label label-warning">
                                  Nxy =  <xsl:value-of select="floor(Forces2D/@Nxy_immediate)"/>
                                </span>
                                <span class="label label-warning">
                                  Mx =  <xsl:value-of select="floor(Forces2D/@Mx_immediate)"/>
                                </span>
                                <span class="label label-warning">
                                  My =  <xsl:value-of select="floor(Forces2D/@My_immediate)"/>
                                </span>
                                <span class="label label-warning">
                                  Mxy =  <xsl:value-of select="floor(Forces2D/@Mxy_immediate)"/>
                                </span>
                              </div>
                            </div>
                            <!--FORCES2D-->
                            <!--STIFFNESS-->
                            <div>
                                <xsl:attribute name="class">
                                  <xsl:text>collapse</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="id">
                                  <xsl:text>collapseSTIFFNESS2D</xsl:text>
                                  <xsl:value-of select="../@elemID"/>
                                  <xsl:value-of select="@eCalculatorCddType"/>
                                </xsl:attribute>
                                <div class="well">
                                  <h4>
                                    Stiffness for <xsl:value-of select="@eCalculatorCddType"/> CDD calculation type
                                  </h4>
                                  <span class="label label-warning">
                                    PricipStressAlpha =  <xsl:value-of select="CStiffness4Deflection2D/CRectAverageStiffness2D/@PricipStressAlpha"/>
                                  </span>
                                  <hr/>               
                                  <span class="label label-warning">
                                    D11l =  <xsl:value-of select="floor(CStiffness4Deflection2D/CRectAverageStiffness2D/CStiffness2D/@D11l)"/>
                                  </span>
                                  <span class="label label-warning">
                                    D22l =  <xsl:value-of select="floor(CStiffness4Deflection2D/CRectAverageStiffness2D/CStiffness2D/@D22l)"/>
                                  </span>
                                  <span class="label label-warning">
                                    d11l =  <xsl:value-of select="floor(CStiffness4Deflection2D/CRectAverageStiffness2D/CStiffness2D/@d11l)"/>
                                  </span>
                                  <span class="label label-warning">
                                    d22l =  <xsl:value-of select="floor(CStiffness4Deflection2D/CRectAverageStiffness2D/CStiffness2D/@d22l)"/>
                                  </span>
                                  <hr/>
                                  <span class="label label-warning">
                                    D11pl =  <xsl:value-of select="floor(CStiffness4Deflection2D/CRectAverageStiffness2D/CStiffness2D/@D11pl)"/>
                                  </span>
                                  <span class="label label-warning">
                                    D22pl =  <xsl:value-of select="floor(CStiffness4Deflection2D/CRectAverageStiffness2D/CStiffness2D/@D22pl)"/>
                                  </span>
                                  <span class="label label-warning">
                                    d11pl =  <xsl:value-of select="floor(CStiffness4Deflection2D/CRectAverageStiffness2D/CStiffness2D/@d11pl)"/>
                                  </span>
                                  <span class="label label-warning">
                                    d22pl =  <xsl:value-of select="floor(CStiffness4Deflection2D/CRectAverageStiffness2D/CStiffness2D/@d22pl)"/>
                                  </span>
                                </div>
                              </div>
                            <!--STIFFNESS-->
                            <!--SOLVER LINK-->
                            <div>
                              <xsl:attribute name="class">
                                <xsl:text>collapse</xsl:text>
                              </xsl:attribute>
                              <xsl:attribute name="id">
                                <xsl:text>collapseSOLVERLINKSTIFFNESS2D</xsl:text>
                                <xsl:value-of select="../@elemID"/>
                                <xsl:value-of select="@eCalculatorCddType"/>
                              </xsl:attribute>
                              <div class="well">
                                <span class="label label-warning">
                                  D11 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D11)"/>
                                </span>
                                <span class="label label-warning">
                                  D22 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D22)"/>
                                </span>
                                <span class="label label-warning">
                                  D33 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D33)"/>
                                </span>
                                <span class="label label-warning">
                                  D44 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D44)"/>
                                </span>
                                <span class="label label-warning">
                                  D55 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D55)"/>
                                </span>
                                <span class="label label-warning">
                                  D12 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D12)"/>
                                </span>
                                <hr/>
                                
                                <span class="label label-warning">
                                  D66 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D66)"/>
                                </span>
                                <span class="label label-warning">
                                  D77 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D77)"/>
                                </span>
                                <span class="label label-warning">
                                  D88 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D88)"/>
                                </span>
                                <span class="label label-warning">
                                  D67 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D67)"/>
                                </span>
                                <hr/>

                                <span class="label label-warning">
                                  D13 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D13)"/>
                                </span>
                                <span class="label label-warning">
                                  D23 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D23)"/>
                                </span>                                                              
                                <span class="label label-warning">
                                  D45 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D45)"/>
                                </span>
                                <span class="label label-warning">
                                  D68 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D68)"/>
                                </span>
                                <span class="label label-warning">
                                  D78 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D78)"/>
                                </span>                                                                                       
                                <hr/>
                                
                                <span class="label label-warning">
                                  D16 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D16)"/>
                                </span>
                                <span class="label label-warning">
                                  D27 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D27)"/>
                                </span>
                                <span class="label label-warning">
                                  D38 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D38)"/>
                                </span>
                                <span class="label label-warning">
                                  D17 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D17)"/>
                                </span>
                                <span class="label label-warning">
                                  D18 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D18)"/>
                                </span>
                                <span class="label label-warning">
                                  D28 =  <xsl:value-of select="floor(CStiffness4Deflection2D/CStiffness4SolverLink2D/@D28)"/>
                                </span>
                                <hr/>

                                <span class="label label-warning">
                                  Thickness =  <xsl:value-of select="CStiffness4Deflection2D/CStiffness4SolverLink2D/@Thickness"/>
                                </span>
                                <span class="label label-warning">
                                  Alpha =  <xsl:value-of select="CStiffness4Deflection2D/CStiffness4SolverLink2D/@Alpha"/>
                                </span>
                                <hr/>
                              </div>
                            </div>
                            <!--SOLVER LINK-->
                            <!--CALCULATIONS1D-->
                            <xsl:for-each select="CStiffness4Deflection2D/CRectAverageStiffness2D/Calculation">                          
                            <div>
                              <xsl:attribute name="class">
                                <xsl:text>collapse</xsl:text>
                              </xsl:attribute>
                              <xsl:attribute name="id">
                                <xsl:text>collapseCALCULATIONS1D</xsl:text>
                                <xsl:value-of select="../../../../@elemID"/>
                                <xsl:value-of select="../../../@eCalculatorCddType"/>
                                <xsl:value-of select="@Direction"/>
                              </xsl:attribute>
                              <div class="well">
                                <h4>
                                  Results for <xsl:value-of select="@eCalculatorCddType"/> CDD calculation type
                                </h4>
                                <h4>EWN</h4>
                                <span class="label label-danger">
                                  <xsl:value-of select="@EWN"/>
                                </span>
                                <h4>Input layers</h4>
                                <xsl:for-each select="CInputRectCssAverageStiffness/CInputRectCssStiffness/ReinfLayer">
                                  <span class="label label-danger">
                                    Layer 1D
                                  </span>
                                  <span class="label label-warning">
                                    Ys =  <xsl:value-of select="@Ys"/>
                                  </span>
                                  <span class="label label-warning">
                                    Zs =  <xsl:value-of select="@Zs"/>
                                  </span>
                                  <span class="label label-warning">
                                    As =  <xsl:value-of select="@As"/>
                                  </span>
                                  <span class="label label-warning">
                                    Ds =  <xsl:value-of select="@Ds"/>
                                  </span>
                                  <span class="label label-warning">
                                    Emodulus =  <xsl:value-of select="@E"/>
                                  </span>
                                  <span class="label label-warning">
                                    Fyk =  <xsl:value-of select="@Fk"/>
                                  </span>
                                  <br/>
                                  <br/>
                                </xsl:for-each>
                                <h4>Rect average stiffness results</h4>
                                <h6>Forces for calculation [N]</h6>
                                <span class="label label-warning">
                                  N =  <xsl:value-of select="floor(RectAverageStiffness/Force4Avg/@N)"/>
                                </span>
                                <span class="label label-warning">
                                  My =  <xsl:value-of select="floor(RectAverageStiffness/Force4Avg/@My)"/>
                                </span>
                                <span class="label label-warning">
                                  Mz =  <xsl:value-of select="floor(RectAverageStiffness/Force4Avg/@Mz)"/>
                                </span>
                                <h6>Uncracked stress</h6>
                                <span class="label label-info">
                                  MaxSigmaTen =  <xsl:value-of select="floor(RectAverageStiffness/UncrackedStress/@SigmaTension)"/>
                                </span>
                                <span class="label label-info">
                                  Nrecalc =  <xsl:value-of select="floor(RectAverageStiffness/UncrackedStress/@N_forceRecalc)"/>
                                </span>
                                <span class="label label-info">
                                  Mrecalc =  <xsl:value-of select="floor(RectAverageStiffness/UncrackedStress/@My_forceRecalc)"/>
                                </span>
                                <span class="label label-info">
                                  ti =  <xsl:value-of select="RectAverageStiffness/UncrackedStress/@Zcalc"/>
                                </span>
                                <span class="label label-info">
                                  H =  <xsl:value-of select="RectAverageStiffness/UncrackedStress/@H"/>
                                </span>
                                <span class="label label-info">
                                  Ai =  <xsl:value-of select="RectAverageStiffness/UncrackedStress/@Ai"/>
                                </span>
                                <span class="label label-info">
                                  Ii =  <xsl:value-of select="RectAverageStiffness/UncrackedStress/@Ii"/>
                                </span>
                                <span class="label label-info">
                                  eSurfaceTypeCdd =  <xsl:value-of select="RectAverageStiffness/UncrackedStress/@eSurfaceTypeCdd"/>
                                </span>
                                <h6>General</h6>
                                <span class="label label-warning">
                                  SigmaCr =  <xsl:value-of select="floor(RectAverageStiffness/@SigmaCr)"/>
                                </span>
                                <span class="label label-warning">
                                  Cracked stiffness calculated =  <xsl:value-of select="RectAverageStiffness/@CrackedStiffnessCalculated"/>
                                </span>
                                <xsl:for-each select="RectAverageStiffness/RectStiffness">
                                  <h4>
                                    <xsl:value-of select="@Type"/> stiffness
                                  </h4>
                                  <h6>Stiffness</h6>
                                  <span class="label label-success">
                                    EA =  <xsl:value-of select="floor(Stiffness/@EA)"/>
                                  </span>
                                  <span class="label label-success">
                                    EIy =  <xsl:value-of select="floor(Stiffness/@EIy)"/>
                                  </span>
                                  <span class="label label-success">
                                    EIz =  <xsl:value-of select="floor(Stiffness/@EIz)"/>
                                  </span>
                                  <span class="label label-success">
                                    EIpay =  <xsl:value-of select="floor(Stiffness/@EIpay)"/>
                                  </span>
                                  <span class="label label-success">
                                    EIpaz =  <xsl:value-of select="floor(Stiffness/@EIpaz)"/>
                                  </span>
                                  <h6>CalcPosition</h6>
                                  <span class="label label-info">
                                    eCalcPosCdd =  <xsl:value-of select="@eCalcPosCdd"/>
                                  </span>
                                  <span class="label label-info">
                                    Y4Calc =  <xsl:value-of select="@Y4Calc"/>
                                  </span>
                                  <span class="label label-info">
                                    Z4Calc =  <xsl:value-of select="@Z4Calc"/>
                                  </span>
                                  <span class="label label-info">
                                    Cgcz =  <xsl:value-of select="@Cgcz"/>
                                  </span>
                                  <span class="label label-info">
                                    Cgsz =  <xsl:value-of select="@Cgsz"/>
                                  </span>
                                  <span class="label label-info">
                                    Cgz =  <xsl:value-of select="@Cgz"/>
                                  </span>
                                  <h6>Areas</h6>
                                  <span class="label label-warning">
                                    X (depth of compression zone) =  <xsl:value-of select="@X"/>
                                  </span>
                                  <span class="label label-info">
                                    SigmaTension (in X calc) =  <xsl:value-of select="@SigmaTension"/>
                                  </span>
                                  <span class="label label-info">
                                    SigmaCompression (in X calc) =  <xsl:value-of select="@SigmaCompression"/>
                                  </span>
                                  <br/>
                                  <br/>
                                  <span class="label label-warning">
                                    Aic =  <xsl:value-of select="@Aic"/>
                                  </span>
                                  <span class="label label-warning">
                                    Ais =  <xsl:value-of select="@Ais"/>
                                  </span>
                                  <span class="label label-warning">
                                    Ai =  <xsl:value-of select="@Ai"/>
                                  </span>
                                  <h6>First moment of interia</h6>
                                  <span class="label label-warning">
                                    Sicy =  <xsl:value-of select="CHARS_2Input/@Sicy"/>
                                  </span>
                                  <span class="label label-warning">
                                    Sicz =  <xsl:value-of select="CHARS_2Input/@Sicz"/>
                                  </span>
                                  <span class="label label-warning">
                                    Sisy =  <xsl:value-of select="CHARS_2Input/@Sisy"/>
                                  </span>
                                  <span class="label label-warning">
                                    Sisz =  <xsl:value-of select="CHARS_2Input/@Sisz"/>
                                  </span>
                                  <span class="label label-warning">
                                    Siy =  <xsl:value-of select="CHARS_2Input/@Siy"/>
                                  </span>
                                  <span class="label label-warning">
                                    Siz =  <xsl:value-of select="CHARS_2Input/@Siz"/>
                                  </span>
                                  <h6>Second moment of interia</h6>
                                  <span class="label label-warning">
                                    Iicy =  <xsl:value-of select="CHARS_2Input/@Iicy"/>
                                  </span>
                                  <span class="label label-warning">
                                    Iicz =  <xsl:value-of select="CHARS_2Input/@Iicz"/>
                                  </span>
                                  <span class="label label-warning">
                                    Iisy =  <xsl:value-of select="CHARS_2Input/@Iisy"/>
                                  </span>
                                  <span class="label label-warning">
                                    Iisz =  <xsl:value-of select="CHARS_2Input/@Iisz"/>
                                  </span>
                                  <span class="label label-warning">
                                    Iiy =  <xsl:value-of select="CHARS_2Input/@Iiy"/>
                                  </span>
                                  <span class="label label-warning">
                                    Iiz =  <xsl:value-of select="CHARS_2Input/@Iiz"/>
                                  </span>
                                </xsl:for-each>

                                <xsl:if test ="(RectAverageStiffness/@CrackedStiffnessCalculated = 'True')">
                                  <h4>DistributionCoefficient</h4>
                                  <h6>General</h6>
                                  <span class="label label-danger">
                                    Ksi =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/@Ksi"/>
                                  </span>
                                  <span class="label label-warning">
                                    Beta4Calc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/@Beta4Calc"/>
                                  </span>
                                  <span class="label label-warning">
                                    SigmaS =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/@SigmaS"/>
                                  </span>
                                  <span class="label label-warning">
                                    SigmaSr =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/@SigmaSr"/>
                                  </span>
                                  <h6>Force input</h6>
                                  <span class="label label-warning">
                                    N =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceInputed/@N"/>
                                  </span>
                                  <span class="label label-warning">
                                    My =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceInputed/@My"/>
                                  </span>
                                  <span class="label label-warning">
                                    Mz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceInputed/@Mz"/>
                                  </span>
                                  <h6>Force input recalc</h6>
                                  <span class="label label-info">
                                    N =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceInputed/@Nrecalc"/>
                                  </span>
                                  <span class="label label-info">
                                    My =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceInputed/@Myrecalc"/>
                                  </span>
                                  <span class="label label-info">
                                    Mz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceInputed/@Mzrecalc"/>
                                  </span>
                                  <h6>Cracking force</h6>
                                  <span class="label label-warning">
                                    N =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceCrack/@N"/>
                                  </span>
                                  <span class="label label-warning">
                                    My =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceCrack/@My"/>
                                  </span>
                                  <span class="label label-warning">
                                    Mz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceCrack/@Mz"/>
                                  </span>
                                  <h6>Cracking force recalculated</h6>
                                  <span class="label label-warning">
                                    N =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceCrack/@Nrecalc"/>
                                  </span>
                                  <span class="label label-warning">
                                    My =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceCrack/@Myrecalc"/>
                                  </span>
                                  <span class="label label-warning">
                                    Mz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceCrack/@Mzrecalc"/>
                                  </span>


                                  <!--Info inputed force-->
                                  <hr/>
                                  <span class="label label-info">Info inputed force</span>
                                  <h6>CalcPosition</h6>
                                  <span class="label label-info">
                                    eCalcPosCdd =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@eCalcPosCdd"/>
                                  </span>
                                  <span class="label label-info">
                                    Y4Calc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@Y4Calc"/>
                                  </span>
                                  <span class="label label-info">
                                    Z4Calc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@Z4Calc"/>
                                  </span>
                                  <span class="label label-info">
                                    Cgcz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@Cgcz"/>
                                  </span>
                                  <span class="label label-info">
                                    Cgsz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@Cgsz"/>
                                  </span>
                                  <span class="label label-info">
                                    Cgz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@Cgz"/>
                                  </span>
                                  <h6>Areas</h6>
                                  <span class="label label-info">
                                    X (depth of compression zone) =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@X"/>
                                  </span>
                                  <span class="label label-info">
                                    SigmaTension (in X calc) =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@SigmaTension"/>
                                  </span>
                                  <span class="label label-info">
                                    SigmaCompression (in X calc) =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@SigmaCompression"/>
                                  </span>
                                  <br/>
                                  <br/>
                                  <span class="label label-info">
                                    Aic =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@Aic"/>
                                  </span>
                                  <span class="label label-info">
                                    Ais =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@Ais"/>
                                  </span>
                                  <span class="label label-info">
                                    Ai =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/@Ai"/>
                                  </span>
                                  <h6>First moment of interia</h6>
                                  <span class="label label-info">
                                    Sicy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Sicy"/>
                                  </span>
                                  <span class="label label-info">
                                    Sicz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Sicz"/>
                                  </span>
                                  <span class="label label-info">
                                    Sisy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Sisy"/>
                                  </span>
                                  <span class="label label-info">
                                    Sisz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Sisz"/>
                                  </span>
                                  <span class="label label-info">
                                    Siy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Siy"/>
                                  </span>
                                  <span class="label label-info">
                                    Siz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Siz"/>
                                  </span>
                                  <h6>Second moment of interia</h6>
                                  <span class="label label-info">
                                    Iicy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Iicy"/>
                                  </span>
                                  <span class="label label-info">
                                    Iicz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Iicz"/>
                                  </span>
                                  <span class="label label-info">
                                    Iisy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Iisy"/>
                                  </span>
                                  <span class="label label-info">
                                    Iisz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Iisz"/>
                                  </span>
                                  <span class="label label-info">
                                    Iiy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Iiy"/>
                                  </span>
                                  <span class="label label-info">
                                    Iiz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceInputed/CHARS_2Input/@Iiz"/>
                                  </span>
                                  <!--Info inputed force-->

                                  <!--Info crack force-->
                                  <hr/>
                                  <span class="label label-success">Info cracking force</span>
                                  <h6>CalcPosition</h6>
                                  <span class="label label-success">
                                    eCalcPosCdd =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@eCalcPosCdd"/>
                                  </span>
                                  <span class="label label-success">
                                    Y4Calc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@Y4Calc"/>
                                  </span>
                                  <span class="label label-success">
                                    Z4Calc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@Z4Calc"/>
                                  </span>
                                  <span class="label label-success">
                                    Cgcz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@Cgcz"/>
                                  </span>
                                  <span class="label label-success">
                                    Cgsz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@Cgsz"/>
                                  </span>
                                  <span class="label label-success">
                                    Cgz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@Cgz"/>
                                  </span>
                                  <h6>Areas</h6>
                                  <span class="label label-success">
                                    X (depth of compression zone) =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@X"/>
                                  </span>
                                  <span class="label label-success">
                                    SigmaTension (in X calc) =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@SigmaTension"/>
                                  </span>
                                  <span class="label label-success">
                                    SigmaCompression (in X calc) =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@SigmaCompression"/>
                                  </span>
                                  <br/>
                                  <br/>
                                  <span class="label label-success">
                                    Aic =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@Aic"/>
                                  </span>
                                  <span class="label label-success">
                                    Ais =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@Ais"/>
                                  </span>
                                  <span class="label label-success">
                                    Ai =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/@Ai"/>
                                  </span>
                                  <h6>First moment of interia</h6>
                                  <span class="label label-success">
                                    Sicy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Sicy"/>
                                  </span>
                                  <span class="label label-success">
                                    Sicz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Sicz"/>
                                  </span>
                                  <span class="label label-success">
                                    Sisy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Sisy"/>
                                  </span>
                                  <span class="label label-success">
                                    Sisz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Sisz"/>
                                  </span>
                                  <span class="label label-success">
                                    Siy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Siy"/>
                                  </span>
                                  <span class="label label-success">
                                    Siz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Siz"/>
                                  </span>
                                  <h6>Second moment of interia</h6>
                                  <span class="label label-success">
                                    Iicy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Iicy"/>
                                  </span>
                                  <span class="label label-success">
                                    Iicz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Iicz"/>
                                  </span>
                                  <span class="label label-success">
                                    Iisy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Iisy"/>
                                  </span>
                                  <span class="label label-success">
                                    Iisz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Iisz"/>
                                  </span>
                                  <span class="label label-success">
                                    Iiy =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Iiy"/>
                                  </span>
                                  <span class="label label-success">
                                    Iiz =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Characteristics_ForceCrack/CHARS_2Input/@Iiz"/>
                                  </span>
                                  <!--Info inputed force-->
                                </xsl:if>
                              </div>
                            </div>
                            </xsl:for-each>
                            <!--CALCULATIONS1D-->
                            </div>
                          <hr/>
                          </div>
                      </xsl:for-each>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>