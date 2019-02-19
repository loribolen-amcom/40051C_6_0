<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="bdar-geninfowp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="bdar-std-practices">
		<fo:block border-after-style="solid" border-after-width="2pt" border-before-style="solid" border-before-width="2pt" border-left-style="solid" border-left-width="2pt" border-right-style="solid" border-right-width="2pt" end-indent="4pc" font-family="sans-serif" font-size="12pt" font-weight="bold" padding-bottom="8pt" padding-left="8pt" padding-right="8pt" padding-top="8pt" space-before="48pt" space-after="28pt" span="all" start-indent="4pc" text-transform="uppercase">
   			BDAR FIXES SHALL BE USED ONLY IN COMBAT OR FOR TRAINING AT THE DISCRETION OF THE COMMANDER. (AUTHORIZED TRAINING FIXES ARE LISTED IN THE BDAR TRAINING PROCEDURES WORK PACKAGE.) IN ANY CASE, DAMAGE SHALL BE REPAIRED BY STANDARD MAINTENANCE PROCEDURES AS SOON AS PRACTICABLE.
   		</fo:block>
		<fo:block>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="bdar-task-resp">
		<fo:block>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="bdar-combat-threat">
		<xsl:choose>
			<xsl:when test="string-length(bdar-combat-threat/title)=0">
				<fo:block xsl:use-attribute-sets="titlesub" span="all" space-before="12pt">
					<xsl:text>Combat Threats</xsl:text>
				</fo:block>
				<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
				<!--xsl:apply-templates select="para"/-->
			</xsl:when>
			<xsl:otherwise>
				<!-- select all the child nodes of this element -->
				<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!--RG 101018 - commenting out below to eliminate conflict with genrepairwp-->
	<!--<xsl:template match="bdar-persn">
		<xsl:apply-templates/>
	</xsl:template>-->
</xsl:stylesheet>
