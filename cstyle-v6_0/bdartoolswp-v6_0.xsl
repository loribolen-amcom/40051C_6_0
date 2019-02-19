<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="bdartoolswp">
	<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
</xsl:template>
 
    <xsl:template match="bdartoolswp/intro[1]">
        <fo:block border-after-style="solid" border-after-width="2pt" border-before-style="solid"
            border-before-width="2pt" border-left-style="solid" border-left-width="2pt"
            border-right-style="solid" border-right-width="2pt" end-indent="4pc"
            font-family="sans-serif" font-size="12pt" font-weight="bold" padding-bottom="8pt"
            padding-left="8pt" padding-right="8pt" padding-top="8pt" space-before="48pt"
            space-after="28pt" span="all" start-indent="4pc" text-transform="uppercase">
            BDAR FIXES SHALL BE USED ONLY IN COMBAT OR FOR TRAINING AT THE DISCRETION OF THE COMMANDER. 
            (AUTHORIZED TRAINING FIXES ARE LISTED IN THE BDAR TRAINING PROCEDURES WORK PACKAGE.) 
            IN ANY CASE, DAMAGE SHALL BE REPAIRED BY STANDARD MAINTENANCE PROCEDURES AS SOON AS PRACTICABLE.
        </fo:block>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="bdar-manuitem">
		<xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>