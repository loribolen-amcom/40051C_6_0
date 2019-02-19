<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--
ELEMENT surwp
-->
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="surwp">
		<xsl:call-template name="wp-pageset"> </xsl:call-template>
	</xsl:template>
	<!--
ELEMENT surtsk
-->
	<xsl:template match="surtsk">
		<xsl:apply-templates select="siting | shltr |  preserv | precal | install | prechkadj | calign | surmat | ammo.handling | mark | ammo.defect | arm | other.surtsk | followon.maintsk"/>
		<fo:block text-align="left" font-weight="bold" keep-with-previous="1" font-family="sans-serif"
           space-before=".2in" space-before.conditionality="retain" space-after=".2in" space-after.conditionality="retain">
          END OF TASK</fo:block>
	</xsl:template>

	<!--
ELEMENT siting
-->
	<xsl:template match="siting">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">SITING</fo:block>	
				<xsl:apply-templates/>
	</xsl:template>
	
	
	<!--
ELEMENT shltr
-->
	<xsl:template match="shltr">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">SHELTER REQUIREMENT</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<!--
ELEMENT mark - see maintwp.xsl -->
	<!--
ELEMENT surmat
-->
	<xsl:template match="surmat">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">SERVICE UPON RECEIPT OF MATERIEL</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<!--
ELEMENT unpack See maintwp
	-->
	<!--
ELEMENT processeqp
-->
	<xsl:template match="processeqp">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">PROCESSING UNPACKED EQUIPMENT</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<!--
ELEMENT chkeqp
-->
	<xsl:template match="chkeqp">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">CHECKING UNPACKED EQUIPMENT</fo:block>
			<xsl:apply-templates/>
	</xsl:template>
	<!--
ELEMENT install See maintwp
-->

	<!--
ELEMENT preserv See Maintwp
-->
<!--
ELEMENT prechkadj
-->
	<xsl:template match="prechkadj">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">PRELIMINARY CHECKS AND ADJUSTMENT OF EQUIPMENT</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<!--
ELEMENT precal
-->
	<xsl:template match="precal">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">PRELIMINARY CALIBRATION OF EQUIPMENT</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<!--
ELEMENT calign
-->
	<xsl:template match="calign">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">CIRCUIT ALIGNMENT</fo:block>
				<xsl:apply-templates select="extconn | setconn |  alignproc"> </xsl:apply-templates>
	</xsl:template>
	<!--
ELEMENT extconn
-->
	<xsl:template match="extconn">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">External Connections</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	<!--
ELEMENT setconn
-->
	<xsl:template match="setconn">
			<fo:block span="all" xsl:use-attribute-sets="titlesub">Switch Settings, Patch Panel Connections, and	Internal Control Settings</fo:block>	
		<xsl:apply-templates/>
	</xsl:template>
	<!--
ELEMENT alignproc
-->
	<xsl:template match="alignproc">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">Alignment Procedures</fo:block>	
		<xsl:apply-templates/>
	</xsl:template>
	<!--
ELEMENT crit.insp.tab
-->
	<xsl:template match="crit.insp.tab">
	<fo:block span="all" id="{generate-id(.)}">
			<fo:table-and-caption caption-side="before">
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" text-transform="capitalize">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="table | crit.insp.tab | pecul.insp.tab" format="1." from="surwp" level="single"/>
						<xsl:text disable-output-escaping="no">&#x2002;&#x2002;</xsl:text>
						<xsl:value-of disable-output-escaping="no" select="title"/>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-before="12pt" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" id="{generate-id(.)}" width="7in">
					<fo:table-column column-number="1" column-width="25%"/>
					<fo:table-column column-number="2" column-width="25%"/>
					<fo:table-column column-number="3" column-width="25%"/>
					<fo:table-column column-number="4" column-width="25%"/>
					<xsl:call-template name="CRIT.INSP.TAB-HEADER"/>
					<fo:table-body>
						<xsl:apply-templates select="crit.insp-group"/>
						<!--<xsl:apply-templates select="node()"/>-->
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
	</fo:block>
	</xsl:template>
	<xsl:template name="CRIT.INSP.TAB-HEADER">
		<fo:table-header>
			<fo:table-row font-weight="bold" text-align="center" keep-together.within-page="always">
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="1" padding-bottom="4pt" padding-top="4pt">
					<fo:block span="all">
						<fo:block space-after="4pt" space-before="4pt">
							<xsl:text disable-output-escaping="no">COMPONENT</xsl:text>
						</fo:block>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block space-after="4pt" space-before="4pt">
						<xsl:text disable-output-escaping="no">ACCEPTABLE</xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="3" padding-bottom="4pt" padding-top="4pt">
					<fo:block space-after="4pt" space-before="4pt">
						<xsl:text disable-output-escaping="no">REPAIRABLE</xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block space-after="4pt" space-before="4pt">
						<xsl:text disable-output-escaping="no">NONREPAIRABLE</xsl:text>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<!--
ELEMENT eqpitem
-->

	<xsl:template match="crit.insp-group">
		<fo:table-row>
			<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-top="solid" border-top-width=".75pt" number-columns-spanned="4" padding-bottom="8pt" padding-top="8pt" text-align="center">
				<fo:block font-weight="bold" margin-bottom="6pt" margin-top="6pt">
					<xsl:value-of disable-output-escaping="no" select="eqpitem[1]"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:apply-templates select="compnt-assem-entry"/>
	</xsl:template>
	
	<!--
ELEMENT compnt-assem-entry
-->
	<xsl:template match="compnt-assem-entry">
		<fo:table-row>
		<fo:table-cell column-number="1" border-bottom="solid" border-bottom-width=".5pt" border-top="solid" border-top-width=".75pt" padding-bottom="8pt" padding-top="8pt" border-right="solid" border-right-width=".5pt" >
				<fo:block font-weight="bold" margin-bottom="6pt" margin-top="6pt">
					<xsl:value-of select="./eqpitem"/>
				</fo:block>
			</fo:table-cell>
			<xsl:apply-templates select="accpt-rpbl-nonrpbl-entry[1]"/>
		</fo:table-row>
		<xsl:apply-templates select="accpt-rpbl-nonrpbl-entry[position()>1]"/>
	</xsl:template>
	<!--
ELEMENT accp-rpbl-nonrpbl-entry/nonrepairable 1st
-->
	<xsl:template match="accpt-rpbl-nonrpbl-entry[1]">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<!--
ELEMENT accp-rpbl-nonrpbl-entry 2 or more
-->
	<xsl:template match="accpt-rpbl-nonrpbl-entry[position()>1]">
		<fo:table-row>
			<fo:table-cell border-right="solid" border-right-width=".5pt" column-number="1" padding-bottom="6pt" padding-top="3pt" border-bottom="solid" border-bottom-width=".5pt">
				<fo:block>&#x2002;</fo:block>
			</fo:table-cell>
			<xsl:apply-templates select="node()"/>
		</fo:table-row>
	</xsl:template>
	<!--
ELEMENT accp-rpbl-nonrpbl/accept
-->
	<xsl:template match="accpt-rpbl-nonrpbl-entry/accept">
		<fo:table-cell border-right="solid" border-right-width=".5pt" column-number="2" padding-bottom="6pt" padding-top="3pt" border-bottom="solid" border-bottom-width=".5pt">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT accp-rpbl-nonrpbl/repairable
-->
	<xsl:template match="accpt-rpbl-nonrpbl-entry/repairable">
		<fo:table-cell border-right="solid" border-right-width=".5pt" column-number="3" padding-bottom="6pt" padding-top="3pt" border-bottom="solid" border-bottom-width=".5pt">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT accp-rpbl-nonrpbl/nonrepairable
-->
	<xsl:template match="accpt-rpbl-nonrpbl-entry/nonrepairable">
		<fo:table-cell border-right="solid" border-right-width=".5pt" column-number="4" padding-bottom="6pt" padding-top="3pt" border-bottom="solid" border-bottom-width=".5pt">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT pecul.insp.tab
-->
	<xsl:template match="pecul.insp.tab">
	<fo:block span="all" id="{generate-id(.)}">
			<fo:table-and-caption caption-side="before" hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" text-transform="capitalize">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="table | crit.insp.tab | pecul.insp.tab" format="1." from="surwp" level="single"/>
						<xsl:text disable-output-escaping="no">&#x2002;&#x2002;</xsl:text>
						<xsl:value-of disable-output-escaping="no" select="title"/>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-before="12pt" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" id="{generate-id(.)}" width="7in">
					<fo:table-column column-number="1" column-width="15%"/>
					<fo:table-column column-number="2" column-width="20%"/>
					<fo:table-column column-number="3" column-width="40%"/>
					<fo:table-column column-number="4" column-width="25%"/>
					<xsl:call-template name="PECUL.INSP.TAB-HEADER"/>
					<fo:table-body>
						<xsl:apply-templates select="pecul.insp-group"/>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
</fo:block>
	</xsl:template>
	<xsl:template name="PECUL.INSP.TAB-HEADER">
		<fo:table-header>
			<fo:table-row font-weight="bold" text-align="center" keep-together.within-page="always">
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="1" padding-bottom="4pt" padding-top="4pt">
					<fo:block span="all">
						<fo:block space-after="4pt" space-before="4pt">
							<xsl:text disable-output-escaping="no">LOCATION</xsl:text>
						</fo:block>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block space-after="4pt" space-before="4pt">
						<xsl:text disable-output-escaping="no">ITEM</xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="3" padding-bottom="4pt" padding-top="4pt">
					<fo:block space-after="4pt" space-before="4pt">
						<xsl:text disable-output-escaping="no">ACTION</xsl:text>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block space-after="4pt" space-before="4pt">
						<xsl:text disable-output-escaping="no">REMARKS</xsl:text>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<xsl:template match="pecul.insp-group">
		<fo:table-row>
			<fo:table-cell border-right="solid" border-right-width=".5pt" padding-top="6pt" border-bottom="solid" border-bottom-width=".5pt">
				<fo:block>
					<xsl:value-of select="compassem/name"/>
				</fo:block>
			</fo:table-cell>
			<xsl:apply-templates select="pecul.insp-entry/eqpitem"/>
			<xsl:call-template name="peculsteprow"/>
		</fo:table-row>
<!--		<xsl:if test="child::figure | child::table">
					<fo:table-row>
						<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="4">
							<xsl:apply-templates select="child::figure | child::table"/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>-->
	</xsl:template>
	<!--
ELEMENT pecul.insp-entry/location

-->
	<xsl:template name="peculsteprow">
	<xsl:if test="pecul.insp-entry/figure | pecul.insp-entry/table">
					<fo:table-row>
						<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="4">
							<xsl:apply-templates select="pecul.insp-entry/figure | pecul.insp-entry/table"/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
		<xsl:for-each select="pecul.insp-entry">
			<fo:table-cell border-right="solid" border-right-width=".5pt" column-number="3" padding-top="6pt" margin="3pt" border-bottom="solid" border-bottom-width=".5pt">
				<fo:block>
					<xsl:apply-templates select="pecul.step-entry/step1" mode="Pecul"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" padding-top="6pt">
				<fo:block>
					<xsl:apply-templates select="pecul.step-entry/remarks"/>
				</fo:block>
			</fo:table-cell>
		</xsl:for-each>
		
	</xsl:template>
	<!--  
ELEMENT pecul.insp-entry
-->
	<xsl:template match="pecul.insp-entry">
	<fo:table-row>
						<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="4">
							<xsl:apply-templates select="figure | table"/>
						</fo:table-cell>
					</fo:table-row>
		<xsl:apply-templates select="eqpitem | pecul.step-entry[1]"/>
		
	</xsl:template>
	<!-- 
ELEMENT pecul.insp-entry/item
-->
	<xsl:template match="pecul.insp-entry/eqpitem">
		<fo:table-cell border-right="solid" border-right-width=".5pt" column-number="2" padding-top="6pt" border-bottom="solid" border-bottom-width=".5pt">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
		<xsl:if test="child::figure | child::table">
					<fo:table-row>
						<fo:table-cell padding-top="12pt" padding-bottom="12pt" column-number="1" number-columns-spanned="4">
							<xsl:apply-templates select="child::figure | child::table"/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:if>
		<xsl:apply-templates select="pecul.step-entry[1][position()>1]"/>
	</xsl:template>
	<!--
ELEMENT step1-entry 1st
	-->

	<xsl:template match="pecul.insp-entry[position()>1]">
		<fo:table-row>
			<fo:table-cell border-right="solid" border-right-width=".5pt" column-number="1" padding-top="6pt">
				<fo:block>&#x2002;</fo:block>
			</fo:table-cell>
			<fo:table-cell border-right="solid" border-right-width=".5pt" column-number="2" padding-top="6pt">
				<fo:block>&#x2002;</fo:block>
			</fo:table-cell>
			<fo:table-cell border-right="solid" border-right-width=".5pt" column-number="3" padding-top="6pt">
				<fo:block>
					<xsl:apply-templates mode="Pecul"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border-right="solid" border-right-width=".5pt" column-number="4" padding-top="6pt">
				<fo:block>
					<xsl:apply-templates select="remarks"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		
	</xsl:template>
	<!--
ELEMENTS step1-entry/step1 />
-->
	<xsl:template match="pecul.step-entry/step1[1]">
		<xsl:if test="child::para[1]/child::figure | specpara/para[1]/figure | para[1]/table | specpara/para[1]/table ">
			<fo:table-cell column-number="3" padding-top="6pt" margin-left="3pt" padding-left="3pt" border-bottom="solid" border-bottom-width=".5pt">
				<fo:block>
					<xsl:apply-templates select="child::para/child::figure | specpara/para/figure | para/table | para/ftnote| specpara/para/table | specpara/para/ftnote"/>
				</fo:block>
			</fo:table-cell>
		</xsl:if>
		<fo:block font-family="sans-serif" font-size="8pt" font-weight="normal" padding-bottom="6pt" span="all" start-indent="0pt">
			<!--<xsl:call-template name="CHECK-ID"/>-->
			<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates select="node()"> </xsl:apply-templates>
		</fo:block>
	</xsl:template>
	<!--
ELEMENT step1-entry/step1/para first  
-->
	<xsl:template mode="Pecul" match="pecul.insp-entry/pecul.step-entry/step1/para[1] | pecul.step-entry/step1/specpara/para[1] | pecul.insp-entry/pecul.step-entry/precond[1]">
		<fo:list-block margin-left="5pt" provisional-distance-between-starts="10pt" provisional-label-separation="5pt">
			<fo:list-item relative-align="baseline" space-before.conditionality="discard" space-before.maximum="4pt" space-before.minimum="2pt" space-before.optimum="3pt">
				<fo:list-item-label relative-align="baseline" end-indent="label-end()" keep-together.within-line="always" hyphenation-character="-" hyphenate="true">
				<fo:block>
						<xsl:number count="step1" format="1." from="//pecul.insp-group" level="any"/>
					</fo:block>
				</fo:list-item-label>
				<fo:list-item-body relative-align="baseline" start-indent="body-start()">
					<fo:block>
						<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno | modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet |  proponent |  phone | instructplt | verbatim | text()"> </xsl:apply-templates>
					<xsl:apply-templates mode="Pecul" select="step2/para"/>
					</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<xsl:template mode="Pecul" match="step2[1]/para[1] | step2[1]/specpara/para[1]">
		<fo:list-block margin-left="10pt" keep-with-previous="always" provisional-distance-between-starts="15pt" provisional-label-separation="4pt">
			<fo:list-item relative-align="baseline" space-before.conditionality="discard" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt">
				<fo:list-item-label relative-align="baseline">
				<fo:block>
						<xsl:number count="step2" format="a." level="single"/>
						</fo:block>
				</fo:list-item-label>
				<fo:list-item-body relative-align="baseline" >  <!--  keep-together.within-line="always" -->
				<fo:block>
					<xsl:call-template name="ESD"> </xsl:call-template>
					<xsl:call-template name="QA"> </xsl:call-template>
					<xsl:call-template name="HCP"> </xsl:call-template>
					<xsl:call-template name="CHANGEBAR"/>
						<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref |  
subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno |  
modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant |  
pageloc | symbol | torque | voltage | null | change | seqlist | randlist |  
deflist | anchor | internet |  proponent |  phone | instructplt | verbatim | text()"> </xsl:apply-templates>
</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENTstep2 para first -->
	<xsl:template mode="Pecul" match="step2[position()>1]/para[1] | 
step2[position()>1]/specpara/para[1]">
		<fo:list-block margin-left="10pt" provisional-distance-between-starts="15pt" provisional-label-separation="4pt">
			<fo:list-item relative-align="baseline" space-before.conditionality="discard" space-before.maximum="4pt" space-before.minimum="2pt" space-before.optimum="3pt">
				<fo:list-item-label relative-align="baseline">
				<fo:block>
						<xsl:number count="step2" format="a." level="single"/>
						</fo:block>
				</fo:list-item-label>
				<fo:list-item-body relative-align="baseline">
				<fo:block>
					<xsl:call-template name="ESD"> </xsl:call-template>
					<xsl:call-template name="QA"> </xsl:call-template>
					<xsl:call-template name="HCP"> </xsl:call-template>
					<xsl:call-template name="CHANGEBAR"/>
						<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref |  
subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno |  
modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant |  
pageloc | symbol | torque | voltage | null | change | seqlist | randlist |  
deflist | anchor | internet |  proponent |  phone | instructplt | verbatim | text()"> </xsl:apply-templates>
</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<!--
ELEMENT step1-entry/remarks
-->
	<xsl:template match="remarks">
	<fo:block >
		<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
