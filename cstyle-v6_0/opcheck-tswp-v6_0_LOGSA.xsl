<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="opcheck-tswp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="opcheck-tsproc">
			<fo:block text-align="left" margin-left="0pt" font-family="sans-serif" span="all">
				<xsl:apply-templates select="title"/>
			<xsl:apply-templates select="warning | caution | note | csi.alert"/>
			<xsl:apply-templates select="testproc" mode="TSPROC"/>
				</fo:block>
	</xsl:template>
	<xsl:template match="opcheck-tsproc/title">
		<fo:block font-weight="bold" margin-bottom="4pt" margin-top="4pt">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>	
	
			<xsl:template match="testproc" mode="TSPROC">
	<fo:block space-after="10pt" span="all" xsl:use-attribute-sets="titlesub">
					<xsl:text>TESTING</xsl:text>
					<xsl:text> - BRANCH </xsl:text>
					<xsl:number count="testproc" level="any" from="opcheck" format="1. "/>
				</fo:block>
		<!--<fo:block margin-bottom="4pt" margin-top="4pt">-->
				<xsl:apply-templates select="checkstep" mode="TSPROC"/>
			<!--</fo:block>mode="CHECKSTEP"mode="CHECKSTEP"mode="Opcheckwp"mode="CHECKSTEP-->
<xsl:apply-templates  select="indication"/>
			<xsl:choose>
				<xsl:when test="malfunc">
					<xsl:apply-templates select="malfunc"  />
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates  select="xref"/>
					<xsl:apply-templates select="action"/>
				</xsl:otherwise>
				</xsl:choose>
	</xsl:template>

<!--
ELEMENT testproc

	<xsl:template match="opcheck-tsproc/testproc">
		<fo:block margin-bottom="4pt" margin-top="4pt">
			<xsl:apply-templates select="checkstep" mode="TSPROC"/>
		</fo:block>
	</xsl:template>-->
	<!--
ELEMENT checkstep
-->
<xsl:template match="checkstep" mode="TSPROC">
		<fo:block  font-weight="bold" space-before="12pt">CHECK STEP
				<xsl:apply-templates select="node()" mode="TSPROC"/>
		 </fo:block>
	</xsl:template>
	
	<xsl:template match="checkstep/figure" mode="TSPROC">
						<xsl:apply-templates select="."/>
	</xsl:template>
	
	<xsl:template match="checkstep/step1" mode="TSPROC">
		<fo:block font-family="sans-serif" font-weight="normal" padding-bottom="6pt" span="all" start-indent="0pt" background-color="blue">
			<xsl:call-template name="CREWMEMBER"/>
					<xsl:call-template name="ESD"/>
					<xsl:call-template name="QA"/>
					<xsl:call-template name="HCP"/>
					<xsl:call-template name="CHANGEBAR"/>
					<xsl:call-template name="safeflght"/>
			<xsl:apply-templates mode="TSPROC" select="para |  specpara"/>
			<xsl:apply-templates select="figure | figure-alt | table | table-alt | step2 | step2-alt"/>
			<!--<xsl:if test="para[1]/figure | specpara/para[1]/figure | para[1]/table | specpara/para[1]/table ">
				<xsl:apply-templates select="para/figure | specpara/para/figure | para/table | para/ftnote| specpara/para/table | specpara/para/ftnote"/>
			</xsl:if>-->
			</fo:block>
	</xsl:template>
	<xsl:template match="specpara" mode="TSPROC">
		<xsl:apply-templates select="warning | caution | note | csi.alert"/>
		<xsl:apply-templates mode="TSPROC" select="para"/>
	</xsl:template>
	<xsl:template match="para" mode="TSPROC">
	
			<fo:list-block margin-left="5pt" provisional-distance-between-starts="20pt" provisional-label-separation="5pt">
				<fo:list-item relative-align="baseline" space-before.conditionality="discard" space-before.maximum="4pt" space-before.minimum="2pt" space-before.optimum="3pt">
					<fo:list-item-label relative-align="baseline">
						<!--<fo:block>-->
							<xsl:number count="checkstep/step1" format="1." from="testproc/checkstep[1]" level="any"/>
						<!--</fo:block>-->
					</fo:list-item-label>
					<fo:list-item-body relative-align="baseline">
						<!--<fo:block>-->
							<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno |  modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet |  proponent |  phone | instructplt | verbatim | table | figure | tabmat | text()"/>
						<!--</fo:block>-->
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
			
	</xsl:template>
	<xsl:template match="malfunc" mode="TSPROC">
		<fo:block start-indent="12pt" font-family="sans-serif" font-weight="bold" margin-left="4pt" text-align="left" padding-after="4pt" padding-before="4pt" margin-bottom="4pt" margin-top="4pt" text-transform="uppercase" space-after="12pt" space-before="12pt" >
		<!--<fo:inline font-family="sans-serif" relative-align="baseline" xsl:use-attribute-sets="titlesub">-->
				<xsl:value-of select="translate(@label,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
			<!--</fo:inline>-->
			 </fo:block>
		<fo:block space-before="0pt" span="all" start-indent="12pt" font-weight="normal">
				<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!--
	
	-->
	<xsl:template match="indication" mode="TSPROC">
		<fo:block start-indent="12pt" space-before.conditionality="discard" space-before.maximum="4pt" space-before.minimum="2pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">CONDITION/INDICATION</fo:block>
		<fo:block space-before="0pt" span="all" start-indent="12pt">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="action" mode="TSPROC">
		<fo:block  start-indent="12pt" space-before.conditionality="discard" space-before.maximum="4pt" space-before.minimum="2pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub" background-color="pink">CORRECTIVE ACTION</fo:block>	
			<fo:block space-before="0pt" span="all" start-indent="12pt" background-color="orange" font-weight="normal">
			<xsl:apply-templates mode="TSPROC"/>
			<xsl:apply-templates select="figure | figure-alt | table | table-alt"/>
			</fo:block>
	</xsl:template>
<xsl:template match="checkstep/action/step1" mode="TSPROC">
		<fo:block font-family="sans-serif" font-size="10pt" font-weight="normal" padding-bottom="6pt" span="all" > 
			<xsl:call-template name="CREWMEMBER"/>
					<xsl:call-template name="ESD"/>
					<xsl:call-template name="QA"/>
					<xsl:call-template name="HCP"/>
					<xsl:call-template name="CHANGEBAR"/>
					<xsl:call-template name="safeflght"/>
			<xsl:apply-templates mode="TSPROC-ACTION" select="para |  specpara"/>
			<xsl:if test="para[1]/figure | specpara/para[1]/figure | para[1]/table | specpara/para[1]/table">
				<xsl:apply-templates select="para/figure | specpara/para/figure | para/table | para/ftnote| specpara/para/table | specpara/para/ftnote"/>
		</xsl:if> 	
		<fo:block start-indent="15pt">
			<xsl:apply-templates select="step2"></xsl:apply-templates>
		</fo:block>
		</fo:block>
	</xsl:template>
	<xsl:template match="checkstep/action/para" mode="TSPROC">
		<!--<fo:block font-family="sans-serif" font-size="10pt" font-weight="normal" padding-bottom="6pt" span="all">-->
			<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno |  modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet |  proponent |  phone | instructplt | verbatim | table | figure | text()">
</xsl:apply-templates>
		<!--</fo:block>-->
	</xsl:template>
	<xsl:template match="specpara" mode="TSPROC-ACTION">
		<xsl:apply-templates select="warning | caution | note | csi.alert"/>
		<xsl:apply-templates mode="TSPROC-ACTION" select="para"/>
	</xsl:template>
	<xsl:template match="para" mode="TSPROC-ACTION">
			<fo:list-block margin-left="5pt" provisional-distance-between-starts="20pt" provisional-label-separation="5pt">
				<fo:list-item relative-align="baseline" space-before.conditionality="discard" space-before.maximum="4pt" space-before.minimum="2pt" space-before.optimum="3pt">
					<fo:list-item-label relative-align="baseline">
						<fo:block>
							<xsl:number count="step1" format="1." from="testproc" level="any"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body relative-align="baseline">
						<fo:block>
					<xsl:call-template name="CHANGEBAR"/>
							<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno |  modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet |  proponent |  phone | instructplt | verbatim | table | figure | text()">
</xsl:apply-templates>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
	</xsl:template>
</xsl:stylesheet>
