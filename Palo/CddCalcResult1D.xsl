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
          <h2>Result CDD 1D</h2>
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
                      <xsl:for-each select="Result1D">
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
                            B =  <xsl:value-of select="Stiffness1DInput/InputRect1D/@B"/>
                          </span>
                          <span class="label label-warning">
                            H =  <xsl:value-of select="Stiffness1DInput/InputRect1D/@H"/>
                          </span>
                          <h5>Add data</h5>
                          <span class="label label-warning">
                            SigmaCr =  <xsl:value-of select="Stiffness1DInput/@SigmaCr"/>
                          </span>
                          <span class="label label-warning">
                            CreepCoeff =  <xsl:value-of select="Stiffness1DInput/@CreepCoeff"/>
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
                      <xsl:for-each select="Result1D">
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
                              Results for <xsl:value-of select="@eCalculatorCddType"/> CDD calculation type
                            </h3>
                            <h3>Forces for calculation</h3>
                            <h6>Stiffness [N]</h6>
                            <span class="label label-warning">
                              N =  <xsl:value-of select="floor(Forces1D/@N_stiffness)"/>
                            </span>
                            <span class="label label-warning">
                              My =  <xsl:value-of select="floor(Forces1D/@My_stiffness)"/>
                            </span>
                            <span class="label label-warning">
                              Mz =  <xsl:value-of select="floor(Forces1D/@Mz_stiffness)"/>
                            </span>
                            <h6>Crack [N]</h6>
                            <span class="label label-warning">
                              N =  <xsl:value-of select="floor(Forces1D/@N_crack)"/>
                            </span>
                            <span class="label label-warning">
                              My =  <xsl:value-of select="floor(Forces1D/@My_crack)"/>
                            </span>
                            <span class="label label-warning">
                              Mz =  <xsl:value-of select="floor(Forces1D/@Mz_crack)"/>
                            </span>
                            <span class="label label-warning">
                              SlsCharCombiIndex = <xsl:value-of select="Forces1D/@SlsCharCombiIndex"/>
                            </span>
                            <h6>Immediate stress [N]</h6>
                            <span class="label label-warning">
                              N =  <xsl:value-of select="floor(Forces1D/@N_immediate)"/>
                            </span>
                            <span class="label label-warning">
                              My =  <xsl:value-of select="floor(Forces1D/@My_immediate)"/>
                            </span>
                            <span class="label label-warning">
                              Mz =  <xsl:value-of select="floor(Forces1D/@Mz_immediate)"/>
                            </span>
                            <hr/>
                            <h3>Stiffness results</h3>
                            <h6>Stiffness FINAL</h6>
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
                            <h6>Stiffness SOLVER LINK</h6>
                            <span class="label label-danger">
                              EAx =  <xsl:value-of select="floor(Stiffness4SolverLink/@Pos0_EAx)"/> [pos 0]
                            </span>
                            <span class="label label-danger">
                              GAy =  <xsl:value-of select="floor(Stiffness4SolverLink/@Pos1_GAy)"/> [pos 1]
                            </span>
                            <span class="label label-danger">
                              GAz =  <xsl:value-of select="floor(Stiffness4SolverLink/@Pos2_GAz)"/> [pos 2]
                            </span>
                            <span class="label label-danger">
                              GIx =  <xsl:value-of select="Stiffness4SolverLink/@Pos3_GIx"/> [pos 3]
                            </span>
                            <span class="label label-danger">
                              EIy =  <xsl:value-of select="floor(Stiffness4SolverLink/@Pos4_EIy)"/> [pos 4]
                            </span>
                            <span class="label label-danger">
                              EIz =  <xsl:value-of select="floor(Stiffness4SolverLink/@Pos5_EIz)"/> [pos 5]
                            </span>
                            <span class="label label-danger">
                              Alpha =  <xsl:value-of select="Stiffness4SolverLink/@Pos12_Alpha"/> [pos 12]
                            </span>
                            <hr/>
                            <h3>Rect average stiffness results</h3>
                            <h6>Forces for calculation [N]</h6>
                            <span class="label label-warning">
                              N =  <xsl:value-of select="floor(RectAverageStiffness/@N)"/>
                            </span>
                            <span class="label label-warning">
                              My =  <xsl:value-of select="floor(RectAverageStiffness/@My)"/>
                            </span>
                            <span class="label label-warning">
                              Mz =  <xsl:value-of select="floor(RectAverageStiffness/@Mz)"/>
                            </span>
                            <span class="label label-warning">
                              Nrecalc =  <xsl:value-of select="floor(RectAverageStiffness/@Nrecalc)"/>
                            </span>
                            <span class="label label-warning">
                              Myrecalc =  <xsl:value-of select="floor(RectAverageStiffness/@Myrecalc)"/>
                            </span>
                            <span class="label label-warning">
                              Mzrecalc =  <xsl:value-of select="floor(RectAverageStiffness/@Mzrecalc)"/>
                            </span>
                            <h6>General</h6>
                            <span class="label label-warning">
                              MaxSigmaTen =  <xsl:value-of select="floor(RectAverageStiffness/@MaxSigmaTen)"/>
                            </span>
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
                              <h6>Areas</h6>
                              <span class="label label-warning">
                                X (depth of compression zone) =  <xsl:value-of select="Characteristics_/@X"/>
                              </span>
                              <span class="label label-warning">
                                Aic =  <xsl:value-of select="Characteristics_/@Aic"/>
                              </span>
                              <span class="label label-warning">
                                Ais =  <xsl:value-of select="Characteristics_/@Ais"/>
                              </span>
                              <span class="label label-warning">
                                Ai =  <xsl:value-of select="Characteristics_/@Ai"/>
                              </span>
                              <h6>First moment of interia</h6>
                              <span class="label label-warning">
                                Sicy =  <xsl:value-of select="Characteristics_/@Sicy"/>
                              </span>
                              <span class="label label-warning">
                                Sicz =  <xsl:value-of select="Characteristics_/@Sicz"/>
                              </span>
                              <span class="label label-warning">
                                Sisy =  <xsl:value-of select="Characteristics_/@Sisy"/>
                              </span>
                              <span class="label label-warning">
                                Sisz =  <xsl:value-of select="Characteristics_/@Sisz"/>
                              </span>
                              <span class="label label-warning">
                                Siy =  <xsl:value-of select="Characteristics_/@Siy"/>
                              </span>
                              <span class="label label-warning">
                                Siz =  <xsl:value-of select="Characteristics_/@Siz"/>
                              </span>
                              <h6>Second moment of interia</h6>
                              <span class="label label-warning">
                                Iicy =  <xsl:value-of select="Characteristics_/@Iicy"/>
                              </span>
                              <span class="label label-warning">
                                Iicz =  <xsl:value-of select="Characteristics_/@Iicz"/>
                              </span>
                              <span class="label label-warning">
                                Iisy =  <xsl:value-of select="Characteristics_/@Iisy"/>
                              </span>
                              <span class="label label-warning">
                                Iisz =  <xsl:value-of select="Characteristics_/@Iisz"/>
                              </span>
                              <span class="label label-warning">
                                Iiy =  <xsl:value-of select="Characteristics_/@Iiy"/>
                              </span>
                              <span class="label label-warning">
                                Iiz =  <xsl:value-of select="Characteristics_/@Iiz"/>
                              </span>
                            </xsl:for-each>
                          
                            <xsl:if test ="(RectAverageStiffness/@CrackedStiffnessCalculated = 'True')">                        
                            <h3>DistributionCoefficient</h3>
                            <h6>General</h6>
                              <span class="label label-danger">
                                Ksi =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/@Ksi"/>
                              </span>
                              <span class="label label-danger">
                                Beta4Calc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/@Beta4Calc"/>
                              </span>
                              <span class="label label-danger">
                                SigmaS =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/@SigmaS"/>
                              </span>
                              <span class="label label-danger">
                                SigmaSr =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/@SigmaSr"/>
                              </span>
                              <h6>Force input</h6>
                              <span class="label label-danger">
                                Nrecalc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceInputed/@Nrecalc"/>
                              </span>
                              <span class="label label-danger">
                                Myrecalc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceInputed/@Myrecalc"/>
                              </span>
                              <span class="label label-danger">
                                Mzrecalc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceInputed/@Mzrecalc"/>
                              </span>
                              <h6>Force crack</h6>
                              <span class="label label-danger">
                                Nrecalc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceCrack/@Nrecalc"/>
                              </span>
                              <span class="label label-danger">
                                Myrecalc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceCrack/@Myrecalc"/>
                              </span>
                              <span class="label label-danger">
                                Mzrecalc =  <xsl:value-of select="RectAverageStiffness/DistributionCoefficient/Forces_ForceCrack/@Mzrecalc"/>
                              </span>
                            </xsl:if> 
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