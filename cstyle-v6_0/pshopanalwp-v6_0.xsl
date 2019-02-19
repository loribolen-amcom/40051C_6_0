<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="pshopanalwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="pshopanal">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="chklist">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="coverpage">
		<fo:block break-after="page" break-before="page" font-size="14pt" text-align="center">
			<xsl:call-template name="preshophead"/>
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template name="preshophead">
		<fo:block font-weight="bold" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="center">
			<xsl:text disable-output-escaping="no">PRESHOP ANALYSIS</xsl:text>
		</fo:block>
		<fo:block font-weight="bold" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="0pt" space-before.minimum="0pt" space-before.optimum="0pt" span="all" text-align="center">
			<xsl:text disable-output-escaping="no">FOR</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="coverpage/partno">
		<fo:block font-weight="bold" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="center">
			<xsl:text disable-output-escaping="no">P/N</xsl:text>
			<fo:inline font-weight="normal">
				<xsl:text disable-output-escaping="no"> _ _ _ _ _ _ _ _</xsl:text>
			</fo:inline>
		</fo:block>
	</xsl:template>
	<xsl:template match="coverpage/serialno">
		<fo:block font-size="10pt" font-weight="bold" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="28pt" space-before.minimum="26pt" space-before.optimum="27pt" span="all" text-align="center">
			<xsl:text disable-output-escaping="no">Serial
No.</xsl:text>
			<fo:inline font-weight="normal">
				<xsl:text disable-output-escaping="no"> _ _ _ _ _ _ _ _ _ _ _ _</xsl:text>
			</fo:inline>
		</fo:block>
	</xsl:template>
	<xsl:template match="coverpage/nsn">
		<fo:block font-size="10pt" font-weight="bold" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="28pt" space-before.minimum="26pt" space-before.optimum="27pt" span="all" text-align="center">
			<xsl:text disable-output-escaping="no">NSN</xsl:text>
			<fo:inline font-weight="normal">
				<xsl:text disable-output-escaping="no"> _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _</xsl:text>
			</fo:inline>
		</fo:block>
	</xsl:template>
	<xsl:template match="modreq">
		<fo:block font-size="10pt" font-weight="bold" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="28pt" space-before.minimum="26pt" space-before.optimum="27pt" span="all" text-align="left">
			<xsl:text disable-output-escaping="no">MWOs
Required</xsl:text>
			<fo:inline font-weight="normal">
				<xsl:text disable-output-escaping="no"> _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _</xsl:text>
			</fo:inline>
		</fo:block>
	</xsl:template>
	<xsl:template match="coverpage/reason">
		<fo:block font-size="10pt" font-weight="bold" hyphenate="false" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="28pt" space-before.minimum="26pt" space-before.optimum="27pt" span="all" text-align="left">
			<xsl:text disable-output-escaping="no">Reason(s)&#x2002;for&#x2002;Overhaul/Repair</xsl:text>
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"> </fo:leader>
		</fo:block>
		<fo:block font-size="18pt" font-weight="bold" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="left">
			<fo:leader leader-length="100%" leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"> </fo:leader>
		</fo:block>
		<fo:block font-size="18pt" font-weight="bold" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="left">
			<fo:leader leader-length="100%" leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"> </fo:leader>
		</fo:block>
		<fo:block font-size="18pt" font-weight="bold" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="left">
			<fo:leader leader-length="100%" leader-pattern="rule" rule-style="solid" rule-thickness="1pt" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt"> </fo:leader>
		</fo:block>
	</xsl:template>
	<xsl:template match="secitem">
		<fo:block font-size="10pt" font-weight="normal" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="48pt" space-before.minimum="36pt" space-before.optimum="40pt" span="all" text-align="left">
			<xsl:text disable-output-escaping="no">Unpacking
Secondary Items Required?</xsl:text>
			<xsl:text disable-output-escaping="no"> _ _ _ _ _ _ _ _</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="revtag">
		<fo:block font-size="10pt" font-weight="normal" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="18pt" space-before.minimum="16pt" space-before.optimum="17pt" span="all" text-align="left">
			<xsl:text disable-output-escaping="no">Reviewed
Tags?</xsl:text>
			<xsl:text disable-output-escaping="no"> _ _ _ _ _ _ _ _</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="revform">
		<fo:block font-size="10pt" font-weight="normal" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="18pt" space-before.minimum="16pt" space-before.optimum="17pt" span="all" text-align="left">
			<xsl:text disable-output-escaping="no">Reviewed
Forms?</xsl:text>
			<xsl:text disable-output-escaping="no"> _ _ _ _ _ _ _ _</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="coverpage/name">
		<fo:block font-size="10pt" font-weight="normal" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="48pt" space-before.minimum="36pt" space-before.optimum="40pt" span="all" text-align="left">
			<xsl:text disable-output-escaping="no">Name
(please print)</xsl:text>
			<xsl:text disable-output-escaping="no"> _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="coverpage/sig">
		<fo:block font-size="10pt" font-weight="normal" keep-with-next="always" space-before.conditionality="discard" space-before.maximum="18pt" space-before.minimum="16pt" space-before.optimum="17pt" span="all" text-align="left">
			<xsl:text disable-output-escaping="no">Signature</xsl:text>
			<xsl:text disable-output-escaping="no"> _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _</xsl:text>
			<xsl:text disable-output-escaping="no">&#x2002;&#x2002;&#x2002;&#x2002;&#x2002;Date</xsl:text>
			<xsl:text disable-output-escaping="no"> _ _ _ _ _ _</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="pshopchk.tab">
	<xsl:apply-templates/>
	</xsl:template>

	</xsl:stylesheet>