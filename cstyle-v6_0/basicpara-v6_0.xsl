<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:exsl="http://exslt.org/common"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="http://www.arbortext.com/namespace/doctypes/styler"
xmlns:atidlm="http://www.arbortext.com/namespace/atidlm"
xmlns:ch="http://www.arbortext.com/namespace/chunker"
xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"
xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements"
xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements"
xmlns:saxon="http://saxon.sf.net/"
xmlns:xlink="http://www.w3.org/1999/xlink"
xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions"
>

	<xsl:template name="format.footnote.mark">
  <xsl:param name="mark" select="'?'"/>
  <fo:inline xsl:use-attribute-sets="footnote.mark.properties">
    <xsl:choose>
      <xsl:when test="$fop.extensions != 0">
        <xsl:attribute name="vertical-align">super</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="baseline-shift">super</xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:copy-of select="$mark"/>
  </fo:inline>
</xsl:template>

	<xsl:template match="ftnote">
  <xsl:choose>
    <xsl:when test="ancestor::table">
      <!--xsl:call-template name="format.footnote.mark">
        <xsl:with-param name="mark">
          <xsl:apply-templates select="." mode="footnote.number"/>
        </xsl:with-param>
      </xsl:call-template-->
    </xsl:when>
    <xsl:otherwise>
      <fo:footnote>
        <fo:inline>
          <!--xsl:call-template name="format.footnote.mark">
            <xsl:with-param name="mark">
              <xsl:apply-templates select="." mode="footnote.number"/>
            </xsl:with-param>
          </xsl:call-template-->
        </fo:inline>
        <fo:footnote-body xsl:use-attribute-sets="footnote.properties">
          <xsl:apply-templates/>
        </fo:footnote-body>
      </fo:footnote>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
	
	<!-- --> <xsl:template match="ftnref">
	<!--xsl:variable name="footnote" select="key('id',@xrefid)"/-->
	 <xsl:variable name="xrefid">
			<xsl:value-of disable-output-escaping="no" select="@xrefid"/>
		</xsl:variable>
		<xsl:for-each select="id(@xrefid)">
		<fo:inline baseline-shift="super" font-size="70%">
					<fo:basic-link internal-destination="{@xrefid}">
	  <xsl:call-template name="format.footnote.mark">
    <xsl:with-param name="mark">
      <xsl:apply-templates select="." mode="footnote.number"/>
    </xsl:with-param>
  </xsl:call-template>
				<!--xsl:value-of disable-output-escaping="no" select="@label"/-->
			</fo:basic-link>
		</fo:inline>
		</xsl:for-each>
	  <!--xsl:call-template name="format.footnote.mark">
    <xsl:with-param name="mark">
      <xsl:apply-templates select="$footnote" mode="footnote.number"/>
    </xsl:with-param>
  </xsl:call-template-->
 

  <!--xsl:if test="not(local-name($footnote) = 'ftnote')">
   <xsl:message terminate="yes">
ERROR: A footnoteref element has a linkend that points to an element that is not a footnote. 
Typically this happens when an id attribute is accidentally applied to the child of a footnote element. 
target element: <xsl:value-of select="local-name($footnote)"/>
linkend/id: <xsl:value-of select="@xrefid"/>
   </xsl:message>
  </xsl:if>

  <xsl:call-template name="format.footnote.mark">
    <xsl:with-param name="mark">
      <xsl:apply-templates select="$footnote" mode="footnote.number"/>
    </xsl:with-param>
  </xsl:call-template-->
</xsl:template>
<!--	-->
	
		<xsl:template match="ftnote/ftnpara">
  <!-- this only works if the first thing in a footnote is a para, -->
  <!-- which is ok, because it usually is. -->
  <fo:block>
    <xsl:call-template name="format.footnote.mark">
      <xsl:with-param name="mark">
        <xsl:apply-templates select="ancestor::ftnote" mode="footnote.number"/>
      </xsl:with-param>
    </xsl:call-template>
<xsl:apply-templates select="node()"/>
  </fo:block>
</xsl:template>

<xsl:template match="ftnote" mode="table.footnote.mode">
  <xsl:choose>
    <xsl:when test="local-name(*[1]) = 'ftnpara'">
      <fo:block xsl:use-attribute-sets="table.footnote.properties">
        <xsl:apply-templates/>
      </fo:block>
    </xsl:when>

    <xsl:when test="$exsl.node.set.available != 0">
      <fo:block xsl:use-attribute-sets="table.footnote.properties">
        <xsl:apply-templates select="*[1]" mode="footnote.body.number"/>
        <xsl:apply-templates select="*[position() &gt; 1]"/>
      </fo:block>
    </xsl:when>

    <xsl:otherwise>
      <xsl:message>
        <xsl:text>Warning: footnote number may not be generated </xsl:text>
        <xsl:text>correctly; </xsl:text>
        <xsl:value-of select="local-name(*[1])"/>
        <xsl:text> unexpected as first child of footnote.</xsl:text>
      </xsl:message>
      <fo:block xsl:use-attribute-sets="table.footnote.properties">
        <xsl:apply-templates/>
      </fo:block>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--	<xsl:template match="*" mode="footnote.body.number">
  <xsl:variable name="footnote.mark">
    <xsl:call-template name="format.footnote.mark">
      <xsl:with-param name="mark">
        <xsl:apply-templates select="ancestor::footnote" mode="footnote.number"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="fo">
    <xsl:apply-templates select="."/>
  </xsl:variable>
  <xsl:variable name="fo-nodes" select="node-name($fo)"/>

  <xsl:choose>
    <xsl:when test="$fo-nodes//fo:block">
      <xsl:apply-templates select="$fo-nodes" mode="insert.fo.fnum">
        <xsl:with-param name="mark" select="$footnote.mark"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="$fo-nodes" mode="insert.fo.text">
        <xsl:with-param name="mark" select="$footnote.mark"/>
      </xsl:apply-templates>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>-->

<xsl:template match="ftnote" mode="footnote.number">
  <xsl:choose>
    <!--xsl:when test="string-length(@label) != 0">
      <xsl:value-of select="@label"/>
    </xsl:when-->
    <xsl:when test="ancestor::table">
      <xsl:variable name="tfnum">
        <xsl:number level="any" from="table" format="1"/>
      </xsl:variable>

      <!--xsl:choose>
        <xsl:when test="string-length($table.footnote.number.symbols) &gt;= $tfnum">
          <xsl:value-of select="substring($table.footnote.number.symbols, $tfnum, 1)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:number level="any" from="table"
                      format="{$table.footnote.number.format}"/>
        </xsl:otherwise>
      </xsl:choose-->
          <xsl:number level="any" from="table"
                      format="{$table.footnote.number.format}"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="fnum">
        <!-- * Determine the footnote number to display for this footnote, -->
        <!-- * by counting all foonotes, and any elements that have -->
        <!-- * an xlink:href attribute that meets the following criteria: -->
        <xsl:number from="aalwp | ammowp | auxeqpwp | ammo.markingwp | bdar-geninfowp | bdartoolswp | bulk_itemswp | coeibiiwp | compchklistwp | ctrlindwp | damage-assesswp | descwp |  destruct-introwp | destruct-materialwp | diagnosticwp | dmwr_introwp | dmwr_operationalreqwp | dmwr_qarwp | emergencywp | eqploadwp | explistwp | facilwp | gen.maintwp | genrepairwp | genwp | ginfowp | introwp | inventorywp | kitswp | loepwp | lubewp | macintrowp | macwp | maintwp | manu_items_introwp | manuwp | mobilwp | mrplwp | natowp | nsnindxwp | oipwp | opcheck-tswp | opcheckwp | opunuwp | opusualwp | orschwp | perseqpwp | plwp | pm-ginfowp | pmcsintrowp | pmcswp | pmi-cklistwp | pmiwp | pms-ginfowp | pms-inspecwp | pnindxwp | ppmgeninfowp | pshopanalwp | qawp | refdesindxwp | refwp | stl_partswp | stlwp | storagewp | stowagewp | substitute-matwp | supitemwp | surwp | techdescwp | thrywp | toolidwp | torquewp | totnum.wps | tsindxwp | tsintrowp | tswp | wiringwp | wtloadwp | //howtouse / softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp"  level="any"  count="ftnote[not(@label)][not(ancestor::table)]"  format="1"/>
      </xsl:variable>
      <!--xsl:choose>
        <xsl:when test="string-length($footnote.number.symbols) &gt;= $fnum">
          <xsl:value-of select="substring($footnote.number.symbols, $fnum, 1)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:number value="$fnum" format="{$footnote.number.format}"/>
        </xsl:otherwise>
      </xsl:choose-->
           <xsl:number value="$fnum" format="{$footnote.number.format}"/>
   </xsl:otherwise>
  </xsl:choose>
</xsl:template>
<xsl:template match="funcdepend">
		<xsl:text> </xsl:text>
    	    <fo:inline font-weight="normal">
      <xsl:apply-templates select="node()"/>
    </fo:inline>
    <xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="harness-indx">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="hazdesc">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="howtouse-alt">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="interconnect">
		<xsl:text> </xsl:text>
    	    <fo:inline font-weight="normal">
      <xsl:apply-templates select="node()"/>
    </fo:inline>
    <xsl:text> </xsl:text>
	</xsl:template>
<!--	<xsl:template match="internet">
		<xsl:text> </xsl:text>
    	    <fo:inline font-weight="normal">
      <xsl:apply-templates select="homepage | email"/>
    </fo:inline>
    <xsl:text> </xsl:text>
	</xsl:template>-->
	<xsl:template match="item">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="itemno">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="memdata">
		<xsl:text> </xsl:text>
    	    <fo:inline font-weight="normal">
      <xsl:apply-templates select="node()"/>
    </fo:inline>
    <xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="memloc">
	<xsl:text> </xsl:text>
    	    <fo:inline font-weight="normal">
      <xsl:apply-templates select="node()"/>
    </fo:inline>
    <xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="mwo">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="nonrepairable">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pms-geninfo">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="pms-para">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="quality_program">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="reason">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="reasonfortest">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="repairable">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="reporting.para">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="schematic">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="serialno">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="sysdesc">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="testflow">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="text">
		<xsl:apply-templates/>
	</xsl:template>


	</xsl:stylesheet>