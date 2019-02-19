<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="pmcsintrowp">
		<xsl:call-template name="wp-pageset">
</xsl:call-template>
	</xsl:template>
	<xsl:template match="pmcsintrowp/intro" >
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="4pt" space-before.optimum="6pt" span="all">
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>

	
	<xsl:template match="fluid.leakage">
	<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">FLUID LEAKAGE</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="node()"/>
		</xsl:template>
	
	</xsl:stylesheet>