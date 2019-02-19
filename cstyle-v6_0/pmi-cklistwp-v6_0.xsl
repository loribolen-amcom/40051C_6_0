<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="pmi-cklistwp">
		<xsl:call-template name="wp-pageset">
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="geninspec">
		<fo:wrapper>
			<xsl:apply-templates select="node()"/>
		</fo:wrapper>
	</xsl:template>
	<xsl:template match="areainspec">
		<fo:wrapper>
			<xsl:apply-templates select="node()"/>
		</fo:wrapper>
	</xsl:template>
	<xsl:template match="pwron-inspec">
		<fo:wrapper>
			<xsl:apply-templates select="node()"/>
		</fo:wrapper>
	</xsl:template>
	<xsl:template match="finalinspec">
		<fo:wrapper>
			<xsl:apply-templates select="node()"/>
		</fo:wrapper>
	</xsl:template>
	<xsl:template match="initials">
		<fo:wrapper>
			<xsl:apply-templates select="node()"/>
		</fo:wrapper>
	</xsl:template>
</xsl:stylesheet>
