<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="wtloadwp">
		<xsl:call-template name="wp-pageset">
</xsl:call-template>
	</xsl:template>
	<!--
ELEMENT formchart
-->
	<xsl:template match="formchart">
		<xsl:apply-templates/>
	</xsl:template>

	<!--
ELEMENT weightinst
-->
	<xsl:template match="weightinst">
	<!--<xsl:choose>
		<xsl:when test="string-length(proc/title[1])=0">
			<fo:block xsl:use-attribute-sets="titlesub" text-transform="uppercase">Loading Instructions</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:apply-templates select="proc/title"/>
		</xsl:otherwise>
		</xsl:choose>-->
		<xsl:apply-templates/>
	</xsl:template>


	</xsl:stylesheet>