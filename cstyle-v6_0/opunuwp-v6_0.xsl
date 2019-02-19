<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--
ELEMENT opunuwp
-->
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="opunuwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
ELEMENT opunutsk
-->
	<xsl:template match="opunutsk">
		<xsl:apply-templates select="node()"/>
		<fo:block text-align="start" font-weight="bold" keep-with-previous="1" font-family="sans-serif"
           space-before=".2in" space-before.conditionality="retain" space-after=".2in" space-after.conditionality="retain">
          END OF TASK</fo:block>
	</xsl:template>
	<!--
ELEMENT unusualenv
-->
	<xsl:template match="unusualenv">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">UNUSUAL ENVIRONMENT/WEATHER</fo:block>
						<xsl:apply-templates/>
	</xsl:template>
	<!--
ELEMENT fording
-->
	<xsl:template match="fording">
			<fo:block span="all" xsl:use-attribute-sets="titlesub">FORDING AND SWIMMING</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<!--
ELEMENT ecm
-->
	<xsl:template match="ecm">
			<fo:block span="all" xsl:use-attribute-sets="titlesub">JAMMING AND ELECTRONIC COUNTERMEASURE (ECM) PROCEDURES</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	
	<!--
ELEMENT decon
-->
	<xsl:template match="decon">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">INTERIM CHEMICAL, BIOLOGICAL, RADIOLOGICAL, NUCLEAR AND EXPLOSIVES (CBRNE) DECONTAMINATION PROCEDURES</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<!--
		ELEMENT degraded
	-->
	<xsl:template match="degraded">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">DEGRADED OPERATION PROCEDURES</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<!-- See opusual stylesheet -->
	<!--<xsl:template match="instructplt">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">DECALS AND INSTRUCTION PLATES</fo:block>
				<xsl:apply-templates/>
	</xsl:template>-->
	<!--
ELEMENT emergency
-->
	<xsl:template match="emergency">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
</xsl:stylesheet>
