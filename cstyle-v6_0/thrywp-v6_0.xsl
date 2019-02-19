<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
	Arbortext, Inc., 1988-2005, v.4002
	<!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--
ELEMENT thrywp
-->
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="thrywp">
		<xsl:call-template name="wp-pageset"> </xsl:call-template>
	</xsl:template>
	<!--
ELEMENT systhry 
-->
		<xsl:template match="systhry">
		<xsl:choose>
			<xsl:when test="string-length(title[1])=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">SYSTEM THEORY</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:block span="all" xsl:use-attribute-sets="titlesub">
					<xsl:apply-templates select="title"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
		<fo:block span="all" space-before="12pt" text-align="left">
			<xsl:apply-templates select="para0 | para | figure | table | note | table-alt | para0-alt | figure-alt | ssysthry | lruthry | sruthry"/>
		</fo:block>
	</xsl:template>
	<!--
ELEMENT ssysthry/sruthry/title | ssysthry/lruthry/title |figure
-->
	<xsl:template match="systhry/lruthry | systhry/sruthry">
		<fo:block span="all" space-before="12pt" text-align="left" space-after="12pt">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="sruthry">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="ssysthry">
		<xsl:apply-templates/>
	</xsl:template>
		<xsl:template match="lruthry">
		<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>
