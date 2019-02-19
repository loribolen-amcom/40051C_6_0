<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="compchklistwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="compchklist">
	<fo:block-container font-family="sans-serif" font-size="10pt" font-weight="normal" text-align="left">
		<fo:block font-size="12pt" font-weight="bold" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="24pt" space-before.minimum="18pt" space-before.optimum="20pt" span="all" text-align="left">COMPONENT CHECKLIST</fo:block>
		<fo:block>
				<xsl:apply-templates select="node()"/>
				</fo:block>
		</fo:block-container>
	</xsl:template>
	<xsl:template match="compchklist/name">
		<fo:block keep-with-next="always" space-before.conditionality="discard" space-before.maximum="26pt" space-before.minimum="22pt" space-before.optimum="24pt" span="all" start-indent="18pt">
			<xsl:text disable-output-escaping="no">Name/nomenclature of the equipment/item&#x2003;&#x2003;</xsl:text>
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="compchklist/serialno">
		<fo:block keep-with-next="always" space-before.conditionality="discard" space-before.maximum="26pt" space-before.minimum="22pt" space-before.optimum="24pt" span="all" start-indent="18pt">
			<xsl:text disable-output-escaping="no">Serial Number&#x2003;&#x2003;</xsl:text>
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="compchklist/daterec">
		<fo:block keep-with-next="always" space-before.conditionality="discard" space-before.maximum="26pt" space-before.minimum="22pt" space-before.optimum="24pt" span="all" start-indent="18pt">
			<xsl:text disable-output-escaping="no">Date received&#x2003;&#x2003;</xsl:text>
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="compchklist/recfrom">
		<fo:block keep-with-next="always" space-before.conditionality="discard" space-before.maximum="26pt" space-before.minimum="22pt" space-before.optimum="24pt" span="all" start-indent="18pt">
			<xsl:text disable-output-escaping="no">Received from (identify unit)&#x2003;&#x2003;</xsl:text>
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="compchklist/compname">
		<fo:block keep-with-next="always" space-before.conditionality="discard" space-before.maximum="26pt" space-before.minimum="22pt" space-before.optimum="24pt" span="all" start-indent="48pt">
			<xsl:text disable-output-escaping="no">Component name&#x2003;&#x2003;</xsl:text>
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="compchklist/nsn">
		<fo:block keep-with-next="always" space-before.conditionality="discard" space-before.maximum="26pt" space-before.minimum="22pt" space-before.optimum="24pt" span="all" start-indent="48pt">
			<xsl:text disable-output-escaping="no">NSN&#x2003;&#x2003;</xsl:text>
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="compchklist/partno">
		<fo:block keep-with-next="always" space-before.conditionality="discard" space-before.maximum="26pt" space-before.minimum="22pt" space-before.optimum="24pt" span="all" start-indent="48pt">
			<xsl:text disable-output-escaping="no">Part number&#x2003;&#x2003;</xsl:text>
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="compchklist/cageno"/>
	<xsl:template match="compchklist/qty">
		<fo:block keep-with-next="always" space-before.conditionality="discard" space-before.maximum="26pt" space-before.minimum="22pt" space-before.optimum="24pt" span="all" start-indent="48pt">
			<xsl:text disable-output-escaping="no">Quantity required&#x2003;&#x2003;</xsl:text>
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="compchklist/qtyrec">
		<fo:block keep-with-next="always" space-before.conditionality="discard" space-before.maximum="26pt" space-before.minimum="22pt" space-before.optimum="24pt" span="all" start-indent="48pt">
			<xsl:text disable-output-escaping="no">Quantity received&#x2003;&#x2003;</xsl:text>
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="compchklist/damage">
		<fo:block keep-with-next="always" space-before.conditionality="discard" space-before.maximum="26pt" space-before.minimum="22pt" space-before.optimum="24pt" span="all" start-indent="48pt">
			<xsl:text disable-output-escaping="no">Visual damage found&#x2003;&#x2003;</xsl:text>
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"/>
		</fo:block>
	</xsl:template>

</xsl:stylesheet>