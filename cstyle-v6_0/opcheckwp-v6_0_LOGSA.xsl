<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
Arbortext, Inc., 1988-2005, v.4002
<!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="opcheckwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
ELEMENT messageindx
-->
	<xsl:template match="messageindx">
			<xsl:if test="geninfo">
			<xsl:apply-templates select="geninfo | title"/>
		</xsl:if>
			<fo:table-and-caption>
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="left">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="table | messageindx" format="1." from="tswp" level="any"/>
						<xsl:text disable-output-escaping="no">&#x2002;&#x2002;</xsl:text>
						<xsl:apply-templates mode="TableTitle" select="title"/>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" inline-progression-dimension="100%">
					<fo:table-column column-number="1" column-width="15%"/>
					<fo:table-column column-number="2" column-width="50%"/>
					<fo:table-column column-number="3" column-width="35%"/>
					<xsl:call-template name="MESSAGEINDX-HEADER"/>
					<fo:table-body>
						<xsl:apply-templates select="messageitem"/>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
	</xsl:template>
	<xsl:template match="title" mode="TableTitle">
		
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template name="MESSAGEINDX-HEADER">
		<fo:table-header font-weight="bold">
			<fo:table-row border-after-style="solid" border-after-width="1pt">
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="1" display-align="after" number-rows-spanned="1" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt">MESSAGE WORD</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="2" display-align="after" number-rows-spanned="1" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">DESCRIPTION</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="3" display-align="after" number-rows-spanned="1" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">CORRECTIVE ACTION</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	
	<xsl:template match="messageitem">
		<fo:table-row>
	<xsl:apply-templates select="messageword"/>
	<xsl:apply-templates select="para[1] | action | link"/>
	<xsl:apply-templates mode="Opcheckwp" select="xref"/>
		</fo:table-row>
	</xsl:template>

	<xsl:template match="messageitem/messageword">
	<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="1">
			<fo:block>
				<xsl:apply-templates select="node()"></xsl:apply-templates>
			</fo:block>
			</fo:table-cell>
	</xsl:template>
	
	
	<!--
ELEMENT messageitem/para - DESCRIPTION
-->

	<xsl:template match="messageitem/para[1]">
		
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="2">
			<fo:block>
				<xsl:apply-templates select="node()">
</xsl:apply-templates>
			</fo:block>
			<xsl:apply-templates mode="MoreMessage" select="following-sibling::para">
</xsl:apply-templates>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="para" mode="MoreMessage">
		<fo:block>
			<xsl:apply-templates select="node()">
</xsl:apply-templates>
		</fo:block>
	</xsl:template>
	<!--
ELEMENT action
-->
	<xsl:template match="opcheckproc/messageindx//action">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="3">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
		<xsl:template match="messageitem/link">
	<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="3">
			<fo:block>
				<xsl:apply-templates select="node()"></xsl:apply-templates>
			</fo:block>
			</fo:table-cell>
	</xsl:template>
	
	<!--
ELEMENTS step1  | checkstep/indication/step1 | checkstep/action/step1
-->
	<xsl:template match="messageitem/action/step1 | faultreports//follow-on/step1">
		
		<xsl:if test="para[1]/figure | specpara/para[1]/figure | para[1]/table | specpara/para[1]/table ">
			<xsl:apply-templates select="para/figure | specpara/para/figure | para/table | specpara/para/table"></xsl:apply-templates>
		</xsl:if>
		<fo:block font-family="sans-serif" font-size="8pt" font-weight="normal" padding-bottom="6pt" span="all" start-indent="4pt">
			<!--<xsl:call-template name="CHECK-ID"/>-->
			<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates mode="FAULTPROC" select="para |  specpara"/>
			<xsl:apply-templates select="step2">
</xsl:apply-templates>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="xref" mode="Opcheckwp">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="3">
			<fo:block>
				<xsl:apply-templates select="../xref"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<!--
ELEMENT faultreports  
-->

	<xsl:template match="opcheckproc/faultreports">
			<xsl:if test="geninfo">
			<xsl:apply-templates select="geninfo | title"/>
		</xsl:if>
			<xsl:if test="following-sibling::faultcode">
		<xsl:choose>
			<xsl:when test="@indxcols='2'">
			<fo:table-and-caption>
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="left">
						<xsl:apply-templates mode="TableTitle" select="title"/>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
					<fo:table-column column-number="1" column-width="30%"/>
					<fo:table-column column-number="2" column-width="65%"/>
					<xsl:call-template name="FAULTREPORTS-HEADER-2"/>

					<fo:table-body>
					<fo:table-row>
						<xsl:apply-templates select="faultcode"/>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
		</xsl:when>
		
		<xsl:when test="@indxcols='3'">
			<fo:table-and-caption>
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="left">
						<xsl:apply-templates mode="TableTitle" select="title"/>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
					<fo:table-column column-number="1" column-width="15%"/>
					<fo:table-column column-number="2" column-width="50%"/>
					<fo:table-column column-number="3" column-width="35%"/>

					<xsl:call-template name="FAULTREPORTS-HEADER-3"/>

					<fo:table-body>
					<fo:table-row>
						<xsl:apply-templates select="faultcode"/>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>

		</xsl:when>
		</xsl:choose>
		</xsl:if>
		<xsl:if test="not(following-sibling::faultcode)">
		<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="FAULTREPORTS-HEADER-2">
<fo:table-header font-weight="bold">
			<fo:table-row border-after-style="solid" border-after-width="1pt">
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="1" display-align="after" number-rows-spanned="1" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt">FAULT MESSAGE</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="2" display-align="after" number-rows-spanned="1" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">CORRECTIVE ACTION</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	
	
	<xsl:template name="FAULTREPORTS-HEADER-3">
<fo:table-header font-weight="bold">
			<fo:table-row border-after-style="solid" border-after-width="1pt">
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="1" display-align="after" number-rows-spanned="1" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt">FAULT MESSAGE</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="2" display-align="after" number-rows-spanned="1" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">CORRECTIVE ACTION</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="3" display-align="after" number-rows-spanned="1" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">FOLLOW-ON</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>


	<xsl:template match="faultcode">
	<fo:table-row>
	<xsl:apply-templates select="faultcode/messageword"/>
	<xsl:apply-templates select="para[1] | action | link | follow-on"/>
	<xsl:apply-templates mode="Opcheckwp" select="xref"/>
	</fo:table-row>
	</xsl:template>

	<xsl:template match="faultcode/messageword">
<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="1">
			<fo:block>
				<xsl:apply-templates select="node()"></xsl:apply-templates>
			</fo:block>
			</fo:table-cell>
	</xsl:template>
	
	
<xsl:template match="faultcode/action/para[1]">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="2">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
			<xsl:apply-templates mode="MoreMessage" select="following-sibling::para"/>
		</fo:table-cell>
	</xsl:template>
	
		<xsl:template match="faultcode/xref" mode="Opcheckwp">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="2">
			<fo:block>
				<xsl:apply-templates select="../xref"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="opcheckproc/faultreports//follow-on">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="3">
		<fo:block>
		<xsl:apply-templates select="node()"/>
		</fo:block>
			</fo:table-cell>
	</xsl:template>
	
<!--		<xsl:template match="opcheckproc/faultreports//action">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="2">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>-->

		<xsl:template match="faultcode/link">
	<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" column-number="2">
			<fo:block>
				<xsl:apply-templates select="node()"></xsl:apply-templates>
			</fo:block>
			</fo:table-cell>
	</xsl:template>

	<xsl:template match="opcheckproc">
			<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold"  text-align="left" text-transform="uppercase" margin-bottom="4pt" margin-top="4pt">
			<xsl:text>OPCHECK PROCEDURE </xsl:text>
			<xsl:number count="opcheckproc" level="single" from="opcheckwp" format="1. "/>
		</fo:block>
			<xsl:apply-templates/>
	</xsl:template>

<!--ELEMENT opcheck  -->

	<xsl:template match="opcheck">
			<fo:block span="all">
			<xsl:call-template name="CREWMEMBER"/>
			<xsl:call-template name="ESD"/>
			<xsl:call-template name="QA"/>
			<xsl:call-template name="HCP"/>
			<xsl:call-template name="safeflght"/>
			<xsl:call-template name="CHANGEBAR"/>
			<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold"  text-align="left" text-transform="uppercase" margin-bottom="4pt" margin-top="4pt">
			<xsl:choose>
				<xsl:when test="string-length(handreceipt/title)=0">
					<xsl:text>OPCHECK </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="opcheck/title"/>
					<xsl:text> </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:number count="opcheck" level="any" from="opcheckproc" format="1. "/>
			</fo:block>
				<xsl:apply-templates select="warning | caution | note | csi.alert"/>
				<fo:block text-align="left" margin-left="0pt" font-family="sans-serif">
							<xsl:apply-templates select="testproc"/>
				</fo:block>
			</fo:block>
	</xsl:template>
	
	<!--xsl:template match="opcheck/title">
		<fo:block margin-bottom="4pt" margin-top="4pt">
			<xsl:choose>
			<xsl:when test="string-length(handreceipt/title)=0">
				<xsl:text>OPCHECK PROCEDURE </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
				<xsl:text> </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:number count="opcheck" level="any" from="opcheckproc" format="1. "/>
		</fo:block>
	</xsl:template-->
	
	<!--ELEMENT testproc--> 
	<xsl:template match="opcheck/testproc">
		<fo:block space-after="10pt" space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">
				<xsl:text>TEST PROCEDURE </xsl:text>
				<xsl:number count="testproc" level="any" from="opcheck | opcheck-tsproc" format="1. "/>
		</fo:block>
		<fo:block>
		<xsl:apply-templates select="checkstep"/>
		</fo:block>
	</xsl:template>

  <xsl:template match="checkstep">
		<fo:block space-after="10pt" space-before.conditionality="discard" space-before.maximum="16pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">
				<xsl:text>TESTING</xsl:text>
				<xsl:text> - BRANCH </xsl:text>
				<xsl:number count="checkstep" level="any" from="testproc" format="1. "/>
		</fo:block>
		<xsl:apply-templates select="node()" mode="CHECKSTEP"/>
	</xsl:template>

	<xsl:template match="figure | table" mode="CHECKSTEP">
		<xsl:apply-templates select="."/>
	</xsl:template>

	<xsl:template match="step1" mode="CHECKSTEP" >
		<xsl:variable name="StepLevel">
			<xsl:value-of select="substring(local-name(.),string-length(local-name(.)),1)"/>
		</xsl:variable>
		<fo:block font-family="sans-serif" font-weight="normal" span="all" font-size="10pt">
			<xsl:choose>
				<xsl:when test="ancestor::table"></xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="font-size">10pt</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:attribute name="start-indent"><xsl:value-of select="(number($StepLevel)-1)*10"/>pt</xsl:attribute>
			<xsl:apply-templates select="para | precond | specpara | step2 | step2-alt | figure | figure-alt | table | table-alt"/>
			<xsl:if test="para[1]/figure | specpara/para[1]/figure | para[1]/table | specpara/para[1]/table">
				<fo:block span="all">
					<xsl:apply-templates select="para/figure | para/table | specpara/para/figure | specpara/para/table"/>
				</fo:block>
			</xsl:if>
			<xsl:call-template name="CHANGEBAR"/>
		</fo:block>
	</xsl:template>

	<xsl:template match="checkstep/indication" mode="CHECKSTEP">
		<fo:block  font-family="sans-serif" font-weight="bold" margin-left="20pt" text-align="left" padding-after="4pt" padding-before="4pt" margin-bottom="4pt" margin-top="4pt" >CONDITION/INDICATION</fo:block>	
		<fo:block margin-left="20pt">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="checkstep/malfunc" mode="CHECKSTEP">
		<fo:block font-family="sans-serif" font-weight="bold" margin-left="20pt" text-align="left" padding-after="4pt" padding-before="4pt" margin-bottom="4pt" margin-top="4pt" text-transform="uppercase" space-after="12pt" space-before="12pt" >
			<xsl:value-of select="translate(@label,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
		</fo:block>
		<fo:block margin-left="20pt">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template match="checkstep/action" mode="CHECKSTEP">
		<fo:block  font-family="sans-serif" font-weight="bold" margin-left="20pt" text-align="left" padding-after="4pt" padding-before="4pt" margin-bottom="4pt" margin-top="4pt" >CORRECTIVE ACTION</fo:block>	
		<fo:block margin-left="20pt">
			<xsl:apply-templates select="node()"/><!-- mode="CHECKSTEP"/-->
			<xsl:call-template name="CHANGEBAR"/>
		</fo:block>
	</xsl:template>

	<!--xsl:template match="checkstep/action/step1" mode="CHECKSTEP">
		<xsl:apply-templates select="node()" mode="CHECKSTEP"/>
		<xsl:if test="para[1]/figure | specpara/para[1]/figure | para[1]/table | specpara/para[1]/table">
			<xsl:apply-templates select="para/figure | specpara/para/figure | para/table | specpara/para/table"/>
		</xsl:if> 
		<xsl:call-template name="CHANGEBAR"/>
	</xsl:template-->

	<!--xsl:template match="opcheck/testproc/checkstep/action/step1/para | opcheck/testproc/checkstep/action/para" mode="CHECKSTEP"-->
	<!--xsl:template match="opcheck/testproc/checkstep/action/para" mode="CHECKSTEP">
		<fo:block>
			<xsl:apply-templates select="node()"/>
			<xsl:call-template name="CHANGEBAR"/>
		</fo:block>
	</xsl:template-->
	

</xsl:stylesheet>