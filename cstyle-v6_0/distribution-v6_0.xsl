<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="RESTRICT">
		<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="notice-attrs">
			<xsl:text>This publication is not available through the APD Distribution Center. This publication is available through </xsl:text>
			<xsl:value-of select="@command_information"/>
			<xsl:text>.</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="a.statement">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="left">
			<fo:inline font-weight="bold" text-decoration="underline">DISTRIBUTION STATEMENT A</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;Approved for public release, distribution is unlimited.</xsl:text>
		</fo:block>
	</xsl:template>
	<!-- As seen in Notices  -->
	<xsl:template match="avail/title">
	</xsl:template>
	<xsl:template match="avail">
		<xsl:variable name="avail-title">
			<xsl:choose>
				<xsl:when test=" name( descendant::title) ">
					<xsl:value-of select="title"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Availability notice</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<fo:block xsl:use-attribute-sets="notice-attrs">
			<fo:inline font-weight="bold" text-decoration="underline" text-transform="uppercase">
				<xsl:value-of select="$avail-title"/>
			</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="b.statement">
		<fo:block xsl:use-attribute-sets="notice-attrs">
			<fo:inline font-weight="bold" text-decoration="underline">DISTRIBUTION STATEMENT B</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;Distribution authorized to U.S. Government Agencies only</xsl:text>
			<xsl:if test="adminops | cntrctperform | crittech | exportctrl | frgngvt | opsec | premature | proprietary | testeval | softwaredoc | specauth | vulninfo">
				<xsl:apply-templates select="adminops | cntrctperform | crittech | exportctrl | frgngvt | opsec | premature | proprietary | testeval | softwaredoc | specauth | vulninfo"/>
				<xsl:text>, as determined on </xsl:text>
				<xsl:apply-templates select="reasondate"/>
				<xsl:text>. Other requests for this document shall be referred to </xsl:text>
				<xsl:apply-templates select="releaseagent"/>
				<xsl:text>.</xsl:text>
			</xsl:if>
		</fo:block>
	</xsl:template>
	<xsl:template match="c.statement">
		<fo:block xsl:use-attribute-sets="notice-attrs">
			<fo:inline font-weight="bold" text-decoration="underline">DISTRIBUTION STATEMENT C</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;Distribution authorized to U.S. Government Agencies and their Subcontractors only</xsl:text>
			<xsl:if test="adminops | crittech | exportctrl |frgngvt | softwaredoc | specauth | vulninfo">
				<xsl:apply-templates select="adminops | crittech | exportctrl |frgngvt | softwaredoc | specauth | vulninfo"/>
				<xsl:text>, as determined on </xsl:text>
				<xsl:apply-templates select="reasondate"/>
				<xsl:text>. Other requests for this document shall be referred to </xsl:text>
				<xsl:apply-templates select="releaseagent"/>
				<xsl:text>.</xsl:text>
			</xsl:if>
		</fo:block>
	</xsl:template>
	<xsl:template match="d.statement">
		<fo:block xsl:use-attribute-sets="notice-attrs">
			<fo:inline font-weight="bold" text-decoration="underline">DISTRIBUTION STATEMENT D</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;Distribution authorized to the Department of Defense and U.S. DoD contractors only</xsl:text>
			<xsl:if test="adminops | crittech | exportctrl |frgngvt | softwaredoc | specauth | vulninfo">
				<xsl:apply-templates select="adminops | crittech | exportctrl |frgngvt | softwaredoc | specauth | vulninfo"/>
				<xsl:text>, as determined on </xsl:text>
				<xsl:apply-templates select="reasondate"/>
				<xsl:text> Other requests for this document shall be referred to </xsl:text>
				<xsl:apply-templates select="releaseagent"/>
				<xsl:text>.</xsl:text>
			</xsl:if>
		</fo:block>
	</xsl:template>
<xsl:template match="e.statement">
		<fo:block xsl:use-attribute-sets="notice-attrs">
			<fo:inline font-weight="bold" text-decoration="underline">DISTRIBUTION STATEMENT E</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;Distribution authorized to DOD Components only</xsl:text>
			<xsl:if test="milsprt | adminops | cntrctperform |  crittech | exportctrl | frgngvt | opsec | premature | proprietary | softwaredoc | specauth | testeval | vulninfo">
				<xsl:apply-templates select="milsprt | adminops | cntrctperform |  crittech | exportctrl | frgngvt | opsec | premature | proprietary | softwaredoc | specauth | testeval | vulninfo"/>
				<xsl:text>, as determined on </xsl:text>
				<xsl:apply-templates select="reasondate"/>
				<xsl:text>. Other requests for this document shall be referred to </xsl:text>
				<xsl:apply-templates select="releaseagent"/>
				<xsl:text>.</xsl:text>
			</xsl:if>
		</fo:block>
	</xsl:template>
	<xsl:template match="f.statement">
		<fo:block xsl:use-attribute-sets="notice-attrs">
			<xsl:choose>
				<xsl:when test="string-length(title[1])=0">
					<fo:inline font-weight="bold" text-decoration="underline">DISTRIBUTION STATEMENT F</fo:inline>
				</xsl:when>
				<xsl:otherwise>
					<fo:inline font-weight="bold" text-decoration="underline">
						<xsl:value-of select="title"/>
					</fo:inline>
					<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(text)&gt;0">
				<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
					<xsl:value-of select="text"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>&#x2002;&#x2013;&#x2002;Further dissemination only as directed by </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="releaseagent"/>
			<xsl:text>, as determined on </xsl:text>
			<xsl:apply-templates select="reasondate"/>
			<xsl:text> or higher DOD authority.</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="x.statement">
		<fo:block xsl:use-attribute-sets="notice-attrs">
			<fo:inline font-weight="bold" text-decoration="underline">DISTRIBUTION STATEMENT X</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;Distribution authorized to U.S. Government Agencies and private individuals or enterprises eligible to obtain export-controlled technical data in accordance with DoD Directive 5230.25. Controlling DoD office is </xsl:text>
			<xsl:apply-templates select="releaseagent"/>
			<xsl:text>.</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="frgngvt">
			<xsl:text> due to Foreign Government Information - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>
	<xsl:template match="softwaredoc">
			<xsl:text> due to Software Documentation - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>
	<xsl:template match="crittech">
			<xsl:text> due to Critical Technology - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>
	<xsl:template match="adminops">
			<xsl:text> due to Administrative or Operational Use - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>
	<xsl:template match="specauth">
			<xsl:text> due to Specific Authority - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>
	<xsl:template match="proprietary">
			<xsl:text> due to Proprietary Information - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>
	<xsl:template match="testeval">
			<xsl:text> due to Test and Evaluation - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>
	<xsl:template match="vulninfo">
			<xsl:text> due to Vulnerability Information - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>
		<xsl:template match="exportctrl">
			<xsl:text> due to Export Controlled - </xsl:text>
				<xsl:value-of select="@distreason"/>
	</xsl:template>
		<xsl:template match="opsec">
			<xsl:text> due to Operations Security - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>
	<xsl:template match="cntrctperform">
			<xsl:text> due to Contractor Performance Evaluation - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>
	<xsl:template match="premature">
			<xsl:text> due to Premature Dissemination - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>
	<xsl:template match="milsprt">
			<xsl:text> due to Direct Military Support - </xsl:text>
			<xsl:value-of select="@distreason"/>
	</xsl:template>

	<xsl:template match="reasondate">
		<xsl:value-of select="node()"/>
	</xsl:template>
	<xsl:template match="releaseagent">
		<xsl:value-of select="node()"/>
	</xsl:template>
	<xsl:template match="destr">
		<xsl:variable name="Content">
			<xsl:value-of select="para"/>
		</xsl:variable>
		<xsl:variable name="Destrtext">
			<xsl:choose>
				<xsl:when test="string-length($Content)=0">For classified documents, follow the procedures in DOD 5220.22-M, National
Industrial Security Program Operating Manual and/or DODM 5200.01, Information Security
Program. For unclassified, limited documents, destroy by any method that will prevent
disclosure of contents or reconstruction of the document.</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="para"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<fo:block xsl:use-attribute-sets="notice-attrs">
			<fo:inline font-weight="bold" text-decoration="underline">DESTRUCTION NOTICE</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
			<xsl:value-of select="$Destrtext"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="dist">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="export">
		<xsl:variable name="Exporttext">
			<xsl:text>This document contains technical data whose export is restricted by the Arms
Export Control Act (Title 22, U.S.C., Sec 2751, et. seq.) or the Export Administration Act of 1979 (Title 50, U.S.C., App. 2401, et seq.), as amended. Violations of these export laws are subject to severe criminal penalties. Disseminate in accordance with provisions of DoD Directive
5230.25.</xsl:text>
		</xsl:variable>
		<fo:block xsl:use-attribute-sets="notice-attrs">
			<fo:inline font-weight="bold" text-decoration="underline">WARNING</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
			<xsl:value-of select="$Exporttext"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="super">
		<xsl:variable name="super-title">
			<xsl:choose>
				<xsl:when test=" name( descendant::title) ">
					<xsl:value-of select="title"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>supersedure notice</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<fo:block xsl:use-attribute-sets="notice-attrs">
			<fo:inline font-weight="bold" text-decoration="underline" text-transform="uppercase">
				<xsl:value-of select="$super-title"/>
			</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="super/title">
	</xsl:template>
	<xsl:template match="super/para">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="reprod">
		<fo:block>
			<fo:inline font-weight="bold" text-decoration="underline">NOTICE</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
		</fo:block>
		<xsl:apply-templates> </xsl:apply-templates>
	</xsl:template>
	<xsl:template match="general_purpose_notices/title">
     </xsl:template>
	<xsl:template match="general_purpose_notices">
		<xsl:variable name="gp-title">
			<xsl:choose>
				<xsl:when test=" name( descendant::title) ">
					<xsl:value-of select="title"/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<fo:block xsl:use-attribute-sets="notice-attrs">
			<fo:inline font-weight="bold" text-decoration="underline" text-transform="uppercase">
				<xsl:value-of select="$gp-title"/>
			</fo:inline>
			<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="reprod/para">
		<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>
