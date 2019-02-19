<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="oipwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="oiptab/title">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="oiptab">
			<fo:table-and-caption>
				<fo:table-caption>
					<fo:block space-after="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center">
						<xsl:text disable-output-escaping="no">Table </xsl:text>
						<xsl:number count="table | oiptab" format="1." from="oipwp" level="single"/>
						<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
						<xsl:choose>
			<xsl:when test="string-length(title[1])=0">
			<fo:block span="all" xsl:use-attribute-sets="titlesub">Overhaul Inspection Procudures</fo:block>
			</xsl:when>
			<xsl:otherwise><xsl:apply-templates select="title"/></xsl:otherwise>
		</xsl:choose>
		</fo:block>
		</fo:table-caption>
				<fo:table border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" border-right-style="solid" border-right-width=".5pt" border-top-style="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-before="12pt" span="all" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
					<fo:table-column column-number="1" column-width="5%"/>
					<fo:table-column column-number="2" column-width="5%"/>
					<fo:table-column column-number="3" column-width="5%"/>
					<fo:table-column column-number="4" column-width="20%"/>
					<fo:table-column column-number="5" column-width="15%"/>
					<fo:table-column column-number="6" column-width="50%"/>
					<fo:table-header font-weight="bold">
						<fo:table-row>
							<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" column-number="1" display-align="after" padding-bottom="4pt" padding-top="4pt" text-align="center">
								<fo:block span="all">QA</fo:block>
								<fo:block span="all">REQ</fo:block>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" column-number="2" display-align="after" padding-bottom="4pt" padding-top="4pt" text-align="center">
								<fo:block span="all">&#x2002;</fo:block>
								<fo:block span="all">NO.</fo:block>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" column-number="3" display-align="after" padding-bottom="4pt" padding-top="4pt" text-align="center">
								<fo:block span="all">REF</fo:block>
								<fo:block span="all">LTR</fo:block>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" column-number="4" display-align="after" padding-bottom="4pt" padding-top="4pt" text-align="center">
								<fo:block span="all">&#x2002;</fo:block>
								<fo:block span="all">CHARACTERISTIC</fo:block>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" column-number="5" display-align="after" padding-bottom="4pt" padding-top="4pt" text-align="center">
								<fo:block span="all">INSPECTION</fo:block>
								<fo:block span="all">METHOD</fo:block>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" column-number="6" display-align="after" padding-bottom="4pt" padding-top="4pt" text-align="center">
								<fo:block span="all">&#x2002;</fo:block>
								<fo:block span="all">REQUISITE</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-body>
						<xsl:apply-templates select="oipitem"/>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
	</xsl:template>
	<xsl:template match="oipitem">
				<xsl:call-template name="CHANGEBAR"/>
			<xsl:if test="contains('warning|caution|note|csi.alert',local-name(preceding-sibling::node()[1]))">
	<fo:table-row>
			<fo:table-cell border-top="thin solid black" border-bottom="thin solid black" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" number-columns-spanned="6">
					<xsl:apply-templates select="preceding-sibling::warning[1] "/>
								<xsl:apply-templates select="preceding-sibling::csi.alert[1] "/>
								<xsl:apply-templates select="preceding-sibling::caution[1] "/>
								<xsl:apply-templates select="preceding-sibling::note[1] "/>
					</fo:table-cell>
				</fo:table-row>
			</xsl:if>
		<fo:table-row>
			<fo:table-cell border-left-style="solid" border-left-width=".5pt" padding-after="6pt" padding-before="3pt" padding-left="3pt" padding-right="3pt">
				<fo:block text-align="left">
					<xsl:if test="@qa='yes'">Yes</xsl:if>
				</fo:block>
			</fo:table-cell>
			<xsl:apply-templates select="child::node()"/>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="oipitem/itemno">
		<fo:table-cell border-left-style="solid" border-left-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-after="6pt" padding-before="3pt" padding-left="3pt" padding-right="3pt" column-number="2">
			<fo:block text-align="left">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
		
		<xsl:template match="oipitem/callout">
		<fo:table-cell border-left-style="solid" border-left-width=".5pt" padding-after="6pt" padding-before="3pt" padding-left="3pt" padding-right="3pt" column-number="3">
			
			<fo:block text-align="left">
				<xsl:value-of disable-output-escaping="no" select="@label"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="oipitem/desc">
		<fo:table-cell border-left-style="solid" border-left-width=".5pt" padding-after="6pt" padding-before="3pt" padding-left="3pt" padding-right="3pt" column-number="4">
			<fo:block text-align="left">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<xsl:template match="oipitem/insp-method">
		<fo:table-cell border-left-style="solid" border-left-width=".5pt" padding-after="6pt" padding-before="3pt" padding-left="3pt" padding-right="3pt" column-number="5">
			<fo:block text-align="left">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="oipitem/actionreq">
		<fo:table-cell border-left-style="solid" border-left-width=".5pt" padding-after="6pt" padding-before="3pt" padding-left="3pt" padding-right="3pt" column-number="6">
			<fo:block text-align="left">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template name="WCN">
		<fo:table-row >
			<fo:table-cell border-left-style="solid" border-left-width=".5pt" padding-after="6pt" padding-before="3pt" padding-left="3pt" padding-right="3pt" number-columns-spanned="6">
				<fo:block text-align="center">
				<xsl:apply-templates select="warning | caution | note | csi.alert"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	</xsl:stylesheet>