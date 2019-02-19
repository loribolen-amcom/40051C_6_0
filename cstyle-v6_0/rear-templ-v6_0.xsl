<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">
	
	<xsl:template match="rear">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	
  	<xsl:template match="pmi/pm.rear/glossary | pms/pm.rear/glossary">
			<xsl:call-template name="frntrear-rl"/>
	  </xsl:template>
	  
	  	<xsl:template match="destruction_manual/rear/glossary">
			<xsl:call-template name="frntrear-rl"/>
	  </xsl:template>
	  
	  <xsl:template match="ammo/rear/glossary">
			<xsl:call-template name="frntrear-rl"/>
	  </xsl:template>
	  
	  	  <xsl:template match="sam/rear/glossary">
			<xsl:call-template name="frntrear-rl"/>
	  </xsl:template>
	  
	  	  <xsl:template match="sum/rear/glossary">
			<xsl:call-template name="frntrear-rl"/>
	  </xsl:template>
	  
	  	  <xsl:template match="genmaintman/rear/glossary">
			<xsl:call-template name="frntrear-rl"/>
	  </xsl:template>
	  
	  	  <xsl:template match="bdar/rear/glossary">
			<xsl:call-template name="frntrear-rl"/>
	  </xsl:template>
	  

	<!-- index -->
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		match="paper.manual/rear/glossary">
		<xsl:call-template name="frntrear-rl"/>
	</xsl:template>

	<xsl:template match="rear/glossary/title">
		<fo:block text-align="center" space-after="1em" font-weight="bold" font-size="125%">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<!-- aindx -->
	<xsl:template match="paper.manual/rear/aindx">
				<xsl:call-template name="frntrear-rl"/>
	</xsl:template>
	
	<xsl:template match="genmaintman/rear/aindx">
		<xsl:call-template name="frntrear-rl"/>
	</xsl:template>
	

<xsl:template match="destruction_manual/rear/aindx">
		<xsl:call-template name="frntrear-rl"/>
	</xsl:template>

<xsl:template match="ammo/rear/aindx">
		<xsl:call-template name="frntrear-rl"/>
	</xsl:template>
	
	<xsl:template match="sam/rear/aindx">
		<xsl:call-template name="frntrear-rl"/>
	</xsl:template>
	<xsl:template match="sum/rear/aindx">
		<xsl:call-template name="frntrear-rl"/>
	</xsl:template>
	
		<xsl:template match="bdar/rear/aindx">
		<xsl:call-template name="frntrear-rl"/>
	</xsl:template>
	

	<xsl:template name="autogen-aindx">
<fo:block>
		<fo:table-and-caption>
			<fo:table>
				<fo:table-column column-width="100%"/>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell font-weight="bold" padding-before="0pt" padding-bottom="6pt"
							text-align="right">
							<fo:block>
								<fo:inline text-decoration="underline">Subject</fo:inline>
								<fo:leader leader-pattern="space"/>
								<fo:inline text-decoration="underline">WP Sequence No.&#x2013;Page
									No.</fo:inline>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<fo:table-row break-after="page" >
						<fo:table-cell>
							<xsl:choose>
								<xsl:when test="//indexentry">
									<xsl:apply-templates select="//indexentry | //alphaindx"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="GATHER-INDEXREF"/>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:table-and-caption>
</fo:block>
	
	</xsl:template>

	<!--
PROCEDURE GATHER-INDEXREF
Transform indexref elements into a XML data stream (see DTD aindx element). The XML stream requires sorting the index level and removing duplicate topics for each level. The procedure first transforms the indexref element and attributes to indexentry and children elements. The wpno element associates the parent WP identification number and stores in attribute wpref. The pageno element stores as the content the indexref generated unique ID name. The ID name is created from the generate-id(//indexref[1]) + the counter in the document.-->


	<xsl:template name="GATHER-INDEXREF">
		<xsl:variable name="IndexRef">
			<xsl:element name="pseudo-aindx">
				<xsl:for-each select="//indxref">
					<xsl:element name="indexentry">
						<xsl:element name="title">
							<xsl:value-of select="@ref1"/>
						</xsl:element>
						<xsl:choose>
							<xsl:when test="@ref2">
								<xsl:element name="indexentry">
									<xsl:element name="title">
										<xsl:value-of select="@ref2"/>
									</xsl:element>
									<xsl:choose>
										<xsl:when test="@ref3">
											<xsl:element name="indexentry">
												<xsl:element name="title">
												<xsl:value-of select="@ref3"/>
												</xsl:element>
												<xsl:choose>
												<xsl:when test="@ref4">
												<xsl:element name="indexentry">
												<xsl:element name="title">
												<xsl:value-of select="@ref4"/>
												</xsl:element>
												<xsl:if test="ancestor::*[@wpno]">
												<xsl:element name="wpno">
												<xsl:attribute name="wpref">
												<xsl:value-of select="ancestor::*[@wpno]/@wpno"/>
												</xsl:attribute>
												<xsl:call-template name="WPNO-TO-WPSEQ">
												<xsl:with-param name="WpRef"
												select="ancestor::*[@wpno]/@wpno"/>
												</xsl:call-template>
												</xsl:element>
												</xsl:if>
												<xsl:element name="pageno">
												<xsl:value-of select="$RefId"/>
												<xsl:value-of select="position()"/>
												</xsl:element>
												</xsl:element>
												</xsl:when>
												<xsl:otherwise>
												<xsl:if test="ancestor::*[@wpno]">
												<xsl:element name="wpno">
												<xsl:attribute name="wpref">
												<xsl:value-of select="ancestor::*[@wpno]/@wpno"/>
												</xsl:attribute>
												<xsl:call-template name="WPNO-TO-WPSEQ">
												<xsl:with-param name="WpRef"
												select="ancestor::*[@wpno]/@wpno"/>
												</xsl:call-template>
												</xsl:element>
												</xsl:if>
												<xsl:element name="pageno">
												<xsl:value-of select="$RefId"/>
												<xsl:value-of select="position()"/>
												</xsl:element>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:if test="ancestor::*[@wpno]">
												<xsl:element name="wpno">
												<xsl:attribute name="wpref">
												<xsl:value-of select="ancestor::*[@wpno]/@wpno"/>
												</xsl:attribute>
												<xsl:call-template name="WPNO-TO-WPSEQ">
												<xsl:with-param name="WpRef"
												select="ancestor::*[@wpno]/@wpno"/>
												</xsl:call-template>
												</xsl:element>
											</xsl:if>
											<xsl:element name="pageno">
												<xsl:value-of select="$RefId"/>
												<xsl:value-of select="position()"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="ancestor::*[@wpno]">
									<xsl:element name="wpno">
										<xsl:attribute name="wpref">
											<xsl:value-of select="ancestor::*[@wpno]/@wpno"/>
										</xsl:attribute>
										<xsl:call-template name="WPNO-TO-WPSEQ">
											<xsl:with-param name="WpRef"
												select="ancestor::*[@wpno]/@wpno"/>
										</xsl:call-template>
									</xsl:element>
								</xsl:if>
								<xsl:element name="pageno">
									<xsl:value-of select="$RefId"/>
									<xsl:number count="//indxref" from="//paper.manual" level="any"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
		</xsl:variable>
		<xsl:apply-templates mode="IndexSortLevel1" select="$IndexRef"/>
	</xsl:template>
	<!--
ROOT NODE to AUTO-GENERATE INDEX 
Applies the element gathered from indexref elements and present them in the same method as manually entered index.-->
	<xsl:template match="/" mode="GENERATE-INDEX">
		<xsl:apply-templates select="//indexentry">
			<xsl:with-param name="Generate-Alpha">YES</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>


	<xsl:template match="aindx/title">
		<fo:block text-align="center" space-before="3cm" space-after="1em" font-size="125%"
			font-weight="bold">
			<xsl:apply-templates/>
		</fo:block>
		<fo:block span="all" text-align="left" text-align-last="right" space-before="1em"
			font-weight="bold" text-decoration="underline"> Subject<fo:leader leader-pattern="space"/>
			<fo:inline text-align="right" text-align-last="end" text-decoration="underline">WP Sequence No.-Page No.</fo:inline>
		</fo:block>
	</xsl:template>
	<!-- The Alpha Character "A" goes here and center -->
	<xsl:template match="aindx/alphaindx">
		<fo:block text-align="center" space-before="1em" font-size="125%" font-weight="bold">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>


	<xsl:template match="indexentry">
		<xsl:choose>
			<xsl:when test="wpno | pageno">
				<fo:block text-align="left" break-after="page">
					<xsl:value-of select="title"/>
					<xsl:text> </xsl:text>
					<fo:leader leader-pattern="dots"/>
					<xsl:if test="wpno">
						<fo:inline text-transform="uppercase" text-align="right">
							<xsl:text>WP&#x2002;</xsl:text>
							<xsl:apply-templates select="wpno"/>
						</fo:inline>
					</xsl:if>
					<xsl:apply-templates select="pageno"/>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:block text-align="left" text-indent="0pt">
					<xsl:value-of select="title"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="indexentry/indexentry">
		<xsl:choose>
			<xsl:when test="wpno | pageno">
				<fo:block text-align="inherit" text-indent="20pt" start-indent="1em">
					<xsl:value-of select="title"/>
					<xsl:text> </xsl:text>
					<fo:leader leader-pattern="dots"/>
					<xsl:if test="wpno">
						<fo:inline text-transform="uppercase" text-align="right">
							<xsl:text>WP&#x2002;</xsl:text>
							<xsl:apply-templates select="wpno"/>
						</fo:inline>
					</xsl:if>
					<xsl:apply-templates select="pageno"/>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:block text-align="left" text-indent="5pt">
					<xsl:value-of select="title"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="aindx//wpno">
		<xsl:if test="preceding-sibling::pageno">, </xsl:if>
		<fo:basic-link internal-destination="{@wpref}">
			<xsl:call-template name="WPNO-TO-WPSEQ">
				<xsl:with-param name="WpRef" select="@wpref"/>
			</xsl:call-template>
		</fo:basic-link>
		<xsl:text>&#x2013;</xsl:text>
	</xsl:template>
	<xsl:template match="pseudo-aindx//wpno">
		<xsl:if test="preceding-sibling::pageno">, </xsl:if>
		<fo:basic-link internal-destination="{@wpref}">
			<xsl:apply-templates/>
		</fo:basic-link>
		<xsl:text>&#x2013;</xsl:text>
	</xsl:template>

	<xsl:template name="WPNO-TO-WPSEQ">
		<xsl:param name="WpRef"/>
		<xsl:for-each select="//wpidinfo">
			<xsl:if test="parent::*[@wpno=$WpRef]">
				<xsl:choose>
					<xsl:when test="../@wpseq">
						<xsl:value-of select="../@wpseq"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:number count="wpidinfo" format="0000" from="paper.manual" level="any"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="aindx//pageno">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="pseudo-aindx//pageno">
		<fo:page-number-citation>
			<xsl:attribute name="ref-id">
				<xsl:apply-templates/>
			</xsl:attribute>
		</fo:page-number-citation>
		<xsl:if test="contains('pageno|wpno',following-sibling::node()[1]) and following-sibling::node()[1]!=''">, </xsl:if>
	</xsl:template>
<!-- | paper.manual/rear/blank_form-->
	<xsl:template match="rear/da2028">
		<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt"
			force-page-count="end-on-even" format="1" hyphenate="true" initial-page-number="1"
			language="en" line-height="1.15em" master-reference="impg" text-align="left">
			<fo:static-content flow-name="xsl-region-before">
				<fo:block text-align="center">
					<xsl:call-template name="output_first_tmno"/>
				</fo:block>
				<fo:block text-align="justify">
					<fo:leader leader-pattern="rule" leader-length="100%"/>
				</fo:block>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after">
				<fo:block text-align-last="center">
					<fo:page-number/>
				</fo:block>
			</fo:static-content>
			<fo:flow flow-name="xsl-region-body">
			<fo:wrapper font-family="sans-serif" font-size="10pt">
				<fo:block span="all" text-align="right">
					<xsl:apply-templates/>
				</fo:block>
				</fo:wrapper>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>

	<xsl:template match="dmwr_ammo/rear/da2028 | dmwr_ammo/rear/blank_form">
		<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt"
			force-page-count="end-on-even" format="1" hyphenate="true" initial-page-number="1"
			language="en" line-height="1.15em" master-reference="impg" text-align="left">
			<fo:static-content flow-name="xsl-region-before">
				<fo:block text-align="center">
					<xsl:call-template name="output_first_tmno"/>
				</fo:block>
				<fo:block text-align="justify">
					<fo:leader leader-pattern="rule" leader-length="100%"/>
				</fo:block>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after">
				<fo:block text-align-last="center">
					<fo:page-number/>
				</fo:block>
			</fo:static-content>
			<fo:flow flow-name="xsl-region-body">
				<fo:block span="all" text-align="center">
					<xsl:apply-templates/>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>

	<xsl:template match="rear/authent[@boardno]" name="rearauthent">
		<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt"
			force-page-count="end-on-even" format="1" hyphenate="true" initial-page-number="1"
			language="en" line-height="1.15em" master-reference="impg" text-align="left">
			<fo:static-content flow-name="xsl-region-before">
				<fo:block text-align="center">
					<xsl:call-template name="output_first_tmno"/>
				</fo:block>
				<fo:block text-align="justify">
					<fo:leader leader-pattern="rule" leader-length="100%"/>
				</fo:block>
				<fo:table space-after="1mm">
					<fo:table-column column-number="1" column-width="33.333%"/>
					<fo:table-column column-number="2" column-width="33.333%"/>
					<fo:table-column column-number="3" column-width="33.333%"/>
					<fo:table-body>
						<fo:table-row vertical-align="top">
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
							<fo:table-cell>
							<fo:block >
								<xsl:apply-templates select="tmno"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<!--<fo:block border-bottom-width="0.01pt" border-bottom-style="solid"/>-->
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after">
				<fo:block text-align-last="center">
					<fo:page-number/>
				</fo:block>
			</fo:static-content>
			<fo:flow flow-name="xsl-region-body">
				<fo:block-container space-after="0.25in" id="{generate-id(.)}"
					display-align="center" text-align="center" break-before="page">
					<fo:block space-before.maximum="10pt" space-before.minimum="8pt"
						space-before.optimum="8pt" span="all">
						<fo:external-graphic>
							<xsl:attribute name="src">
								<xsl:call-template name="substring-after-last">
									<xsl:with-param name="str"
										select="unparsed-entity-uri(@boardno)"/>
								</xsl:call-template>
							</xsl:attribute>
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
							</xsl:choose>
						</fo:external-graphic>
					</fo:block>
				</fo:block-container>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>

	<xsl:template match="lubeorder_rear">
		<xsl:apply-templates select="node()"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="lubeorder_rear/authent[@boardno]">
		<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt"
			force-page-count="end-on-even" format="1" hyphenate="true" initial-page-number="1"
			language="en" line-height="1.15em" master-reference="impg" text-align="left">
			<fo:static-content flow-name="xsl-region-before">
				<fo:block text-align="center">
					<xsl:call-template name="output_first_tmno"/>
				</fo:block>
				<fo:block text-align="justify">
					<fo:leader leader-pattern="rule" leader-length="100%"/>
				</fo:block>
				<fo:table space-after="1mm">
					<fo:table-column column-number="1" column-width="33.333%"/>
					<fo:table-column column-number="2" column-width="33.333%"/>
					<fo:table-column column-number="3" column-width="33.333%"/>
					<fo:table-body>
						<fo:table-row vertical-align="top">
							<fo:table-cell/>
							<fo:table-cell>
								<xsl:apply-templates select="tmno"/>
							</fo:table-cell>
							<fo:table-cell> </fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<!--<fo:block border-bottom-width="0.01pt" border-bottom-style="solid"/>-->
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after">
				<fo:block text-align-last="center">
					<fo:page-number/>
				</fo:block>
			</fo:static-content>
			<fo:flow flow-name="xsl-region-body">
				<fo:block-container space-after="0.25in" id="{generate-id(.)}"
					display-align="center" text-align="center" break-before="page">
					<fo:block space-before.maximum="10pt" space-before.minimum="8pt"
						space-before.optimum="8pt" span="all">
						<fo:external-graphic>
							<xsl:attribute name="src">
								<xsl:call-template name="substring-after-last">
									<xsl:with-param name="str"
										select="unparsed-entity-uri(@boardno)"/>
								</xsl:call-template>
							</xsl:attribute>
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
							</xsl:choose>
						</fo:external-graphic>
					</fo:block>
				</fo:block-container>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>

	<xsl:template match="back[@boardno]" name="back">
				<fo:page-sequence master-reference="impg" initial-page-number="1"
					force-page-count="no-force" language="en" line-height="1.15em"
					font-family="sans-serif" font-size="10pt" hyphenate="false">
					<fo:static-content flow-name="xsl-region-before">
						<fo:table space-after="1mm">
							<fo:table-column column-number="1" column-width="33.333%"/>
							<fo:table-column column-number="2" column-width="33.333%"/>
							<fo:table-column column-number="3" column-width="33.333%"/>
							<fo:table-body>
								<fo:table-row vertical-align="top">
									<fo:table-cell>
										<fo:block></fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center"
											keep-together.within-line="always">
											<xsl:value-of select="//paper.manual//tmno"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block></fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
						<!--<fo:block border-bottom-width="0.01pt" border-bottom-style="solid"/>-->
					</fo:static-content>

					<fo:static-content flow-name="xsl-region-after"> <fo:block></fo:block></fo:static-content>

					<fo:static-content flow-name="xsl-region-body-blank">
						<fo:block margin-top="3.5in" text-align="center">This page intentionally
							left blank</fo:block>
					</fo:static-content>

					<fo:flow flow-name="xsl-region-body">
						<fo:block-container space-after="0.25in" id="{generate-id(.)}"
							display-align="center" text-align="center" break-before="page">
							<fo:block space-before.maximum="10pt" space-before.minimum="8pt"
								space-before.optimum="8pt" span="all">
								<fo:external-graphic>
									<xsl:attribute name="src">
										<xsl:call-template name="substring-after-last">
											<xsl:with-param name="str"
												select="unparsed-entity-uri(@boardno)"/>
										</xsl:call-template>
									</xsl:attribute>
									<xsl:if test="@reprowid and @reprodep">
										<xsl:attribute name="scaling">non-uniform</xsl:attribute>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="@reprowid">
											<xsl:apply-templates mode="graphic-attribute"
												select="@reprowid"/>
										</xsl:when>
										<xsl:when test="@reprodep">
											<xsl:apply-templates mode="graphic-attribute"
												select="@reprodep"/>
										</xsl:when>
										<xsl:when test="@hscale">
											<xsl:apply-templates mode="graphic-attribute"
												select="@hscale"/>
										</xsl:when>
										<xsl:when test="@vscale">
											<xsl:apply-templates mode="graphic-attribute"
												select="@vscale"/>
										</xsl:when>
									</xsl:choose>
								</fo:external-graphic>
							</fo:block>
						</fo:block-container>
					</fo:flow>
				</fo:page-sequence>
			<!--</xsl:otherwise>
		</xsl:choose>-->

	</xsl:template>

	<xsl:template name="output_first_tmno">
		<xsl:choose>
			<xsl:when
				test="/production/paper.manual/paper.frnt/frntcover/tmtitle/tminfono/servbranch/@service='army'">
				<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
				</fo:block>
				<fo:block xsl:use-attribute-sets="tmno-header-attrs">
					<xsl:value-of select="$tmnotxt"/>
				</fo:block>
				<fo:block xsl:use-attribute-sets="tmno-header-attrs">
					<xsl:value-of select="/production/paper.manual/paper.frnt/frntcover/tmtitle/tminfono/tmno"/>
				</fo:block>
			</xsl:when>
			<xsl:when
				test="/production/paper.manual/paper.frnt/frntcover/tmtitle/tminfono/servbranch/@service='af'">
				<fo:block>
					<xsl:text>TO </xsl:text>
					<xsl:value-of
						select="/production/paper.manual/paper.frnt/frntcover/tmtitle/tminfono/tmno"
					/>
				</fo:block>
			</xsl:when>
			<xsl:when
				test="/production/paper.manual/paper.frnt/frntcover/tmtitle/tminfono/servbranch/@service='navy'">
				<fo:block>
					<xsl:text>TM </xsl:text>
					<xsl:value-of
						select="/production/paper.manual/paper.frnt/frntcover/tmtitle/tminfono/tmno"
					/>
				</fo:block>
			</xsl:when>
			<xsl:when
				test="/production/paper.manual/paper.frnt/frntcover/tmtitle/tminfono/servbranch/@service='marines'">
				<fo:block>
					<xsl:text>TM </xsl:text>
					<xsl:value-of select="/production/paper.manual/paper.frnt/frntcover/tmtitle/tminfono/tmno"/>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>

				<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
				</fo:block>
				<fo:block xsl:use-attribute-sets="tmno-header-attrs">
					<xsl:value-of select="$tmnotxt"/>
				</fo:block>
				<fo:block xsl:use-attribute-sets="tmno-header-attrs">
					<xsl:value-of
						select="/production/paper.manual/paper.frnt/frntcover/tmtitle/tmno"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
		<fo:block text-align="justify">
			<fo:leader leader-pattern="rule" leader-length="100%"/>
		</fo:block>
	</xsl:template>


	<xsl:template match="/" mode="IndexSortLevel1">
		<xsl:variable name="IndexRefSortLevel1">
			<xsl:element name="pseudo-aindx">
				<xsl:apply-templates mode="IndexSortLevel1" select="//indexentry">
					<xsl:sort select="title"/>
				</xsl:apply-templates>
			</xsl:element>
		</xsl:variable>
		<xsl:apply-templates mode="IndexDuplicateLevel1" select="$IndexRefSortLevel1"/>
	</xsl:template>
	<!-- COPY CHILDREN FOR SORT LEVEL 1-->
	<xsl:template match="indexentry" mode="IndexSortLevel1">
		<xsl:copy>
			<xsl:apply-templates mode="Copy"/>
		</xsl:copy>
	</xsl:template>
	<!--INDEX SORT LEVEL 2
Sorts the sub-entry1 topics. -->
	<xsl:template match="/" mode="IndexSortLevel2">
		<xsl:variable name="IndexRefSortLevel2">
			<xsl:element name="pseudo-aindx">
				<xsl:apply-templates mode="IndexSortLevel2" select="//indexentry"/>
			</xsl:element>
		</xsl:variable>
		<xsl:apply-templates mode="IndexDuplicateLevel2" select="$IndexRefSortLevel2"/>
	</xsl:template>
	<!--COPY FOR indexentry
Sorts the sub-entry1 topics. -->
	<xsl:template match="indexentry" mode="IndexSortLevel2">
		<xsl:element name="indexentry">
			<xsl:apply-templates mode="Copy" select="title | wpno | pageno"> </xsl:apply-templates>
			<xsl:apply-templates mode="IndexSortLevel2" select="title">
				<xsl:sort select="title"/>
			</xsl:apply-templates>
		</xsl:element>
	</xsl:template>
	<!--COPY FOR sub-entry1-->
	<xsl:template match="title" mode="IndexSortLevel2">
		<xsl:copy>
			<xsl:apply-templates mode="Copy"/>
		</xsl:copy>
	</xsl:template>
	<!--INDEX SORT LEVEL 3
Sorts the sub-entry2 topics. -->
	<xsl:template match="/" mode="IndexSortLevel3">
		<xsl:variable name="IndexRefSortLevel3">
			<xsl:element name="pseudo-aindx">
				<xsl:apply-templates mode="IndexSortLevel3" select="//indexentry"/>
			</xsl:element>
		</xsl:variable>
		<xsl:apply-templates mode="IndexDuplicateLevel3" select="$IndexRefSortLevel3"/>
	</xsl:template>
	<!--COPY FOR indexentry-->
	<xsl:template match="indexentry" mode="IndexSortLevel3">
		<xsl:element name="indexentry">
			<xsl:apply-templates mode="Copy" select="title | wpno | pageno"/>
			<xsl:apply-templates mode="IndexSortLevel3" select="title"/>
		</xsl:element>
	</xsl:template>
	<!--COPY FOR sub-entry1-->
	<xsl:template match="title" mode="IndexSortLevel3">
		<xsl:copy>
			<xsl:apply-templates mode="Copy" select="title | wpno | pageno"/>
			<xsl:apply-templates mode="IndexSortLevel3" select="title">
				<xsl:sort select="title"/>
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>
	<!--COPY FOR sub-entry2-->
	<!--	<xsl:template match="sub-entry2" mode="IndexSortLevel3">
		<?Pub Dtl?>
		<xsl:copy>
			<xsl:apply-templates mode="Copy"/>
		</xsl:copy>
	</xsl:template> -->
	<!--INDEX SORT LEVEL 4
Sorts the sub-entry3 topics. -->
	<!---->
	<xsl:template match="/" mode="IndexSortLevel4">
		<xsl:variable name="IndexRefSortLevel4">
			<xsl:element name="pseudo-aindx">
				<xsl:apply-templates mode="IndexSortLevel4" select="//indexentry"/>
			</xsl:element>
		</xsl:variable>
		<xsl:apply-templates mode="IndexDuplicateLevel4" select="$IndexRefSortLevel4"/>
	</xsl:template>
	<!--COPY FOR indexentry-->
	<xsl:template match="indexentry" mode="IndexSortLevel4">
		<xsl:element name="indexentry">
			<xsl:apply-templates mode="Copy" select="title | wpno | pageno"/>
			<xsl:apply-templates mode="IndexSortLevel4" select="indexentry"/>
		</xsl:element>
	</xsl:template>
	<!--COPY FOR sub-entry1
	<xsl:template match="sub-entry1" mode="IndexSortLevel4">
		<?Pub Dtl?>
		<xsl:copy>
			<xsl:apply-templates mode="Copy" select="title | wpno | pageno"/>
			<xsl:apply-templates mode="IndexSortLevel4" select="indexentry"/>
		</xsl:copy>
	</xsl:template>-->
	<!--COPY FOR sub-entry2
	<xsl:template match="sub-entry2" mode="IndexSortLevel4">
		<?Pub Dtl?>
		<xsl:copy>
			<xsl:apply-templates mode="Copy" select="topic | wpno | pageno"/>
			<xsl:apply-templates mode="IndexSortLevel4" select="sub-entry3">
				<xsl:sort select="topic"/>
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>-->
	<!--COPY FOR sub-entry3
	<xsl:template match="sub-entry3" mode="IndexSortLevel4">
		<?Pub Dtl?>
		<xsl:copy>
			<xsl:apply-templates mode="Copy"/>
		</xsl:copy>
	</xsl:template>-->
	<!--REMOVE DUPLICATE TTITLE LEVEL 1
Removes duplicate topics at the same level and combines the page number and subtopics.
Copies the previous nodes already combined. Checks the previous level topic name against the current topic name. If topics are different
THEN
   1. Start new index entry 
   2. Copy wpno and pageno for the current and following duplicate topics
   3. Copy subtopics for the current and following duplicate topics
ELSE Skip the topic (since duplicate topic and already processed)
After processing current index entry then process the following-sibling index entry-->
	<xsl:template match="/" mode="IndexDuplicateLevel1">
		<xsl:variable name="IndexRefDuplicateLevel1">
			<xsl:element name="pseudo-aindx">
				<xsl:apply-templates mode="IndexDuplicateLevel1" select="//indexentry[1]"
				> </xsl:apply-templates>
			</xsl:element>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="//title">
				<xsl:apply-templates mode="IndexSortLevel2" select="$IndexRefDuplicateLevel1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="GENERATE-INDEX" select="$IndexRefDuplicateLevel1"
				> </xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="indexentry" mode="IndexDuplicateLevel1">
		<xsl:variable name="Title" select="title"/>
		<xsl:if test="preceding-sibling::indexentry[1]/title!=$Title">
			<xsl:copy>
				<xsl:apply-templates mode="Copy" select="title | wpno | pageno"/>
				<xsl:apply-templates mode="SameTopicForPage" select="following-sibling::indexentry">
					<xsl:with-param name="Title" select="$Title"/>
				</xsl:apply-templates>
				<xsl:apply-templates mode="Copy" select="title"> </xsl:apply-templates>
				<xsl:apply-templates mode="SameTopicForChildern"
					select="following-sibling::indexentry">
					<xsl:with-param name="Title" select="$Title"/>
				</xsl:apply-templates>
			</xsl:copy>
		</xsl:if>
		<xsl:apply-templates mode="IndexDuplicateLevel1" select="following-sibling::indexentry[1]"/>
	</xsl:template>

	<xsl:template match="/" mode="IndexDuplicateLevel4">
		<xsl:variable name="IndexRefDuplicateLevel4">
			<xsl:element name="pseudo-aindx">
				<xsl:apply-templates mode="IndexDuplicateLevel4" select="//indexentry"
				> </xsl:apply-templates>
			</xsl:element>
		</xsl:variable>
		<xsl:apply-templates mode="GENERATE-INDEX" select="$IndexRefDuplicateLevel4"/>
	</xsl:template>
	<xsl:template match="indexentry" mode="IndexDuplicateLevel4">
		<xsl:copy>
			<xsl:apply-templates mode="Copy" select="title | wpno | pageno"/>
			<xsl:apply-templates mode="IndexDuplicateLevel4" select="title"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="sub-entry1" mode="IndexDuplicateLevel4">
		<xsl:copy>
			<xsl:apply-templates mode="Copy" select="title | wpno | pageno"/>
			<xsl:apply-templates mode="IndexDuplicateLevel4" select="indexentry"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="sub-entry2" mode="IndexDuplicateLevel4">
		<xsl:copy>
			<xsl:apply-templates mode="Copy" select="title | wpno | pageno"/>
			<xsl:apply-templates mode="IndexDuplicateLevel4" select="indexentry[1]"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="sub-entry3" mode="IndexDuplicateLevel4">
		<xsl:variable name="Title" select="title"/>
		<xsl:if
			test="preceding-sibling::sub-entry3[1]/title!=$Title  or count(preceding-sibling::indexentry)=0">
			<xsl:copy>
				<xsl:apply-templates mode="Copy" select="title | wpno | pageno"/>
				<xsl:apply-templates mode="SameTopicForPage" select="following-sibling::indexentry">
					<xsl:with-param name="Title" select="$Title"/>
				</xsl:apply-templates>
			</xsl:copy>
		</xsl:if>
		<xsl:apply-templates mode="IndexDuplicateLevel4" select="following-sibling::indexentry[1]"/>
	</xsl:template>
	<!--
MODE SameTopicForPage
The mode copies the wpno and pageno elements
-->
	<xsl:template match="indexentry | indexentry/indexentry" mode="SameTopicForPage">

		<xsl:param name="Title"/>
		<xsl:if test="$Title=title">
			<xsl:apply-templates mode="Copy" select="wpno | pageno"> </xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	<!--
MODE SameTopicForSubTopic
The mode copies the subtopic and children elements
-->
	<xsl:template match="indexentry | indexentry/indexentry" mode="SameTopicForChildern">
		<xsl:param name="Title"/>
		<xsl:if test="$Title=title">
			<xsl:apply-templates mode="Copy" select="indexentry"> </xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	<!--
MODE COPY
The following modes copies itself for next level sorting.
-->
	<xsl:template match="title" mode="Copy">
		<xsl:element name="title">
			<xsl:apply-templates> </xsl:apply-templates>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pageno" mode="Copy">
		<xsl:element name="pageno">
			<xsl:apply-templates> </xsl:apply-templates>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
