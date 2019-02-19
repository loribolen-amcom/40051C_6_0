<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="stowagewp">
		<xsl:call-template name="wp-pageset"> </xsl:call-template>
	</xsl:template>
	<xsl:template match="stowinfo">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="stowinfo/intro" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">Stowage Guide</fo:block>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="decalinfo">
		<xsl:choose>
			<xsl:when test="string-length(title[1])=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">DECAL INFORMATION</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="decalinfo/title"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<!--/opim/stowagewp/decalinfo/para0/subpara1	-->
	<xsl:template match="decalinfo/intro" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">Decal/Data Plate Guide</fo:block>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="decalinfo/intro/title" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">
			<xsl:if test="contains('trim.para|trim.specpara|para|specpara|proc|figure|hazmat|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates> </xsl:apply-templates>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
