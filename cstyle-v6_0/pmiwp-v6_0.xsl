<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="pmiwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="pmi.pecul.tab">
<xsl:param name="pmitblctr">
			<xsl:number count="pmi.pecul.tab" format="1." from="pmiwp" level="any"/>
		</xsl:param>
		<fo:block font-family="sans-serif" font-size="100%" font-weight="bold" keep-with-next.within-column="always" space-after="6pt" space-before="12pt" space-before.conditionality="discard" span="all" text-align="center" display-align="center">
			<xsl:text>Table&#x2002;</xsl:text>
			<xsl:value-of select="$pmitblctr"/>
			<xsl:text>&#x2002;</xsl:text>
			<xsl:value-of select="title[1]"/>
		</fo:block>
			<fo:table border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" border-right-style="solid" border-right-width=".5pt" border-top-style="solid" border-top-width=".5pt" font-size="10pt" span="all">
				<fo:table-column column-number="1" column-width="7%"/>
				<fo:table-column column-number="2" column-width="7%"/>
				<fo:table-column column-number="3" column-width="12%"/>
				<fo:table-column column-number="4" column-width="20%"/>
				<fo:table-column column-number="5" column-width="54%"/>
				<fo:table-header>
					<fo:table-row font-weight="bold" text-align="center" keep-together.within-page="always">
						<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
							<fo:block>	AREA</fo:block>
							<fo:block>NO.</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
							<fo:block>INSP</fo:block>
							<fo:block>NO.</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
							<fo:block>&#x2003;</fo:block>
							<fo:block>INTERVAL</fo:block>
						</fo:table-cell>
					<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
							<fo:block>&#x2003;</fo:block>
							<fo:block>COMPONENT</fo:block>
						</fo:table-cell>
						<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
							<fo:block>&#x2003;</fo:block>
							<fo:block>PROCEDURE</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:apply-templates select="pmi.pecul.tab/title"/>
					<xsl:apply-templates select="pmi.pecul-row"/>
				</fo:table-body>
			</fo:table>
	</xsl:template>
	<xsl:template match="pmi.pecul.tab/title">
		<fo:table-row vertical-align="middle" keep-together.within-page="always">
			<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="5" padding="4pt" vertical-align="middle">
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
					<xsl:value-of disable-output-escaping="no" select="pmi.pecul.tab/title"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:template match="pmi.pecul-row">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="pmi.pecul-row/serialno">
		<fo:table-row keep-with-next="always" keep-together.within-page="always">
			<fo:table-cell border-after-style="solid" border-after-width=".5pt" border-before-style="solid" border-before-width=".5pt" number-columns-spanned="5" padding-after="4pt" padding-before="4pt">
			<fo:block keep-with-next="always">
			<xsl:choose>
		<xsl:when test="string-length(serialno)=0">
			<fo:inline font-weight="bold">SERIAL NUMBER: &#x2003;&#x2003;&#x2003;&#x2003;&#x2003;&#x2003;</fo:inline>
		</xsl:when>
		<xsl:otherwise>
		<fo:inline font-weight="bold">SERIAL NUMBER: &#x2003;&#x2003;</fo:inline>
					<xsl:apply-templates select="node()"/>
		</xsl:otherwise>
		</xsl:choose>
					<fo:inline font-weight="bold">&#x2003;&#x2003;INSPECTION DATE: </fo:inline>
					<xsl:value-of disable-output-escaping="no" select="following-sibling::date"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
				<xsl:apply-templates select="pmi.pecul-entry"/>
	</xsl:template>
	<xsl:template match="pmi.pecul-row/date"/>
	<xsl:template match="pmi.pecul-entry">
		<fo:table-row>
			<xsl:apply-templates select="areano | itemno | interval | compname | proc | step1 | figure | table"/>
		</fo:table-row>
		<xsl:apply-templates mode="STEP1-MOREROWS" select="step1[position()>1]"/>
	</xsl:template>
	<xsl:template match="pmi.pecul-entry/areano">
		<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-bottom="6pt" padding-left="4pt" padding-right="4pt" padding-top="4pt" text-align="center">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pmi.pecul-entry/itemno">
		<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-bottom="6pt" padding-left="4pt" padding-right="4pt" padding-top="4pt" text-align="center">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pmi.pecul-entry/interval">
		<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-bottom="6pt" padding-left="4pt" padding-right="4pt" padding-top="4pt" text-align="center">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pmi.pecul-entry/compname">
		<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-bottom="6pt" padding-left="4pt" padding-right="4pt" padding-top="4pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pmi.pecul-entry/proc | pmi.pecul-entry/figure | pmi.pecul-entry/table">
		<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-bottom="6pt" padding-left="4pt" padding-right="4pt" padding-top="4pt" text-align="left">
			<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pmi.pecul-entry/step1">
		<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" padding-bottom="6pt" padding-left="4pt" padding-right="4pt" padding-top="4pt" text-align="left">
			<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
				<xsl:apply-templates/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="step1" mode="STEP1-MOREROWS">
		<fo:table-row>
			<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt"/>
			<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt"/>
			<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt"/>
			<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt"/>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="5" padding-after="4pt" padding-before="4pt" text-align="left">
				<fo:block>
					<xsl:apply-templates select="node()"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

</xsl:stylesheet>
