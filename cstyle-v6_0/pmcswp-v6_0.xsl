<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="pmcswp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>

		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="br">
		<fo:block>
			<xsl:text>&#x2002;</xsl:text>
		</fo:block>
	</xsl:template>

	<!--#######################################################################################################-->
	<!--BEGIN [pmcstable table...mil-std-2361D]   -->
<xsl:template match="pmcstable | paper.manual/mim/pmcscategory/pmcswp/pmcstable | paper.manual/mim/maintenancepmcscategory/pmcswp/pmcstable | pmc/pmcstable">
		<xsl:param name="pmcstblctr">
			<xsl:number count="pmcstable" format="1." from="pmcswp" level="any"/>
		</xsl:param>
				<fo:block font-family="sans-serif" font-size="100%" font-weight="bold" keep-with-next.within-column="always" space-after="6pt" space-before="6pt" space-before.conditionality="discard" span="all" text-align="center" display-align="center" text-transform="capitalize" id="{generate-id(.)}" hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<xsl:text>Table&#x2002;</xsl:text>
				<xsl:value-of select="$pmcstblctr"/>
				<xsl:text>&#x2002;</xsl:text>
				<xsl:value-of select="title"/>
			</fo:block>
			<xsl:if test="following-sibling::pmcs-intervals">
<fo:block font-family="sans-serif" font-size="100%" font-weight="bold" keep-with-next.within-column="always" space-after="6pt" space-before="6pt" space-before.conditionality="discard" span="all" text-align="center" display-align="center" text-transform="capitalize">
				<xsl:apply-templates select="pmcs-intervals"/>
				<xsl:text> </xsl:text>
			</fo:block>
			</xsl:if>
			<fo:block span="all">
			<fo:table border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" border-right-style="solid" border-right-width=".5pt" border-top-style="solid" border-top-width=".5pt" font-family="sans-serif" font-size="10pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="2pt" padding-bottom="4pt" padding-left="4pt" padding-right="4pt" padding-top="2pt" relative-position="static" space-after="6pt" space-before="3pt" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" width="7in">
				<!-- This CHOOSE segment is added to account for the attribute of 'use-manhours'-->
				<xsl:choose>
					<xsl:when test="@use-manhours='yes'">
						<fo:table-column column-number="1" column-width="7%"/>
						<fo:table-column column-number="2" column-width="17%"/>
						<fo:table-column column-number="3" column-width="8%"/>
						<fo:table-column column-number="4" column-width="15%"/>
						<fo:table-column column-number="5" column-width="38%"/>
						<fo:table-column column-number="6" column-width="15%"/>
						<xsl:call-template name="PMCS-HEADER"/>
				<fo:table-body border-bottom="none" border-top="none">
					<xsl:if test="child::warning | child::caution | child::note">
						<fo:table-row>

							<fo:table-cell border-top="thin solid black" border-bottom="thin solid black" border-left-style="solid" border-left-width=".5pt" padding="3pt" number-columns-spanned="6" text-align="center">
							<xsl:call-template name="WCN"/>
								<xsl:apply-templates select="child::warning"/>
								<xsl:apply-templates select="child::csi.alert"/>
								<xsl:apply-templates select="child::caution"/>
								<xsl:apply-templates select="child::note"/>
							</fo:table-cell>
						</fo:table-row>
					</xsl:if>
					<xsl:apply-templates select="child::pmcs-entry"/>
					<xsl:apply-templates select="br"/>
				</fo:table-body>
					</xsl:when>
					<xsl:otherwise>
						<fo:table-column column-number="1" column-width="7%"/>
						<fo:table-column column-number="2" column-width="17%"/>
						<fo:table-column column-number="3" column-width="15%"/>
						<fo:table-column column-number="4" column-width="43%"/>
						<fo:table-column column-number="5" column-width="18%"/>
						<xsl:call-template name="PMCS-HEADER"/>
				<fo:table-body border-bottom="none" border-top="none">
					<xsl:if test="child::warning | child::caution | child::note | child::csi.alert" >
						<fo:table-row>
							<fo:table-cell border-top="thin solid black" border-bottom="thin solid black" border-left-style="solid" border-left-width=".5pt" padding="3pt" number-columns-spanned="5" text-align="center">
							<!--<xsl:call-template name="WCN"/>-->
								<xsl:apply-templates select="child::warning"/>
								<xsl:apply-templates select="child::csi.alert"/>
								<xsl:apply-templates select="child::caution"/>
								<xsl:apply-templates select="child::note"/>
							</fo:table-cell>
						</fo:table-row>
					</xsl:if>
					<xsl:apply-templates select="child::pmcs-entry"/>
					<xsl:apply-templates select="br"/>
				</fo:table-body>
					</xsl:otherwise>
				</xsl:choose>				
			</fo:table>
	</fo:block>
	</xsl:template>
		<xsl:template match="pmcs-intervals">
		<fo:block font-weight="normal" space-after="6pt" space-before="12pt" space-before.conditionality="discard" span="all" text-align="left">
			<xsl:value-of select="interval"/>
		</fo:block>
	</xsl:template>
	<xsl:template name="PMCS-HEADER">
		<fo:table-header font-weight="bold" text-align="center" vertical-align="bottom">
			<fo:table-row>
				<fo:table-cell font-family="sans-serif" font-size="10pt" border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>ITEM</fo:block>
					<fo:block>NO.</fo:block>
				</fo:table-cell>
				<fo:table-cell font-family="sans-serif" font-size="10pt" border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>INTERVAL</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<!-- This CHOOSE segment is added to account for the attribute of 'use-manhours'-->
				<xsl:choose>
					<xsl:when test="@use-manhours='yes'">
						<fo:table-cell font-family="sans-serif" font-size="10pt" border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" padding-bottom="4pt" padding-top="4pt">
							<fo:block>&#x2002;</fo:block>
							<fo:block>MAN-</fo:block>
							<fo:block>HOUR</fo:block>
						</fo:table-cell>
					</xsl:when>
				</xsl:choose>
				<fo:table-cell font-family="sans-serif" font-size="10pt" border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block text-align="center">ITEM TO BE
					CHECKED OR
					SERVICED</fo:block>
				</fo:table-cell>
				<fo:table-cell font-family="sans-serif" font-size="10pt" border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>PROCEDURE</fo:block>
				</fo:table-cell>
				<!--2018.07.27 / R. Gamble - BOM per Mil-Std, changed NOT MISSION CAPABLE (NMC) IF: to EQUIPMENT NOT READY AVAILABLE IF:-->
				<fo:table-cell font-family="sans-serif" font-size="10pt" border-bottom-style="solid" border-bottom-width=".5pt" border-left-style="solid" border-left-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>EQUIPMENT</fo:block>
					<fo:block>NOT READY</fo:block>
					<fo:block>AVAILABLE IF:</fo:block>
				</fo:table-cell>
				<!--2018.07.27 / R. Gamble - EOM-->
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<xsl:template match="pmcs-entry">
	
	<!--<xsl:call-template name="CHANGEBAR"/>-->
		<xsl:if test="contains(child::processing-instruction()[1],'newpage')">
			<fo:table-row break-after="page">
				<fo:table-cell column-number="1">
					<fo:block><xsl:call-template name="CHANGEBAR"/></fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<fo:table-row padding-bottom="5pt" padding-top="3pt" keep-together.within-page="auto">
			<fo:table-cell border-top="thin solid black" border-left-style="solid" border-left-width=".5pt" padding-bottom="3pt" padding-top="3pt" padding-left="5pt" padding-right="5pt">
				<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="5pt" end-indent="5pt" hyphenate="true">
				<xsl:call-template name="CHANGEBAR"/>
					<xsl:value-of select="child::itemno"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border-top="thin solid black" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
				<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="5pt" end-indent="5pt">
				<xsl:call-template name="CHANGEBAR"/>
					<xsl:choose>
						<xsl:when test="interval">
							<xsl:for-each select="interval">
								<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
									<xsl:value-of select="."/>
								</fo:block>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x2002;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
			<!-- This CHOOSE segment is added to account for the attribute of 'use-manhours'-->
			<xsl:choose>
				<xsl:when test="../@use-manhours='yes'">
					<fo:table-cell column-number="3" border-top="thin solid black" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
						<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="5pt" end-indent="5pt">
						<xsl:call-template name="CHANGEBAR"/>
							<xsl:choose>
								<xsl:when test="manhours">
									<xsl:apply-templates select="manhours"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>&#x2002;</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</fo:block>
					</fo:table-cell>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			<fo:table-cell border-top="thin solid black" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
				<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="5pt" end-indent="5pt" keep-together.within-column="always" hyphenate="true">
				<xsl:call-template name="CHANGEBAR"/>
					<xsl:choose>
						<xsl:when test="checked">
							<xsl:apply-templates select="checked"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x2002;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border-top="thin solid black" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
				<xsl:if test="child::pmcsproc[1]/@crewmember">
					<fo:block padding-top="5pt" font-weight="bold">
					<xsl:call-template name="CHANGEBAR"/>
						<xsl:value-of select="child::pmcsproc[1]/@crewmember"/>
					</fo:block>
				</xsl:if>
				<xsl:if test="child::pmcsproc[1]/title">
					<fo:block padding-top="2mm" padding-bottom="2mm" font-weight="bold">
					<xsl:call-template name="CHANGEBAR"/>
						<xsl:value-of select="child::pmcsproc[1]/title"/>
					</fo:block>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="descendant::pmcsstep1[1]/specpara">
						<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="5pt" end-indent="5pt">
							<xsl:choose>
								<xsl:when test="(descendant::pmcsstep1[1]/specpara/warning) and (descendant::pmcsstep1[1]/specpara/caution | descendant::pmcsstep1[1]/specpara/note)">
									<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/warning[1]"/>
								</xsl:when>
								<xsl:when test="(descendant::pmcsstep1[1]/specpara/warning) and (not(descendant::pmcsstep1[1]/specpara/caution | descendant::pmcsstep1[1]/specpara/note))">
									<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/warning[1]"/>
								</xsl:when>
								<xsl:when test="(descendant::pmcsstep1[1]/specpara/caution) and (descendant::pmcsstep1[1]/specpara/note) and (not(descendant::pmcsstep1[1]/specpara/warning))">
									<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/caution"/>
								</xsl:when>
								<xsl:when test="(descendant::pmcsstep1[1]/specpara/caution) and (not(descendant::pmcsstep1[1]/specpara/note | descendant::pmcsstep1[1]/specpara/warning))">
									<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/caution"/>
								</xsl:when>
								<xsl:when test="(descendant::pmcsstep1[1]/specpara/note) and not(descendant::pmcsstep1[1]/specpara/caution | descendant::pmcsstep1[1]/specpara/warning)">
									<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/note"/>
								</xsl:when>
							</xsl:choose>
						</fo:block>
					</xsl:when>
					<xsl:when test="descendant::pmcspara/specpara">
						<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="5pt" end-indent="5pt">
							<xsl:choose>
						<xsl:when test="(descendant::pmcspara/specpara/warning) and (descendant::pmcspara/specpara/caution | descendant::pmcspara/specpara/note)">
									<xsl:apply-templates select="descendant::pmcspara/specpara/warning[1]"/>
								</xsl:when>
			<xsl:when test="(descendant::pmcspara/specpara/warning) and (not(descendant::pmcspara/specpara/caution | descendant::pmcspara/specpara/note))">
									<xsl:apply-templates select="descendant::pmcspara/specpara/warning[1]"/>
								</xsl:when>
								<xsl:when test="(descendant::pmcspara/specpara/caution) and (descendant::pmcspara/specpara/note) and (not(descendant::pmcspara/specpara/warning))">
									<xsl:apply-templates select="descendant::pmcspara/specpara/caution"/>
								</xsl:when>
								<xsl:when test="(descendant::pmcspara/specpara/caution) and (not(descendant::pmcspara/specpara/note | descendant::pmcspara/specpara/warning))">
									<xsl:apply-templates select="descendant::pmcspara/specpara/caution"/>
								</xsl:when>
								<xsl:when test="(descendant::pmcspara/specpara/note) and not(descendant::pmcspara/specpara/caution | descendant::pmcspara/specpara/warning)">
									<xsl:apply-templates select="descendant::pmcspara/specpara/note"/>
								</xsl:when>
							</xsl:choose>
						</fo:block>
					</xsl:when>
					<xsl:when test="child::pmcsproc/child::pmcsstep1-alt/child::pmcsstep1[1]/child::para">
						<xsl:apply-templates select="child::pmcsproc/child::pmcsstep1-alt/child::pmcsstep1[1]/child::para" mode="pmcs"/>
					</xsl:when>
					<xsl:when test="child::pmcsproc[1]/child::pmcspara">
						<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="4pt" end-indent="4pt">
							<xsl:apply-templates select="child::pmcsproc[1]/child::pmcspara/para"/>
						</fo:block>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="descendant::pmcsstep1[1]/para" mode="pmcs"/>
						<xsl:apply-templates select="descendant::pmcspara/para"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="pmcsproc[1]/pmcspara/specpara/warning/icon-set">
						<fo:block text-align="left" space-after="1mm" space-before="1mm" start-indent="4pt" end-indent="4pt">
							<fo:external-graphic>
								<xsl:attribute name="src"><xsl:text>url(</xsl:text><xsl:value-of select="@boardno"/><xsl:text>)</xsl:text></xsl:attribute>
								<xsl:if test="@reprowid and @reprodep">
									<xsl:attribute name="scaling">non-uniform</xsl:attribute>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="@reprowid">
										<xsl:apply-templates mode="graphic-attribute" select="@reprowid"/>
									</xsl:when>
									<xsl:when test="@reprodep">
										<xsl:apply-templates mode="graphic-attribute" select="@reprodep"/>
									</xsl:when>
									<xsl:when test="@hscale">
										<xsl:apply-templates mode="graphic-attribute" select="@hscale"/>
									</xsl:when>
									<xsl:when test="@vscale">
										<xsl:apply-templates mode="graphic-attribute" select="@vscale"/>
									</xsl:when>
									<xsl:when test="@scalefit">
										<xsl:apply-templates mode="graphic-attribute" select="@scalefit"/>
									</xsl:when>
								</xsl:choose>
							</fo:external-graphic>
						</fo:block>
					</xsl:when>
				</xsl:choose>
			</fo:table-cell>
			<fo:table-cell border-top="thin solid black" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
				<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="4pt" end-indent="4pt" hyphenate="true">
				<xsl:call-template name="CHANGEBAR"/>
					<xsl:choose>
						<xsl:when test="(child::pmcsproc/pmcspara/eqpnotavail/trim.para) and (not(child::pmcsproc/pmcspara/specpara))">
							<!-- BOLEN added [1] -->
							<xsl:apply-templates select="child::pmcsproc[1]/pmcspara/eqpnotavail/trim.para"/>
						</xsl:when>
						<xsl:when test="(child::pmcsproc/pmcsstep1[1]/para) and (child::pmcsproc/pmcsstep1[1]/eqpnotavail/trim.para)">
							<xsl:apply-templates select="child::pmcsproc/pmcsstep1[1]/eqpnotavail/trim.para"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x2002;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:if test="descendant::pmcsstep1[1]/specpara/warning[position()>1]">
			<xsl:choose>
				<xsl:when test="../@use-manhours='yes'">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="4pt">
							<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/warning[position()>1]"/>
						</fo:table-cell>
						<fo:table-cell column-number="6" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/warning[position()>1]"/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(descendant::pmcsstep1[1]/specpara/warning) and (descendant::pmcsstep1[1]/specpara/caution)">
			<xsl:choose>
				<xsl:when test="../@use-manhours='yes'">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/caution"/>
						</fo:table-cell>
						<fo:table-cell column-number="6" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/caution"/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(descendant::pmcsstep1[1]/specpara/warning | descendant::pmcsstep1[1]/specpara/caution) and (descendant::pmcsstep1[1]/specpara/note)">
			<xsl:choose>
				<xsl:when test="../@use-manhours='yes'">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/note/trim.para"/>
						</fo:table-cell>
						<fo:table-cell column-number="6" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="4pt" padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/note"/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="descendant::pmcsstep1[1]/specpara/para">
			<xsl:choose>
				<xsl:when test="../@use-manhours='yes'">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-top="4pt" padding-left="5pt" padding-right="5pt">
							<fo:block text-align="left" space-after="5pt">
								<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/para" mode="pmcs1"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="6" border-left-style="solid" border-left-width=".5pt" padding-left="5pt" padding-right="5pt">
							<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="4pt" end-indent="4pt" hyphenate="true" keep-together.within-page="always">
							<xsl:call-template name="CHANGEBAR"/>
								<xsl:if test="(child::pmcsproc/pmcsstep1[1]/specpara/para) and (child::pmcsproc/pmcsstep1[1]/eqpnotavail/trim.para)">
									<xsl:apply-templates select="child::pmcsproc/pmcsstep1[1]/eqpnotavail/trim.para"/>
								</xsl:if>
								<!--<xsl:if test="(child::pmcsproc/pmcsstep1[1]/para | child::pmcsproc/pmcsstep1[1]/specpara/para) and (child::pmcsproc/pmcsstep1[1]/eqpnotavail/trim.para)">
									<xsl:apply-templates select="child::pmcsproc/pmcsstep1[1]/eqpnotavail/trim.para"/>
								</xsl:if>-->
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="4pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
							<fo:block hyphenate="true" text-align="left" space-after="5pt">
								<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/para" mode="pmcs"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-left="5pt" padding-right="5pt">
				<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="4pt" end-indent="4pt" hyphenate="true" keep-together.within-page="always">
				<xsl:call-template name="CHANGEBAR"/>
								<xsl:if test="(child::pmcsproc/pmcsstep1[1]/para | child::pmcsproc/pmcsstep1[1]/specpara/para) and (child::pmcsproc/pmcsstep1[1]/eqpnotavail/trim.para)">
									<xsl:apply-templates select="child::pmcsproc/pmcsstep1[1]/eqpnotavail/trim.para"/>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="descendant::pmcspara/specpara/warning[position()>1]">
			<xsl:choose>
				<xsl:when test="../@use-manhours='yes'">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="descendant::pmcspara/specpara/warning[position()>1]"/>
						</fo:table-cell>
						<fo:table-cell column-number="6" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="descendant::pmcspara/specpara/warning[position()>1]"/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(descendant::pmcspara/specpara/warning) and (descendant::pmcspara/specpara/caution)">
			<xsl:choose>
				<xsl:when test="../@use-manhours='yes'">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="descendant::pmcspara/specpara/caution"/>
						</fo:table-cell>
						<fo:table-cell column-number="6" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="descendant::pmcspara/specpara/caution"/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(descendant::pmcspara/specpara/warning | descendant::pmcspara/specpara/caution) and (descendant::pmcspara/specpara/note)">
			<xsl:choose>
				<xsl:when test="../@use-manhours='yes'">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="descendant::pmcspara/specpara/note"/>
						</fo:table-cell>
						<fo:table-cell column-number="6" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="4pt" padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="descendant::pmcspara/specpara/note"/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="descendant::pmcspara/specpara/para">
			<xsl:choose>
				<xsl:when test="../@use-manhours='yes'">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-top="4pt" padding-left="5pt" padding-right="5pt">
							<fo:block text-align="left" space-after="5pt">
								<!--						<xsl:apply-templates select="descendant::pmcspara/specpara/para" mode="pmcs1"/>-->
								<xsl:apply-templates select="descendant::pmcspara/specpara/para"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="6" border-left-style="solid" border-left-width=".5pt" padding-left="5pt" padding-right="5pt">
							<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="4pt" end-indent="4pt" hyphenate="true">
							<xsl:call-template name="CHANGEBAR"/>
								<!--						<xsl:if test="(child::pmcsproc/pmcspara/para) and (child::pmcsproc/pmcspara/eqpnotavail/trim.para)">-->
								<xsl:if test="(child::pmcsproc/pmcspara/para | child::pmcsproc/pmcspara/specpara/para) and (child::pmcsproc/pmcspara/eqpnotavail/trim.para)">
									<xsl:apply-templates select="child::pmcsproc/pmcspara/eqpnotavail/trim.para"/>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="4pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
							<fo:block hyphenate="true" text-align="left" space-after="5pt">
								<xsl:apply-templates select="descendant::pmcspara/specpara/para"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-left="5pt" padding-right="5pt">
							<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="4pt" end-indent="4pt" hyphenate="true">
							<xsl:call-template name="CHANGEBAR"/>
								<xsl:if test="(child::pmcsproc/pmcspara/para | child::pmcsproc/pmcspara/specpara/para) and (child::pmcsproc/pmcspara/eqpnotavail/trim.para)">
									<xsl:apply-templates select="child::pmcsproc/pmcspara/eqpnotavail/trim.para"/>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="(child::pmcsproc[1]/pmcsstep1[1]/child::para/child::figure | child::pmcsproc[1]/pmcsstep1[1]/specpara/child::para/child::figure | child::pmcsproc/pmcspara//figure | child::pmcsproc/pmcspara/specpara/para/figure) and (ancestor::pmcstable/attribute::use-manhours='no')">
			<fo:table-row>
				<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="5">
					<xsl:apply-templates select="child::pmcsproc[1]/pmcsstep1[1]/para/figure | child::pmcsproc[1]/pmcsstep1[1]/specpara/para/figure | child::pmcsproc/pmcspara//figure | child::pmcsproc/pmcspara/specpara/para/figure"/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="(child::pmcsproc[1]/pmcsstep1[1]/child::para/child::figure | child::pmcsproc[1]/pmcsstep1[1]/specpara/child::para/child::figure | child::pmcsproc/pmcspara/para/figure | child::pmcsproc/pmcspara/specpara/para/figure) 		and (ancestor::pmcstable/attribute::use-manhours='yes')">
			<fo:table-row>
				<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="6">
					<xsl:apply-templates select="child::pmcsproc[1]/pmcsstep1[1]/para/figure | child::pmcsproc[1]/pmcsstep1[1]/specpara/para/figure | child::pmcsproc/pmcspara/para/figure | child::pmcsproc/pmcspara/specpara/para/figure"/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:apply-templates select="descendant::pmcsstep1[1]/pmcsstep2"/>
		<xsl:apply-templates select="child::pmcsproc[1]/pmcsstep1[position()!=1]"/>
		<xsl:apply-templates select="child::pmcsproc[position() != 1]"/>
		<xsl:apply-templates select="br"/>
	</xsl:template>
	<xsl:template match="pmcstable/pmcs-entry/pmcsproc/pmcsstep1[position()>1]">
	<xsl:call-template name="CHANGEBAR"/>
		<xsl:if test="contains(child::processing-instruction()[1],'newpage')">
			<fo:table-row break-after="page">
				<fo:table-cell column-number="1">
					<fo:block/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="ancestor::pmcstable/attribute::use-manhours='yes'">
				<xsl:if test="child::specpara">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" padding-top="4pt" padding-bottom="3pt" padding-right="4pt" padding-left="4pt" border-left-style="solid" border-left-width=".5pt">
							<xsl:apply-templates select="child::specpara/warning | child::specpara/caution | child::specpara/note"/>
						</fo:table-cell>
						<fo:table-cell column-number="6" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
				<xsl:for-each select=".">
					<fo:table-row>
						<xsl:if test="descendant::para/preceding-sibling::note[1]">
							<xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
						</xsl:if>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-left="4pt" padding-top="3pt" padding-right="5pt">
							<xsl:apply-templates select="child::para[1] | child::specpara/para" mode="pmcs"/>
						</fo:table-cell>
						<fo:table-cell column-number="6" padding-top="3pt" padding-bottom="3pt" border-left-style="solid" border-left-width=".5pt" padding-left="5pt" padding-right="5pt">
							<xsl:choose>
								<xsl:when test="child::eqpnotavail/trim.para">
								<fo:block  font-family="sans-serif" relative-align="baseline" text-decoration="none">
									<xsl:apply-templates select="child::eqpnotavail/trim.para"/>
									</fo:block>
								</xsl:when>
								<xsl:otherwise>
									<fo:block/>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
				<xsl:if test="child::para/child::figure | child::specpara/child::para/child::figure">
					<fo:table-row>
						<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="6">
							<xsl:apply-templates select="child::para/figure | child::specpara/para/figure"/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="child::specpara">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt" border-left-style="solid" border-left-width=".5pt" >
							<xsl:apply-templates select="child::specpara/warning | child::specpara/caution | child::specpara/note"/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
				<xsl:for-each select=".">
					<fo:table-row>
						<xsl:if test="descendant::para/preceding-sibling::note[1]">
							<xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
						</xsl:if>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-left="5pt" padding-right="5pt" padding-top="3pt">
							<xsl:apply-templates select="child::para[1] | child::specpara/para" mode="pmcs"/>
						</fo:table-cell>
						<fo:table-cell column-number="5" padding-top="3pt" padding-bottom="3pt" border-left-style="solid" border-left-width=".5pt" padding-left="5pt" padding-right="5pt">
							<xsl:choose>
								<xsl:when test="child::eqpnotavail/trim.para">
								<fo:block>
									<xsl:apply-templates select="child::eqpnotavail/trim.para"/>
								</fo:block>
								</xsl:when>
								<xsl:otherwise>
									<fo:block/>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
				<xsl:if test="child::para/child::figure | child::specpara/child::para/child::figure">
					<fo:table-row>
						<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="5">
							<xsl:apply-templates select="child::para/figure | child::specpara/para/figure"/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="child::pmcsstep2"/>
	</xsl:template>
	<xsl:template match="pmcsproc[position() != 1]">
		<fo:table-row>
			<fo:table-cell column-number="1" border-top="thin solid black" border-left-style="solid" border-left-width=".5pt">
				<fo:block/>
			</fo:table-cell>
			<fo:table-cell column-number="2" border-top="thin solid black" border-left-style="solid" border-left-width=".5pt">
				<fo:block/>
			</fo:table-cell>
			<fo:table-cell column-number="3" border-top="thin solid black" border-left-style="solid" border-left-width=".5pt">
				<fo:block/>
			</fo:table-cell>
			<fo:table-cell column-number="4" border-top="thin solid black" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
				<xsl:if test="title">
					<fo:block padding-top="2mm" padding-bottom="2mm" font-weight="bold">
						<xsl:value-of select="title"/>
					</fo:block>
				</xsl:if>
				<xsl:if test="@crewmember">
					<fo:block padding-top="5pt" font-weight="bold">
						<xsl:value-of select="@crewmember"/>
					</fo:block>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="child::pmcsstep1[1]/specpara">
						<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="5pt" end-indent="5pt">
							<xsl:choose>
								<xsl:when test="(child::pmcsstep1[1]/specpara/warning) and (child::pmcsstep1[1]/specpara/caution | child::pmcsstep1[1]/specpara/note)">
									<xsl:apply-templates select="child::pmcsstep1[1]/specpara/warning[1]"/>
								</xsl:when>
								<xsl:when test="(child::pmcsstep1[1]/specpara/warning) and (not(child::pmcsstep1[1]/specpara/caution | child::pmcsstep1[1]/specpara/note))">
									<xsl:apply-templates select="child::pmcsstep1[1]/specpara/warning[1]"/>
								</xsl:when>
							<xsl:when test="(child::pmcsstep1[1]/specpara/caution) and (child::pmcsstep1[1]/specpara/note) and (not(child::pmcsstep1[1]/specpara/warning))">
									<xsl:apply-templates select="child::pmcsstep1[1]/specpara/caution"/>
								</xsl:when>
								<xsl:when test="(child::pmcsstep1[1]/specpara/caution) and (not(child::pmcsstep1[1]/specpara/note | child::pmcsstep1[1]/specpara/warning))">
									<xsl:apply-templates select="child::pmcsstep1[1]/specpara/caution"/>
								</xsl:when>
								<xsl:when test="(child::pmcsstep1[1]/specpara/note) and not(child::pmcsstep1[1]/specpara/caution | child::pmcsstep1[1]/specpara/warning)">
									<xsl:apply-templates select="child::pmcsstep1[1]/specpara/note"/>
								</xsl:when>
							</xsl:choose>
						</fo:block>
					</xsl:when>
					<xsl:when test="child::pmcspara/specpara">
						<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="5pt" end-indent="5pt">
							<xsl:choose>
								<xsl:when test="(child::pmcspara/specpara/warning) and (child::pmcspara/specpara/caution | child::pmcspara/specpara/note)">
									<xsl:apply-templates select="child::pmcspara/specpara/warning[1]"/>
								</xsl:when>
								<xsl:when test="(child::pmcspara/specpara/warning) and (not(child::pmcspara/specpara/caution | child::pmcspara/specpara/note))">
									<xsl:apply-templates select="child::pmcspara/specpara/warning[1]"/>
								</xsl:when>
								<xsl:when test="(child::pmcspara/specpara/caution) and (child::pmcspara/specpara/note) and (not(child::pmcspara/specpara/warning))">
									<xsl:apply-templates select="child::pmcspara/specpara/caution"/>
								</xsl:when>
								<xsl:when test="(child::pmcspara/specpara/caution) and (not(child::pmcspara/specpara/note | child::pmcspara/specpara/warning))">
									<xsl:apply-templates select="child::pmcspara/specpara/caution"/>
								</xsl:when>
								<xsl:when test="(child::pmcspara/specpara/note) and not(child::pmcspara/specpara/caution | child::pmcspara/specpara/warning)">
									<xsl:apply-templates select="child::pmcspara/specpara/note"/>
								</xsl:when>
							</xsl:choose>
						</fo:block>
					</xsl:when>
					<xsl:when test="child::pmcspara">
						<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="4pt" end-indent="4pt">
							<xsl:apply-templates select="child::pmcspara/para"/>
						</fo:block>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="child::pmcsstep1[1]/para" mode="pmcs1"/>
						<xsl:apply-templates select="child::pmcspara/para"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="child::pmcspara/specpara/warning/icon-set">
						<fo:block text-align="left" space-after="1mm" space-before="1mm" start-indent="4pt" end-indent="4pt">
							<!-- <xsl:apply-templates select="pmcsproc/pmcspara/specpara/warning/icon-set"/>  -->
							<fo:external-graphic>
								<xsl:attribute name="src"><xsl:text>url(</xsl:text><xsl:value-of select="@boardno"/><xsl:text>)</xsl:text></xsl:attribute>
								<xsl:if test="@reprowid and @reprodep">
									<xsl:attribute name="scaling">non-uniform</xsl:attribute>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="@reprowid">
										<xsl:apply-templates mode="graphic-attribute" select="@reprowid"/>
									</xsl:when>
									<xsl:when test="@reprodep">
										<xsl:apply-templates mode="graphic-attribute" select="@reprodep"/>
									</xsl:when>
									<xsl:when test="@hscale">
										<xsl:apply-templates mode="graphic-attribute" select="@hscale"/>
									</xsl:when>
									<xsl:when test="@vscale">
										<xsl:apply-templates mode="graphic-attribute" select="@vscale"/>
									</xsl:when>
									<xsl:when test="@scalefit">
										<xsl:apply-templates mode="graphic-attribute" select="@scalefit"/>
									</xsl:when>
								</xsl:choose>
							</fo:external-graphic>
						</fo:block>
					</xsl:when>
				</xsl:choose>
			</fo:table-cell>
			<fo:table-cell border-top="thin solid black" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
				<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="4pt" end-indent="4pt"  font-family="sans-serif" relative-align="baseline" text-decoration="none">
				<xsl:call-template name="CHANGEBAR"/>
					<xsl:choose>
						<xsl:when test="(child::pmcspara/eqpnotavail/trim.para) and (not(child::pmcspara/specpara))">
							<xsl:apply-templates select="child::pmcspara/eqpnotavail/trim.para"/>
						</xsl:when>
						<xsl:when test="(child::pmcsstep1/eqpnotavail/trim.para) and (not(child::pmcsstep1/specpara))">
							<xsl:apply-templates select="child::pmcspara/eqpnotavail/trim.para"/>
						</xsl:when>
						<xsl:when test="(child::pmcsstep1[1]/para) and (child::pmcsstep1[1]/eqpnotavail/trim.para)">
							<xsl:apply-templates select="child::pmcsstep1[1]/eqpnotavail/trim.para"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x2002;</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:if test="(child::pmcsproc/pmcspara//figure | child::pmcsproc/pmcspara/specpara/para/figure) and (ancestor::pmcstable/attribute::use-manhours='no')">
			<fo:table-row>
				<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="5">
					<xsl:apply-templates select="child::pmcsproc/pmcspara//figure | child::pmcsproc/pmcspara/specpara/para/figure"/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="(child::pmcsproc/pmcspara/para/figure | child::pmcsproc/pmcspara/specpara/para/figure) 
		and (ancestor::pmcstable/attribute::use-manhours='yes')">
			<fo:table-row>
				<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="6">
					<xsl:apply-templates select="child::pmcsproc/pmcspara/para/figure | child::pmcsproc/pmcspara/specpara/para/figure"/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="child::pmcsstep1[1]/specpara/warning[position()>1]">
			<fo:table-row>
				<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
					<xsl:apply-templates select="child::pmcsstep1[1]/specpara/warning[position()>1]"/>
				</fo:table-cell>
				<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="(child::pmcsstep1[1]/specpara/warning) and (child::pmcsstep1[1]/specpara/caution)">
			<fo:table-row>
				<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
			<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="3pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
					<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/caution"/>
				</fo:table-cell>
				<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="(child::pmcsstep1[1]/specpara/warning | child::pmcsstep1[1]/specpara/caution) and (child::pmcsstep1[1]/specpara/note)">
			<fo:table-row>
				<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
			<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="4pt" padding-left="5pt" padding-right="5pt">
					<xsl:apply-templates select="child::pmcsstep1[1]/specpara/note"/>
				</fo:table-cell>
				<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="child::pmcsstep1[1]/specpara/para">
			<fo:table-row>
				<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-top="4pt" padding-bottom="3pt" padding-left="5pt" padding-right="5pt">
					<fo:block text-align="left" space-after="5pt" padding-right="5pt">
						<xsl:apply-templates select="child::pmcsstep1[1]/specpara/para" mode="pmcs1"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding-left="5pt" padding-right="5pt">
			<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="4pt" end-indent="4pt" keep-together.within-page="always"  font-family="sans-serif" relative-align="baseline" text-decoration="none">
						<xsl:if test="(child::pmcsstep1[1]/para | child::pmcsstep1[1]/specpara/para) and (child::pmcsstep1[1]/eqpnotavail/trim.para)">
							<xsl:apply-templates select="child::pmcsstep1/eqpnotavail/trim.para"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="child::pmcsstep1[1]/child::para/child::figure | child::pmcsstep1[1]/child::specpara/child::para/child::figure">
			<fo:table-row>
				<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="5">
					<xsl:apply-templates select="child::pmcsstep1[1]/child::para/figure | child::pmcsstep1[1]/child::specpara/para/figure"/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:apply-templates select="child::pmcsstep2"/>
		<xsl:apply-templates select="child::pmcsstep1[position()!=1]"/>
	</xsl:template>
	<xsl:template match="pmcsstep2">
		<xsl:call-template name="PMCS_TABLE_ROW"/>
		<xsl:apply-templates select="child::pmcsstep3"/>
	</xsl:template>
	<xsl:template match="pmcsstep3">
		<xsl:call-template name="PMCS_TABLE_ROW"/>
		<xsl:apply-templates select="child::pmcsstep4"/>
	</xsl:template>
	<xsl:template match="pmcsstep4">
		<xsl:call-template name="PMCS_TABLE_ROW"/>
	</xsl:template>
	<!-- END [pmcstable table...mil-std-2361D]-->
	<!--#######################################################################################################-->
	<xsl:template match="pmcsstep1/para[1] | pmcsstep1/specpara/para[1]" mode="pmcs">
			<fo:list-block keep-with-previous="always" provisional-distance-between-starts="12pt" provisional-label-separation="6pt">
				<fo:list-item relative-align="baseline" space-before.conditionality="discard" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt" margin-left="2pt">
					<fo:list-item-label start-indent="-2pt" end-indent="label-end()" text-align="end">
						<!-- BOLEN changed for applicability -->
						<fo:block>
						<xsl:number count="pmcsstep1[not(parent::pmcsstep1-alt)]|pmcsstep1-alt" format="1. " level="single"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
					<fo:block>
						<!-- BOLEN added for applicability -->
						<xsl:call-template name="APPLICABLE"/>
						<xsl:call-template name="PMCSCREWMEMBER"/>
							<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref |  subscrpt | supscrpt | xref | link |cageno | callout | dodac | dwgname | dwgno | modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant |  pageloc | symbol | torque | voltage | null | change | seqlist |  
deflist | anchor | internet | proponent | phone | instructplt | verbatim | text()"/>
							<xsl:apply-templates select="randlist" mode="PMCSLIST"/>
							</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
	</xsl:template>
	<xsl:template match="pmcsstep1[1]/para | pmcsstep1[1]/specpara/para" mode="pmcs1">
		<fo:list-block keep-with-previous="always" provisional-distance-between-starts="12pt" provisional-label-separation="6pt">
			<fo:list-item space-before.conditionality="discard" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt">
				<fo:list-item-label start-indent="-2pt" text-align="end" end-indent="label-end()">
				<fo:block>
					<!-- BOLEN changed for applicability -->
					<xsl:number count="pmcsstep1[not(parent::pmcsstep1-alt)]|pmcsstep1-alt" format="1. " level="single"/>
				</fo:block>
				</fo:list-item-label>
				<fo:list-item-body start-indent="body-start()">
				<fo:block>
						<xsl:call-template name="APPLICABLE"/>
						<xsl:call-template name="PMCSCREWMEMBER"/>
						<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | link | cageno | callout | dodac | dwgname | dwgno | modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist |  
deflist | anchor | internet |  proponent | phone | instructplt | verbatim | text()"/>
						<xsl:apply-templates select="randlist" mode="PMCSLIST"/>
			</fo:block>	
			</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<xsl:template match="pmcsstep2[1]/para[1] | pmcsstep2[1]/specpara/para[1]">
		<fo:list-block start-indent="24pt" keep-with-previous="always" provisional-distance-between-starts="20pt" provisional-label-separation="4pt">
			<fo:list-item space-before.conditionality="discard" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt">
				<fo:list-item-label text-align="end" end-indent="label-end()">
					<fo:block font-family="sans-serif" relative-align="baseline">
						<!-- BOLEN changed for applicability -->
						<xsl:number count="pmcsstep2[not(parent::pmcsstep2-alt)]|pmcsstep2-alt" format="a." level="single"/>
					</fo:block>
				</fo:list-item-label>
				<fo:list-item-body start-indent="body-start()">
				<fo:block  font-family="sans-serif" relative-align="baseline" text-decoration="none">
					<xsl:call-template name="APPLICABLE"/>
					<xsl:call-template name="PMCSCREWMEMBER"/>
						<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref |  subscrpt | supscrpt | xref | link | cageno | callout | dodac | dwgname | dwgno | modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant |  pageloc | symbol | torque | voltage | null | change | seqlist |
deflist | anchor | internet |  proponent |  phone | instructplt | verbatim |  text()"/>
						<xsl:apply-templates select="randlist" mode="PMCSLIST"/>
				</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<xsl:template match="pmcsstep2[position()>1]/para[1] | pmcsstep2[position()>1]/specpara/para[1]">
		<fo:list-block start-indent="24pt" keep-with-previous="always" provisional-distance-between-starts="20pt" provisional-label-separation="4pt">
	<fo:list-item relative-align="baseline" space-before.conditionality="discard" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt">
				<fo:list-item-label text-align="end" end-indent="label-end()">
					<fo:block font-family="sans-serif" relative-align="baseline" text-decoration="none">
						<!-- BOLEN changed for applicability -->
						<xsl:number count="pmcsstep2[not(parent::pmcsstep2-alt)]|pmcsstep2-alt" format="a." level="single"/>
					</fo:block>
				</fo:list-item-label>
				<fo:list-item-body start-indent="body-start()">
				<fo:block  font-family="sans-serif" relative-align="baseline" text-decoration="none">
						<xsl:call-template name="APPLICABLE"/>
						<xsl:call-template name="PMCSCREWMEMBER"/>
						<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref |  subscrpt | supscrpt | xref | link | cageno | callout | dodac | dwgname | dwgno | modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist |   
deflist | anchor | internet | proponent | phone | instructplt | verbatim | text()"/>
						<xsl:apply-templates select="randlist" mode="PMCSLIST"/>
				</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<xsl:template match="pmcsstep3/para[1] | pmcsstep3/specpara/para[1]">
		<fo:list-block start-indent="38pt" keep-with-previous="always" provisional-distance-between-starts="20pt" provisional-label-separation="4pt">
			<fo:list-item space-before.conditionality="discard" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt">
				<fo:list-item-label text-align="end" end-indent="label-end()">
					<fo:block  font-family="sans-serif" relative-align="baseline" text-decoration="none">
						<!-- BOLEN changed for applicability -->
						<xsl:number count="pmcsstep3[not(parent::pmcsstep3-alt)]|pmcsstep3-alt" format="(1) " level="single"/>
					</fo:block>
				</fo:list-item-label>
				<fo:list-item-body start-indent="body-start()">
				<fo:block  font-family="sans-serif" relative-align="baseline" text-decoration="none">
						<xsl:call-template name="APPLICABLE"/>
						<xsl:call-template name="PMCSCREWMEMBER"/>
						<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | link | cageno | callout | dodac | dwgname | dwgno | modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet | proponent | phone | instructplt | verbatim | text()"/>
				</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<xsl:template match="pmcsstep4/para[1] | pmcsstep4/specpara/para[1]">
		<fo:list-block start-indent="51pt" keep-with-previous="always" provisional-distance-between-starts="16pt" provisional-label-separation="7pt">
			<fo:list-item space-before.conditionality="discard" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt">
				<fo:list-item-label text-align="end" end-indent="label-end()">
					<fo:block font-family="sans-serif" relative-align="baseline">
						<!-- BOLEN added for applicability -->
						<xsl:number count="pmcsstep4[not(parent::pmcsstep4-alt)]|pmcsstep4-alt" format="(a) " level="single"/>
					</fo:block>
				</fo:list-item-label>
				<fo:list-item-body start-indent="body-start()">
				<fo:block  font-family="sans-serif" relative-align="baseline" text-decoration="none">
						<xsl:call-template name="APPLICABLE"/>
						<xsl:call-template name="PMCSCREWMEMBER"/>
						<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | link | cageno | callout | dodac | dwgname | dwgno | modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet | proponent | phone | instructplt | verbatim | text()"/>
				</fo:block></fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<xsl:template match="pmcsproc/pmcspara/para | pmcsproc/pmcspara/specpara/para">
		<fo:block text-align="left" space-after="5pt" space-before="5pt" start-indent="5pt" end-indent="5pt">
			<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref |  subscrpt | supscrpt | xref | link | cageno | callout | dodac | dwgname | dwgno | modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet | proponent | phone | instructplt | verbatim | text()"/>
		</fo:block >
		<xsl:if test="(child::pmcsproc/pmcspara//figure | child::pmcsproc/pmcspara/specpara/para/figure) and (ancestor::pmcstable/attribute::use-manhours='no')">
			<fo:table-row>
				<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="5">
					<xsl:apply-templates select="figure"/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="(child::pmcsproc/pmcspara/para/figure | child::pmcsproc/pmcspara/specpara/para/figure) 
		and (ancestor::pmcstable/attribute::use-manhours='yes')">
			<fo:table-row>
				<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="6">
					<xsl:apply-templates select="figure"/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PMCSCREWMEMBER">
		<xsl:if test="parent::*/@crewmember">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="parent::*/@crewmember"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PMCS_TABLE_ROW">
		<xsl:if test="contains(child::processing-instruction()[1],'newpage')">
			<fo:table-row break-after="page">
				<fo:table-cell column-number="1">
					<fo:block/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="ancestor::pmcstable/attribute::use-manhours='yes'">
				<xsl:if test="specpara">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" padding-top="4pt" padding-bottom="3pt" padding-right="4pt" padding-left="4pt" border-left-style="solid" border-left-width=".5pt">
						<fo:block/>
							<!--<xsl:apply-templates select="child::specpara/warning | child::specpara/caution | child::specpara/note"/>-->
						</fo:table-cell>
						<fo:table-cell column-number="6" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
				<xsl:for-each select=".">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt" padding="4pt">
						<fo:block/>
							<!--<xsl:apply-templates select="child::para[1] | child::specpara/para"/>-->
						</fo:table-cell>
						<fo:table-cell column-number="6" padding-top="3pt" padding-bottom="3pt" border-left-style="solid" border-left-width=".5pt">
							<xsl:choose>
								<xsl:when test="child::eqpnotavail/trim.para">
									<xsl:apply-templates select="child::eqpnotavail/trim.para"/>
								</xsl:when>
								<xsl:otherwise>
									<fo:block/>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
				<xsl:if test="child::para/child::figure | child::specpara/child::para/child::figure">
					<fo:table-row>
						<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="6">
							<xsl:apply-templates select="child::para/figure | child::specpara/para/figure"/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="specpara">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" padding-top="4pt" padding-bottom="3pt" padding-right="4pt" padding-left="4pt" border-left-style="solid" border-left-width=".5pt">
						
							<xsl:apply-templates select="child::specpara/warning | child::specpara/caution | child::specpara/note"/>
						</fo:table-cell>
						<fo:table-cell column-number="5" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
				<xsl:for-each select=".">
					<fo:table-row>
						<fo:table-cell column-number="1" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="2" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="3" border-left-style="solid" border-left-width=".5pt">
							<fo:block/>
						</fo:table-cell>
						<fo:table-cell column-number="4" border-left-style="solid" border-left-width=".5pt" padding-left="4pt" padding-top="4pt">
							<xsl:apply-templates select="child::para[1] | child::specpara/para[1]"/>
						</fo:table-cell>
						<fo:table-cell column-number="5" padding-top="3pt" padding-bottom="3pt" border-left-style="solid" border-left-width=".5pt">
							<xsl:choose>
								<xsl:when test="child::eqpnotavail/trim.para">
									<xsl:apply-templates select="child::eqpnotavail/trim.para"/>
								</xsl:when>
								<xsl:otherwise>
									<fo:block/>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
				<xsl:if test="child::para/child::figure | child::specpara/child::para/child::figure">
					<fo:table-row>
						<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="5">
							<xsl:apply-templates select="child::para/figure | child::specpara/para/figure"/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- ELEMENTrandlist  PMCS TABLE-->
	<xsl:template match="randlist" mode="PMCSLIST">
		<xsl:variable name="StepLevel">
			<xsl:choose>
				<xsl:when test="ancestor::step6">5</xsl:when>
				<xsl:when test="ancestor::step5">4</xsl:when>
				<xsl:when test="ancestor::step4">3</xsl:when>
				<xsl:when test="ancestor::step3">2</xsl:when>
				<xsl:when test="ancestor::step2">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="ListLevel">
			<xsl:choose>
				<xsl:when test="../../../../../../../../../../item">6</xsl:when>
				<xsl:when test="../../../../../../../../item">5</xsl:when>
				<xsl:when test="../../../../../../item">4</xsl:when>
				<xsl:when test="../../../../item">3</xsl:when>
				<xsl:when test="../../item">2.5</xsl:when>
				<xsl:otherwise>2.0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<fo:block>
			<xsl:if test="not(ancestor::warning or ancestor::warning.group)">
				<xsl:attribute name="start-indent"><xsl:value-of disable-output-escaping="no" select="($StepLevel+$ListLevel)*15"/>pt</xsl:attribute>
				<xsl:apply-templates select="node()"/>
			</xsl:if>
		</fo:block>
		<xsl:if test="(ancestor::warning or ancestor::warning.group)">
			<fo:block font-weight="normal" space-after="6pt" space-before="12pt" space-before.conditionality="discard" span="all" display-align="center" text-align="inherit" end-indent="">
				<xsl:attribute name="end-indent">42pt</xsl:attribute>
				<xsl:attribute name="start-indent">34pt</xsl:attribute>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
