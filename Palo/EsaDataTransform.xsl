<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes" omit-xml-declaration="yes" />

  <xsl:template match="/">
    <HTML>
      <BODY>
      <H3>Nodes_ESA</H3>
      <TABLE cellpadding="4" cellspacing="4" style="border:2px solid black;font-family:verdana;font-size:9pt;">
          <xsl:apply-templates select="Esa/Nodes_ESA">
		<xsl:with-param name="MaxNumOfRows" select="999" />			
          </xsl:apply-templates>
      </TABLE>

      <H3>Nodes_EPW</H3>
      <TABLE cellpadding="4" cellspacing="4" style="border:2px solid black;font-family:verdana;font-size:9pt;">
          <xsl:apply-templates select="Esa/Nodes_EPW">
		<xsl:with-param name="MaxNumOfRows" select="999" />			
          </xsl:apply-templates>
      </TABLE>

      <H3>ConcreteCombi</H3>
      <TABLE cellpadding="4" cellspacing="4" style="border:2px solid black;font-family:verdana;font-size:9pt;">
          <xsl:apply-templates select="Esa/ConcreteCombi">
		<xsl:with-param name="MaxNumOfRows" select="999" />			
          </xsl:apply-templates>
      </TABLE>

      <H3>Node</H3>
      <TABLE cellpadding="4" cellspacing="4" style="border:2px solid black;font-family:verdana;font-size:9pt;">
          <xsl:apply-templates select="Esa/Node">
		<xsl:with-param name="MaxNumOfRows" select="999" />			
          </xsl:apply-templates>
      </TABLE>

      </BODY>
    </HTML>
  </xsl:template>

  <xsl:template match="Nodes_ESA">
   	<xsl:param name="MaxNumOfRows" select="4" />
	<xsl:if test="$MaxNumOfRows > position()">
      <TR>
		<xsl:apply-templates select="*" />
      </TR>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Nodes_EPW">
   	<xsl:param name="MaxNumOfRows" select="4" />
	<xsl:if test="$MaxNumOfRows > position()">
      <TR>
		<xsl:apply-templates select="*" />
      </TR>
    </xsl:if>
  </xsl:template>

  <xsl:template match="ConcreteCombi">
   	<xsl:param name="MaxNumOfRows" select="4" />
	<xsl:if test="$MaxNumOfRows > position()">
      <TR>
		<xsl:apply-templates select="*" />
      </TR>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Node">
   	<xsl:param name="MaxNumOfRows" select="4" />
	<xsl:if test="$MaxNumOfRows > position()">
      <TR>
		<xsl:apply-templates select="*" />
      </TR>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*">
      <TD >
   	  <B><xsl:value-of select="." /></B>
      </TD>
  </xsl:template>

</xsl:stylesheet>