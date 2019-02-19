<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="genrepairwp">
	<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
</xsl:template>

<xsl:template match="bdar-repair">
		<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" xsl:use-attribute-sets="titlesub">BDAR-REPAIR</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<fo:block span="all">
		<xsl:value-of select="child::title"/>
		</fo:block>
		</xsl:otherwise>
		</xsl:choose>
		<fo:block>
			<xsl:apply-templates select="node()" /> <!-- must do title to get template para -->
		</fo:block>
	</xsl:template>

<xsl:template match="bdar-repair-proc">
		<fo:block >
		<xsl:apply-templates select="node()"></xsl:apply-templates>
		</fo:block>
	</xsl:template>
	


	<xsl:template match="bdar-repair-option">
		<fo:block >
		<xsl:apply-templates select="node()"></xsl:apply-templates>
		</fo:block>
	</xsl:template>


	
	
	<xsl:template match="bdar-limitation">
		<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" xsl:use-attribute-sets="titlesub">LIMITATIONS</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">
		<xsl:value-of select="child::title"/>
		</fo:block>
		</xsl:otherwise>
		</xsl:choose>
		<fo:block span="all">			
			<xsl:apply-templates select="*[not(self::title)]"/>
			<!--xsl:apply-templates select="node()" /-->
		</fo:block>
	</xsl:template>
	
	<xsl:template match="bdar-persn">
		<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" font-family="sans-serif" font-size="10pt" font-weight="bold" space-before="6pt">Personnel Required</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<fo:block span="all">
		<xsl:value-of select="child::title"/>
		</fo:block>
		</xsl:otherwise>
		</xsl:choose>
		<fo:wrapper font-family="san-serif" font-size="10pt" font-weight="normal" text-align="left" span="all" text-transform="inherit">
			<xsl:apply-templates select="*[not(self::title)]"/>
			<!--xsl:apply-templates select="node()" /-->
		</fo:wrapper> 
		</xsl:template>
	
	<xsl:template match="bdar-mtrl-tools">
		<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" font-family="sans-serif" font-size="10pt" font-weight="bold" space-before="6pt">Materials/Tools Required</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<fo:block span="all">
		<xsl:value-of select="child::title"/>
		</fo:block>
		</xsl:otherwise>
		</xsl:choose>
		<fo:wrapper font-family="san-serif" font-size="10pt" font-weight="normal" text-align="left" span="all">
			<xsl:apply-templates select="*[not(self::title)]"/>
			<!--xsl:apply-templates select="node()" /-->
		</fo:wrapper> 
	</xsl:template>
	
	
    </xsl:stylesheet>