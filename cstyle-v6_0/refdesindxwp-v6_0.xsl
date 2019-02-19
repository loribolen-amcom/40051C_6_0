<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="refdesindx">
<fo:block span="all">
		<fo:table border-bottom="solid" border-bottom-width="1pt" border-top="solid" border-top-width="1pt" border-left-style="solid" border-left-width="1pt" border-right-style="solid" border-right-width="1pt" font-family="sans-serif" font-size="10pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-before="14pt" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
				<fo:table-column column-number="1" column-width="60%"/>
				<fo:table-column column-number="2" column-width="20%"/>
				<fo:table-column column-number="3" column-width="20%"/>
					<xsl:call-template name="REFDESINDX-HEADER"/>
				<fo:table-body>
					<xsl:apply-templates select="refdesindxrow"/>
				</fo:table-body>
			</fo:table>
			</fo:block>
	</xsl:template>
	<xsl:template name="REFDESINDX-HEADER">
		<fo:table-header>
			<fo:table-row display-align="after" font-weight="bold" keep-together.within-page="always">
				<fo:table-cell border-bottom="solid" border-bottom-width="1pt" column-number="1" padding-bottom="8pt" padding-top="8pt" text-align="left">
					<fo:block span="none">REFERENCE</fo:block>
					<fo:block>DESIGNATOR</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width="1pt" column-number="2" padding-bottom="8pt" padding-top="8pt" text-align="right">
					<fo:block span="none">FIG.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width="1pt" column-number="3" padding-bottom="8pt" padding-top="8pt" text-align="right">
					<fo:block span="none">ITEM</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<xsl:template match="refdesindxrow">
		<fo:table-row padding-top="6pt">
			<xsl:apply-templates select="refdes"/>
			<xsl:apply-templates select="callout[1]"/>
		</fo:table-row>
		<xsl:apply-templates select="callout[position()>1]"/>
	</xsl:template>
	<xsl:template match="refdesindxrow/refdes">
		<fo:table-cell padding-top="6pt" border-right-style="solid" border-right-width=".5pt" padding-after="3pt">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="refdesindxrow/callout[1]">
		<xsl:call-template name="FIG-ITEM"/>
	</xsl:template>
	<xsl:template match="refdesindxrow/callout[position()>1]">
		<fo:table-row>
			<fo:table-cell padding-top="6pt" border-right-style="solid" border-right-width=".5pt">&#x2002;</fo:table-cell>
			<xsl:call-template name="FIG-ITEM"/>
		</fo:table-row>
	</xsl:template>
	</xsl:stylesheet>