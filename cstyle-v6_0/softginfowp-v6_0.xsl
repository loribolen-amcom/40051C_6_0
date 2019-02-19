<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="softginfowp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="softsysover">
		<xsl:choose>
			<xsl:when test="string-length(softsysover/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt" text-transform="uppercase">SYSTEM OVERVIEW</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="softdocover">
		<xsl:choose>
			<xsl:when test="string-length(softdocover/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">DOCUMENT OVERVIEW</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="softginfowp/scope">
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
</xsl:stylesheet>
