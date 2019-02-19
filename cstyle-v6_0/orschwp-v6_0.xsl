<?xml version="1.0" encoding="utf-8" standalone="no"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="orschwp">
		<xsl:call-template name="wp-pageset"> </xsl:call-template>
	</xsl:template>
	<xsl:template match="orsch">
		<xsl:choose>
			<xsl:when test="string-length(title[1])=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">OVERHAUL AND RETIREMENT SCHEDULE</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="maintsk/title"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="orsch.tab">
			<fo:table-and-caption>
				<fo:table-caption font-family="sanserif" font-size="10pt" font-weight="bold" text-align="center">
					<fo:block space-after="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all">
						<xsl:text>Table&#x2002;</xsl:text>
						<xsl:number count="orsch.tab" format="1." from="orschwp" level="any"/>
						<xsl:text>&#x2002;&#x2002;Overhaul and Retirement Schedule.</xsl:text>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font="sanserif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" span="all">
					<fo:table-column column-number="1" column-width="24%"/>
					<fo:table-column column-number="2" column-width="24%"/>
					<fo:table-column column-number="3" column-width="13%"/>
					<fo:table-column column-number="4" column-width="13%"/>
					<fo:table-column column-number="5" column-width="12%"/>
					<fo:table-column column-number="6" column-width="12%"/>
					<xsl:call-template name="ORSCH.TAB-HEADER"/>
					<fo:table-body>
						<xsl:apply-templates select="orsch.entry"/>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
	</xsl:template>
	
	<!--
ELEMENT orsch.entry 
-->
	<xsl:template match="orsch.entry">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row padding-after="4pt" padding-before="4pt" keep-together.within-page="always">
			<xsl:apply-templates select="name[1] | orsch.interval.entry[1]"/>
		</fo:table-row>
		<xsl:apply-templates mode="ORSCH-MOREROWS" select="orsch.interval.entry[position()>1]"/>
	</xsl:template>

<xsl:template match="orsch.entry/name">
<fo:table-cell border-right-width="0.5pt" padding-bottom="5pt" padding-top="5pt" >
				<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" padding-before="2mm" padding-after="2mm" padding-bottom="5pt" padding-top="5pt">
					<xsl:apply-templates select="node()"/>
				</fo:block>
			</fo:table-cell>
			</xsl:template>
			
	<!--
ELEMENTpartno 
-->

	<xsl:template match="orsch.interval.entry/partno">
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" >
			<fo:block>
				<xsl:apply-templates select="node()[1]"/>
			</fo:block>
			<fo:block>
				<xsl:text disable-output-escaping="no">(</xsl:text>
				<xsl:value-of disable-output-escaping="no" select="following-sibling::cageno[1]"/>
				<xsl:text disable-output-escaping="no">) </xsl:text>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="orsch.interval.entry/overhaul.interval/interval.hours">
	<xsl:call-template name="CHANGEBAR"/>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="left" ><fo:block>
				<xsl:apply-templates select="node()"/>
</fo:block>

		</fo:table-cell>
	</xsl:template>
	
		<xsl:template match="orsch.interval.entry/overhaul.interval/interval.notes">
	<xsl:call-template name="CHANGEBAR"/>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="left" >
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="orsch.interval.entry/retirement.interval/interval.hours">
	<xsl:call-template name="CHANGEBAR"/>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="left" >
			<fo:block><xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
		<xsl:template match="orsch.interval.entry/retirement.interval/interval.notes">
	<xsl:call-template name="CHANGEBAR"/>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="left">
			<fo:block>
			<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="orsch.interval.entry" mode="ORSCH-MOREROWS">
		<fo:table-row>
		<fo:table-cell/>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="2" >
			<fo:block>
			<xsl:value-of disable-output-escaping="no" select="partno"/>
			</fo:block>
			<fo:block>
				<xsl:text disable-output-escaping="no">(</xsl:text>
				<xsl:value-of disable-output-escaping="no" select="cageno"/>
				<xsl:text disable-output-escaping="no">) </xsl:text>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="left">
			<fo:block>
			<xsl:value-of select="overhaul.interval/interval.hours[1]"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="left">
			<fo:block>
			<xsl:value-of select="overhaul.interval/interval.notes[1]"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="left">
			<fo:block>
			<xsl:value-of select="retirement.interval/interval.hours[1]"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="left">
			<fo:block>
			<xsl:value-of select="retirement.interval/interval.hours[1]"/>
			</fo:block>
		</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
		<xsl:template name="ORSCH.TAB-HEADER">
		<fo:table-header font-weight="bold">
			<fo:table-row>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">PART
						NAME</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">PART
						NUMBER/</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">CAGEC</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">OVERHAUL</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">INTERVAL</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">HOURS</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">OVERHAUL</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">INTERVAL</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">NOTES</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">RETIREMENT</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">INTERVAL</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">HOURS</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">RETIREMENT</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">INTERVAL</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">NOTES</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
</xsl:stylesheet>
