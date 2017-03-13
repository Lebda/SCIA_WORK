<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="1.0">
	<xsl:output method="html" indent="yes" omit-xml-declaration="yes" />
	<xsl:variable name="mergedset1" select="document(/files/file)"/>
	<xsl:template match="/">

		<!-- matching on the root node of your config file -->
		<HTML>
			<HEAD>
				<style type="text/css">
					td {border:1px solid gray}
				</style>
			</HEAD>
			<BODY>
				<xsl:apply-templates select="$mergedset1/xs:schema" mode="process">
					<xsl:with-param name="MaxNumOfRows" select="999999" />
				</xsl:apply-templates>
			</BODY>
		</HTML>
	</xsl:template>
	
	<xsl:template match="/xs:schema" mode="process">
			<xsl:apply-templates select="xs:element/xs:complexType/xs:choice/xs:element"  mode="schema"/>
	</xsl:template>
	
	<xsl:template match="xs:element" mode="schema">
		<xsl:variable name="my_esa_node">
			<xsl:value-of select="@name"/>
		</xsl:variable>
		<HR></HR>
		<H2>
			<xsl:value-of select="$my_esa_node"/>
		</H2>
		<TABLE cellpadding="0" cellspacing="0" style="border:2px solid black;font-family:verdana;font-size:9pt;">
		<TR class="header">
			<xsl:apply-templates select="xs:complexType/xs:sequence/xs:element"  mode="schema_element"/>
		</TR>

		<xsl:apply-templates select="$mergedset1/Esa"  mode="esa_node">
			<xsl:with-param name="esa_table" select="@name" />
		</xsl:apply-templates>

		</TABLE>
	</xsl:template>

  <xsl:template match="xs:element" mode="schema_element">
		<TD>
			<xsl:value-of select="@name"/>
		</TD>
	</xsl:template>

	<xsl:template match="*" mode="esa_node">
		<xsl:param name="esa_table">Nodes_ESA</xsl:param>
		<xsl:for-each select="child::*[local-name()=$esa_table]">
			<TR>
				<xsl:for-each select="*">
					<TD>
						<xsl:value-of select="."/>
					</TD>
				</xsl:for-each>
			</TR>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>