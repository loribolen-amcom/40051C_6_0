<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="opusualwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="opertsk">
		<xsl:apply-templates select="node()"/>
	<fo:block text-align="start" font-weight="bold" keep-with-previous="1" font-family="sans-serif" space-before=".2in" space-before.conditionality="retain" space-after=".2in" space-after.conditionality="retain">
          END OF TASK</fo:block>
	</xsl:template>
<!--	<xsl:template match="opertsk/initial">
		<xsl:apply-templates select="node()"/>
	</xsl:template>--><!--<xsl:choose>
			<xsl:when test="string-length(title[1])=0"></xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="shelter/title"/>
			</xsl:otherwise>
		</xsl:choose>-->
	<xsl:template match="site">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">SITING REQUIREMENTS</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="shelter">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">SHELTER REQUIREMENTS</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
<!--			<xsl:if test="string-length(proc[1]/title[1])=0">   		</xsl:if> -->
	<xsl:template match="opertsk/prepforuse">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">ASSEMBLY AND PREPARATION FOR USE</fo:block>
			<xsl:apply-templates/>
	</xsl:template>
	<!-- check to see if title has content. If no content, then display the predefined tag information 		<xsl:if test="string-length(proc[1]/title[1])=0">-->
	<xsl:template match="initial">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">INITIAL ADJUSTMENTS, BEFORE USE AND SELF-TEST</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="oper">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">OPERATING PROCEDURES</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="operaux">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">OPERATING AUXILIARY EQUIPMENT</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="prepmove">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">PREPARATION FOR MOVEMENT</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="instructplt">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">DECALS AND INSTRUCTION PLATES</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>
