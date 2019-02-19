<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<!--
ELEMENT aalwp
-->
	<xsl:template match="aalwp" >
		<xsl:choose >
		<xsl:when test="./@deletewp='yes'" >
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="aalwp/uoc | aalwp/modelno"/>
	<xsl:template match="uoc | modelno |  name" mode="AAL-INTRO">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template name="AAL-INTRO">
		<fo:block space-before.maximum="12pt" space-before.minimum="10pt" space-before.optimum="10pt" span="all" xsl:use-attribute-sets="titlesub"></fo:block>
		<xsl:if test="preceding-sibling::uoc">
				<fo:list-block provisional-distance-between-starts="10pc" provisional-label-separation="1pc" space-before.conditionality="discard" space-before.maximum="6pt" space-before.minimum="2pt" space-before.optimum="4pt" start-indent="15pt" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<fo:list-item space-after="2pt">
						<fo:list-item-label>
							<fo:block font-weight="bold" text-decoration="underline">Code</fo:block>
						</fo:list-item-label>
						<fo:list-item-body start-indent="11pc">
							<fo:block font-weight="bold" text-decoration="underline">Used On</fo:block>
						</fo:list-item-body>
					</fo:list-item>
				</fo:list-block>
				<xsl:for-each select="preceding-sibling::uoc">
					<fo:list-block provisional-distance-between-starts="10pc" provisional-label-separation="1pc" space-before.conditionality="discard" space-before.maximum="6pt" space-before.minimum="2pt" space-before.optimum="4pt" start-indent="15pt" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
						<fo:list-item space-after="2pt">
							<fo:list-item-label>
								<xsl:apply-templates mode="AAL-INTRO" select="node()"/>
							</fo:list-item-label>
							<fo:list-item-body start-indent="11pc">
								<xsl:apply-templates mode="AAL-INTRO" select="following-sibling::modelno[1]"> </xsl:apply-templates>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
				</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--
ELEMENT aal
-->
	<xsl:template match="aal">
		<xsl:call-template name="AAL-INTRO"/>
		<fo:block span="all">
					<fo:table-and-caption caption-side="before" >
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" id="{generate-id(.)}">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="table | aal" format="1." from="aalwp" level="any"/>
						<xsl:choose>
							<xsl:when test="ancestor::aalwp/@marines='yes'">
									<xsl:text>Using Unit Responsibility Items (UURI) LIST</xsl:text>
							</xsl:when>
							<xsl:otherwise>
									<xsl:choose>
						<xsl:when test="string-length(title[1])=0">
							<fo:block span="all" xsl:use-attribute-sets="titlesub">
							<xsl:text>&#x2002;Additional Authorization List.</xsl:text></fo:block>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x2002;</xsl:text>
							<xsl:value-of select="child::title"/>
						</xsl:otherwise>
						</xsl:choose>
						</xsl:otherwise>
				</xsl:choose>
			</fo:block>
		</fo:table-caption>
				
				<fo:table width="7in" border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" inline-progression-dimension="100%">
					<fo:table-column column-number="1" column-width="16%"> </fo:table-column>
					<fo:table-column column-number="2" column-width="50%"> </fo:table-column>
					<fo:table-column column-number="3" column-width="16%"> </fo:table-column>
					<fo:table-column column-number="4" column-width="8%"> </fo:table-column>
					<fo:table-column column-number="5" column-width="8%"> </fo:table-column>
					<xsl:call-template name="AAL-HEADER"/>
					<fo:table-body>
						<xsl:choose>
							<xsl:when test="aal-category">
								<xsl:apply-templates select="aal-category"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="aal-entry"/>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-body>
				</fo:table>
	
			</fo:table-and-caption>
				</fo:block>
	</xsl:template>
	<!--
PROCEDURE AAL-HEADER
-->
	<xsl:template name="AAL-HEADER">
		<fo:table-header font-weight="bold">
			<fo:table-row border-after-style="solid" border-after-width="1pt">
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="1" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" space-after="4pt" span="all" text-align="center">(1)</fo:block>
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">NATIONAL </fo:block>
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">STOCK</fo:block>
					<fo:block margin-bottom="3pt">NUMBER (NSN)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="2" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block space-after="4pt" span="all" text-align="center">(2)</fo:block>
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">DESCRIPTION, PART NUMBER/(CAGEC)</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="3" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block space-after="4pt" span="all" text-align="center">(3)</fo:block>
					<fo:block space-after="4pt" text-align="center">USABLE ON</fo:block>
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">CODE</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="4" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block space-after="4pt" span="all" text-align="center">(4)</fo:block>
					<fo:block margin-bottom="3pt">U/I</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="5" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block space-after="4pt" span="all" text-align="center">(5)</fo:block>
					<fo:block margin-bottom="3pt">QTY</fo:block>
					<fo:block margin-bottom="3pt">RECM</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<!--
ELEMENT aal-category
-->
	<xsl:template match="aal-category">
		<!--<xsl:call-template name="CHANGEBAR"/>-->
		<fo:table-row vertical-align="middle" >
			<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="5" padding="4pt" vertical-align="middle">
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
				<xsl:call-template name="CHANGEBAR"/>
					<xsl:value-of disable-output-escaping="no" select="title"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:apply-templates select="aal-entry"/>
	</xsl:template>
	<!--
ELEMENT aal-entry
-->
	<xsl:template match="aal-entry">
		<!--<xsl:call-template name="CHANGEBAR"/>-->
		<fo:table-row padding-after="4pt" padding-before="4pt" >
			<xsl:apply-templates select="node()"/>
		</fo:table-row>
	</xsl:template>
	<!--
ELEMENT aal-entry
nsn 1st
-->
	<xsl:template match="aal-entry/nsn[1]">
	<!--<xsl:call-template name="CHANGEBAR"/>-->
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt">
			<fo:block>
			<xsl:call-template name="CHANGEBAR"/>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc" select="fsc"/>
					<xsl:with-param name="Niin" select="niin"/>
				</xsl:call-template>
			</fo:block>
			<xsl:apply-templates mode="Multiple" select="../nsn[position()>1]"/>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT aal-entry
nsn 2nd or more
Ignore so all NSN are in the same cell
-->
	<xsl:template match="aal-entry/nsn[position()>1]"> </xsl:template>
	<!--
ELEMENT aal-entry
nsn Mode Multiple
When 2nd or more occur to remain in the same cell
-->
	<xsl:template match="nsn" mode="Multiple">
		<fo:block>
			<xsl:call-template name="NSN-VALUE">
				<xsl:with-param name="Fsc" select="fsc"/>
				<xsl:with-param name="Niin" select="niin"/>
			</xsl:call-template>
		</fo:block>
	</xsl:template>
	<!--
ELEMENT aal-entry
dcpno
-->
	<xsl:template match="aal-entry/dcpno">
	<!--<xsl:call-template name="CHANGEBAR"/>-->
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt">
			<fo:block>
			<xsl:call-template name="CHANGEBAR"/>
				<xsl:apply-templates select="name"/>
				<xsl:text disable-output-escaping="no">: </xsl:text>
				<xsl:apply-templates select="desc"/>
			</fo:block>
			<fo:block>
				<xsl:text disable-output-escaping="no"> </xsl:text>
				<xsl:value-of disable-output-escaping="no" select="partno[1]"/>
				<xsl:text disable-output-escaping="no"> &#x2002; </xsl:text>
				<xsl:if test="not(string-length(cageno[1])=0)">
					<xsl:text> (</xsl:text><xsl:value-of disable-output-escaping="no" select="cageno[1]"/><xsl:text>) </xsl:text>
				</xsl:if>
			</fo:block>
			<xsl:if test="cageno[2]">
				<fo:block>
					<xsl:text disable-output-escaping="no"> </xsl:text>
					<xsl:value-of disable-output-escaping="no" select="partno[2]"/>
					<xsl:text disable-output-escaping="no"> &#x2002; </xsl:text>
					<xsl:text> (</xsl:text><xsl:value-of disable-output-escaping="no" select="cageno[2]"/><xsl:text>) </xsl:text>
				</fo:block>
			</xsl:if>
			<xsl:if test="cageno[3]">
				<fo:block>
					<xsl:text disable-output-escaping="no"> </xsl:text>
					<xsl:value-of disable-output-escaping="no" select="partno[3]"/>
					<xsl:text disable-output-escaping="no"> &#x2002; </xsl:text>
					<xsl:text> (</xsl:text><xsl:value-of disable-output-escaping="no" select="cageno[3]"/><xsl:text>) </xsl:text>
				</fo:block>
			</xsl:if>
			<xsl:if test="cageno[4]">
				<fo:block>
					<xsl:text disable-output-escaping="no"> </xsl:text>
					<xsl:value-of disable-output-escaping="no" select="partno[4]"/>
					<xsl:text disable-output-escaping="no"> &#x2002; </xsl:text>
					<xsl:text> (</xsl:text><xsl:value-of disable-output-escaping="no" select="cageno[4]"/><xsl:text>) </xsl:text>
				</fo:block>
			</xsl:if>
		</fo:table-cell>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt">
			<xsl:for-each select="uoc">
				<fo:block text-align="center">
					<xsl:apply-templates select="node()">
</xsl:apply-templates>
				</fo:block>
			</xsl:for-each>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="aal-entry/dcpno/name | aal-entry/dcpno/desc">
	<!--<xsl:call-template name="CHANGEBAR"/>-->
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	
	<!--
ELEMENT aal-entry ui
-->
	<xsl:template match="aal-entry/ui">
	<!--<xsl:call-template name="CHANGEBAR"/>-->
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
		<fo:block>
		<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT aal-entry qty
-->
	<xsl:template match="aal-entry/qty">
	<!--<xsl:call-template name="CHANGEBAR"/>-->
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="center">
		<fo:block>
		<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
</xsl:stylesheet>
