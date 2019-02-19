<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="tim">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="masterindexcategory | troublecategory | troubleaviationcategory | troubledmwrnmwrcategory">
    <xsl:apply-templates/>
  </xsl:template>
  
  <!-- WP with Initial Setup, and Troubleshooting	-->
<!--	<xsl:template match="diagnosticwp">
					<xsl:call-template name="diagnosticwplayout"/>
	</xsl:template>
	
	
	<xsl:template name="diagnosticwplayout">
		<fo:page-sequence id="{@wpno}" master-reference="wpkgs" initial-page-number="1" force-page-count="even" language="en" line-height="1.15em" font-family="Helvetica, unifont" font-selection-strategy="character-by-character" hyphenate="false">
			
			<xsl:call-template name="wp_region_before"/>
			<xsl:call-template name="wp_region_after_left"/>
			<xsl:call-template name="wp_region_after_right"/>

			<fo:flow flow-name="xsl-region-body">
                <fo:block>
                    <fo:block-container id="{generate-id(.)}" space-after="1.79705em" font-weight="bold" text-align="center" break-before="page">
                        <xsl:call-template name="mainttype"/>
                        <fo:block>
                            <xsl:call-template name="CHANGEBAR"/>
                            <xsl:if test="@crewmember">
                                <xsl:value-of select="@crewmember"/>
                            </xsl:if>
                        <xsl:apply-templates select="wpidinfo/title"/>
                        </fo:block>

                        --><!-- Change added here for Bug #24765 BJB --><!--
                        <xsl:if test="wpidinfo/config">
                            <xsl:call-template name="effectivity.Notice"/>
                        </xsl:if>
                        <fo:block>
                            <xsl:choose>
                                <xsl:when test="$pagesize='pocket' ">
                                    <xsl:attribute name="space-after">1mm</xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="space-after">1.8em</xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:block>
                        --><!-- End change for Bug #24765 BJB--><!--
                        <fo:block border-bottom-width="0.75pt" border-bottom-style="solid"/>
                    </fo:block-container>
                    <xsl:call-template name="initialsetup"/>

                    <xsl:if test="wp.metadata/applicability != ''">
                        <xsl:for-each select="wp.metadata/applicability">
                            <xsl:call-template name="applicability"/>
                        </xsl:for-each>
                    </xsl:if>

                    <fo:block-container space-after="1.8em" font-weight="bold" keep-with-next.within-page="always">
                        <fo:block>
                            <xsl:text>TROUBLESHOOTING PROCEDURE</xsl:text>
                        </fo:block>
                        <xsl:apply-templates select="wpidinfo/title">
                            <xsl:with-param name="generateId" select="false()"/>
                        </xsl:apply-templates>
                    </fo:block-container>
                    <xsl:apply-templates/>
                    <fo:block keep-with-previous="always" space-before="1.8em" font-weight="bold">
                        <xsl:text>END OF WORK PACKAGE</xsl:text>
                    </fo:block>
                </fo:block>
                --><!-- Fix for bug #24954 --><!--
                    <fo:wrapper>
                        <fo:marker marker-class-name="write_ending_pageno">
                            <xsl:text>/</xsl:text>
                            <fo:page-number-citation-last ref-id="{@wpno}"/>
                            <xsl:text> blank</xsl:text>
                        </fo:marker>
                    <xsl:if test="//minipub">
                        <xsl:call-template name="writePIN"/>
                    </xsl:if>
                    </fo:wrapper>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
 -->
  </xsl:stylesheet>