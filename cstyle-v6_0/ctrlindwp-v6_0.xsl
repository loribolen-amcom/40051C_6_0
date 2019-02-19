<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="ctrlindwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="ctrlinddesc">
		<fo:block space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>

<!--	<xsl:template match="ctrlinddesc">
		<fo:block space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all">
-->		<!--<xsl:apply-templates select="note"/>
		<xsl:apply-templates select="title"/>-->
<!--		<xsl:call-template name="CTRL_TP"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template name="CTRL_TP">
		<xsl:for-each select="trim.para">
	<fo:block font-family="sans-serif" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all">
			<xsl:value-of select="trim.para"/>
		</fo:block>
		</xsl:for-each>
		</xsl:template>
-->		
	
		
	<!--#######################################################################################################-->

<xsl:template match="ctrlindtab-alt">
	<xsl:apply-templates select="ctrlindtab"/>
</xsl:template>	
	<xsl:template match="ctrlindtab/title">
			<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="ctrlindwp//ctrlindtab | ctrlindproc//ctrlindtab | softtoolswp//ctrlindtab">
		<xsl:param name="ctrltblctr">
			<xsl:number count="ctrlindtab[not(parent::ctrlindtab-alt)] | ctrlindtab-alt | table[not(parent::table-alt)][not(following-sibling::title)]|table-alt" format="1." from="ctrlindwp|softtoolswp|ctrlindproc" level="any"/>
		</xsl:param>		
		<fo:block space-after="2mm" space-before="2mm">
			<xsl:if test="figure">
				<xsl:apply-templates select="figure[1]"/>
			</xsl:if>
		</fo:block>
		<fo:block font-family="sans-serif" font-size="100%" font-weight="bold"  space-after="6pt" space-before="12pt" space-before.conditionality="discard" span="all" text-align="center" display-align="center" text-transform="capitalize" id="{generate-id(.)}" keep-with-next.within-column="always">
						<xsl:text>Table&#x2002;</xsl:text>
						<xsl:value-of select="$ctrltblctr"/>
						<xsl:text>&#x2002;</xsl:text>
			<xsl:call-template name="APPLICABLE"/>
			<xsl:call-template name="CHANGEBAR"/>
						<xsl:value-of select="title"/>
					</fo:block>

		<fo:block span="all" >
				  <fo:table border="thin solid black" table-layout="fixed" inline-progression-dimension="100%" >
					<fo:table-column column-number="1" column-width="proportional-column-width(10)"/>
					<fo:table-column column-number="2" column-width="proportional-column-width(25)"/>
					<fo:table-column column-number="3" column-width="proportional-column-width(65)"/>
					<fo:table-header>
						<fo:table-row padding-bottom="5pt" padding-top="5pt">
					<fo:table-cell border-top="thin solid black" border-bottom="thin solid black" border-left="thin solid black" padding-bottom="5pt" padding-top="5pt">
								<fo:block height="6mm"/>
								<fo:block text-align="center" font-weight="bold">Key</fo:block>
							</fo:table-cell>
					<fo:table-cell border-top="thin solid black" border-bottom="thin solid black" border-left="thin solid black" padding-bottom="5pt" padding-top="5pt">
								<fo:block height="6mm"/>
								<fo:block text-align="center" font-weight="bold">Control/Indicator</fo:block>
							</fo:table-cell>
					<fo:table-cell border-top="thin solid black" border-bottom="thin solid black" border-left="thin solid black" padding-bottom="5pt" padding-top="5pt">
								<fo:block height="6mm"/>
								<fo:block text-align="center" font-weight="bold">Function</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-body>
						<xsl:apply-templates select="ctrlindrow"/>
					</fo:table-body>
				</fo:table>
		</fo:block>
	</xsl:template>
	<xsl:template match="ctrlindrow">
		<fo:table-row padding-bottom="5pt" padding-top="5pt">
			<fo:table-cell border-right="thin solid black" padding-bottom="5pt" padding-top="5pt">
				<fo:block space-after="2mm" space-before="2mm" start-indent="2mm"	end-indent="2mm" padding-before="2mm" padding-after="2mm" padding-bottom="5pt" padding-top="5pt">
			<xsl:call-template name="CHANGEBAR"/>
					<xsl:choose>
						<xsl:when test="normalize-space(key)">
							<xsl:apply-templates select="key"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x2002;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border-right="thin solid black" padding-bottom="5pt" padding-top="5pt">
				<fo:block  space-after="2mm" space-before="2mm" start-indent="2mm"  padding-bottom="5pt" padding-top="5pt"> <!-- keep-together.within-page="always" padding-before="2mm" padding-after="2mm"-->
					<xsl:choose>
						<xsl:when test="normalize-space(ctrlind)">
							<xsl:apply-templates select="ctrlind"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x2002;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border-right="thin solid black" padding-bottom="5pt" padding-top="5pt">
				<fo:block space-after="2mm" space-before="2mm" start-indent="2mm"> <!-- keep-together.within-page="always" -->
					<xsl:choose>
						<xsl:when test="normalize-space(note)">
							<xsl:apply-templates select="note"/>
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
				</fo:block>
				<fo:block end-indent="2mm"  space-after="2mm" space-before="2mm" start-indent="2mm"  padding-bottom="5pt" padding-top="5pt"> <!-- keep-together.within-page="always" padding-before="2mm" padding-after="2mm"-->
					<xsl:choose>
						<xsl:when test="normalize-space(function)">
							<xsl:apply-templates select="function"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x2002;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:if test="following-sibling::*[1][local-name() = 'figure']">
			<fo:table-row padding-bottom="5pt" padding-top="5pt">
				<fo:table-cell border-bottom="thin solid black" padding-bottom="5pt" padding-top="5pt" number-columns-spanned="3">
					<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
						<xsl:apply-templates select="following-sibling::*[1][local-name() = 'figure']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ctrlind">
		<fo:inline font-weight="normal">
			<xsl:apply-templates select="node()"/>
		</fo:inline>
	</xsl:template>
	<!--END [ctrlindtab table...mil-std-2361D] stuff ...    -->
	    <xsl:template match="torque">
		<xsl:text> </xsl:text>
		<fo:inline font-weight="normal">
			<xsl:apply-templates select="node()"/>
		</fo:inline>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="voltage">
		<xsl:text> </xsl:text>
		<fo:inline font-weight="normal">
			<xsl:apply-templates select="node()"/>
		</fo:inline>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="lubricant">
		<xsl:text> </xsl:text>
		<fo:inline font-weight="normal">
			<xsl:apply-templates select="node()"/>
		</fo:inline>
		<xsl:text> </xsl:text>
	</xsl:template>
		<xsl:template match="function">
			<xsl:apply-templates select="node()"/>
	</xsl:template>
	   
</xsl:stylesheet>
