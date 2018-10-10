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
          <h2>Input CDD 2D</h2>
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
                <xsl:for-each select="CddCalcInput/ElemInput">
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
                      <xsl:for-each select="Forces2D">
                        <button class="btn btn-primary btn-xs" type="button" data-toggle="collapse" aria-expanded="false">
                          <xsl:attribute name="data-target">
                            <xsl:text>#collapse</xsl:text>
                            <xsl:value-of select="../@elemID"/>
                            <xsl:value-of select="@eCalculatorCddType"/>
                          </xsl:attribute>
                          Forces2D => <xsl:value-of select="@eCalculatorCddType"/>
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
                            <h5>CreepCoeff auto calculation</h5>
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
                              MeanTemperature =  <xsl:value-of select="StiffnessInput2D/CreepCoeffIn/@dTemp"/>
                            </span>
                          </xsl:if>
                          <h5>Reinforcement</h5>
                          <xsl:for-each select="StiffnessInput2D/ReinfLayer2D">
                            <span class="label label-Danger">
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
                      <xsl:for-each select="Forces2D">
                        <div>
                          <xsl:attribute name="class">
                            <xsl:text>collapse</xsl:text>
                          </xsl:attribute>
                          <xsl:attribute name="id">
                            <xsl:text>collapse</xsl:text>
                            <xsl:value-of select="../@elemID"/>
                            <xsl:value-of select="@eCalculatorCddType"/>
                          </xsl:attribute>
                          <div class="well">
                            <h3>
                              Forces for <xsl:value-of select="@eCalculatorCddType"/> CDD calculation type
                            </h3>
                            <h3>Forces for calculation</h3>
                            <h6>Stiffness [N]</h6>
                            <span class="label label-warning">
                              Nx =  <xsl:value-of select="floor(@Nx_stiffness)"/>
                            </span>
                            <span class="label label-warning">
                              Ny =  <xsl:value-of select="floor(@Ny_stiffness)"/>
                            </span>
                            <span class="label label-warning">
                              Nxy =  <xsl:value-of select="floor(@Nxy_stiffness)"/>
                            </span>
                            <span class="label label-warning">
                              Mx =  <xsl:value-of select="floor(@Mx_stiffness)"/>
                            </span>
                            <span class="label label-warning">
                              My =  <xsl:value-of select="floor(@My_stiffness)"/>
                            </span>
                            <span class="label label-warning">
                              Mxy =  <xsl:value-of select="floor(@Mxy_stiffness)"/>
                            </span>
                            <h6>Crack [N]</h6>
                            <span class="label label-warning">
                              Nx =  <xsl:value-of select="floor(@Nx_crack)"/>
                            </span>
                            <span class="label label-warning">
                              Ny =  <xsl:value-of select="floor(@Ny_crack)"/>
                            </span>
                            <span class="label label-warning">
                              Nxy =  <xsl:value-of select="floor(@Nxy_crack)"/>
                            </span>
                            <span class="label label-warning">
                              Mx =  <xsl:value-of select="floor(@Mx_crack)"/>
                            </span>
                            <span class="label label-warning">
                              My =  <xsl:value-of select="floor(@My_crack)"/>
                            </span>
                            <span class="label label-warning">
                              Mxy =  <xsl:value-of select="floor(@Mxy_crack)"/>
                            </span>
                            <span class="label label-warning">
                              SlsCharCombiIndex = <xsl:value-of select="@SlsCharCombiIndex"/>
                            </span>
                            <h6>Immediate stress [N]</h6>
                            <span class="label label-warning">
                              Nx =  <xsl:value-of select="floor(@Nx_immediate)"/>
                            </span>
                            <span class="label label-warning">
                              Ny =  <xsl:value-of select="floor(@Ny_immediate)"/>
                            </span>
                            <span class="label label-warning">
                              Nxy =  <xsl:value-of select="floor(@Nxy_immediate)"/>
                            </span>
                            <span class="label label-warning">
                              Mx =  <xsl:value-of select="floor(@Mx_immediate)"/>
                            </span>
                            <span class="label label-warning">
                              My =  <xsl:value-of select="floor(@My_immediate)"/>
                            </span>
                            <span class="label label-warning">
                              Mxy =  <xsl:value-of select="floor(@Mxy_immediate)"/>
                            </span>
                          </div>
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