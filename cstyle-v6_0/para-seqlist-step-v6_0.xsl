<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="geninfo">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="br">
		<fo:block>
			<xsl:text>&#x2002;</xsl:text>
		</fo:block>
	</xsl:template>
	<!-- PROCEDURE CHECK id ATTRIBUTE If id attribute exist, add the id value to fo:block
 id attribute value for reference 
	<xsl:template name="CHECK-ID">
		<xsl:if test="@id">
			<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
		</xsl:if>
	</xsl:template>-->
	<xsl:template name="ESD">
	<xsl:if test="ancestor::*/@esd='yes'">
<!--		<xsl:if test="../@esd='yes'">-->
				<fo:inline font-weight="bold">
					<xsl:text> (ESD) </xsl:text>
				</fo:inline>
		</xsl:if>
		<xsl:if test="@esd='yes'">
			<fo:inline font-weight="bold">
				<xsl:text> (ESD) </xsl:text>
			</fo:inline>
		</xsl:if>
	</xsl:template>
<xsl:template name="CHANGEBAR">
	<xsl:if test="self::*/@inschlvl != '0'">

		<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black"  />
		<fo:change-bar-end change-bar-class="{generate-id(.)}"/>

	</xsl:if>
<xsl:if test="self::*/@delchlvl != '0'">

		<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black" />
		<fo:change-bar-end change-bar-class="{generate-id(.)}"/>

</xsl:if>
		<!-- Delete the Change level at this place -->
	</xsl:template>
<xsl:template name="CHANGEBAR_2">
	<xsl:if test="ancestor::*/@inschlvl != '0'">

		<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black" />
		<fo:change-bar-end change-bar-class="{generate-id(.)}"/>

	</xsl:if>
<xsl:if test="ancestor::*/@delchlvl != '0'">

		<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black" />
		<fo:change-bar-end change-bar-class="{generate-id(.)}"/>

</xsl:if>
		
	</xsl:template>
<xsl:template name="CHANGEBAR_3">
	<xsl:if test="parent::*/@inschlvl != '0'">

		<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black" />
		<fo:change-bar-end change-bar-class="{generate-id(.)}"/>

	</xsl:if>
<xsl:if test="parent::*/@delchlvl != '0'">

		<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black" />
		<fo:change-bar-end change-bar-class="{generate-id(.)}"/>

</xsl:if>
		
	</xsl:template>
	<!-- Delete the Change level at this place -->
	<xsl:template name="CREWMEMBER">
		<xsl:if test="self::*/@crewmember">
		<fo:block>
			<!--<fo:inline font-weight="normal">-->
				<xsl:text> (</xsl:text>
				<xsl:value-of select="self::*/@crewmember"/>
				<xsl:text>) </xsl:text>
			<!--</fo:inline>-->
			</fo:block>
		</xsl:if>
	</xsl:template>
	<xsl:template name="QA">
		<xsl:if test="ancestor::*/@qa='yes'">
			<!--<fo:block font-weight="bold"></fo:block>-->
				<xsl:text> (QA) </xsl:text>
			
		</xsl:if>
				<xsl:if test="@qa='yes'">
			<!--<fo:block font-weight="bold"></fo:block>-->
				<xsl:text> (QA) </xsl:text>
			
		</xsl:if>
	</xsl:template>
	<xsl:template name="HCP">
		<xsl:if test="ancestor::*/@hcp='yes'">
			<fo:inline font-weight="bold">
				<xsl:text> (HCP) </xsl:text>
			</fo:inline>
		</xsl:if>
		<xsl:if test="@hcp='yes'">
			<fo:inline font-weight="bold">
				<xsl:text> (HCP) </xsl:text>
			</fo:inline>
		</xsl:if>
	</xsl:template>
		<xsl:template name="safeflght">
		<xsl:if test="ancestor::*/@safeflght='yes'">
			<fo:inline font-weight="bold">
				<xsl:text> (Flight Safety Critical Step) </xsl:text>
			</fo:inline>
		</xsl:if>
		<xsl:if test="@safeflght='yes'">
			<fo:inline font-weight="bold">
				<xsl:text> (Flight Safety Critical Step) </xsl:text>
			</fo:inline>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="APPLICABLE">
		<xsl:if test="ancestor-or-self::*/@applicable">
		<xsl:variable name="applicvalue">
			<xsl:value-of select="ancestor-or-self::*/@applicable"/>
		</xsl:variable>
       <xsl:variable name="tokenizedapplic" select="tokenize($applicvalue,' ')"/>
		<xsl:for-each select="id($tokenizedapplic)">
				<fo:inline font-weight="bold">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="@abbrevcode"/>
					<xsl:text>) </xsl:text>
				</fo:inline>
    	</xsl:for-each>
       
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="applic_ref_list">
	<fo:block visibility="hidden">
	<xsl:value-of select="applic_ref_list"/>
	</fo:block>
	</xsl:template>
	<xsl:template name="applic">
	<fo:block visibility="hidden">
	<xsl:value-of select="applic"/>
	</fo:block>
	</xsl:template>
	
	<!-- PROCEDURE CHECK bullet ATTRIBUTE Check if the paragraph is bulleted. -->
	<xsl:template name="CHECK-BULLET">
		<xsl:if test="@bullet = yes">
			<xsl:text>&#x2022;&#x2002;</xsl:text>
		</xsl:if>
	</xsl:template>
	<!--  ELEMENTpara0  -->
	<xsl:template match="para0">
		<fo:block font-family="sans-serif" font-weight="bold" score-spaces="false" space-before.conditionality="discard" space-before.maximum="10pt" space-before.minimum="6pt" space-before.optimum="8pt" span="all" text-align="left">
		<xsl:call-template name="CHANGEBAR"/>
			<xsl:call-template name="ESD"/>
		<xsl:call-template name="QA"/>
			<xsl:call-template name="HCP"></xsl:call-template>
			<xsl:apply-templates select="node()"/>
		</fo:block>
		<xsl:apply-templates select="br"/>
	</xsl:template>
	<xsl:template match="para0/title" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">
			<xsl:if test="contains('trim.para|trim.specpara|para|subpara1|para0|specpara|proc|figure|hazmat
|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:if test="ancestor-or-self::work_planning and string-length()=0">
				<xsl:text>Work planning</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor-or-self::disposition and string-length()=0">
				<xsl:text>Disposition</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor-or-self::equipment and string-length()=0">
				<xsl:text>Equipment</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor-or-self::sfty_req and string-length()=0">
				<xsl:text>Safety Requirements</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor-or-self::gen_hazards and string-length()=0">
				<xsl:text>Protection against general hazards</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor-or-self::spec_hazards and string-length()=0">
				<xsl:text>Protection against specific hazards</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor-or-self::haz_analysis and string-length()=0">
				<xsl:text>Hazard analysis</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor-or-self::erc and string-length()=0">
				<xsl:text>Environmental regulation compliance</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor-or-self::rcrr and string-length()=0">
				<xsl:text>Resource conservation and recovery regulations</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor-or-self::resource_recovery and string-length()=0">
				<xsl:text>Resource recovery</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor-or-self::tabdata and string-length()=0">
				<xsl:text>Tabulated data</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor-or-self::dmwr_introwp/flowchart and string-length()=0">
				<xsl:text>Overall Flowchart for Radiographic Inspection of Cartridge, 40mm: HEDP, M430, M430A1, and HE, M383.</xsl:text>
			</xsl:if>
					<xsl:call-template name="APPLICABLE"/>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	

		<xsl:template match="para0-alt">
		<xsl:apply-templates/>
	</xsl:template>
	
	<!--  ELEMENTpara   -->
	<xsl:template match="para">
	<fo:block font-family="sans-serif" font-weight="normal" score-spaces="false" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="5pt" space-before.optimum="6pt" span="all" provisional-distance-between-starts="10pt" provisional-label-separation="5pt" text-align="left">
	<xsl:call-template name="CHANGEBAR"/>
			<xsl:call-template name="ESD"/>
			<xsl:call-template name="QA"/>
			<xsl:call-template name="HCP"/>
			<xsl:call-template name="CREWMEMBER"/>
<xsl:apply-templates select="processing-instruction() | emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno | modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet | proponent |  phone | instructplt | verbatim | table | table-alt | figure | figure-alt | inlinegraphic | term.def | term | help.info | statemanipulation | text()"/>
		</fo:block>
	</xsl:template>
	<!-- ELEMENTspecpara -->
	<xsl:template match="specpara">
		<fo:block font-weight="normal" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="5pt" space-before.optimum="6pt" span="none" text-align="left">
			<xsl:apply-templates select="node()"/>
			<xsl:call-template name="CHANGEBAR"/>
		</fo:block>
	</xsl:template>
	<!-- ELEMENTsubpara1 -->
	<xsl:template match="subpara1 | subpara1-alt">
	  <xsl:call-template name="CHANGEBAR"/>
		<fo:block text-align="start" space-before.minimum=".7em" space-before.optimum="1em" space-before.maximum="1.1em">
			<fo:block text-align="start" keep-with-next="always" space-before.minimum=".7em" space-before.optimum="1em" space-before.maximum="1.1em">
				<xsl:choose>
			 <xsl:when test="@numbering='yes'">
				<xsl:number count="subpara1" format="1." from="para0" level="any"/>
				<xsl:text>&#x2002;&#x2002;</xsl:text>
				<xsl:apply-templates select="title"/>
				</xsl:when>
				<xsl:otherwise><xsl:apply-templates select="title"/></xsl:otherwise>
			</xsl:choose>
				<xsl:call-template name="ESD"/>
				<xsl:call-template name="QA"/>
				<xsl:call-template name="HCP"/>
				<xsl:call-template name="CREWMEMBER"/>
				
			</fo:block>
		 <!-- <xsl:call-template name="CHANGEBAR"/>-->
			<xsl:apply-templates select="*[not(self::title)]"/>
		</fo:block>
	</xsl:template>
	<!-- ELEMENTsubpara2 -->
	<xsl:template match="subpara2 | subpara2-alt">
		<xsl:if test="contains(child::processing-instruction()[1],'_newpage')">
			<fo:block page-break-before="always"></fo:block>
		</xsl:if>
		<fo:block font-weight="normal" text-align="start" space-before.minimum=".7em" space-before.optimum="1em" space-before.maximum="1.1em">
			<xsl:choose>
		<xsl:when test="@numbering='yes'">
		<xsl:number count="subpara2" format="a." from="subpara1" level="any"/>
		<xsl:text>&#x2002;&#x2002;</xsl:text>
		</xsl:when>
		<xsl:otherwise/>
	</xsl:choose>
			<xsl:apply-templates select="title"/>
			<xsl:text>&#x2002;</xsl:text>
			<xsl:call-template name="ESD"/>
			<xsl:call-template name="QA"/>
			<xsl:call-template name="HCP"/>
			<xsl:call-template name="CREWMEMBER"/>
			<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates select="*[not(self::title)]"/>
		</fo:block>
	</xsl:template>
	<!-- ELEMENTsubpara3 -->
	<xsl:template match="subpara3 | subpara3-alt">
		<fo:block text-align="start" start-indent="2.5em" space-before.minimum=".7em" space-before.optimum="1em" space-before.maximum="1.1em">
				<xsl:if test="@numbering='yes'">
		<xsl:number count="subpara3" format="(1)" from="subpara2" level="any"/>
				<xsl:text>&#x2002;&#x2002;</xsl:text>
			</xsl:if>
			<xsl:apply-templates select="title"/>
			<xsl:text>&#x2002;</xsl:text>
			<xsl:call-template name="ESD"/>
			<xsl:call-template name="QA"/>
			<xsl:call-template name="HCP"/>
			<xsl:call-template name="CREWMEMBER"/>
			<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates select="*[not(self::title)]"/>
		</fo:block>
	</xsl:template>
	<!-- ELEMENTsubpara4 -->
	<xsl:template match="subpara4 | subpara4-alt">
		<fo:block text-align="start" start-indent="5em" space-before.minimum=".7em" space-before.optimum="1em" space-before.maximum="1.1em">
		<xsl:if test="@numbering='yes'">
		<xsl:number count="subpara4" format="(a)" from="subpara3" level="any"/>
				<xsl:text>&#x2002;&#x2002;</xsl:text>
			</xsl:if>
			<xsl:apply-templates select="title"/>
			<xsl:text>&#x2002;</xsl:text>
			<xsl:call-template name="ESD"/>
			<xsl:call-template name="QA"/>
			<xsl:call-template name="HCP"/>
			<xsl:call-template name="CREWMEMBER"/>
			<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates select="*[not(self::title)]"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="subpara2/title | subpara3/title | subpara4/title | subpara2-alt/title | subpara3-alt/title | subpara4-alt/title">
		<fo:inline font-weight="bold">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="subpara2/para[1] | subpara3/para[1] | subpara4/para[1] | subpara2-alt/para[1] | subpara3-alt/para[1] | subpara4-alt/para[1]">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- ELEMENTS proc -->
	<xsl:template match="proc" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:call-template name="CREWMEMBER"/>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<!-- ELEMENTS proc title -->
	<xsl:template match="proc/title" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">
			<xsl:if test="contains('trim.para|trim.specpara|para|para0|specpara|proc|figure|hazmat
|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
		<xsl:call-template name="CHANGEBAR"/><!-- self when on title -->
		<xsl:call-template name="CHANGEBAR_3"/><!-- parent when on proc -->
		<xsl:call-template name="APPLICABLE"/>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!-- ELEMENTS step1 -->
	
		<xsl:template match="step1">
		<xsl:variable name="StepLevel">
			<xsl:value-of select="substring(local-name(.),string-length(local-name(.)),1)"/>
		</xsl:variable>
		<fo:block font-family="sans-serif" font-weight="normal" span="all" font-size="10pt">
			<xsl:choose>
				<xsl:when test="ancestor::table | ancestor::pmi.pecul.tab"></xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="font-size">10pt</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
							<xsl:when test="ancestor::*[name() = 'indication']">
			<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel))*10"/>pt</xsl:attribute>			
							</xsl:when>
							<xsl:when test="ancestor::checkstep/*[name() = 'action']">
			<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel))*10"/>pt</xsl:attribute>			
							</xsl:when>
							<xsl:when test="ancestor::*[name() = 'endblock']">
			<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel))*10"/>pt</xsl:attribute>
			
							</xsl:when>
							<xsl:otherwise>
			<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*10"/>pt</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:call-template name="CREWMEMBER"/>
		<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates select="processing-instruction() | para | precond | specpara | step2 | step2-alt | figure | figure-alt | table | table-alt"/>
			
			<xsl:if test="para[1]/figure | para[1]/figure-alt | specpara/para[1]/figure | specpara/para[1]/figure-alt | para[1]/table | para[1]/table-alt | specpara/para[1]/table">
				<fo:block span="all">
					<!--xsl:apply-templates select="para/figure | specpara/para/figure | para/ftnote | para/table | specpara/para/table | specpara/para/ftnote"/-->
					<xsl:apply-templates select="para/figure | para/figure-alt | specpara/para/figure | specpara/para/figure-alt | para/table | para/table-alt | specpara/para/table | specpara/para/table-alt"/>
				</fo:block>
			</xsl:if>
			<!--<xsl:call-template name="CHANGEBAR"/>-->
		</fo:block>
	</xsl:template>
	
	
	<!-- ELEMENTS step2,step3,step4,step5,step6 -->
	<xsl:template match="step2 | step3 | step4 | step5 | step6">
		<xsl:variable name="StepLevel">
			<xsl:value-of select="substring(local-name(.),string-length(local-name(.)),1)"/>
		</xsl:variable>
		<fo:block font-family="sans-serif" font-weight="normal" span="none">
			<xsl:choose>
				<xsl:when test="ancestor-or-self::step4">
					<xsl:choose>
						<xsl:when test="ancestor-or-self::step5 and not(ancestor-or-self::step6)">
							<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*18"/>pt</xsl:attribute>
						</xsl:when>
						<xsl:when test="ancestor-or-self::step6">
							<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*17.6"/>pt</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*17"/>pt</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*15"/>pt</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="node()"/>
			<xsl:if test="para[1]/figure | para[1]/figure-alt | specpara/para[1]/figure | specpara/para[1]/figure-alt | para[1]/table | specpara/para[1]/table">
				<fo:block span="all" margin-left="0pt">
				<xsl:attribute name="start-indent"><xsl:value-of select="0"/>pt</xsl:attribute>
					<!--xsl:apply-templates select="para/figure | para[1]/figure-alt | specpara/para/figure | specpara/para[1]/figure-alt | para/ftnote | specpara/para/table | para/table | specpara/para/ftnote"/-->
					<xsl:apply-templates select="para/figure | para[1]/figure-alt | specpara/para/figure | specpara/para[1]/figure-alt | specpara/para/table | para/table"/>
				</fo:block>
			</xsl:if>
		</fo:block>
	</xsl:template>
	<!-- ELEMENTstep1 para first -->
	<xsl:template match="step1/para[1] | step1/specpara/para[1]">
	<xsl:choose>
		<xsl:when test="ancestor::logicproc//test">
		<xsl:apply-templates select="procstep1" mode="LOGICPROC"/>
		</xsl:when>
		<xsl:otherwise>
		
		<!-- increased 16pt for 3 digits - tog dec 2010 -->
		<fo:list-block provisional-distance-between-starts="2.5em" provisional-label-separation="7pt">
			<xsl:call-template name="do-step">
				<xsl:with-param name="dingbat">
				<xsl:choose>
					<xsl:when test="ancestor-or-self::checkstep and not(ancestor-or-self::indication) and not(ancestor-or-self::action)">
					<xsl:number count="checkstep/step1" format=" 1. " from="testproc" level="any"/>
					</xsl:when>
					<xsl:otherwise>
					<!--xsl:number count="step1" level="single" format="1."/-->
					<xsl:number count="step1[not(parent::step1-alt)]|step1-alt" format="1." level="single"/>
					</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="dingbat-align" select="'end'"/>
			</xsl:call-template>
		</fo:list-block>
		</xsl:otherwise>
	</xsl:choose>
	</xsl:template>
	<!-- ELEMENTstep2 para first step and para -->
	<xsl:template match="step2[1]/para[1] | step2[1]/specpara/para[1]">
		<fo:list-block provisional-distance-between-starts="2.5em" provisional-label-separation="7pt">
			<xsl:call-template name="do-step">
				<xsl:with-param name="dingbat">
					<!--xsl:number count="step2" level="single" format="a."/-->
					<xsl:number count="step2[not(parent::step2-alt)]|step2-alt" format="a." from="step1" level="single"/>
				</xsl:with-param>
				<xsl:with-param name="dingbat-align" select="'end'"/>
			</xsl:call-template>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENTstep3 para first step and para -->
	<xsl:template match="step3[1]/para[1] | step3[1]/specpara/para[1]">
		<fo:list-block keep-with-previous="always" provisional-distance-between-starts="2.0em" provisional-label-separation="20pt">
			<xsl:call-template name="do-step">
				<xsl:with-param name="dingbat">
					<!--xsl:number count="step3" level="single" format="(1)"/-->
					<xsl:number count="step3[not(parent::step3-alt)]|step3-alt" format="(1)" from="step2" level="single"/>
				</xsl:with-param>
				<xsl:with-param name="dingbat-align" select="'end'"/>
			</xsl:call-template>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENTstep4 para first step and para -->
	<xsl:template match="step4[1]/para[1] | step4[1]/specpara/para[1]">
		<fo:list-block keep-with-previous="always" provisional-distance-between-starts="2.0em" provisional-label-separation="20pt">
			<xsl:call-template name="do-step">
				<xsl:with-param name="dingbat">
					<!--xsl:number count="step4" level="single" format="(a)"/-->
					<xsl:number count="step4[not(parent::step4-alt)]|step4-alt" format="(a)" from="step3" level="single"/>
				</xsl:with-param>
				<xsl:with-param name="dingbat-align" select="'end'"/>
			</xsl:call-template>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENTstep5 para first step and para -->
	<xsl:template match="step5[1]/para[1] | step5[1]/specpara/para[1]">
		<fo:list-block keep-with-previous="always" provisional-distance-between-starts="15pt" provisional-label-separation="16pt">
			<xsl:call-template name="do-step">
				<xsl:with-param name="dingbat">
					<!--xsl:number count="step5" level="single" format="1"/-->
					<xsl:number count="step5[not(parent::step5-alt)]|step5alt" format="1" from="step4" level="single"/>
				</xsl:with-param>
				<xsl:with-param name="dingbat-align" select="'end'"/>
			</xsl:call-template>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENTstep6 para first step and para -->
	<xsl:template match="step6[1]/para[1] | step6[1]/specpara/para[1]">
		<fo:list-block keep-with-previous="always" provisional-distance-between-starts="15pt" provisional-label-separation="16pt">
			<xsl:call-template name="do-step">
				<xsl:with-param name="dingbat">
					<!--xsl:number count="step6" level="single" format="a"/-->
					<xsl:number count="step6[not(parent::step6-alt)]|step6alt" format="a" from="step5" level="single"/>
				</xsl:with-param>
				<xsl:with-param name="dingbat-align" select="'end'"/>
			</xsl:call-template>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENT next step2 para first -->
	<xsl:template match="step2[position()>1]/para[1] | step2[position()>1]/specpara/para[1]">
		<fo:list-block provisional-distance-between-starts="2.5em" provisional-label-separation="7pt">
			<xsl:call-template name="do-step">
				<xsl:with-param name="dingbat">
					<!--xsl:number count="step2" level="single" format="a."/-->
					<xsl:number count="step2[not(parent::step2-alt)]|step2-alt" format="a." from="step1" level="single"/>
				</xsl:with-param>
				<xsl:with-param name="dingbat-align" select="'end'"/>
			</xsl:call-template>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENT next step3 para first -->
	<xsl:template match="step3[position()>1]/para[1] | step3[position()>1]/specpara/para[1]">
		<fo:list-block provisional-distance-between-starts="2.0em" provisional-label-separation="16pt">
			<xsl:call-template name="do-step">
				<xsl:with-param name="dingbat">
					<!--xsl:number count="step3" level="single" format="(1)"/-->
					<xsl:number count="step3[not(parent::step3-alt)]|step3-alt" format="(1)" from="step2" level="single"/>
				</xsl:with-param>
				<xsl:with-param name="dingbat-align" select="'end'"/>
			</xsl:call-template>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENTstep4 para -->
	<xsl:template match="step4[position()>1]/para[1] | step4[position()>1]/specpara/para[1]">
		<fo:list-block provisional-distance-between-starts="2.0em" provisional-label-separation="16pt">
			<xsl:call-template name="do-step">
				<xsl:with-param name="dingbat">
					<!--xsl:number count="step4" level="single" format="(a)"/-->
					<xsl:number count="step4[not(parent::step4-alt)]|step4-alt" format="(a)" from="step3" level="single"/>
				</xsl:with-param>
				<xsl:with-param name="dingbat-align" select="'end'"/>
			</xsl:call-template>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENTstep5 para -->
	<xsl:template match="step5[position()>1]/para[1] | 
step5[position()>1]/specpara/para[1]">
		<fo:list-block provisional-distance-between-starts="15pt" provisional-label-separation="16pt">
			<xsl:call-template name="do-step">
				<xsl:with-param name="dingbat">
					<!--xsl:number count="step5" level="single" format="1"/-->
					<xsl:number count="step5[not(parent::step5-alt)]|step5alt" format="1" from="step4" level="single"/>
				</xsl:with-param>
				<xsl:with-param name="dingbat-align" select="'end'"/>
			</xsl:call-template>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENTstep6 para -->
	<xsl:template match="step6[position()>1]/para[1] | step6[position()>1]/specpara/para[1]">
		<fo:list-block provisional-distance-between-starts="15pt" provisional-label-separation="16pt">
			<xsl:call-template name="do-step">
				<xsl:with-param name="dingbat">
					<!--xsl:number count="step6" level="single" format="a"/-->
					<xsl:number count="step6[not(parent::step6-alt)]|step6alt" format="a" from="step5" level="single"/>
				</xsl:with-param>
				<xsl:with-param name="dingbat-align" select="'end'"/>
			</xsl:call-template>
		</fo:list-block>
	</xsl:template>
	<xsl:template name="do-step">
		<xsl:param name="dingbat">&#x2022;</xsl:param>
		<xsl:param name="dingbat-align">start</xsl:param>
		<fo:list-item relative-align="baseline" score-spaces="false" space-before.conditionality="discard" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt" >
			<xsl:choose>
				<xsl:when test="ancestor-or-self::step5">
					<fo:list-item-label text-decoration="underline" end-indent="label-end()" text-align="{$dingbat-align}">
							<fo:block><xsl:value-of select="$dingbat"/></fo:block>
					</fo:list-item-label>
				</xsl:when>
				<xsl:otherwise>
					<fo:list-item-label text-decoration="none" end-indent="label-end()" text-align="{$dingbat-align}">
					<fo:block>
							<xsl:value-of select="$dingbat"/>
							</fo:block>
					</fo:list-item-label>
				</xsl:otherwise>
			</xsl:choose>
			<fo:list-item-body start-indent="body-start()">
			<fo:block>
					<xsl:call-template name="ESD"/>
					<xsl:call-template name="QA"/>
					<xsl:call-template name="HCP"/>
					<xsl:call-template name="APPLICABLE"/>
					<xsl:call-template name="CREWMEMBER"/>
					<xsl:call-template name="CHANGEBAR"/>
					<xsl:apply-templates select="emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno |  modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet |  proponent | phone | instructplt | verbatim | inlinegraphic | text()"/>
				</fo:block>
			</fo:list-item-body>
		</fo:list-item>
	</xsl:template>
	<!-- ELEMENTstep* para when second or greater -->
	<xsl:template match="step1/para[position()>1] | step2/para[position()>1] |  
step3/para[position()>1] | step4/para[position()>1] | step5/para[position()>1]  | 
step6/para[position()>1] " priority="2">
		<xsl:variable name="StepLevel">
			<xsl:value-of select="substring(local-name(parent::node()[1]),string-length(local-name(parent::node()[1])),1)"/>
		</xsl:variable>
		<fo:block font-family="sans-serif" score-spaces="false" span="all" text-align="justify">
			<xsl:choose>
				<xsl:when test="ancestor-or-self::step2">
					<xsl:choose>
						<xsl:when test="ancestor-or-self::step2 and not(ancestor-or-self::step3)">
							<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*15+15.4"/>pt</xsl:attribute>
						</xsl:when>
						<xsl:when test="ancestor-or-self::step3 and not(ancestor-or-self::step4)">
							<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*25"/>pt</xsl:attribute>
						</xsl:when>
						<xsl:when test="ancestor-or-self::step4 and not(ancestor-or-self::step5)">
							<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*23.65"/>pt</xsl:attribute>
						</xsl:when>
						<xsl:when test="ancestor-or-self::step5 and not(ancestor-or-self::step6)">
							<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*21.8"/>pt</xsl:attribute>
						</xsl:when>
						<xsl:when test="ancestor-or-self::step6">
							<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*20.6"/>pt</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*17"/>pt</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*15+15"/>pt</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="node()"> </xsl:apply-templates>
		</fo:block>
	</xsl:template>
	<!-- ELEMENTseqlist -->
	<xsl:template match="seqlist">
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
				<xsl:when test="../../item">2</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<fo:block>
			<xsl:attribute name="start-indent"><xsl:value-of select="($StepLevel+$ListLevel)*24"/>pt</xsl:attribute>
			<!--<fo:list-block font-weight="normal" provisional-distance-between-starts="24pt" provisional-label-separation="4pt" space-after.minimum="6pt">-->
				<xsl:apply-templates/>
			<!--</fo:list-block>-->
		</fo:block>
	</xsl:template>
	<!-- ELEMENTseqlist item 1st level -->
	<xsl:template match="seqlist/item" priority="2">
		<xsl:call-template name="do-list-item">
			<xsl:with-param name="dingbat">
				<xsl:number level="single" format="1."/>
			</xsl:with-param>
			<xsl:with-param name="dingbat-align" select="'end'"/>
		</xsl:call-template>
	</xsl:template>
	<!-- ELEMENTseqlist item 2nd level -->
	<xsl:template match="seqlist/*/seqlist/item" priority="3">
		<xsl:call-template name="do-list-item">
			<xsl:with-param name="dingbat">
				<xsl:number level="single" format="a."/>
			</xsl:with-param>
			<xsl:with-param name="dingbat-align" select="'end'"/>
		</xsl:call-template>
	</xsl:template>
	<!-- ELEMENTseqlist item 3rd level -->
	<xsl:template match="seqlist/*/seqlist/*/seqlist/item" priority="4">
		<xsl:call-template name="do-list-item">
			<xsl:with-param name="dingbat">
				<xsl:number level="single" format="(1)"/>
			</xsl:with-param>
			<xsl:with-param name="dingbat-align" select="'end'"/>
		</xsl:call-template>
	</xsl:template>
	<!-- ELEMENTseqlist item 4th level -->
	<xsl:template match="seqlist/*/seqlist/*/seqlist/*/seqlist/item" priority="5">
		<xsl:call-template name="do-list-item">
			<xsl:with-param name="dingbat">
				<xsl:number level="single" format="(a)"/>
			</xsl:with-param>
			<xsl:with-param name="dingbat-align" select="'end'"/>
		</xsl:call-template>
	</xsl:template>
	<!-- ELEMENTseqlist item 5th level -->
	<xsl:template match="seqlist/*/seqlist/*/seqlist/*/seqlist/*/seqlist/item" priority="6">
		<xsl:call-template name="do-list-item">
			<xsl:with-param name="dingbat">
				<xsl:number level="single" format="[1]"/>
			</xsl:with-param>
			<xsl:with-param name="dingbat-align" select="'end'"/>
		</xsl:call-template>
	</xsl:template>
	<!-- ELEMENTseqlist item 6th level -->
	<xsl:template match="seqlist/*/seqlist/*/seqlist/*/seqlist/*/seqlist/*/seqlist/item" priority="7">
		<xsl:call-template name="do-list-item">
			<xsl:with-param name="dingbat">
				<xsl:number level="single" format="[a]"/>
			</xsl:with-param>
			<xsl:with-param name="dingbat-align" select="'end'"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="do-list-item">
		<xsl:param name="dingbat">&#x2022;</xsl:param>
		<xsl:param name="dingbat-align">start</xsl:param>
		<fo:list-block font-weight="normal" provisional-distance-between-starts="24pt" provisional-label-separation="4pt" space-after.minimum="6pt">
		<fo:list-item relative-align="baseline" score-spaces="false" space-before.conditionality="discard" space-before.maximum="6pt" space-before.minimum="4pt" space-before.optimum="5pt" >
			<xsl:call-template name="CHANGEBAR"/>
			<fo:list-item-label end-indent="label-end()" text-align="{$dingbat-align}">
							<fo:block><xsl:value-of select="$dingbat"/></fo:block>
			</fo:list-item-label>
			<fo:list-item-body start-indent="body-start()" >
				<fo:block>
					<xsl:apply-templates select="figure | emphasis | extref | ftnote | ftnref | indxref | subscrpt | supscrpt | xref | cageno | callout | dodac | dwgname | dwgno |  modelno | name | nsn | partno | sc | ctrlind | ctrlind-val | lubricant | pageloc | symbol | torque | voltage | null | change | seqlist | randlist | deflist | anchor | internet |  proponent |  phone | instructplt | verbatim | table | inlinegraphic | note | figure-alt | term | def | term.def | text()"/>
				</fo:block>
			</fo:list-item-body>
		</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENTrandlist -->
	<xsl:template match="randlist">
		<xsl:variable name="StepLevel">
			<xsl:choose>
				<xsl:when test="ancestor::step6">5</xsl:when>
				<xsl:when test="ancestor::step5">4</xsl:when>
				<xsl:when test="ancestor::step4">3</xsl:when>
				<xsl:when test="ancestor::step3">2</xsl:when>
				<xsl:when test="ancestor::step2">1</xsl:when>
				<xsl:when test="ancestor::subpara4">3</xsl:when>
				<xsl:when test="ancestor::subpara3">2</xsl:when>
				<xsl:when test="ancestor::subpara2">1</xsl:when>
				<xsl:when test="ancestor::subpara1">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="ListLevel">
			<xsl:choose>
				<xsl:when test="../../../../../../../../../../item">6</xsl:when>
				<xsl:when test="../../../../../../../../item">5</xsl:when>
				<xsl:when test="../../../../../../item">4</xsl:when>
				<xsl:when test="../../../../item">3</xsl:when>
				<xsl:when test="../../item">2</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<fo:block>
			<xsl:attribute name="start-indent"><xsl:value-of select="($StepLevel+$ListLevel)*24"/>pt</xsl:attribute>
				<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!-- ELEMENT randlist item Need to determine the prefix before the item -->
	<xsl:template match="randlist/item">
		<xsl:variable name="ItemLabel">
			<xsl:choose>
				<xsl:when test="@label">
					<xsl:value-of select="@label"/>
				</xsl:when>
				<xsl:when test="../@prefix">
					<xsl:value-of select="../@prefix"/>
				</xsl:when>
				<xsl:when test="../@bullet='yes'">
					<xsl:text>&#x2022;</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:call-template name="do-list-item">
			<xsl:with-param name="dingbat">
				<xsl:value-of select="$ItemLabel"/>
			</xsl:with-param>
			<xsl:with-param name="dingbat-align" select="'end'"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="deflist">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all">
			<xsl:apply-templates select="node()"> </xsl:apply-templates>
		</fo:block>
	</xsl:template>
	<xsl:template match="title.term.def">
		<fo:list-block space-before.minimum="2pt" space-before.optimum="4pt" space-before.maximum="6pt" space-before.conditionality="discard" provisional-label-separation="1pc" provisional-distance-between-starts="15pc">
			<fo:list-item space-after="2pt">
				<fo:list-item-label end-indent="label-end()">
					<fo:block>
						<xsl:apply-templates select="title[1]"/>
					</fo:block>
				</fo:list-item-label>
				<fo:list-item-body start-indent="body-start()">
					<fo:block>
						<xsl:apply-templates select="title[2]"/>
					</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<!-- ELEMENTterm.def /para -->

	<xsl:template match="term.def">
	<xsl:call-template name="CHANGEBAR"/>
			<fo:list-block space-before.minimum="2pt" space-before.optimum="4pt" space-before.maximum="6pt" space-before.conditionality="discard" provisional-label-separation="1pc" provisional-distance-between-starts="9pc">
				<fo:list-item space-after="2pt">
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:apply-templates select="term"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block>
							<xsl:apply-templates select="def"/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
	</xsl:template>
		<xsl:template match="term">
	<xsl:call-template name="CHANGEBAR"/>
	<xsl:apply-templates select="node()"/>	
	</xsl:template>
	<xsl:template match="def">
<xsl:call-template name="CHANGEBAR"/>
<xsl:apply-templates select="node()"/>
	</xsl:template>
	<!-- ELEMENTstep1-entry -->
	<xsl:template match="step1-entry">
		<xsl:apply-templates select="node()"> </xsl:apply-templates>
	</xsl:template>
	<xsl:template match="mfrr.para">
		<fo:block span="all" space-before="12pt">
			<xsl:apply-templates select="node()"></xsl:apply-templates>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
