<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--
ELEMENT eqploadwp
-->
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="eqploadwp">
		<xsl:call-template name="wp-pageset">
</xsl:call-template>
	</xsl:template>
	<!--
ELEMENT loaddesc
-->
	<xsl:template match="loaddesc">
		<xsl:choose>
			<xsl:when test="string-length(title[1])=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">ILLUSTRATED LOADING PLAN DESCRIPTION</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="loaddesc/title"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>
	<!--
ELEMENT loadlist
-->
	<xsl:template match="loadlist">
			<fo:table-and-caption>
				<fo:table font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="14pt" space-before="12pt" span="all" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
					<fo:table-column column-number="1" column-width="10%"/>
					<fo:table-column column-number="2" column-width="80%"/>
					<xsl:call-template name="LOADLIST-HEADER"/>
					<fo:table-body>
						<xsl:apply-templates select="callout"/>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
	</xsl:template>
	<!--
PROCEDURE LOADLIST-HEADER
-->
	<xsl:template name="LOADLIST-HEADER">
		<fo:table-header font-family="sans-serif" font-size="8pt" font-weight="bold">
			<fo:table-row>
				<fo:table-cell display-align="after" padding-bottom="4pt" padding-top="4pt" text-align="left">
					<fo:block text-decoration="underline">ITEM NO.</fo:block>
				</fo:table-cell>
				<fo:table-cell display-align="after" padding-bottom="4pt" padding-top="4pt" text-align="left">
					<fo:block text-decoration="underline">ITEM NAME</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<!--
ELEMENT loadlist/callout
-->
	<xsl:template match="loadlist/callout">
		<fo:table-row>
			<fo:table-cell padding-top="4pt" text-align="left">
				<fo:block>
					<xsl:value-of disable-output-escaping="no" select="@label"/>
				</fo:block>
			</fo:table-cell>
			<xsl:apply-templates select="following-sibling::item[1]"/>
		</fo:table-row>
	</xsl:template>
	<!--
ELEMENT loadlist/item
-->
	<xsl:template match="loadlist/item">
		<fo:table-cell padding-top="4pt">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	</xsl:stylesheet>