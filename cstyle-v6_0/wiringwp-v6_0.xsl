<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="wiringwp">
				<xsl:call-template name="wp-pageset">
</xsl:call-template>
	</xsl:template>
	<xsl:template match="wireid">
	<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block xsl:use-attribute-sets="titlesub" text-transform="uppercase">Wiring Identification</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="wireid/title"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="figure-alt | figure | table | table-alt | para | para0 | para0-alt | note"/>
	</xsl:template>
	<xsl:template match="wiringdiag">
		<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block xsl:use-attribute-sets="titlesub" text-transform="uppercase">Wiring Diagrams</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="wiringdiag/title"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="trim.para | figure"/>
	</xsl:template>
	<xsl:template match="abbrev">
		<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block xsl:use-attribute-sets="titlesub" text-transform="uppercase">Abbreviations</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="abbrev/title"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="wireid/title | abbrev/title |  wiringdiag/title">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">
	<xsl:if test="contains('trim.para|trim.specpara|para|specpara|proc|figure|hazmat|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	</xsl:stylesheet>