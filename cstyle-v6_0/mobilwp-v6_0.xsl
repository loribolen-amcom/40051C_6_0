<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="mobilwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="mobilreq" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">Mobilization Requirements</fo:block>
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="mobilreq/title"/>
		</xsl:otherwise>
		</xsl:choose>
				
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="mobiltab">
		<fo:block span="all"  id="{generate-id(.)}">
			<fo:table-and-caption span="all">
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="mobiltab | table" format="1." from="mobilwp" level="any"/>
						<xsl:text disable-output-escaping="no">&#x2002;Mobilization Requirements.</xsl:text>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width="1pt" border-left-style="solid" border-left-width="1pt" border-right-style="solid" border-right-width="1pt" border-top="solid" border-top-width="1pt" font-family="sans-serif" font-size="10pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-before="14pt" span="all" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
					<fo:table-column column-number="1" column-width="15%"/>
					<fo:table-column column-number="2" column-width="85%"/>
					<xsl:call-template name="MOBILTAB-HEADER"/>
					<fo:table-body>
						<xsl:apply-templates select="mobil-entry"/>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
		</fo:block>
	</xsl:template>
	<xsl:template name="MOBILTAB-HEADER">
		<fo:table-header>
			<fo:table-row display-align="after" font-weight="bold" keep-together.within-page="always">
				<fo:table-cell border-bottom="solid" border-bottom-width="1pt" border-right-style="solid" border-right-width=".5pt" column-number="1" padding-bottom="8pt" padding-top="8pt" text-align="left">
					<fo:block span="none">WORK
					</fo:block>
					<fo:block>PACKAGE</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width="1pt" column-number="2" padding-bottom="8pt" padding-top="8pt" text-align="left">
					<fo:block span="none">&#x2002;</fo:block>
					<fo:block span="none">&#x2002;ACTION</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<xsl:template match="mobil-entry">
		<fo:table-row>
			<fo:table-cell border-right-style="solid" border-right-width=".5pt" padding-bottom="12pt" padding-top="6pt">
				<fo:block>
					<xsl:apply-templates select="xref"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="12pt" padding-top="6pt">
				<fo:block>
					<xsl:apply-templates select="actionreq">
</xsl:apply-templates>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="mobil-entry/actionreq">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	</xsl:stylesheet>