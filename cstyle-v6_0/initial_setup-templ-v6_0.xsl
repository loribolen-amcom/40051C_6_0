<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="initial_setup//cageno">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:inline xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<xsl:apply-templates select="node()"/>
			<xsl:if test="following-sibling::*">
				<xsl:text disable-output-escaping="no">, </xsl:text>
			</xsl:if>
		</fo:inline>
	</xsl:template>
	<xsl:template match="initial_setup//dwgname">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:inline>
			<xsl:apply-templates select="node()"/>
			<xsl:if test="following-sibling::*">
				<xsl:text disable-output-escaping="no">, </xsl:text>
			</xsl:if>
		</fo:inline>
	</xsl:template>
	<xsl:template match="initial_setup//dwgno">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:inline>
			<xsl:apply-templates select="node()"/>
			<xsl:if test="following-sibling::*">
				<xsl:text disable-output-escaping="no">, </xsl:text>
			</xsl:if>
		</fo:inline>
	</xsl:template>
	<xsl:template match="initial_setup//name">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:inline>
			<xsl:apply-templates select="node()"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="initial_setup//mos">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:inline>
			<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
			<xsl:apply-templates select="node()"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="initial_setup//qty">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:inline>
			<xsl:if test="(parent::mtrlpart-setup-item or parent::persnreq-setup-item or parent::mrp-setup-item)"> 
				<xsl:text disable-output-escaping="no"> - </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="node()"/>
		</fo:inline>
	</xsl:template>
		<xsl:template match="condition">
		<xsl:call-template name="CHANGEBAR"/>
		<fo:inline>
			<xsl:apply-templates select="node()"/>
			<xsl:if test="following-sibling::*">
				<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
			</xsl:if>
		</fo:inline>
	</xsl:template>
	<xsl:template match="testeqp//itemref | tools//itemref | spectools//itemref | mtrlpart//itemref | mrp//itemref | eqpconds//itemref">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:inline>
		<xsl:if test="xref">
			<xsl:text disable-output-escaping="no"> (</xsl:text>
			<xsl:apply-templates select="xref"/>
			<xsl:text disable-output-escaping="no">) </xsl:text>
			<xsl:if test="following-sibling::*">
				<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
			</xsl:if>
			</xsl:if>
	<xsl:if test="extref">
	<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
				<xsl:apply-templates select="extref"/>
	</xsl:if>
		</fo:inline>
	</xsl:template>

	<xsl:template match="initial_setup">
		<fo:block color="#000000" font-family="sans-serif" score-spaces="false" space-after.maximum="6pt" space-after.minimum="6pt" space-after.optimum="6pt" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="6pt" span="none" >
			<fo:block font-weight="bold" span="all" text-transform="uppercase">Initial setup:</fo:block>
			<fo:block font-family="sans-serif" span="none">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:block>
		<fo:block space-before.maximum="0pt" space-before.minimum="0pt" space-before.optimum="0pt" span="all">
			<fo:leader color="black" leader-length="100%" leader-pattern="rule" rule-style="solid" rule-thickness="1pt"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="testeqp">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="none" xsl:use-attribute-sets="initial_setupsub">
			<fo:block font-weight="bold" keep-with-next.within-column="always">
				<xsl:text disable-output-escaping="no">Test Equipment</xsl:text>
			</fo:block>
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="testeqp-setup-item[1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" keep-with-previous.within-column="always" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="testeqp-setup-item[position()>1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="tools">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="none" xsl:use-attribute-sets="initial_setupsub">
			<fo:block font-weight="bold">
				<xsl:text disable-output-escaping="no">Tools</xsl:text>
			</fo:block>
			<xsl:apply-templates select="tools-setup-item"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="tools-setup-item[1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" keep-with-previous.within-column="always" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="name"/>
			<xsl:apply-templates select="itemref"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="tools-setup-item[position()>1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="name"/>
			<xsl:apply-templates select="itemref"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="spectools">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="none" xsl:use-attribute-sets="initial_setupsub">
			<fo:block font-weight="bold">
				<xsl:text disable-output-escaping="no">Special Tools</xsl:text>
			</fo:block>
			<xsl:apply-templates select="spectools-setup-item"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="spectools-setup-item[1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" keep-with-previous.within-column="always" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="name"/>
			<xsl:apply-templates select="itemref"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="spectools-setup-item[position()>1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="name"/>
			<xsl:apply-templates select="itemref"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="mtrlpart">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="none" xsl:use-attribute-sets="initial_setupsub">
			<fo:block font-weight="bold" keep-with-next.within-column="always" span="none">
				<xsl:text disable-output-escaping="no">Materials</xsl:text>
			</fo:block>
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="mtrlpart-setup-item[1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" keep-with-previous.within-column="always" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="mtrlpart-setup-item[position()>1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	
		<xsl:template match="mrp">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="none" xsl:use-attribute-sets="initial_setupsub">
			<fo:block font-weight="bold" keep-with-next.within-column="always" span="none">
				<xsl:text disable-output-escaping="no">Mandatory Replacement Parts</xsl:text>
			</fo:block>
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="mrp-setup-item[1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" keep-with-previous.within-column="always" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="mrp-setup-item[position()>1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>

	<xsl:template match="persnreq">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="none" xsl:use-attribute-sets="initial_setupsub" keep-together.within-column="always">
			<fo:block font-weight="bold" keep-with-next.within-column="always">
				<xsl:text disable-output-escaping="no">Personnel Required</xsl:text>
			</fo:block>
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="persnreq-setup-item[1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" keep-with-previous.within-column="always" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="persnreq-setup-item[position()>1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="ref"> 
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="none" xsl:use-attribute-sets="initial_setupsub">
			<fo:block font-weight="bold" keep-together.within-column="always">
				<xsl:text disable-output-escaping="no">References</xsl:text>
			</fo:block>
			<xsl:apply-templates select="ref-setup-item"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="ref-setup-item">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" keep-with-previous.within-column="always" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="xref | extref | link"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="ref-setup-item[position()>1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="xref | extref | link"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="eqpconds">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="none" xsl:use-attribute-sets="initial_setupsub">
			<fo:block font-weight="bold" keep-with-next.within-column="always">
				<xsl:text disable-output-escaping="no">Equipment Condition</xsl:text>
			</fo:block>
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="eqpconds-setup-item[1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" keep-with-previous.within-column="always" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="condition"/>
			<xsl:apply-templates select="itemref"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="eqpconds-setup-item[position()>1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="dwgreq">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="none" xsl:use-attribute-sets="initial_setupsub">
			<fo:block font-weight="bold" keep-with-next.within-column="always">
				<xsl:text disable-output-escaping="no">Drawings Required</xsl:text>
			</fo:block>
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="dwgreq-setup-item[1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" keep-with-previous.within-column="always" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="dwgreq-setup-item[position()>1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="specenv">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="none" xsl:use-attribute-sets="initial_setupsub">
			<fo:block font-weight="bold" keep-with-next.within-column="always">
				<xsl:text disable-output-escaping="no">Special Environmental Conditions</xsl:text>
			</fo:block>
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="specenv-setup-item[1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" keep-with-previous.within-column="always" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="specenv-setup-item[position()>1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-family="sans-serif" font-weight="normal" span="none" start-indent="12pt" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="time.to.comp">
		<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="none" xsl:use-attribute-sets="initial_setupsub">
			<fo:block font-weight="bold" keep-with-next.within-column="always">
				<xsl:text disable-output-escaping="no">Time to Complete</xsl:text>
			</fo:block>
			<fo:block font-family="sans-serif" font-weight="normal" start-indent="12pt" text-align="left">
				<xsl:value-of disable-output-escaping="no" select="@hrs"/>
				<xsl:text disable-output-escaping="no"> hours</xsl:text>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:block>
	</xsl:template>
	<xsl:template match="initial_setup/null">
<fo:block font-family="sans-serif" font-size="10pt" font-weight="normal" space-after="6pt" space-before="6pt" start-indent="12pt">NOT APPLICABLE</fo:block>
	</xsl:template>
</xsl:stylesheet>
