<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="tswp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tsproc">
	<fo:block span="all" id="{generate-id(.)}">
		<!-- LB  when multiple procs in one WP need to add page breaks - added processing-instruction() | -->
		<xsl:apply-templates select="processing-instruction() | faultproc | muxproc | logicproc"/>
		</fo:block>
	</xsl:template>
	<!--ELEMENT faultproc-->
	<xsl:template match="faultproc">
		
			<!--<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of disable-output-escaping="no" select="@id"/></xsl:attribute>
			</xsl:if>-->
	<fo:block font-family="sans-serif" font-weight="bold" text-align="left" keep-with-next="always" margin-top="4pt">TROUBLESHOOTING PROCEDURE</fo:block>
			<xsl:apply-templates select="title"/>
			<xsl:apply-templates select="warning | caution | note | csi.alert"/>
			<xsl:apply-templates select="symptom"/>
		
	</xsl:template>
	<!--PROCEDURE FAULTPROC-HEADER-->
	<xsl:template name="FAULTPROC-HEADER">
		<fo:block font-family="sans-serif" font-weight="bold" margin-left="8pt" text-align="left" margin-bottom="4pt" margin-top="4pt">SYMPTOM</fo:block>
		<xsl:text>&#xA;</xsl:text>
	</xsl:template>
	<xsl:template match="faultproc/title">
		<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" text-align="left" text-transform="uppercase" margin-bottom="4pt" margin-top="4pt">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<!--ELEMENT symptom keep-together.within-page="always"keep-with-previous.within-page="always"-->
	<xsl:template match="faultproc/symptom">
		<fo:block font-family="sans-serif" font-weight="bold" keep-with-next.within-page="always" margin-left="8pt" text-align="left" margin-bottom="4pt" margin-top="4pt">SYMPTOM	 </fo:block>
		<fo:block text-align="left" margin-left="15pt" font-family="sans-serif" margin="left">
			<xsl:call-template name="CHANGEBAR"/> <!-- self -->
			<xsl:apply-templates select="node()"/>
		</fo:block>

		<fo:block margin-left="26pt">
			<xsl:apply-templates select="following-sibling::*[1]"/>
			<xsl:apply-templates select="following-sibling::*[2]"/>
		</fo:block>
			<xsl:if test="local-name(following-sibling::*[3])='malfunc'">
				<xsl:apply-templates mode="More-Malfunc" select="following-sibling::*[3]"/>
			</xsl:if>
	</xsl:template>
	<!--ELEMENT malfunc -->
	<xsl:template match="faultproc/malfunc" mode="More-Malfunc">

		<fo:block margin-left="26pt">
			<!--keep-with-previous.within-page="always"-->
			<xsl:apply-templates select="."/>
			<xsl:apply-templates select="following-sibling::*[1]"/> <!--action[1] | following-sibling::xref[1] |  following-sibling::link[1]"/-->
		</fo:block>
			<xsl:if test="local-name(following-sibling::*[2])='malfunc'">
				<xsl:apply-templates mode="More-Malfunc" select="following-sibling::*[2]"/>
			</xsl:if>
	</xsl:template>
	<xsl:template match="faultproc/malfunc">
		<fo:block font-family="sans-serif" font-weight="bold" keep-with-next.within-page="always" text-align="left" margin-bottom="4pt" margin-top="4pt">MALFUNCTION</fo:block>
		<fo:block>
			<xsl:call-template name="CHANGEBAR"/> <!-- self -->
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="faultproc/action">
		<fo:block font-family="sans-serif" font-weight="bold" keep-with-next.within-page="always" margin="left" margin-left="15pt" text-align="left" margin-bottom="4pt" margin-top="4pt">CORRECTIVE ACTION</fo:block>
		<fo:block margin-left="20pt">
			<xsl:apply-templates select="para | specpara | note | warning | caution | csi.alert | step1 | step1-alt"/>
		</fo:block>
		<fo:block margin-left="0pt">
			<xsl:apply-templates select="table | figure"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="faultproc/action/para">
		<fo:block margin-left="1pt" text-align="left" font-weight="normal" font-family="sans-serif" provisional-distance-between-starts="12.25pt" provisional-label-separation="4.75pt" space-before.conditionality="discard" space-before.maximum="4pt" space-before.minimum="2pt" space-before.optimum="3pt">
			<fo:inline>
				<xsl:call-template name="CREWMEMBER"/>
				<xsl:call-template name="ESD"/>
				<xsl:call-template name="QA"/>
				<xsl:call-template name="HCP"/>
				<xsl:call-template name="CHANGEBAR"/>
				<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno | modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet |  proponent |  phone | instructplt | verbatim | text()"/>
			</fo:inline>
		</fo:block>
	</xsl:template>

	<xsl:template match="faultproc/action/step1-alt">
		<xsl:apply-templates select="step1"/>
	</xsl:template>

	<xsl:template match="faultproc/action/step1 | faultproc/action/step1-alt/step1">
		<fo:block font-family="sans-serif" font-size="10pt" font-weight="normal" span="all" start-indent="40pt">
		 	<!--xsl:call-template name="CHECK-ID"/-->
			<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates mode="FAULTPROC" select="para |  specpara"/>
			<fo:block start-indent="75pt">
			<xsl:apply-templates select="step2 | figure | figure-alt | table | table-alt"/><!-- mode="reformat"/-->
			</fo:block>
			<xsl:if test="para[1]/figure | specpara/para[1]/figure | para[1]/table | specpara/para[1]/table">
				<xsl:apply-templates select="para/figure | specpara/para/figure | para/table | specpara/para/table"/>
			</xsl:if>
		</fo:block>
	</xsl:template>


	<!--ELEMENT action/step1/para first-->
	<xsl:template match="step1/specpara" mode="FAULTPROC">
		<xsl:apply-templates select="warning | caution | note | csi.alert"/>
		<xsl:apply-templates mode="FAULTPROC" select="para"/>
	</xsl:template>

	<xsl:template match="step1/para[1] | step1/specpara/para[1] | step1-alt/step1/para[1] | step1-alt/step1/specpara/para[1]" mode="FAULTPROC">
		<fo:block margin-left="1pt" text-align="left" font-weight="normal" font-family="sans-serif" provisional-distance-between-starts="12.25pt" provisional-label-separation="4.75pt" space-before.conditionality="discard" space-before.maximum="4pt" space-before.minimum="2pt" space-before.optimum="3pt">
			<fo:inline font-family="sans-serif" relative-align="baseline">
				<xsl:text>STEP </xsl:text>
				<xsl:number count="step1[not(parent::step1-alt)]|step1-alt" format="1." from="//action | //follow-on | //indication" level="single"/>
				<xsl:text disable-output-escaping="no">&#x2002;&#x2002;</xsl:text>
			</fo:inline>
			<fo:inline>
				<xsl:call-template name="CREWMEMBER"/>
				<xsl:call-template name="ESD"/>
				<xsl:call-template name="QA"/>
				<xsl:call-template name="HCP"/>
				<xsl:call-template name="safeflght"/>
				<xsl:call-template name="APPLICABLE"/>
				<xsl:call-template name="CHANGEBAR"/>
				<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno | modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet |  proponent |  phone | instructplt | verbatim | text()"/>
			</fo:inline>
		</fo:block>
	</xsl:template>

	<xsl:template match="muxproc">
		<fo:block span="all">
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of disable-output-escaping="no" select="@id"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="warning | caution | note | csi.alert"/>
			<fo:table border-after-width="0" border-bottom-width="0" border-left-width="0" border-right-width="0" font-family="sans-serif" font-size="10pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="23pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
				<fo:table-column column-number="1" column-width="5%"/>
				<fo:table-column column-number="2" column-width="95%"/>
				<fo:table-body>
					<xsl:apply-templates select="signal-item[1]">
</xsl:apply-templates>
				</fo:table-body>
			</fo:table>
			<xsl:apply-templates select="symptom"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="muxproc/symptom">
		<fo:block font-family="sans-serif" font-weight="bold" margin-left="8pt" text-align="left" margin-bottom="4pt" margin-top="4pt">SYMPTOM
		 </fo:block>
		<xsl:text>&#xA;</xsl:text>
		<fo:block span="all">
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of disable-output-escaping="no" select="@id"/></xsl:attribute>
			</xsl:if>
			<fo:table border-after-width="0" border-bottom-width="0" border-left-width="0" border-right-width="0" font-family="sans-serif" font-size="10pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="33pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
				<fo:table-column column-number="1" column-width="5%"/>
				<fo:table-column column-number="2" column-width="95%"/>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="2" padding-before="6pt" padding-bottom="6pt">
							<fo:block font-weight="bold">
								<xsl:apply-templates select="node()"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:apply-templates select="following-sibling::signal-item[1]"/>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	<xsl:template match="muxproc/signal-item">
		<fo:table-row>
			<fo:table-cell padding-before="9pt">
				<fo:block font-weight="bold">
					<xsl:number count="signal-item" format="1." from="//muxproc" level="single"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-before="9pt">
				<xsl:apply-templates select="node()"/>
			</fo:table-cell>
		</fo:table-row>
		<xsl:if test="local-name(following-sibling::node()[1])='signal-item'">
			<xsl:apply-templates select="following-sibling::node()[1]"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="signal-item/signame">
		<fo:block space-before="3pt" text-align="left">
			SIGNAL NAME:&#x2002;
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="signal-item/dataitem">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="signal-item/dataitem/memloc">
		<fo:block space-before="3pt">
			MEMORY LOCATION:&#x2002;
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="signal-item/dataitem/memdata">
		<fo:block space-before="3pt" text-align="left">
			MEMORY DATA BIT(S):&#x2002;
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="signal-item/dataitem/condition">
		<fo:block space-before="3pt">
			CONDITION:&#x2002;
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="signal-item/dataitem/sigfunc">
		<fo:block space-before="3pt">
			SIGNAL FUNCTION:&#x2002;
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="signal-item/ckremarks">
		<fo:block space-before="3pt">
			REMARKS:&#x2002;
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="signal-item/criteria[@type='pass']">
		<fo:block space-before="3pt">
			PASS:&#x2002;
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="signal-item/criteria[@type='fail']">
		<fo:block space-before="3pt">
			FAIL:&#x2002;
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="logicproc">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="logicproc/title">
	<!-- IF check for title-->
		<fo:block space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">TROUBLESHOOTING PROCEDURE</fo:block>
		<fo:block span="all" xsl:use-attribute-sets="titlesub">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="origin | testblock | endblock">
		<xsl:if test="@branchto"> <!-- got to testblock or endblock -->
			<xsl:variable name="branchto">
				<xsl:value-of disable-output-escaping="no" select="@branchto"/>
			</xsl:variable>
			<xsl:text disable-output-escaping="no">&#x2013;</xsl:text>
			<fo:inline>
				<fo:basic-link internal-destination="{@branch}" >
					<xsl:for-each select="id($branchto)">
						<xsl:value-of disable-output-escaping="no" select="testblock/@branchlabel"/>
					</xsl:for-each>
				</fo:basic-link>
			</fo:inline>
		</xsl:if>
		<fo:block span="all">
			<fo:leader leader-length="100%" leader-pattern="rule" rule-style="solid" rule-thickness="1pt"> </fo:leader>
		</fo:block>

		<xsl:if test="local-name(.) = 'origin'">
			<fo:block space-after="10pt" space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">
							<xsl:value-of select="@branchlabel"/>
			</fo:block>
		</xsl:if>
		
		<xsl:if test="local-name(.) = 'testblock'">
			<fo:block space-after="10pt" space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">
							<xsl:value-of select="@branchlabel"/>
			</fo:block>
		</xsl:if>

		<xsl:if test="local-name(.) = 'endblock'">
			<fo:block space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">
				<xsl:choose>
  				<xsl:when test="@branchlabel">
						<xsl:value-of select="@branchlabel"/>
					</xsl:when>				
					<xsl:otherwise>
						<xsl:text>MALFUNCTION</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> - BRANCH </xsl:text>
				<xsl:number count="origin|testblock|endblock" level="any" from="logicproc" format="1. "/>
			</fo:block>
		</xsl:if>
		<xsl:apply-templates/>
		<xsl:if test="local-name(.) = 'endblock' and position() =last()">
			<fo:block span="all">
				<fo:leader leader-length="100%" leader-pattern="rule" rule-style="solid" rule-thickness="1pt"> </fo:leader>
			</fo:block>
		</xsl:if>
	</xsl:template>
<!-- <!ELEMENT test (title?, %alert;, ((%step;)+ | (proc+)))> -->
	<xsl:template match="test">
		<xsl:variable name="testtitle">
			<xsl:if test="descendant::proc/title">
				<xsl:value-of select="descendant::proc/title"/>
			</xsl:if>
		</xsl:variable>
		<xsl:choose> 
			<xsl:when test="title"> <!-- optional title element for test -->
						<fo:block space-after="10pt" text-transform="uppercase" space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">
							<xsl:value-of select="title"/>
							<xsl:text> - BRANCH </xsl:text>
							<xsl:number count="origin|testblock|endblock" level="any" from="logicproc" format="1. "/>
						</fo:block>
			</xsl:when>
			<xsl:when test="descendant::proc/title"> <!-- no optional title element for test, use proc/title -->
				<xsl:choose>
					<xsl:when test="$testtitle=''"> <!-- no content it proc/title element -->
						<fo:block space-after="10pt" space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">
							<xsl:text>TESTING</xsl:text>
							<xsl:text> - BRANCH </xsl:text>
							<xsl:number count="origin|testblock|endblock" level="any" from="logicproc" format="1. "/>
						</fo:block>
					</xsl:when>
					<xsl:otherwise> <!-- content in proc/title element -->
						<fo:block space-after="10pt" text-transform="uppercase" space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">
							<xsl:value-of select="descendant::proc/title"/>
							<xsl:text> - BRANCH </xsl:text>
							<xsl:number count="origin|testblock|endblock" level="any" from="logicproc" format="1. "/>
						</fo:block>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise><!-- no title element to output -->
				<fo:block space-after="10pt" space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">
					<xsl:text>TESTING</xsl:text>
					<xsl:text> - BRANCH </xsl:text>
					<xsl:number count="origin|testblock|endblock" level="any" from="logicproc" format="1. "/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
		<fo:block space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all">
			<xsl:apply-templates select="warning | caution | note | csi.alert"/>
		<xsl:choose>
			<xsl:when test="proc">
			<xsl:apply-templates select="proc" mode="LOGICPROC"/>
		</xsl:when>
			<xsl:otherwise>
			<xsl:apply-templates select="step1 | figure | figure-alt | table | table-alt" mode="LOGICPROC" />
			</xsl:otherwise>
		</xsl:choose>
			</fo:block>
	</xsl:template>

	<xsl:template match="figure | figure-alt | table | table-alt" mode="LOGICPROC">
		<xsl:apply-templates select="."/>
	</xsl:template>

<!-- <!ELEMENT proc (title?, %alert;, geninfo?, (para | (%step;, (%step;)+)))> -->
	<xsl:template match="proc" mode="LOGICPROC">
		<xsl:apply-templates select="title" mode="LOGICPROC"/>
		<xsl:apply-templates select="warning | caution | note | csi.alert"/>
		<xsl:apply-templates select="para | step1 | figure | figure-alt | table | table-alt" mode="LOGICPROC" />
	</xsl:template>

<xsl:template match="test/proc[1]/title" mode="LOGICPROC"/>
<xsl:template match="test/proc[position()>1]/title" mode="LOGICPROC">
		<xsl:apply-templates select="."/>
	</xsl:template>
	
<!-- <!ELEMENT step1 (precond?, (%p;), (%figtab; | step2 | step2-alt)*)> -->	
	<xsl:template match="step1[1]" mode="LOGICPROC">
		<xsl:apply-templates select="para | specpara" mode="LOGICPROC" />
		<fo:block start-indent="15pt">
			<xsl:apply-templates select="processing-instruction() | step2 | figure | figure-alt | table | table-alt"/><!-- mode="reformat"/-->
		</fo:block>
		<xsl:if test="para[1]/figure | specpara/para[1]/figure | para[1]/table | specpara/para[1]/table">
			<fo:block span="all">
				<xsl:apply-templates select="para/figure | specpara/para/figure | para/table | specpara/para/table"/>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xsl:template match="specpara" mode="LOGICPROC">
		<xsl:apply-templates select="warning | caution | note | csi.alert"/>
		<xsl:apply-templates mode="LOGICPROC" select="para"/>
	</xsl:template>
	
	<xsl:template match="step1[position()>1]" mode="LOGICPROC">
		<fo:block font-family="sans-serif" span="all">
			<xsl:attribute name="font-size">10pt</xsl:attribute>
			<xsl:apply-templates select="para | specpara" mode="LOGICPROC"/>
			<fo:block start-indent="15pt">
				<xsl:apply-templates select="processing-instruction() | step2 | figure | figure-alt | table | table-alt"/><!-- mode="reformat"/-->
			</fo:block>
			<xsl:if test="para[1]/figure | specpara/para[1]/figure | para[1]/table | specpara/para[1]/table ">
				<fo:block span="all">
					<xsl:apply-templates select="para/figure | specpara/para/figure | para/table | specpara/para/table"> </xsl:apply-templates>
				</fo:block>
			</xsl:if>
		</fo:block>
	</xsl:template>
	
	<!-- ELEMENTstep1 para first									 -->
	<xsl:template match="para[1]" mode="LOGICPROC">		
		<fo:list-block provisional-distance-between-starts="20pt" provisional-label-separation="7pt">
			<fo:list-item relative-align="baseline" space-before.conditionality="discard" space-before.maximum="4pt" space-before.minimum="2pt" space-before.optimum="3pt">
				<fo:list-item-label relative-align="baseline">
					<fo:inline font-family="sans-serif" relative-align="baseline">
						<xsl:choose>
							<xsl:when test="ancestor::step1 and not(ancestor::action)">
								<!-- Check on this because proc is syblling -->
								<xsl:number count="test//step1 | malfunc" format="1." from="logicproc" level="any"/>
							</xsl:when>
							<xsl:when test="ancestor::action">
								<xsl:number count="step1 | endblock/action/para | test/proc/para" format="1." from="logicproc" level="any"/>
							</xsl:when>
						</xsl:choose>
					</fo:inline>
				</fo:list-item-label>
				<fo:list-item-body relative-align="baseline">
						<xsl:call-template name="CREWMEMBER"/>
						<xsl:call-template name="ESD"/>
						<xsl:call-template name="QA"/>
						<xsl:call-template name="HCP"/>
						<xsl:call-template name="safeflght"/>
						<xsl:call-template name="CHANGEBAR"/>
					  <xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno |  modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet |  proponent | phone | instructplt | verbatim | inlinegraphic | text()"/>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<xsl:template match="logicproc//indication">
		<fo:block space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">CONDITION/INDICATION</fo:block>
		<fo:block space-before="0pt" span="all" start-indent="12pt">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template name="GetBranchNumber">
		<xsl:param name="id"/>
		<xsl:for-each select="ancestor::logicproc//*[@branch=$id or @origin=$id or @id=$id]">
			<!-- test each branch for same ID -->
			<xsl:text> - Step </xsl:text>
			<xsl:variable name="stepCount" select="count(preceding::step1[ancestor::logicproc//*[@branch=$id or @origin=$id or @id=$id]])"/>
<!-- LB CHANGED 10/29/2014
			<xsl:number format="1." value="number($stepCount + 1)"/> -->
			<xsl:variable name="stepCount2" select="count(preceding::para[parent::action | parent::proc][ancestor::logicproc//*[@branch=$id or @origin=$id or @id=$id]])"/>
			<xsl:number format="1." value="number($stepCount + $stepCount2+ 1)"/>
			
		</xsl:for-each>
	</xsl:template>
	<!-- Test Block Malfunction -->
	<xsl:template match="origin/answer[1] | testblock/answer[1]">
		<fo:block space-after="10pt" space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">DECISION</fo:block>
		<fo:block space-before="0pt" span="all" start-indent="12pt">
			<xsl:choose>
				<xsl:when test="@answerval='value'">
					<xsl:value-of select="@value"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="translate(@answerval,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="not(string-length(answer)=0)">
					<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
					<xsl:value-of select="answer"/>
					<xsl:value-of select="@branch"/>
					<xsl:apply-templates/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="@idref">
							<xsl:variable name="idref" select="@idref"/>
							<!--					 - Branch  -->
							<xsl:call-template name="GetBranchNumber">
								<xsl:with-param name="id" select="@idref"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text> </xsl:text>
							<xsl:apply-templates/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>
	<xsl:template match="origin/answer[position()>1] | testblock/answer[position()>1]">
		<fo:block space-before="0pt" span="all" start-indent="12pt">
			<xsl:choose>
				<xsl:when test="@answerval='value'">
					<xsl:value-of select="@value"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="translate(@answerval,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="not(string-length(answer)=0)">
					<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
					<xsl:apply-templates>
				</xsl:apply-templates>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="@idref">
							<xsl:variable name="idref" select="@idref"/>
							<!--					 - Branch  -->
							<xsl:call-template name="GetBranchNumber">
								<xsl:with-param name="id" select="@idref"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text> </xsl:text>
							<xsl:apply-templates/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>
	<!-- End block malfunction -->
	<xsl:template match="endblock/malfunc">
		<fo:block provisional-distance-between-starts="15pt" provisional-label-separation="5pt" space-before="10pt" margin-left="12pt" span="all">
			<fo:inline font-family="sans-serif" relative-align="baseline" xsl:use-attribute-sets="titlesub">
				<xsl:value-of select="translate(@label,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/> - 
			</fo:inline>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="endblock/action">
		<fo:block start-indent="12pt" keep-with-previous.within-page="always" space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">ACTION</fo:block>
		<fo:block space-before="0pt" span="all" start-indent="12pt">
			<xsl:apply-templates mode="LOGICPROC"/>
		</fo:block>
		<fo:block space-before="0pt" span="all" xsl:use-attribute-sets="titlesub" keep-with-previous.within-page="always">
			<xsl:text>END OF TASK</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="hookup">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">PRETEST SETUP PROCEDURES</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="disconnect">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">POST-OPERATINAL SHUTDOWN PROCEDURES</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>
