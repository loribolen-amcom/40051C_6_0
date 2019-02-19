<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<!--
ELEMENT ammowp
-->

<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="ammowp">
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
ELEMENT ammo.handling
-->
	<xsl:template match="ammo.handling" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">AMMUNITION HANDLING</fo:block>
		<xsl:apply-templates/>
	</xsl:template>
<!--
ELEMENT ammo.markings
-->
<xsl:template match="ammo.markings" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<fo:block span="all" xsl:use-attribute-sets="titlesub">AMMUNITION MARKING</fo:block>
	<xsl:apply-templates/>
</xsl:template>
<!--
ELEMENT ammo.defect
-->
<xsl:template match="ammo.defect" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<fo:block span="all" xsl:use-attribute-sets="titlesub">CLASSIFICATION OF AMMUNITION DEFECTS</fo:block>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="arm" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<fo:block span="all" xsl:use-attribute-sets="titlesub">PROCEDURES FOR AMMUNITION ACTIVATION</fo:block>
	<xsl:apply-templates/>
</xsl:template>

<!--
ELEMENT ammotype
-->
<xsl:template match="ammotype" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:apply-templates select="node()"/>
</xsl:template>


<xsl:template match="statemanipulation" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<fo:block><xsl:apply-templates select="node()"/></fo:block>
</xsl:template>

<!--
ELEMENT ammo.packing
-->
<xsl:template match="ammo.packing" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:apply-templates/>
</xsl:template>
<!--
ELEMENT ammo.unpacking
-->
<xsl:template match="ammo.unpacking" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:apply-templates/>
</xsl:template>

<!--
ELEMENT ammowp/title
-->
<xsl:template match="ammo.packing/title | ammo.unpacking/title" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<fo:block span="all" xsl:use-attribute-sets="titlesub">
		<xsl:if test="contains('trim.para|trim.specpara|para|specpara|proc|figure|hazmat|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
			<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
			<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
			<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
		</xsl:if>
		<xsl:apply-templates>
</xsl:apply-templates>
	</fo:block>
</xsl:template>
</xsl:stylesheet>