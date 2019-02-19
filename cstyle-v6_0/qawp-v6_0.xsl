<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="qawp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="responsibility">
	
	<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Statement of Responsibility</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="responsibility/title"/>
		</xsl:otherwise>
		</xsl:choose>
			<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="first/title | certreq/title |  specialreq/title">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">
			<xsl:if test="contains('trim.para|trim.specpara|para|specpara|proc|figure|hazmat|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates></xsl:apply-templates>
		</fo:block>
	</xsl:template>
	<xsl:template match="definitions">
	<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Definitions</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="definitions/title"/>
		</xsl:otherwise>
		</xsl:choose>
				<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="specialreq">
		

<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Special Requirements for Inspection
Tools and Equipment</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="specialreq/title"/>
		</xsl:otherwise>
		</xsl:choose>
		
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	
	<xsl:template match="certreq">
	<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Certification Requirements</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="certreq/title"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	
	<xsl:template match="inprocess">
			<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">In Process Inspection</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="inprocess/title"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="acceptance">	
		<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
					<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Acceptance Inspections</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="acceptance/title"/>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	
	<xsl:template match="first">
		<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">First Article Inspection</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="first/title"/>
		</xsl:otherwise>
		</xsl:choose>
		
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	</xsl:stylesheet>