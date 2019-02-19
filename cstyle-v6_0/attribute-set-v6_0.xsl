<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions">
    <xsl:attribute-set xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="widow-attrs">
        <xsl:attribute name="widows">2</xsl:attribute>
        <xsl:attribute name="orphans">2</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="secur-attrs">
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="span">all</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="secur-header-attrs" use-attribute-sets="secur-attrs">
        <xsl:attribute name="space-after">8pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="secur-footer-attrs" use-attribute-sets="secur-attrs">
        <xsl:attribute name="space-before">8pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="tmno-header-attrs">
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="span">all</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="header-leader-attrs">
        <xsl:attribute name="leader-length">100%</xsl:attribute>
        <xsl:attribute name="leader-pattern">rule</xsl:attribute>
        <xsl:attribute name="rule-style">solid</xsl:attribute>
        <xsl:attribute name="rule-thickness">2pt</xsl:attribute>
        <xsl:attribute name="space-end">10pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="notice-attrs">
        <xsl:attribute name="span">all</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="space-before">8pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="cover-attrs">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="font-size">8pt</xsl:attribute>
        <xsl:attribute name="space-after.minimum">8pt</xsl:attribute>
        <xsl:attribute name="space-after.optimum">8pt</xsl:attribute>
        <xsl:attribute name="space-after.maximum">12pt</xsl:attribute>
        <xsl:attribute name="space-before.minimum">8pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">8pt</xsl:attribute>
        <xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="specparasub">
        <xsl:attribute name="start-indent">4pc</xsl:attribute>
        <xsl:attribute name="end-indent">4pc</xsl:attribute>
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">medium</xsl:attribute>
        <xsl:attribute name="keep-with-previous">always</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="text-align-last">left</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="titlesub" use-attribute-sets="widow-attrs">
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
        <xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
        <xsl:attribute name="space-before.conditionality">discard</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="text-align-last">left</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="tasktitlesub" use-attribute-sets="titlesub">
        <xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
        <xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
        <xsl:attribute name="text-transform">uppercase</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="wcn-border">
        <xsl:attribute name="border-before-style">solid</xsl:attribute>
        <xsl:attribute name="border-after-style">solid</xsl:attribute>
        <xsl:attribute name="border-before-width">2pt</xsl:attribute>
        <xsl:attribute name="border-after-width">2pt</xsl:attribute>
        <xsl:attribute name="padding-top">4pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">2pt</xsl:attribute>
        <xsl:attribute name="padding-left">4pt</xsl:attribute>
        <xsl:attribute name="padding-right">4pt</xsl:attribute>
    </xsl:attribute-set>
    
 <xsl:attribute-set name="change">
		<xsl:attribute name="change-bar-width">4pt</xsl:attribute>
		<xsl:attribute name="change-bar-style">solid</xsl:attribute>
		<xsl:attribute name="change-bar-offset">4pt</xsl:attribute>
		<xsl:attribute name="change-bar-color">black</xsl:attribute>
		<xsl:attribute name="change-bar-placement">end</xsl:attribute>
	</xsl:attribute-set>
	
    <xsl:attribute-set name="initial_setupsub" use-attribute-sets="widow-attrs">
        <xsl:attribute name="space-before.minimum">0pt</xsl:attribute>
        <xsl:attribute name="space-before.optimum">0pt</xsl:attribute>
        <xsl:attribute name="space-before.maximum">3pt</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0pt</xsl:attribute>
        <xsl:attribute name="space-after.optimum">0pt</xsl:attribute>
        <xsl:attribute name="space-after.maximum">1pt</xsl:attribute>
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="parasub">
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">medium</xsl:attribute>
        <xsl:attribute name="keep-with-previous">always</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="text-align-last">left</xsl:attribute>
    </xsl:attribute-set>
    
	<xsl:attribute-set name="table.footnote.properties">
		<xsl:attribute name="font-family">sans-serif</xsl:attribute>
		<xsl:attribute name="font-size">70%</xsl:attribute>
		<!--<xsl:attribute name="keep-with-previous">always</xsl:attribute>-->
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="text-align-last">left</xsl:attribute>
		<xsl:attribute name="supscrpt"></xsl:attribute>
	</xsl:attribute-set>	
	<xsl:attribute-set name="footnote.properties">
		<xsl:attribute name="font-family">sans-serif</xsl:attribute>
		<xsl:attribute name="font-size">70%</xsl:attribute>
		<!--<xsl:attribute name="keep-with-previous">always</xsl:attribute>-->
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="text-align-last">left</xsl:attribute>
	</xsl:attribute-set>	    

</xsl:stylesheet>
