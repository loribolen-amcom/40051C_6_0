<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
		xmlns:db="http://docbook.org/ns/docbook"
		xmlns:f="http://docbook.org/xslt/ns/extension"
		xmlns:m="http://docbook.org/xslt/ns/mode"
		xmlns:t="http://docbook.org/xslt/ns/template"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="db f m t xs">
	<xsl:variable name="double.sided"/>
	<xsl:variable name="fo.processor"/>
	<xsl:variable name="body.start.indent"/>
	<xsl:variable name="body.end.indent"/>
	
	<xsl:template name="t:page-number-format">
		<xsl:param name="element" select="local-name(.)"/>
  <xsl:param name="master-reference" select="''"/>

  <xsl:choose>
    <xsl:when test="$element = 'frntcover_abbreviated'">i</xsl:when>
    <!--<xsl:when test="$element = 'dedication'">i</xsl:when>-->
    <xsl:otherwise>1</xsl:otherwise>
  </xsl:choose>
</xsl:template>

			<xsl:template name="t:initial-page-number">
  <xsl:param name="element" select="local-name(.)"/>
  <xsl:param name="master-reference" select="''"/>

  <!-- Select the first content that the stylesheet places
       after the TOC  paper.frnt -->
  <xsl:variable name="first.lube.content" 
                select="ancestor::lubeorder/*[
                          not(self::frntcover_abbreviated or
                              self::loepwp or
                              self::titleabbrev or
                              self::bookinfo or
                              self::info or
                              self::dedication or
                              self::toc or
                              self::lot)][1]"/>
  <xsl:choose>
    <!-- double-sided output -->
    <xsl:when test="$double.sided != ''">
      <xsl:choose>
    <!--     <xsl:when test="$element = 'toc'">auto-odd</xsl:when>
    	    <xsl:when test="$element = 'lubeorder'">1</xsl:when>
preface typically continues TOC roman numerals -->
	<!-- Change page.number.format if not 
                            or preceding::opim
                            or preceding::tim
                            or preceding::mim
                            or preceding::pim
                            or preceding::sim
                            or preceding::dim 
and not(preceding::lointrowp)
     <xsl:when test="$element = 'loepwp'">auto-odd</xsl:when> -->
     
     <!--07AUG18 / S. Hurst - BOM.  Per LOGSA and MIL-STD 40051 changed instances of <lubricantsymbolwp> to <lubricantsymbolswp> -->
   
        <xsl:when test="($element = 'loepwp' or $element = 'lointrowp' or $element = 'lubewp' or $element = 'lubricantsymbolswp' or $element = 'lubetypeswp' or $element = 'lospecnoteswp' or $element = 'sim')">1</xsl:when>
	<xsl:when test="generate-id($first.lube.content) =
	                generate-id(.)">1</xsl:when>
        <xsl:otherwise>auto-odd</xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    
     <!--07AUG18 / S. Hurst - EOM.-->

    <!-- single-sided output or preceding::opim
                            or preceding::tim
                            or preceding::mim
                            or preceding::pim
                            or preceding::sim
                            or preceding::dim
and not(preceding::lointrowp)
and not(preceding::lointrowp)
 -->
 
  <!--08AUG18 / S. Hurst - BOM.  Per LOGSA and MIL-STD 40051 changed instances of <lubricantsymbolwp> to <lubricantsymbolswp> -->
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$element = 'contents'">auto</xsl:when>
        <xsl:when test="$element = 'lubeorder'">1</xsl:when>
        <xsl:when test="$element = 'warning'">auto</xsl:when>
         <xsl:when test="($element = 'lointrowp' or $element = 'lubewp' or $element = 'lubricantsymbolswp' or $element = 'lubetypeswp' or $element = 'lospecnoteswp' or $element = 'sim')">1</xsl:when>
	<xsl:when test="generate-id($first.lube.content) =
	                generate-id(.)">1</xsl:when>
        <xsl:otherwise>auto</xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
 <!--08AUG18 / S. Hurst - EOM.-->

<!-- Utility template to create a page sequence for an element -->
<xsl:template name="t:force-page-count">
  <xsl:param name="element" select="local-name(.)"/>
  <xsl:param name="master-reference" select="''"/>
 
 
  <xsl:choose>
    <!-- double-sided output -->
    <xsl:when test="$double.sided != ''">end-on-even</xsl:when>
    <!-- single-sided output -->
    <xsl:otherwise>no-force</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="t:flow-properties">
  <xsl:param name="element" select="local-name(.)"/>
  <xsl:param name="master-reference" select="''"/>

  <!-- This template is called after each <fo:flow> starts. -->
  <!-- Customize this template to set attributes on fo:flow -->

  <xsl:choose>
    <xsl:when test="$fo.processor = 'fop' or $fo.processor = 'passivetex'">
      <!-- body.start.indent does not work well with these processors -->
    </xsl:when>
    <xsl:when test="starts-with($master-reference, 'lointrowp') or
                    starts-with($master-reference, 'lubewp') or
                    starts-with($master-reference, 'frntcover_abbreviated') or
                    starts-with($master-reference, 'sim') or
		    (starts-with($master-reference, 'lubeorder_rear') and $element = 'authent')">
      <xsl:attribute name="start-indent">
        <xsl:value-of select="$body.start.indent"/>
      </xsl:attribute>
      <xsl:attribute name="end-indent">
        <xsl:value-of select="$body.end.indent"/>
      </xsl:attribute>
    </xsl:when>
  </xsl:choose>

</xsl:template>

<!-- ==================================================================== -->

<!-- Utility template to create a page sequence for an element -->

<!-- ==================================================================== -->

<xsl:function name="f:page-number-format" as="xs:string">
  <xsl:param name="context" as="element()"/>
  <xsl:value-of select="f:page-number-format($context, local-name($context), '')"/>
</xsl:function>

<xsl:function name="f:page-number-format" as="xs:string">
  <xsl:param name="context" as="element()"/>
  <xsl:param name="element" as="xs:string"/>
  <xsl:value-of select="f:page-number-format($context, $element, '')"/>
</xsl:function>

<xsl:function name="f:page-number-format" as="xs:string">
  <xsl:param name="context" as="element()"/>
  <xsl:param name="element" as="xs:string"/>
  <xsl:param name="master-reference" as="xs:string"/>

  <xsl:choose>
    <xsl:when test="$element = 'loepwp'">
      <xsl:value-of select="'i'"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="'1'"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:function name="f:initial-page-number" as="xs:string">
  <xsl:param name="context" as="element()"/>
  <xsl:value-of select="f:initial-page-number($context, local-name($context), '')"/>
</xsl:function>

<xsl:function name="f:initial-page-number" as="xs:string">
  <xsl:param name="context" as="element()"/>
  <xsl:param name="element" as="xs:string"/>
  <xsl:value-of select="f:initial-page-number($context, $element,'')"/>
</xsl:function>

<xsl:function name="f:initial-page-number" as="xs:string">
  <xsl:param name="context" as="element()"/>
  <xsl:param name="element" as="xs:string"/>
  <xsl:param name="master-reference" as="xs:string"/>

  <!-- Select the first content that the stylesheet places
       after the TOC -->
  <xsl:variable name="first.book.content" 
                select="$context/self::lointrowp/*[
                          not(self::db:info or
                              self::db:dedication or
                              self::db:preface or
                              self::db:toc or
                              self::db:lot)	][1]"/>

  <xsl:variable name="auto" select="if ($double.sided != '')
                                    then 'auto-odd'
				    else 'auto'"/>

  <xsl:choose>
    <xsl:when test="$element = 'contents'">
      <xsl:value-of select="$auto"/>
    </xsl:when>
    <xsl:when test="$element = 'lubeorder'">
      <xsl:value-of select="'1'"/>
    </xsl:when>
    <!-- preface typically continues TOC roman numerals -->
    <!-- Change page.number.format if not -->
    <!--08AUG18 / S. Hurst - BOM.  Per LOGSA and MIL-STD 40051 changed instances of <lubricantsymbolwp> to <lubricantsymbolswp> -->
    <xsl:when test="($element = 'frntcover_abbreviated' or $element = 'lointrowp' or $element = 'lubewp' or $element = 'lubricantsymbolswp' or $element = 'lubetypeswp' or $element = 'lospecnoteswp' or $element = 'lubeorder_rear')">
      <xsl:value-of select="'1'"/>
    </xsl:when>
    <xsl:when test="generate-id($first.book.content) = generate-id($context)">
      <xsl:value-of select="'1'"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$auto"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>
  <!--08AUG18 / S. Hurst - EOM.-->
<xsl:function name="f:force-page-count" as="xs:string">
  <xsl:param name="context" as="element()"/>
  <xsl:value-of select="f:force-page-count($context,local-name($context),'')"/>
</xsl:function>

<xsl:function name="f:force-page-count" as="xs:string">
  <xsl:param name="context" as="element()"/>
  <xsl:param name="element" as="xs:string"/>
  <xsl:value-of select="f:force-page-count($context,$element,'')"/>
</xsl:function>

<xsl:function name="f:force-page-count" as="xs:string">
  <xsl:param name="context" as="element()"/>
  <xsl:param name="element" as="xs:string"/>
  <xsl:param name="master-reference" as="xs:string"/>

  <xsl:choose>
    <!-- double-sided output -->
    <xsl:when test="$double.sided != ''">
      <xsl:value-of select="'end-on-even'"/>
    </xsl:when>
    <!-- single-sided output -->
    <xsl:otherwise>
      <xsl:value-of select="'no-force'"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

<xsl:template name="t:set-flow-properties">
  <xsl:param name="element" select="local-name(.)"/>
  <xsl:param name="master-reference" select="''"/>

  <!-- This template is called after each <fo:flow> starts. -->
  <!-- Customize this template to set attributes on fo:flow -->

  <!-- remove -draft from reference -->
  <xsl:variable name="pageclass">
    <xsl:choose>
      <xsl:when test="contains($master-reference, descendant-or-self::node())">
        <xsl:value-of select="substring-before($master-reference, descendant-or-self::node())"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$master-reference"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$fo.processor = 'fop' or $fo.processor = 'passivetex'">
      <!-- body.start.indent does not work well with these processors -->
    </xsl:when>
    <xsl:when test="starts-with($pageclass, 'para0') or
                    starts-with($pageclass, 'proc') or
                    starts-with($pageclass, 'front') or
                    $element = 'lubeorder_rear' or
                    (starts-with($pageclass, 'back') and
                    $element = 'authent')">
      <xsl:attribute name="start-indent">
        <xsl:value-of select="$body.start.indent"/>
      </xsl:attribute>
      <xsl:attribute name="end-indent">
        <xsl:value-of select="$body.end.indent"/>
      </xsl:attribute>
    </xsl:when>
  </xsl:choose>
</xsl:template>

	<xsl:template name="initial.page.number">auto-odd</xsl:template>
<xsl:template name="page.number.format">1</xsl:template>

	<!-- PAGESET TEMPLATES (lube-odd-first, CHAP-PAGESET, FRNTREAR-RL -->
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="lubeorder">
	<xsl:call-template name="lube-pageset"/>
	</xsl:template>
	<xsl:template name="lube-pageset">
			<xsl:param name="docsecr2">
			<xsl:value-of select="$docsecr"/>
		</xsl:param>
			
	<xsl:param name="Odd-First"/>
	<xsl:param name="Odd-Or-First"/>
	<xsl:param name="Odd-Or-Even"/>
	<xsl:param name="docsecr">
			<xsl:choose>
				<xsl:when test="@security">
					<xsl:if test="@security='ts'">
						<xsl:text>TOP SECRET</xsl:text>
					</xsl:if>
					<xsl:if test="@security='s'">
						<xsl:choose>
							<xsl:when test="descendant::*[@security='ts']">
								<xsl:text>TOP SECRET</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>SECRET</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="@security='c'">
						<xsl:choose>
							<xsl:when test="descendant::*[@security='ts']">
								<xsl:text>TOP SECRET</xsl:text>
							</xsl:when>
							<xsl:when test="descendant::*[@security='s']">
								<xsl:text>SECRET</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>CONFIDENTIAL</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="@security='fouo'">
						<xsl:choose>
							<xsl:when test="descendant::*[@security='ts']">
								<xsl:text>TOP SECRET</xsl:text>
							</xsl:when>
							<xsl:when test="descendant::*[@security='s']">
								<xsl:text>SECRET</xsl:text>
							</xsl:when>
							<xsl:when test="descendant::*[@security='c']">
								<xsl:text>CONFIDENTIAL</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>FOR OFFICIAL USE ONLY</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$docsecr2"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="tblctr">
			<xsl:number count="table" format="1." from="//lubewp" level="any"/>
		</xsl:param>	
	<xsl:param name="wpseqno">
					<xsl:choose>
				<xsl:when test="@wpseq">
					<xsl:value-of select="@wpseq"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates mode="count" select="wpidinfo" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		
		<xsl:param name="changeno">
			<xsl:if test="string-length(@chngno)>0">  
				<xsl:text>CHANGE&#x2002;</xsl:text>
				<xsl:value-of select="@chngno"/>
			</xsl:if>
		</xsl:param>
		<xsl:variable name="chngno">
			<xsl:if test="@chnglevel">
				<xsl:text>CHANGE&#x2002;</xsl:text>
				<xsl:value-of select="@chnglevel"/>
			</xsl:if>
		</xsl:variable>
		

		<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt" format="1" hyphenate="false" initial-page-number="auto" language="en" line-height="1.15em" master-reference="lube" text-align="left" id="veryLastPage">
			<fo:static-content flow-name="lube-before">  
				<xsl:call-template name="lube-HEADER">
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
			</fo:static-content>
			<!-- Page information for ODD numbered pages -->
			<fo:static-content flow-name="lube-odd">
				<xsl:call-template name="lube-HEADER">
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
			</fo:static-content>
			<!-- Page information for EVEN numbered pages -->
			<fo:static-content flow-name="lube-even">
				<xsl:call-template name="lube-HEADER">
					<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after-odd">
				<xsl:call-template name="lube-FOOTER">
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
					</fo:static-content>
			<fo:static-content flow-name="xsl-region-after-even">
				<xsl:call-template name="lube-FOOTER">
					<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
							</fo:static-content>

<fo:flow flow-name="xsl-region-body">
<fo:block id="first-page"/>
			<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all">
			<fo:block xsl:use-attribute-sets="secur-header-attrs">
						<xsl:value-of select="$docsecr"/>
					</fo:block>
					<fo:block>
		<fo:marker marker-class-name="card-page"></fo:marker>
				</fo:block>
			<fo:block>
		<fo:marker marker-class-name="blank-page"></fo:marker>
				</fo:block>
				<fo:block>
				<fo:wrapper space-after.conditionality="discard" space-after.maximum="160pt" space-after.minimum="150pt" space-after.optimum="155pt" space-before.conditionality="discard" space-before.maximum="160pt" space-before.minimum="150pt" space-before.optimum="155pt" span="all">

					<xsl:apply-templates select="node()"/>
				
				</fo:wrapper>
				</fo:block>
				</fo:block>
				
					<!--<fo:block margin-top="20pt" space-before="10pt" span="all" text-align="left">
						<xsl:apply-templates select="lubeorder/intro"/>
					</fo:block>-->
				<fo:block keep-with-previous.within-page="always" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub">
				
							<xsl:choose>
								<xsl:when test="lubewp">
									<xsl:text>END OF WORK PACKAGE</xsl:text>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
							</fo:block>
				<fo:block>
					<fo:marker marker-class-name="blank-page">
						<xsl:text>/</xsl:text>
						<xsl:text>blank</xsl:text>
					</fo:marker>
				</fo:block>
				<fo:block id="last-page"/>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	<xsl:template name="lube-HEADER">
		<xsl:param name="Odd-Or-Even"/>

		<xsl:param name="WpSeqNo"/>
		<fo:block xsl:use-attribute-sets="secur-header-attrs">
			<xsl:value-of select="$docsecr"/>
		</fo:block>
		<fo:wrapper font-family="sans-serif" font-size="10pt" font-weight="bold">
				<fo:table>
					<fo:table-column column-width="21pc"/>
					<fo:table-column column-width="21pc"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell column-number="1" text-align="left">
								<fo:block space-after="6pt">
									<xsl:text>LUBRICATION ORDER</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="2" text-align="right">
								<fo:block>
									<xsl:choose>
										<xsl:when test="$Odd-Or-Even='Even'">
										<xsl:text>LO </xsl:text>
										<xsl:value-of select="//lubeorder/frntcover_abbreviated/tmtitle/tmno"/>
																					</xsl:when>
										<xsl:otherwise>
										<xsl:text>LO </xsl:text>
											<xsl:value-of select="//lubeorder/frntcover_abbreviated/tmtitle/tmno"/>
										</xsl:otherwise>
									</xsl:choose>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row space-before="12pt">
							<fo:table-cell column-number="1" text-align="left" space-before="12pt">
								<fo:block space-before="12pt">
									<xsl:choose>
										<xsl:when test="$Odd-Or-Even='Even'">
											<xsl:text/>
										</xsl:when>
										<xsl:otherwise>
										<fo:block>
											<xsl:value-of select="//lubeorder/frntcover_abbreviated/date"/>
											</fo:block>
										</xsl:otherwise>
									</xsl:choose>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="2" text-align="right">
								<fo:block space-before="24pt">
									<xsl:choose>
										<xsl:when test="$Odd-Or-Even='Even'">
										<fo:block>
											<xsl:value-of select="//lubeorder/frntcover_abbreviated/date"/>
											</fo:block>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text/>
										</xsl:otherwise>
									</xsl:choose>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
		</fo:wrapper>
		<fo:block span="all">
			<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
		</fo:block>
	</xsl:template>
	<xsl:template mode="CONTENTS" match="tmno">
		<fo:block font-size="12pt" font-weight="bold" space-after.maximum="0pt" space-after.minimum="0pt" space-after.optimum="0pt" space-before.maximum="12pt" space-before.minimum="10pt" space-before.optimum="10pt" span="all" text-align="right" text-transform="uppercase">
		<xsl:text>LO </xsl:text>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>

	<xsl:template name="lube-FOOTER">
		<xsl:param name="Odd-Or-Even"/>
		<xsl:param name="WpSeqNo"/>
	<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" span="all" text-align="center">
			<fo:table>
				<fo:table-column>
		<xsl:attribute name="column-width">
		<xsl:choose>
		<xsl:when test="$Odd-Or-Even='Even'">16pc</xsl:when>
		<xsl:otherwise>13pc</xsl:otherwise>
		</xsl:choose>
		</xsl:attribute>
				</fo:table-column>
				<fo:table-column column-width="13pc"/>
				<fo:table-column>
					<xsl:attribute name="column-width">
					<xsl:choose>
					<xsl:when test="$Odd-Or-Even='Even'">13pc</xsl:when>
					<xsl:otherwise>16pc</xsl:otherwise>
					</xsl:choose>
					</xsl:attribute>
				</fo:table-column>
				<fo:table-body>
					<fo:table-row>
						<xsl:if test="$Odd-Or-Even='Even'">
							<fo:table-cell text-align="left">
								<fo:block>
									<xsl:value-of select="$chngno"/>
								</fo:block>
							</fo:table-cell>
						</xsl:if>
						<fo:table-cell column-number="2" text-align="center">
							<fo:block>
								<xsl:text>Card </xsl:text>
								
								<fo:page-number />
								<xsl:text> of </xsl:text>
								<!--<fo:page-number-citation ref-id="{generate-id(.)}" />
								<fo:page-number-citation-last page-citation-strategy="all" ref-id="veryLastPage"/>-->
								<fo:page-number-citation ref-id="veryLastPage"/>
								<xsl:if test="$Odd-Or-Even='Odd'">
									<fo:retrieve-marker retrieve-boundary="document" retrieve-class-name="blank-page"/>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
						<xsl:if test="$Odd-Or-Even='Odd'">
							<fo:table-cell text-align="right">
								<fo:block>
									<xsl:value-of select="$chngno"/>
								</fo:block>
							</fo:table-cell>
						</xsl:if>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		<fo:block xsl:use-attribute-sets="secur-footer-attrs">
			<xsl:value-of select="$docsecr"/>
		</fo:block>
	</xsl:template>

<xsl:template match="lubeorder/warning | lubeorder/caution | lubeorder/note | lubeorder/csi.alert">
<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt" format="1" hyphenate="false" initial-page-number="1" language="en" line-height="1.15em" master-reference="impg" text-align="left">
					<fo:static-content flow-name="impg-before">
						<xsl:call-template name="lube-HEADER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<!-- Page information for ODD numbered pages -->
					<fo:static-content flow-name="xsl-region-before-odd">
						<xsl:call-template name="lube-HEADER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<!-- Page information for EVEN numbered pages -->
					<fo:static-content flow-name="xsl-region-before-even">
						<xsl:call-template name="lube-HEADER">
							<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after-odd">
						<xsl:call-template name="lube-FOOTER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after-even">
						<xsl:call-template name="lube-FOOTER">
							<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-before">
						<fo:block/>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-end">
						<fo:block/>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after-blank">
						<fo:block/>
					</fo:static-content>
					<fo:static-content flow-name="xsl-footnote-separator">
  <fo:block>
   <fo:leader leader-pattern="rule" leader-length="25%" rule-thickness="0.5pt" rule-style="solid" color="black"/>
   <fo:footnote>
				<fo:inline> <xsl:value-of select="ftnref"/></fo:inline>
				<fo:footnote-body>
					<fo:block><xsl:value-of select="/ftnote/ftnpara"/></fo:block>
				</fo:footnote-body>
			</fo:footnote>
  </fo:block>
  </fo:static-content>
  		<fo:flow flow-name="xsl-region-body">
		<fo:block>
		<fo:marker marker-class-name="blank-page"></fo:marker>
				</fo:block>
	<fo:wrapper space-after.conditionality="discard" space-after.maximum="160pt" space-after.minimum="150pt" space-after.optimum="155pt" space-before.conditionality="discard" space-before.maximum="160pt" space-before.minimum="150pt" space-before.optimum="155pt">
							<xsl:apply-templates select="node()"/>
						</fo:wrapper>
				<fo:block>
				
				<fo:marker marker-class-name="blank-page">
					<xsl:text>/</xsl:text>
					<xsl:text>blank</xsl:text>
				</fo:marker>
				</fo:block>
			</fo:flow>
				</fo:page-sequence>

		
</xsl:template>

<xsl:template match="lubeorder/intro">
<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt" format="1" hyphenate="false" initial-page-number="1" language="en" line-height="1.15em" master-reference="impg" text-align="left">
					<fo:static-content flow-name="impg-before">
						<xsl:call-template name="lube-HEADER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<!-- Page information for ODD numbered pages -->
					<fo:static-content flow-name="xsl-region-before-odd">
						<xsl:call-template name="lube-HEADER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<!-- Page information for EVEN numbered pages -->
					<fo:static-content flow-name="xsl-region-before-even">
						<xsl:call-template name="lube-HEADER">
							<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after-odd">
						<xsl:call-template name="lube-FOOTER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after-even">
						<xsl:call-template name="lube-FOOTER">
							<xsl:with-param name="Odd-Or-Even"></xsl:with-param>
								<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
							
						</xsl:call-template>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-before">
						<fo:block/>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-end">
						<fo:block/>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after-blank">
						<fo:block/>
					</fo:static-content>
					<fo:static-content flow-name="xsl-footnote-separator">
  <fo:block>
   <fo:leader leader-pattern="rule" leader-length="25%" rule-thickness="0.5pt" rule-style="solid" color="black"/>
   <fo:footnote>
				<fo:inline> <xsl:value-of select="ftnref"/></fo:inline>
				<fo:footnote-body>
					<fo:block><xsl:value-of select="/ftnote/ftnpara"/></fo:block>
				</fo:footnote-body>
			</fo:footnote>
  </fo:block>
  </fo:static-content>
  		<fo:flow flow-name="xsl-region-body">
		<fo:block>
		<fo:marker marker-class-name="blank-page"></fo:marker>
				</fo:block>
	<fo:wrapper space-after.conditionality="discard" space-after.maximum="160pt" space-after.minimum="150pt" space-after.optimum="155pt" space-before.conditionality="discard" space-before.maximum="160pt" space-before.minimum="150pt" space-before.optimum="155pt">
	
							<xsl:apply-templates select="node()"/>
						</fo:wrapper>
				<fo:block>
				<fo:marker marker-class-name="blank-page">
					<xsl:text>/</xsl:text>
					<xsl:text>blank</xsl:text>
				</fo:marker>
				</fo:block>
			</fo:flow>
				</fo:page-sequence>

		
</xsl:template>
</xsl:stylesheet>
