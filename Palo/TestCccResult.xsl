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
          <h2>Result test concrete check calculation</h2>
          <p></p>
          <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>ResultID</th>
                  <th>#</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="Results/Result">
                  <tr>
                    <td>
                      <span class="label label-warning">
                        Force =  <xsl:value-of select="Stiffness1DInput/InputRect1D/Material/@E"/>
                      </span>
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