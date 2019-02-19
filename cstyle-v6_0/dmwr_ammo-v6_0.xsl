<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atixslts="http://www.arbortext.com/namespace/XslTurboStyler/3.0" xmlns:atixslfoext="http://www.arbortext.com/namespace/XslFoExtensions" xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions" xmlns:xi="http://www.w3.org/2001/XSL/XInclude" xmlns:xalan="http://xml.apache.org/xalan" xmlns:saxon="http://saxon.sf.net/">
	<xsl:template match="dmwr_ammo">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="dmwr_introwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="work_planning | disposition | equipment | sfty_req | gen_hazards | spec_hazards | haz_analysis | erc | rcrr | resource_recovery | reporting_req | tabdata | dmwr_introwp/flowchart | special_sfty | op_steps | dmwr_operationalreqwp/flowchart">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	
	<xsl:template match="dmwr_operationalreqwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="dmwr_qarwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	
<xsl:template match="demil_qar">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
		
<xsl:template match="maintenance_qar">
		<xsl:choose>
	<xsl:when test="string-length(maintenance_qar/para0/title)=0">
		<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
			<xsl:text>Maintenance of Ammunition</xsl:text>
		</fo:block>
		<xsl:apply-templates/>
	</xsl:when>
	<xsl:otherwise>
		<xsl:apply-templates select="node()"/>
	</xsl:otherwise>
	</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
