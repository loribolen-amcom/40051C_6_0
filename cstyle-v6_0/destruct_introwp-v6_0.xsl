<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="destruct-introwp">
			<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
</xsl:template>

<xsl:template match="authorize_to_destroy">
<xsl:choose>
	<xsl:when test="child::title=''">
	<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
			<xsl:text>Authorized to Destroy</xsl:text>
		</fo:block>
		<xsl:apply-templates select="para"/>
	</xsl:when>
	<xsl:otherwise>
	<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
	<xsl:value-of select="title"/>
	</fo:block>
		<xsl:apply-templates select="para"/>
</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="report_destruct">
	<xsl:choose>
	<xsl:when test="child::title=''">
		<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
			<xsl:text>Reporting Destruction</xsl:text>
		</fo:block>
		<xsl:apply-templates select="para"/>
	</xsl:when>
	<xsl:otherwise>
		<xsl:apply-templates select="node()"/>
	</xsl:otherwise>
	</xsl:choose>
	</xsl:template>
	
	<xsl:template match="general_destruct_info">
	<xsl:choose>
	<xsl:when test="child::title=''">
		<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
			<xsl:text>General Destruction Information</xsl:text>
		</fo:block>
		<xsl:apply-templates select="para0/para | para0/subpara1 | para0/subpara1-alt"/>
	</xsl:when>
	<xsl:otherwise>
		<xsl:apply-templates select="node()"/>
	</xsl:otherwise>
	</xsl:choose>
	</xsl:template>
	
		<xsl:template match="component_spares">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	
</xsl:stylesheet>