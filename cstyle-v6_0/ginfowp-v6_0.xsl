<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="ginfowp">
		<xsl:call-template name="wp-pageset"> </xsl:call-template>
	</xsl:template>
	<xsl:template match="mfrr">
		<xsl:choose>
			<xsl:when test="string-length(mfrr/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">MAINTENANCE FORMS, RECORDS, AND REPORTS</fo:block>
				<xsl:apply-templates select="mfrr.para | para"/>
			</xsl:when>
			<xsl:when test="string-length(mfrr/title)>0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:apply-templates select="node()"/>
				</fo:block>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eir">
		<xsl:choose>
			<xsl:when test="string-length(eir/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>REPORTING EQUIPMENT IMPROVEMENT RECOMMENDATIONS (EIR) and</xsl:text>
					<xsl:text> PRODUCT QUALITY DEFICIENCY REPORTS (PQDR).</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="handreceipt">
		<xsl:choose>
			<xsl:when test="string-length(handreceipt/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt" text-transform="uppercase">HAND RECEIPT (HR) MANUALS </fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="cpcdata">
		<xsl:choose>
			<xsl:when test="string-length(cpcdata/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">CORROSION
					PREVENTION AND CONTROL (CPC)</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
		<xsl:template match="transportability">
		<xsl:choose>
			<xsl:when test="string-length(transportability/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">TRANSPORTABILITY GUIDANCE </fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	<xsl:template match="odsdata">
		<xsl:choose>
			<xsl:when test="string-length(odsdata/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">OZONE
					DEPLETING SUBSTANCES (ODS)</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="destructmat">
		<xsl:choose>
			<xsl:when test="string-length(destructmat/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">DESTRUCTION OF ARMY MATERIAL TO PREVENT ENEMY USE</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="pssref">
		<xsl:choose>
			<xsl:when test="string-length(pssref/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>PREPARATION FOR SHIPPING OR STORAGE</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="wrntyref">
		<xsl:choose>
			<xsl:when test="string-length(wrntyref/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>WARRANTY INFORMATION</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="nomenreflist">
		<xsl:choose>
			<xsl:when test="string-length(nomenreflist/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>NOMENCLATURE CROSS-REFERENCE LIST</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="loa">
		<xsl:choose>
			<xsl:when test="string-length(loa/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>LIST OF ABBREVIATIONS/ACRONYMS</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="qainfo">
		<xsl:choose>
			<xsl:when test="string-length(qainfo/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>QUALITY ASSURANCE (QA)</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="qual.mat.info">
		<xsl:choose>
			<xsl:when test="string-length(qual.mat.info/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>QUALITY OF MATERIAL</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="sftyinfo">
		<xsl:choose>
			<xsl:when test="string-length(sftyinfo/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>SAFETY, CARE, AND HANDLING</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="hcp">
		<xsl:choose>
			<xsl:when test="string-length(hcp/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>NUCLEAR HARDNESS</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="calref">
		<xsl:choose>
			<xsl:when test="string-length(calref/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>CALIBRATION</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
		<xsl:template match="iuid">
		<xsl:choose>
			<xsl:when test="string-length(iuid/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>ITEM UNIQUE IDENTIFICATION</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="ecp">
		<xsl:choose>
			<xsl:when test="string-length(ecp/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:if test="@mwo='yes'">MODIFICATION WORK ORDER AND </xsl:if>ENGINEERING
					CHANGE PROPOSALS</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="modification">
		<xsl:choose>
			<xsl:when test="string-length(modification/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>MODIFICATION WORK ORDER</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="deviation">
		<xsl:choose>
			<xsl:when test="string-length(deviation/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>DEVIATIONS AND EXCEPTIONS</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="mobreq">
		<xsl:choose>
			<xsl:when test="string-length(mobreq/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>MOBILIZATION REQUIREMENTS</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="csireq">
		<xsl:choose>
			<xsl:when test="string-length(csireq/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>CRITICAL SAFETY ITEM (CSI (FSCAP))</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="cost">
		<xsl:choose>
			<xsl:when test="string-length(cost/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>COST CONSIDERATIONS</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="secref">
	<xsl:variable name="secreftitle">
			<xsl:if test="descendant::proc/title">
				<xsl:value-of select="descendant::proc/title"/>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="descendant::proc/title">
				<xsl:choose>
					<xsl:when test="$secreftitle=''">
						<xsl:text>SECURITY MEASURES FOR ELECTRONIC DATA</xsl:text>
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>SECURITY MEASURES FOR ELECTRONIC DATA</xsl:text>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="copyrt">
		<xsl:choose>
			<xsl:when test="string-length(copyrt/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:text>COPYRIGHT CREDIT LINE</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="supdata">
		<xsl:choose>
			<xsl:when test="string-length(supdata/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt" text-transform="uppercase">Supporting Information for Repair Parts, Special
					Tools, TMDE, and Support Equipment</fo:block>
				<xsl:apply-templates select="node()"/>
			</xsl:when>
			<xsl:otherwise>
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:apply-templates select="node()"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="supdata/title">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">
			<xsl:if test="contains('trim.para|trim.specpara|para|specpara|proc|figure|hazmat|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="ginfowp/scope">
	<xsl:choose>
			<xsl:when test="string-length(scope/title)=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt" text-transform="uppercase">SCOPE</fo:block>
						<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:apply-templates select="node()"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="ginfowp/reporting">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">Reporting Errors and Recommending
			Improvements</fo:block>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
</xsl:stylesheet>
