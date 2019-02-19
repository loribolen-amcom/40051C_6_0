<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="techdescwp">
		<xsl:call-template name="wp-pageset">
</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="descproc">
	<fo:block span="all" xsl:use-attribute-sets="titlesub">Equipment Description and Data</fo:block>
				<xsl:apply-templates select="node()"/>
	</xsl:template>
	
	<xsl:template match="ctrlindproc">
	<fo:block span="all" xsl:use-attribute-sets="titlesub">Controls and Indicators</fo:block>
		<xsl:choose>
			<xsl:when test="ancestor-or-self::ctrlindtab">
				<xsl:apply-templates select="intro"/>
				<xsl:apply-templates select="ctrlindtab" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="thryproc">
	<fo:block span="all" xsl:use-attribute-sets="titlesub" >Theory of Operation</fo:block>
			<xsl:apply-templates select="node()"/>
	</xsl:template>
	</xsl:stylesheet>