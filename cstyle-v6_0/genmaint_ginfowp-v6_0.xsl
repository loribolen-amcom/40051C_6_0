<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="genmaint_ginfowp">
		<xsl:call-template name="wp-pageset"> </xsl:call-template>
	</xsl:template>
	
	<xsl:template match="genmaint_ginfowp/safety">
		<xsl:choose>
			<xsl:when test="string-length(safety/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>SAFETY</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="policy">
		<xsl:choose>
			<xsl:when test="string-length(policy/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>POLICY</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="genmaint_ginfowp/scope">
	<xsl:choose>
			<xsl:when test="string-length(scope/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt" text-transform="uppercase">SCOPE</fo:block>
						<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:apply-templates select="node()"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="genmaint_ginfowp/reporting">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">Reporting Errors and Recommending
			Improvements</fo:block>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
</xsl:stylesheet>
