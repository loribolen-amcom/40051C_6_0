<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
	Arbortext, Inc., 1988-2005, v.4002
	<!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="storagewp">
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
ELEMENT flyable
-->
	<xsl:template match="flyable">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Flyable Storage</fo:block>
		<xsl:apply-templates select="geninfo"/>
	</xsl:template>

	<!--
ELEMENT short
-->
	<xsl:template match="short">
		<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Short Term (Administrative Storage) &#x2013; 1 to 45 Days.</fo:block>
		<xsl:apply-templates select="geninfo"/>
	</xsl:template>

	<!--
ELEMENT intermediate
-->
	<xsl:template match="intermediate">
	<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Intermediate Storage &#x2013; 46 to 180 Days</fo:block>
			<xsl:apply-templates select="geninfo"/>
	</xsl:template>
</xsl:stylesheet>
