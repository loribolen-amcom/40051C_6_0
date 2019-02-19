<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="softsumwp">
	<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:param name="TaskTitlewp">
		<xsl:value-of select="title"/>
	</xsl:param>
	<xsl:template match="soft_app">
	<xsl:call-template name="CHANGEBAR"/>
				<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="soft_inventory">
	<xsl:call-template name="CHANGEBAR"/>
						<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="soft_environment">
	<xsl:call-template name="CHANGEBAR"/>
						<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="soft_secpriv">
	<xsl:call-template name="CHANGEBAR"/>
						<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="soft_superctrls">
	<xsl:call-template name="CHANGEBAR"/>
						<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="soft_assistreport">
	<xsl:call-template name="CHANGEBAR"/>
						<xsl:apply-templates select="node()"/>
	</xsl:template>
</xsl:stylesheet>
