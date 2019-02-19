<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="descwp">
		<xsl:call-template name="wp-pageset"> </xsl:call-template>
	</xsl:template>
	<xsl:template match="eqpinfo">
		<xsl:choose>
			<xsl:when test="string-length(title[1])=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Equipment Characteristics, Capabilities, and Features</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="eqpinfo/title"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="eqpdesc">
		<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">
			<xsl:apply-templates select="eqpdesc/title"/>
		</fo:block>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="eqpdesc/title">
		<fo:block span="all" text-transform="uppercase" font-weight="bold">
			<xsl:if test="contains('trim.para|trim.specpara|para|specpara|proc|figure|hazmat|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="locdesc">
		<xsl:choose>
			<xsl:when test="string-length(title[1])=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Location and Descriptions of Major Components</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="locdesc/title"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="locdesc/title">
		<fo:block span="all" text-transform="uppercase" font-weight="bold">
			<xsl:if test="contains('trim.para|trim.specpara|para|specpara|proc|figure|hazmat|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="comp-item">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="eqpdiff">
		<xsl:choose>
			<xsl:when test="string-length(title[1])=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Equipment Differences</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="eqpdiff/title"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="eqpdiff/title">
		<fo:block span="all" text-transform="uppercase" font-weight="bold">
			<xsl:if test="contains('trim.para|trim.specpara|para|specpara|proc|figure|hazmat|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="eqpdata">
		<xsl:choose>
			<xsl:when test="string-length(title[1])=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Equipment Data</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="eqpdata/title"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="eqpdata/title">
		<fo:block span="all" text-transform="uppercase" xsl:use-attribute-sets="titlesub">
			<xsl:if test="contains('trim.para|trim.specpara|para|specpara|proc|figure|hazmat|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="eqpconfig">
		<xsl:choose>
			<xsl:when test="string-length(title[1])=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Equipment Configuration</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="config/title"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="config/title">
		<fo:block span="all" xsl:use-attribute-sets="titlesub" font-weight="bold">
			<xsl:if test="contains('trim.para|trim.specpara|para|specpara|proc|figure|hazmat|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
