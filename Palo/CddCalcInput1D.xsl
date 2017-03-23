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
          <h2>Input CDD 1D</h2>
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
                      <xsl:for-each select="Forces1D">
                        <button class="btn btn-primary btn-xs" type="button" data-toggle="collapse" aria-expanded="false">
                          <xsl:attribute name="data-target">
                            <xsl:text>#collapse</xsl:text>
                            <xsl:value-of select="../@elemID"/>
                            <xsl:value-of select="@eCalculatorCddType"/>
                          </xsl:attribute>
                          Forces => <xsl:value-of select="@eCalculatorCddType"/>
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
                            B =  <xsl:value-of select="Stiffness1DInput/InputRect1D/@B"/>
                          </span>
                          <span class="label label-warning">
                            H =  <xsl:value-of select="Stiffness1DInput/InputRect1D/@H"/>
                          </span>
                          <h5>Add data</h5>
                          <span class="label label-danger">
                            eCalcPosCdd =  <xsl:value-of select="Stiffness1DInput/InputRect1D/@eCalcPosCdd"/>
                          </span>
                          <span class="label label-warning">
                            SigmaCr =  <xsl:value-of select="Stiffness1DInput/@SigmaCr"/>
                          </span>
                          <span class="label label-warning">
                            PoissonCoeff =  <xsl:value-of select="Stiffness1DInput/@PoissonCoeff"/>
                          </span>
                          <span class="label label-warning">
                            Zcalc =  <xsl:value-of select="Stiffness1DInput/InputRect1D/@Zcalc"/>
                          </span>
                          <span class="label label-warning">
                            LocalAxisAlpha =  <xsl:value-of select="Stiffness1DInput/InputRect1D/@LocalAxisAlpha"/>
                          </span>
                          <span class="label label-warning">
                            CreepCoeffAutoCalc =  <xsl:value-of select="Stiffness1DInput/@CreepCoeffAutoCalc"/>
                          </span>
                          <span class="label label-warning">
                            CreepCoeff =  <xsl:value-of select="Stiffness1DInput/@CreepCoefficient"/>
                          </span>
                          <h5>Material</h5>
                          <span class="label label-warning">
                            Emodulus =  <xsl:value-of select="Stiffness1DInput/InputRect1D/Material/@E"/>
                          </span>
                          <span class="label label-warning">
                            Gmodulus =  <xsl:value-of select="Stiffness1DInput/InputRect1D/Material/@G"/>
                          </span>
                          <span class="label label-warning">
                            Gmodulus =  <xsl:value-of select="Stiffness1DInput/InputRect1D/Material/@G"/>
                          </span>
                          <span class="label label-warning">
                            Fck =  <xsl:value-of select="Stiffness1DInput/InputRect1D/Material/@Fk"/>
                          </span>
                          <span class="label label-warning">
                            PoissonCoeff =  <xsl:value-of select="Stiffness1DInput/InputRect1D/Material/@PoissonCoeff"/>
                          </span>
                          <xsl:if test ="(Stiffness1DInput/@CreepCoeffAutoCalc = 'True')">
                            <h5>CreepCoeff auto calculation</h5>
                            <span class="label label-warning">
                              Ac =  <xsl:value-of select="Stiffness1DInput/CreepCoeffIn/@Ac"/>
                            </span>
                            <span class="label label-warning">
                              AtmoPeriMeter =  <xsl:value-of select="Stiffness1DInput/CreepCoeffIn/@AtmoPeriMeter"/>
                            </span>
                            <span class="label label-warning">
                              Cement =  <xsl:value-of select="Stiffness1DInput/CreepCoeffIn/@Cement"/>
                            </span>
                            <span class="label label-warning">
                              ConsideredTime_t =  <xsl:value-of select="Stiffness1DInput/CreepCoeffIn/@ConsideredTime_t"/>
                            </span>
                            <span class="label label-warning">
                              LoadingTime_t0 =  <xsl:value-of select="Stiffness1DInput/CreepCoeffIn/@LoadingTime_t0"/>
                            </span>
                            <span class="label label-warning">
                              Fcm =  <xsl:value-of select="Stiffness1DInput/CreepCoeffIn/@Fcm"/>
                            </span>
                            <span class="label label-warning">
                              Relative humidity =  <xsl:value-of select="Stiffness1DInput/CreepCoeffIn/@RH"/>
                            </span>
                          </xsl:if>
                          <h5>Reinforcement</h5>
                          <xsl:for-each select="Stiffness1DInput/ReinfLayer">
                            <span class="label label-Danger">
                              Layer
                            </span>
                            <span class="label label-warning">
                              Ys =  <xsl:value-of select="@Ys"/>
                            </span>
                            <span class="label label-warning">
                              Zs =  <xsl:value-of select="@Zs"/>
                            </span>
                            <span class="label label-warning">
                              AsLayer =  <xsl:value-of select="@As"/>
                            </span>
                            <span class="label label-warning">
                              DsBarInLayer =  <xsl:value-of select="@Ds"/>
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
                      </div>
                      <xsl:for-each select="Forces1D">
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
                              N =  <xsl:value-of select="floor(@N_stiffness)"/>
                            </span>
                            <span class="label label-warning">
                              My =  <xsl:value-of select="floor(@My_stiffness)"/>
                            </span>
                            <span class="label label-warning">
                              Mz =  <xsl:value-of select="floor(@Mz_stiffness)"/>
                            </span>
                            <h6>Crack [N]</h6>
                            <span class="label label-warning">
                              N =  <xsl:value-of select="floor(@N_crack)"/>
                            </span>
                            <span class="label label-warning">
                              My =  <xsl:value-of select="floor(@My_crack)"/>
                            </span>
                            <span class="label label-warning">
                              Mz =  <xsl:value-of select="floor(@Mz_crack)"/>
                            </span>
                            <span class="label label-warning">
                              SlsCharCombiIndex = <xsl:value-of select="@SlsCharCombiIndex"/>
                            </span>
                            <h6>Immediate stress [N]</h6>
                            <span class="label label-warning">
                              N =  <xsl:value-of select="floor(@N_immediate)"/>
                            </span>
                            <span class="label label-warning">
                              My =  <xsl:value-of select="floor(@My_immediate)"/>
                            </span>
                            <span class="label label-warning">
                              Mz =  <xsl:value-of select="floor(@Mz_immediate)"/>
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