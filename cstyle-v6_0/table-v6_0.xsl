<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:param name="table.cell.border.color">black</xsl:param>
<xsl:param name="table.cell.border.style">solid</xsl:param>
<xsl:param name="table.cell.border.thickness">0.5pt</xsl:param>
<xsl:attribute-set name="table.cell.padding">
  <xsl:attribute name="padding-left">2pt</xsl:attribute>
  <xsl:attribute name="padding-right">2pt</xsl:attribute>
  <xsl:attribute name="padding-top">2pt</xsl:attribute>
  <xsl:attribute name="padding-bottom">2pt</xsl:attribute>
</xsl:attribute-set>
<xsl:param name="default.table.width"/>
<xsl:param name="default.table.frame">all</xsl:param>
<xsl:param name="table.frame.border.color">black</xsl:param>
<xsl:param name="table.frame.border.style">solid</xsl:param>
<xsl:param name="table.frame.border.thickness">0.5pt</xsl:param>
<xsl:attribute-set name="table.table.properties">
  <xsl:attribute name="border-before-width.conditionality">retain</xsl:attribute>
  <xsl:attribute name="border-collapse">collapse</xsl:attribute>
</xsl:attribute-set>

<!-- added foolowing for handling applicability in a CALS table -->
		<!--xsl:variable name="tgroup.cols"><xsl:value-of select="ancestor::tgroup[1]/@cols"/></xsl:variable>
		<xsl:attribute-set name="table.row.spanned">
			<xsl:attribute name="number-rows-spanned">1</xsl:attribute>
			<xsl:attribute name="number-columns-spanned"><xsl:value-of select="$tgroup.cols"/></xsl:attribute>
		</xsl:attribute-set-->
<!-- END handling applicability in a CALS table -->


	<!--xsl:variable name="default.table.width">100%</xsl:variable-->
	<!--xsl:variable name="default.table.align">center</xsl:variable-->
	<!--xsl:variable name="default.units">pt</xsl:variable-->
	<!--xsl:variable name="table.border.color">black</xsl:variable-->
	<!--xsl:variable name="table.border.style">solid</xsl:variable-->
	<xsl:variable name="table.border.thickness">0.5pt</xsl:variable>
<xsl:variable name="table.entry.padding">2pt</xsl:variable>
<xsl:variable name="table.entry.margin">2pt</xsl:variable>
	<xsl:attribute-set name="table.cell.padding">
		<xsl:attribute name="padding-left"><xsl:value-of select="$table.entry.padding"/></xsl:attribute>
		<xsl:attribute name="padding-right"><xsl:value-of select="$table.entry.padding"/></xsl:attribute>
		<xsl:attribute name="padding-top"><xsl:value-of select="$table.entry.padding"/></xsl:attribute>
		<xsl:attribute name="padding-bottom"><xsl:value-of select="$table.entry.padding"/></xsl:attribute>
		<xsl:attribute name="margin"><xsl:value-of select="$table.entry.margin"/></xsl:attribute>
		
</xsl:attribute-set>
		
		
	<!-- 
ELEMENT<table> 
-->

<xsl:template match="table-alt">
<xsl:apply-templates select="table"/>
</xsl:template>

	<xsl:template match="table">
		<fo:block space-after.conditionality="discard" space-after.maximum="8pt" space-after.minimum="6pt" space-after.optimum="7pt" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" display-align="center" text-align="center" hyphenate="true" hyphenation-character="-" hyphenation-keep="column" id="{generate-id(.)}">
			<xsl:attribute name="font-size">
			<xsl:choose>
			<xsl:when test="contains(@tabstyle,'font-size-')">
			<xsl:value-of select="substring-before(substring-after(@tabstyle,'font-size-'),'-')"/></xsl:when>
			<xsl:otherwise>10pt</xsl:otherwise>
			</xsl:choose>
			</xsl:attribute>
			<fo:table-and-caption start-indent="0in">
				<fo:table-caption caption-side="top">
				<fo:block>
					<xsl:apply-templates select="title"/></fo:block>
				</fo:table-caption>
				<xsl:apply-templates select="tgroup"/>
			</fo:table-and-caption>
		</fo:block>
   <!-- <fo:marker marker-class-name="tabletitle"/>-->
				 <!--<fo:marker marker-class-name="tabletitle">
      <xsl:value-of select="title"/> - (CONTINUED)
    </fo:marker>--> <!-- Doesnt go here.  Works but gives and error on output -->
    <!--<fo:block>
				<fo:marker marker-class-name="table-caption-continued">
					<xsl:apply-templates select="title" /> - Continued </fo:marker>
			</fo:block>-->
			
	</xsl:template>

	<xsl:template match="table/title">
		<xsl:param name="tblctr">
			<xsl:number count="table[not(parent::table-alt)][not(following-sibling::title)]|table-alt" format="1." from="ginfowp | descwp | thrywp | abbrevwp | symbolwp | ctrlindwp | opusualwp | opunuwp | stowagewp | eqploadwp | tsindxwp | pshopanalwp | compchklistwp | opcheck-tswp | tswp | opcheckwp | tsintrowp | techdescwp | surwp | perseqpwp | pmcsintrowp | pmcswp | pmcstable | gen.maintwp | maintwp | pmiwp | lubewp | facilwp | oipwp | mobilwp | qawp | manuwp | torquewp | inventorywp | storagewp | wtloadwp |wiringwp | ammowp | ammo.markingwp | natowp | auxeqpwp | wiringwp | pms-inspecwp | pmi-cklistwp | refwp | macintrowp | macwp | rpstlwp | coeibiiwp | plwp | aalwp | explistwp | toolidwp | mrplwp | csi.wp | supitemwp | genwp | introwp | destruct-ginfowp | destruct-materialwp | bdar-geninfowp | damage-assesswp | genrepairwp | bdartoolswp | substitute-matwp | destruct-introwp | ppmgeninfowp | orschwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | warnsum | howtouse" level="any"/>
		</xsl:param>
		<fo:block-container text-align="center">
		<fo:block font-family="sans-serif" font-size="100%" font-weight="bold" keep-with-next.within-column="always" space-after="6pt" space-before="12pt" space-before.conditionality="discard" span="all" text-align="center" >
			<xsl:call-template name="CHANGEBAR"/> <!-- self -->
			<xsl:call-template name="CHANGEBAR_3"/><!-- parent -->
			<xsl:text>Table&#x2002;</xsl:text>
			<xsl:value-of select="$tblctr"/>
			<xsl:text>&#x2002;</xsl:text>
			<xsl:if test="../@applicable">
				<xsl:variable name="applicvalue">
					<xsl:value-of select="../@applicable"/>
				</xsl:variable>
				<!--<fo:inline font-weight="bold">-->
					<xsl:text> (</xsl:text>
					<xsl:value-of select="//*/applic[@id=$applicvalue]/@abbrevcode"/>
					<xsl:text>) </xsl:text>
				<!--</fo:inline>-->
				<xsl:text>&#x2002;</xsl:text>
			</xsl:if>
			<xsl:apply-templates select="node()"/>
			<xsl:text>.&#x2002; </xsl:text>
		</fo:block>
		</fo:block-container>
	</xsl:template>
	
<!-- from DOCBOOK FO\tables.xsl -->
<!-- ==================================================================== -->

<xsl:template name="empty.table.cell">
  <xsl:param name="colnum" select="0"/>

  <xsl:variable name="rowsep">
    <xsl:choose>
      <!-- If this is the last row, rowsep never applies. -->
      <xsl:when test="not(ancestor-or-self::row[1]/following-sibling::row
                          or ancestor-or-self::thead/following-sibling::tbody
                          or ancestor-or-self::tbody/preceding-sibling::tfoot)">
        <xsl:value-of select="0"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inherited.table.attribute">
          <xsl:with-param name="entry" select="NOT-AN-ELEMENT-NAME"/>
          <xsl:with-param name="row" select="ancestor-or-self::row[1]"/>
          <xsl:with-param name="colnum" select="$colnum"/>
          <xsl:with-param name="attribute" select="'rowsep'"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="colsep">
    <xsl:choose>
      <!-- If this is the last column, colsep never applies. -->
      <xsl:when test="number($colnum) &gt;= ancestor::tgroup/@cols">0</xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inherited.table.attribute">
          <xsl:with-param name="entry" select="NOT-AN-ELEMENT-NAME"/>
          <xsl:with-param name="row" select="ancestor-or-self::row[1]"/>
          <xsl:with-param name="colnum" select="$colnum"/>
          <xsl:with-param name="attribute" select="'colsep'"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <fo:table-cell text-align="center"
                 display-align="center"
                 xsl:use-attribute-sets="table.cell.padding">
    <!--xsl:if test="$xep.extensions != 0"-->
      <!-- Suggested by RenderX to workaround a bug in their implementation -->
      <!--xsl:attribute name="keep-together.within-column">always</xsl:attribute>
    </xsl:if-->
    <xsl:if test="$rowsep &gt; 0">
      <xsl:call-template name="border">
        <xsl:with-param name="side" select="'bottom'"/>
      </xsl:call-template>
    </xsl:if>

    <xsl:if test="$colsep &gt; 0 and number($colnum) &lt; ancestor::tgroup/@cols">
      <xsl:call-template name="border">
        <xsl:with-param name="side" select="'right'"/>
      </xsl:call-template>
    </xsl:if>

    <!-- fo:table-cell should not be empty -->
    <fo:block/>
  </fo:table-cell>
</xsl:template>

<!-- ==================================================================== -->
<xsl:template name="table.frame">
  <xsl:variable name="frame">
    <xsl:choose>
      <xsl:when test="../@frame">
        <xsl:value-of select="../@frame"/>
      </xsl:when>
      <xsl:when test="$default.table.frame != ''">
        <xsl:value-of select="$default.table.frame"/>
      </xsl:when>
      <xsl:otherwise>all</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$frame='all'">
      <xsl:attribute name="border-left-style">
        <xsl:value-of select="$table.frame.border.style"/>
      </xsl:attribute>
      <xsl:attribute name="border-right-style">
        <xsl:value-of select="$table.frame.border.style"/>
      </xsl:attribute>
      <xsl:attribute name="border-top-style">
        <xsl:value-of select="$table.frame.border.style"/>
      </xsl:attribute>
      <xsl:attribute name="border-bottom-style">
        <xsl:value-of select="$table.frame.border.style"/>
      </xsl:attribute>
      <xsl:attribute name="border-left-width">
        <xsl:value-of select="$table.frame.border.thickness"/>
      </xsl:attribute>
      <xsl:attribute name="border-right-width">
        <xsl:value-of select="$table.frame.border.thickness"/>
      </xsl:attribute>
      <xsl:attribute name="border-top-width">
        <xsl:value-of select="$table.frame.border.thickness"/>
      </xsl:attribute>
      <xsl:attribute name="border-bottom-width">
        <xsl:value-of select="$table.frame.border.thickness"/>
      </xsl:attribute>
      <xsl:attribute name="border-left-color">
        <xsl:value-of select="$table.frame.border.color"/>
      </xsl:attribute>
      <xsl:attribute name="border-right-color">
        <xsl:value-of select="$table.frame.border.color"/>
      </xsl:attribute>
      <xsl:attribute name="border-top-color">
        <xsl:value-of select="$table.frame.border.color"/>
      </xsl:attribute>
      <xsl:attribute name="border-bottom-color">
        <xsl:value-of select="$table.frame.border.color"/>
      </xsl:attribute>
    </xsl:when>
    <xsl:when test="$frame='bottom'">
      <xsl:attribute name="border-left-style">none</xsl:attribute>
      <xsl:attribute name="border-right-style">none</xsl:attribute>
      <xsl:attribute name="border-top-style">none</xsl:attribute>
      <xsl:attribute name="border-bottom-style">
        <xsl:value-of select="$table.frame.border.style"/>
      </xsl:attribute>
      <xsl:attribute name="border-bottom-width">
        <xsl:value-of select="$table.frame.border.thickness"/>
      </xsl:attribute>
      <xsl:attribute name="border-bottom-color">
        <xsl:value-of select="$table.frame.border.color"/>
      </xsl:attribute>
    </xsl:when>
    <xsl:when test="$frame='sides'">
      <xsl:attribute name="border-left-style">
        <xsl:value-of select="$table.frame.border.style"/>
      </xsl:attribute>
      <xsl:attribute name="border-right-style">
        <xsl:value-of select="$table.frame.border.style"/>
      </xsl:attribute>
      <xsl:attribute name="border-top-style">none</xsl:attribute>
      <xsl:attribute name="border-bottom-style">none</xsl:attribute>
      <xsl:attribute name="border-left-width">
        <xsl:value-of select="$table.frame.border.thickness"/>
      </xsl:attribute>
      <xsl:attribute name="border-right-width">
        <xsl:value-of select="$table.frame.border.thickness"/>
      </xsl:attribute>
      <xsl:attribute name="border-left-color">
        <xsl:value-of select="$table.frame.border.color"/>
      </xsl:attribute>
      <xsl:attribute name="border-right-color">
        <xsl:value-of select="$table.frame.border.color"/>
      </xsl:attribute>
    </xsl:when>
    <xsl:when test="$frame='top'">
      <xsl:attribute name="border-left-style">none</xsl:attribute>
      <xsl:attribute name="border-right-style">none</xsl:attribute>
      <xsl:attribute name="border-top-style">
        <xsl:value-of select="$table.frame.border.style"/>
      </xsl:attribute>
      <xsl:attribute name="border-bottom-style">none</xsl:attribute>
      <xsl:attribute name="border-top-width">
        <xsl:value-of select="$table.frame.border.thickness"/>
      </xsl:attribute>
      <xsl:attribute name="border-top-color">
        <xsl:value-of select="$table.frame.border.color"/>
      </xsl:attribute>
    </xsl:when>
    <xsl:when test="$frame='topbot'">
      <xsl:attribute name="border-left-style">none</xsl:attribute>
      <xsl:attribute name="border-right-style">none</xsl:attribute>
      <xsl:attribute name="border-top-style">
        <xsl:value-of select="$table.frame.border.style"/>
      </xsl:attribute>
      <xsl:attribute name="border-bottom-style">
        <xsl:value-of select="$table.frame.border.style"/>
      </xsl:attribute>
      <xsl:attribute name="border-top-width">
        <xsl:value-of select="$table.frame.border.thickness"/>
      </xsl:attribute>
      <xsl:attribute name="border-bottom-width">
        <xsl:value-of select="$table.frame.border.thickness"/>
      </xsl:attribute>
      <xsl:attribute name="border-top-color">
        <xsl:value-of select="$table.frame.border.color"/>
      </xsl:attribute>
      <xsl:attribute name="border-bottom-color">
        <xsl:value-of select="$table.frame.border.color"/>
      </xsl:attribute>
    </xsl:when>
    <xsl:when test="$frame='none'">
      <xsl:attribute name="border-left-style">none</xsl:attribute>
      <xsl:attribute name="border-right-style">none</xsl:attribute>
      <xsl:attribute name="border-top-style">none</xsl:attribute>
      <xsl:attribute name="border-bottom-style">none</xsl:attribute>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message>
        <xsl:text>Impossible frame on table: </xsl:text>
        <xsl:value-of select="$frame"/>
      </xsl:message>
      <xsl:attribute name="border-left-style">none</xsl:attribute>
      <xsl:attribute name="border-right-style">none</xsl:attribute>
      <xsl:attribute name="border-top-style">none</xsl:attribute>
      <xsl:attribute name="border-bottom-style">none</xsl:attribute>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template name="border">
  <xsl:param name="side" select="'left'"/>

  <xsl:attribute name="border-{$side}-width">
    <xsl:value-of select="$table.cell.border.thickness"/>
  </xsl:attribute>
  <xsl:attribute name="border-{$side}-style">
    <xsl:value-of select="$table.cell.border.style"/>
  </xsl:attribute>
  <xsl:attribute name="border-{$side}-color">
    <xsl:value-of select="$table.cell.border.color"/>
  </xsl:attribute>
</xsl:template>

<!-- ==================================================================== -->

	<xsl:template match="tgroup">
		<xsl:variable name="colspecs">
			<xsl:call-template name="generate.colgroup">
				<xsl:with-param name="cols" select="@cols"> </xsl:with-param>
				<xsl:with-param name="count" select="1"> </xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<fo:table>
			<xsl:variable name="frame">
				<xsl:choose>
					<xsl:when test="../@frame">
						<xsl:value-of select="../@frame"/>
					</xsl:when>
					<xsl:otherwise>all</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="$frame='all'">
					<xsl:attribute name="border-left-style">solid</xsl:attribute>
					<xsl:attribute name="border-right-style">solid</xsl:attribute>
					<xsl:attribute name="border-top-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-left-width"><xsl:value-of select="$table.border.thickness"/></xsl:attribute>
					<xsl:attribute name="border-right-width"><xsl:value-of select="$table.border.thickness"/></xsl:attribute>
					<xsl:attribute name="border-top-width"><xsl:value-of select="$table.border.thickness"/></xsl:attribute>
					<xsl:attribute name="border-bottom-width"><xsl:value-of select="$table.border.thickness"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="$frame='bottom'">
					<xsl:attribute name="border-left-style">none</xsl:attribute>
					<xsl:attribute name="border-right-style">none</xsl:attribute>
					<xsl:attribute name="border-top-style">none</xsl:attribute>
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-width"><xsl:value-of select="$table.border.thickness"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="$frame='sides'">
					<xsl:attribute name="border-left-style">solid</xsl:attribute>
					<xsl:attribute name="border-right-style">solid</xsl:attribute>
					<xsl:attribute name="border-top-style">none</xsl:attribute>
					<xsl:attribute name="border-bottom-style">none</xsl:attribute>
					<xsl:attribute name="border-left-width"><xsl:value-of select="$table.border.thickness"/></xsl:attribute>
					<xsl:attribute name="border-right-width"><xsl:value-of select="$table.border.thickness"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="$frame='top'">
					<xsl:attribute name="border-left-style">none</xsl:attribute>
					<xsl:attribute name="border-right-style">none</xsl:attribute>
					<xsl:attribute name="border-top-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-style">none</xsl:attribute>
					<xsl:attribute name="border-top-width"><xsl:value-of select="$table.border.thickness"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="$frame='topbot'">
					<xsl:attribute name="border-left-style">none</xsl:attribute>
					<xsl:attribute name="border-right-style">none</xsl:attribute>
					<xsl:attribute name="border-top-style">solid</xsl:attribute>
					<xsl:attribute name="border-bottom-style">solid</xsl:attribute>
					<xsl:attribute name="border-top-width"><xsl:value-of select="$table.border.thickness"/></xsl:attribute>
					<xsl:attribute name="border-bottom-width"><xsl:value-of select="$table.border.thickness"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="$frame='none'">
					<xsl:attribute name="border-left-style">none</xsl:attribute>
					<xsl:attribute name="border-right-style">none</xsl:attribute>
					<xsl:attribute name="border-top-style">none</xsl:attribute>
					<xsl:attribute name="border-bottom-style">none</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:message terminate="no">
						<xsl:text>Impossible frame on table:</xsl:text>
						<xsl:value-of select="$frame"/>
					</xsl:message>
					<xsl:attribute name="border-left-style">none</xsl:attribute>
					<xsl:attribute name="border-right-style">none</xsl:attribute>
					<xsl:attribute name="border-top-style">none</xsl:attribute>
					<xsl:attribute name="border-bottom-style">none</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:attribute name="width"><xsl:value-of select="$default.table.width"/></xsl:attribute>
			<xsl:copy-of select="$colspecs"/>
			<xsl:apply-templates select="thead"/>
			<xsl:apply-templates select="tbody"/>
			<xsl:apply-templates select="tfoot"/>
		</fo:table>
	</xsl:template>

<xsl:template match="colspec"></xsl:template>

<xsl:template name="table.width">

  <xsl:variable name="numcols">
    <xsl:call-template name="widest-html-row">
      <xsl:with-param name="rows" select=".//tr"/>
    </xsl:call-template>
  </xsl:variable>

  <!--xsl:variable name="explicit.table.width">
    <xsl:choose>
      <xsl:when test="self::entrytbl">
        <xsl:call-template name="pi.dbfo_table-width"/>
      </xsl:when>
      <xsl:when test="self::table or self::informaltable">
        <xsl:call-template name="pi.dbfo_table-width"/>
      </xsl:when>
      <xsl:otherwise-->
        <!-- * no dbfo@table-width PI as a child of this table, so check -->
        <!-- * the parent of this table to see if the table has any -->
        <!-- * sibling dbfo@table-width PIs (FIXME: 2007-07 MikeSmith: we -->
        <!-- * should really instead be checking here just to see if the -->
        <!-- * first preceding sibling of this table is a -->
        <!-- * dbfo@table-width PI) -->
        <!--xsl:call-template name="pi.dbfo_table-width">
          <xsl:with-param name="node" select=".."/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable-->

  <xsl:variable name="column.sum">
    <xsl:choose>
      <!-- CALS table -->
      <xsl:when test="@cols">
        <xsl:if test="count(colspec) = @cols">
          <xsl:for-each select="colspec">
            <xsl:if test="position() != 1">
              <xsl:text> + </xsl:text>
            </xsl:if>
            <xsl:choose>
              <xsl:when test="not(@colwidth)">NOWIDTH</xsl:when>
              <xsl:when test="contains(@colwidth, '*')">NOWIDTH</xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="@colwidth"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <!-- HTML table -->
        <xsl:if test="count(col|colgroup/col) = $numcols">
          <xsl:for-each select="col|colgroup/col">
            <xsl:if test="position() != 1">
              <xsl:text> + </xsl:text>
            </xsl:if>
            <xsl:choose>
              <xsl:when test="not(@width)">NOWIDTH</xsl:when>
              <xsl:when test="contains(@width, '%')">NOWIDTH</xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="@width"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="column.sum.width">
    <xsl:if test="not(contains($column.sum, 'NOWIDTH'))">
      <xsl:value-of select="$column.sum"/>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="prop-columns"
                select=".//colspec[contains(@colwidth, '*')]"/>

  <xsl:variable name="table.width">
    <xsl:choose>
      <!--xsl:when test="$explicit.table.width != ''">
        <xsl:value-of select="$explicit.table.width"/>
      </xsl:when-->
      <xsl:when test="$column.sum.width != ''">
        <xsl:value-of select="$column.sum.width"/>
      </xsl:when>
      <xsl:when test="$default.table.width = ''">
        <xsl:choose>
          <!-- These processors don't support table-layout="auto" -->
          <xsl:when test="$fop.extensions != 0 or
                          $fop1.extensions != 0 or
                          $passivetex.extensions != 0">
            <xsl:text>100%</xsl:text>
          </xsl:when>
          <!-- Proportional columns imply 100% width -->
          <xsl:when test="count($prop-columns) != 0">
            <xsl:text>100%</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>auto</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$default.table.width"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:value-of select="$table.width"/>

</xsl:template>

<xsl:template match="spanspec"></xsl:template>

<xsl:template match="thead">
  <xsl:variable name="tgroup" select="parent::*"/>

  <fo:table-header start-indent="0pt" end-indent="0pt">
    <xsl:apply-templates select="row[1]">
      <xsl:with-param name="spans">
        <xsl:call-template name="blank.spans">
          <xsl:with-param name="cols" select="../@cols"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:apply-templates>
  </fo:table-header>
</xsl:template>

<xsl:template match="tfoot">
  <xsl:variable name="tgroup" select="parent::*"/>
  <fo:table-footer start-indent="0pt" end-indent="0pt">
    <xsl:apply-templates select="row[1]">
      <xsl:with-param name="spans">
        <xsl:call-template name="blank.spans">
          <xsl:with-param name="cols" select="../@cols"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:apply-templates>
  </fo:table-footer>
</xsl:template>

<xsl:template match="tbody">
  <xsl:variable name="tgroup" select="parent::*"/>

  <fo:table-body start-indent="0pt" end-indent="0pt">
    <xsl:apply-templates select="row[1]">
      <xsl:with-param name="spans">
        <xsl:call-template name="blank.spans">
          <xsl:with-param name="cols" select="../@cols"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:apply-templates>
  </fo:table-body>
</xsl:template>

<xsl:template match="row">
  <xsl:param name="spans"/>
<!--<xsl:call-template name="CHANGEBAR"/>-->
  <xsl:choose>
    <xsl:when test="contains($spans, '0')">
      <xsl:call-template name="normal-row">
        <xsl:with-param name="spans" select="$spans"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>

      <xsl:if test="normalize-space(.//text()) != ''">
        <xsl:message>Warning: overlapped row contains content!</xsl:message>
      </xsl:if>

      <fo:table-row>
        <xsl:comment> This row intentionally left blank </xsl:comment>
        <fo:table-cell><fo:block/></fo:table-cell>
      </fo:table-row>

      <xsl:apply-templates select="following-sibling::row[1]">
        <xsl:with-param name="spans">
          <xsl:call-template name="consume-row">
            <xsl:with-param name="spans" select="$spans"/>
          </xsl:call-template>
        </xsl:with-param>
      </xsl:apply-templates>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="normal-row">
  <xsl:param name="spans"/>
<!-- added foolowing for handling applicability in a CALS table -->
	<xsl:if test="@applicable">
		<xsl:variable name="tgroup.cols"><xsl:value-of select="ancestor::tgroup[1]/@cols"/></xsl:variable>
		<fo:table-row keep-with-next.within-page="always" border="inherit">
			<fo:table-cell > <!--xsl:use-attribute-sets="table.row.spanned"-->
				<xsl:attribute name="number-columns-spanned"><xsl:value-of select="$tgroup.cols"/></xsl:attribute>
			<fo:block>
<!--					<xsl:variable name="applicvalue">
					</xsl:variable>
					<fo:inline font-weight="bold">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="//*/applic[@id=$applicvalue]/@abbrevcode"/>
						<xsl:text>) </xsl:text>
					</fo:inline>
-->
		<xsl:variable name="applicvalue">
			<xsl:value-of select="@applicable"/>
		</xsl:variable>
    <xsl:variable name="tokenizedapplic" select="tokenize($applicvalue,' ')"/>
		<xsl:for-each select="id($tokenizedapplic)">
				<fo:inline font-weight="bold">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="@abbrevcode"/>
					<xsl:text>) </xsl:text>
				</fo:inline>
    	</xsl:for-each>
					
					<xsl:text>&#x2002;</xsl:text>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:if>
<!-- END handling applicability in a CALS table -->

  <fo:table-row>
    <xsl:call-template name="table.row.properties"/>
    <!--xsl:call-template name="anchor"/-->

  <xsl:call-template name="CHANGEBAR"/> <!-- when on row -->
	<xsl:if test="entry/@inschlvl != '0'"> <!-- when on entry -->
		<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black"  />
		<fo:change-bar-end change-bar-class="{generate-id(.)}"/>
	</xsl:if>

	    <xsl:apply-templates select="(entry|entrytbl)[1]">
      <xsl:with-param name="spans" select="$spans"/>
    </xsl:apply-templates>
  </fo:table-row>

  <xsl:if test="following-sibling::row">
    <xsl:variable name="nextspans">
      <xsl:apply-templates select="(entry|entrytbl)[1]" mode="span">
        <xsl:with-param name="spans" select="$spans"/>
      </xsl:apply-templates>
    </xsl:variable>

    <xsl:apply-templates select="following-sibling::row[1]">
      <xsl:with-param name="spans" select="$nextspans"/>
    </xsl:apply-templates>
  </xsl:if>
</xsl:template>

<!-- customize this template to add row properties -->
<xsl:template name="table.row.properties">

  <!-- Keep header row with next row -->
  <xsl:if test="ancestor::thead">
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  </xsl:if>

</xsl:template>

<xsl:template match="entry|entrytbl" name="entry">
  <xsl:param name="col" select="1"/>
  <xsl:param name="spans"/>

  <xsl:variable name="row" select="parent::row"/>
  <xsl:variable name="group" select="$row/parent::*[1]"/>
  <xsl:variable name="frame" select="ancestor::tgroup/parent::*/@frame"/>

  <xsl:variable name="empty.cell" select="count(node()) = 0"/>

  <xsl:variable name="named.colnum">
    <xsl:call-template name="entry.colnum"/>
  </xsl:variable>

  <xsl:variable name="entry.colnum">
    <xsl:choose>
      <xsl:when test="$named.colnum &gt; 0">
        <xsl:value-of select="$named.colnum"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$col"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="entry.colspan">
    <xsl:choose>
      <xsl:when test="@spanname or @namest">
        <xsl:call-template name="calculate.colspan"/>
      </xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="following.spans">
    <xsl:call-template name="calculate.following.spans">
      <xsl:with-param name="colspan" select="$entry.colspan"/>
      <xsl:with-param name="spans" select="$spans"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="rowsep">
    <xsl:choose>
      <!-- If this is the last row, rowsep never applies. -->
      <xsl:when test="not(ancestor-or-self::row[1]/following-sibling::row
                          or ancestor-or-self::thead/following-sibling::tbody
                          or ancestor-or-self::tbody/preceding-sibling::tfoot)">
        <xsl:value-of select="0"/>
      </xsl:when>
      <!-- Check for morerows too -->
      <xsl:when test="(@morerows and count(ancestor-or-self::row[1]/
                       following-sibling::row) = @morerows )
                      and not (ancestor-or-self::thead/following-sibling::tbody
                       or ancestor-or-self::tbody/preceding-sibling::tfoot)">
        <xsl:value-of select="0"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inherited.table.attribute">
          <xsl:with-param name="entry" select="."/>
          <xsl:with-param name="colnum" select="$entry.colnum"/>
          <xsl:with-param name="attribute" select="'rowsep'"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

<!--
  <xsl:message><xsl:value-of select="."/>: <xsl:value-of select="$rowsep"/></xsl:message>
-->

  <xsl:variable name="colsep">
    <xsl:choose>
      <!-- If this is the last column, colsep never applies. -->
      <xsl:when test="$following.spans = ''">0</xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inherited.table.attribute">
          <xsl:with-param name="entry" select="."/>
          <xsl:with-param name="colnum" select="$entry.colnum"/>
          <xsl:with-param name="attribute" select="'colsep'"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="valign">
    <xsl:call-template name="inherited.table.attribute">
      <xsl:with-param name="entry" select="."/>
      <xsl:with-param name="colnum" select="$entry.colnum"/>
      <xsl:with-param name="attribute" select="'valign'"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="align">
    <xsl:call-template name="inherited.table.attribute">
      <xsl:with-param name="entry" select="."/>
      <xsl:with-param name="colnum" select="$entry.colnum"/>
      <xsl:with-param name="attribute" select="'align'"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="char">
    <xsl:call-template name="inherited.table.attribute">
      <xsl:with-param name="entry" select="."/>
      <xsl:with-param name="colnum" select="$entry.colnum"/>
      <xsl:with-param name="attribute" select="'char'"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="charoff">
    <xsl:call-template name="inherited.table.attribute">
      <xsl:with-param name="entry" select="."/>
      <xsl:with-param name="colnum" select="$entry.colnum"/>
      <xsl:with-param name="attribute" select="'charoff'"/>
    </xsl:call-template>
  </xsl:variable>
<!--<xsl:call-template name="CHANGEBAR"/>-->
  <xsl:choose>
    <xsl:when test="$spans != '' and not(starts-with($spans,'0:'))">
      <xsl:call-template name="entry">
        <xsl:with-param name="col" select="$col+1"/>
        <xsl:with-param name="spans" select="substring-after($spans,':')"/>
      </xsl:call-template>
    </xsl:when>

    <xsl:when test="number($entry.colnum) &gt; $col">
      <xsl:call-template name="empty.table.cell">
        <xsl:with-param name="colnum" select="$col"/>
      </xsl:call-template>
      <xsl:call-template name="entry">
        <xsl:with-param name="col" select="$col+1"/>
        <xsl:with-param name="spans" select="substring-after($spans,':')"/>
      </xsl:call-template>
    </xsl:when>

    <xsl:otherwise>
      <xsl:variable name="cell.content">
        <fo:block>
          <xsl:call-template name="table.cell.block.properties"/>

          <!-- are we missing any indexterms? -->
          <xsl:if test="not(preceding-sibling::entry)
                        and not(parent::row/preceding-sibling::row)">
            <!-- this is the first entry of the first row -->
            <xsl:if test="ancestor::thead or
                          (ancestor::tbody
                           and not(ancestor::tbody/preceding-sibling::thead
                                   or ancestor::tbody/preceding-sibling::tbody))">
              <!-- of the thead or the first tbody -->
              <xsl:apply-templates select="ancestor::tgroup/preceding-sibling::indexterm"/>
            </xsl:if>
          </xsl:if>

          <xsl:choose>
            <xsl:when test="$empty.cell">
              <xsl:text>&#160;</xsl:text>
            </xsl:when>
            <xsl:when test="self::entrytbl">
              <xsl:variable name="prop-columns"
                            select=".//colspec[contains(@colwidth, '*')]"/>
              <fo:table xsl:use-attribute-sets="table.table.properties">
                <xsl:if test="count($prop-columns) != 0">
                  <xsl:attribute name="table-layout">fixed</xsl:attribute>
                </xsl:if>
                <!--xsl:call-template name="tgroup"/-->
                <xsl:apply-templates select="tgroup"/>
              </fo:table>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates/>
            </xsl:otherwise>
          </xsl:choose>
        </fo:block>
      </xsl:variable>

      <!--xsl:variable name="cell-orientation">
        <xsl:call-template name="pi.dbfo_orientation">
          <xsl:with-param name="node" select="ancestor-or-self::entry"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="row-orientation">
        <xsl:call-template name="pi.dbfo_orientation">
          <xsl:with-param name="node" select="ancestor-or-self::row"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="cell-width">
        <xsl:call-template name="pi.dbfo_rotated-width">
          <xsl:with-param name="node" select="ancestor-or-self::entry"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="row-width">
        <xsl:call-template name="pi.dbfo_rotated-width">
          <xsl:with-param name="node" select="ancestor-or-self::row"/>
        </xsl:call-template>
      </xsl:variable-->

      <!--xsl:variable name="orientation">
        <xsl:choose>
          <xsl:when test="$cell-orientation != ''">
            <xsl:value-of select="$cell-orientation"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$row-orientation"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable-->

      <!--xsl:variable name="rotated-width">
        <xsl:choose>
          <xsl:when test="$cell-width != ''">
            <xsl:value-of select="$cell-width"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$row-width"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable-->

      <!--xsl:variable name="bgcolor">
        <xsl:call-template name="pi.dbfo_bgcolor">
          <xsl:with-param name="node" select="ancestor-or-self::entry"/>
        </xsl:call-template>
      </xsl:variable-->

      <fo:table-cell xsl:use-attribute-sets="table.cell.padding">
        <xsl:call-template name="table.cell.properties">
          <!--xsl:with-param name="bgcolor.pi" select="$bgcolor"/-->
          <xsl:with-param name="rowsep.inherit" select="$rowsep"/>
          <xsl:with-param name="colsep.inherit" select="$colsep"/>
          <xsl:with-param name="col" select="$col"/>
          <xsl:with-param name="valign.inherit" select="$valign"/>
          <xsl:with-param name="align.inherit" select="$align"/>
          <xsl:with-param name="char.inherit" select="$char"/>
        </xsl:call-template>

        <!--xsl:call-template name="anchor"/-->

        <xsl:if test="@morerows">
          <xsl:attribute name="number-rows-spanned">
            <xsl:value-of select="@morerows+1"/>
          </xsl:attribute>
        </xsl:if>

        <xsl:if test="$entry.colspan &gt; 1">
          <xsl:attribute name="number-columns-spanned">
            <xsl:value-of select="$entry.colspan"/>
          </xsl:attribute>
        </xsl:if>

<!--
        <xsl:if test="@charoff">
          <xsl:attribute name="charoff">
            <xsl:value-of select="@charoff"/>
          </xsl:attribute>
        </xsl:if>
-->

        <!--xsl:choose>
          <xsl:when test="$fop.extensions = 0 and $passivetex.extensions = 0
                          and $orientation != ''">
            <fo:block-container reference-orientation="{$orientation}">
              <xsl:if test="$rotated-width != ''">
                <xsl:attribute name="width">
                  <xsl:value-of select="$rotated-width"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:copy-of select="$cell.content"/>
            </fo:block-container>
          </xsl:when>
          <xsl:otherwise-->
            <xsl:copy-of select="$cell.content"/>
          <!--/xsl:otherwise>
        </xsl:choose-->
      </fo:table-cell>

      <xsl:choose>
        <xsl:when test="following-sibling::entry|following-sibling::entrytbl">
          <xsl:apply-templates select="(following-sibling::entry
                                       |following-sibling::entrytbl)[1]">
            <xsl:with-param name="col" select="$col+$entry.colspan"/>
            <xsl:with-param name="spans" select="$following.spans"/>
          </xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="finaltd">
            <xsl:with-param name="spans" select="$following.spans"/>
            <xsl:with-param name="col" select="$col+$entry.colspan"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Expand this template to add properties to any fo:table-cell -->
<xsl:template name="table.cell.properties">
  <!--xsl:param name="bgcolor.pi" select="''"/-->
  <xsl:param name="rowsep.inherit" select="1"/>
  <xsl:param name="colsep.inherit" select="1"/>
  <xsl:param name="col" select="1"/>
  <xsl:param name="valign.inherit" select="''"/>
  <xsl:param name="align.inherit" select="''"/>
  <xsl:param name="char.inherit" select="''"/>

  <xsl:choose>
    <xsl:when test="ancestor::tgroup">

      <xsl:if test="$rowsep.inherit &gt; 0">
        <xsl:call-template name="border">
          <xsl:with-param name="side" select="'bottom'"/>
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="$colsep.inherit &gt; 0 and 
                      $col &lt; (ancestor::tgroup/@cols|ancestor::entrytbl/@cols)[last()]">
        <xsl:call-template name="border">
          <xsl:with-param name="side" select="'right'"/>
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="$valign.inherit != ''">
        <xsl:attribute name="display-align">
          <xsl:choose>
            <xsl:when test="$valign.inherit='top'">before</xsl:when>
            <xsl:when test="$valign.inherit='middle'">center</xsl:when>
            <xsl:when test="$valign.inherit='bottom'">after</xsl:when>
            <xsl:otherwise>
              <xsl:message>
                <xsl:text>Unexpected valign value: </xsl:text>
                <xsl:value-of select="$valign.inherit"/>
                <xsl:text>, center used.</xsl:text>
              </xsl:message>
              <xsl:text>center</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </xsl:if>

      <xsl:choose>
        <xsl:when test="$align.inherit = 'char' and $char.inherit != ''">
          <xsl:attribute name="text-align">
            <xsl:value-of select="$char.inherit"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:when test="$align.inherit != ''">
          <xsl:attribute name="text-align">
            <xsl:value-of select="$align.inherit"/>
          </xsl:attribute>
        </xsl:when>
      </xsl:choose>

    </xsl:when>
    <xsl:otherwise>
      <!-- HTML table -->
      <xsl:variable name="border" 
                    select="(ancestor::table |
                             ancestor::informaltable)[last()]/@border"/>
      <xsl:if test="$border != '' and $border != 0">
        <xsl:attribute name="border">
          <xsl:value-of select="$table.cell.border.thickness"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="$table.cell.border.style"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="$table.cell.border.color"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<!-- Expand this template to add properties to any cell's block -->
<xsl:template name="table.cell.block.properties">
  <!-- highlight this entry? -->
  <xsl:if test="ancestor::thead or ancestor::tfoot">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:if>
</xsl:template>

<xsl:template match="entry|entrytbl" name="sentry" mode="span">
  <xsl:param name="col" select="1"/>
  <xsl:param name="spans"/>

  <xsl:variable name="entry.colnum">
    <xsl:call-template name="entry.colnum"/>
  </xsl:variable>

  <xsl:variable name="entry.colspan">
    <xsl:choose>
      <xsl:when test="@spanname or @namest">
        <xsl:call-template name="calculate.colspan"/>
      </xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="following.spans">
    <xsl:call-template name="calculate.following.spans">
      <xsl:with-param name="colspan" select="$entry.colspan"/>
      <xsl:with-param name="spans" select="$spans"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$spans != '' and not(starts-with($spans,'0:'))">
      <xsl:value-of select="substring-before($spans,':')-1"/>
      <xsl:text>:</xsl:text>
      <xsl:call-template name="sentry">
        <xsl:with-param name="col" select="$col+1"/>
        <xsl:with-param name="spans" select="substring-after($spans,':')"/>
      </xsl:call-template>
    </xsl:when>

    <xsl:when test="number($entry.colnum) &gt; $col">
      <xsl:text>0:</xsl:text>
      <xsl:call-template name="sentry">
        <xsl:with-param name="col" select="$col+$entry.colspan"/>
        <xsl:with-param name="spans" select="$following.spans"/>
      </xsl:call-template>
    </xsl:when>

    <xsl:otherwise>
      <xsl:call-template name="copy-string">
        <xsl:with-param name="count" select="$entry.colspan"/>
        <xsl:with-param name="string">
          <xsl:choose>
            <xsl:when test="@morerows">
              <xsl:value-of select="@morerows"/>
            </xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
          </xsl:choose>
          <xsl:text>:</xsl:text>
        </xsl:with-param>
      </xsl:call-template>

      <xsl:choose>
        <xsl:when test="following-sibling::entry|following-sibling::entrytbl">
          <xsl:apply-templates select="(following-sibling::entry
                                       |following-sibling::entrytbl)[1]"
                               mode="span">
            <xsl:with-param name="col" select="$col+$entry.colspan"/>
            <xsl:with-param name="spans" select="$following.spans"/>
          </xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="sfinaltd">
            <xsl:with-param name="spans" select="$following.spans"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="generate.colgroup.raw">
  <xsl:param name="cols" select="1"/>
  <xsl:param name="count" select="1"/>

  <xsl:choose>
    <xsl:when test="$count>$cols"></xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="generate.col.raw">
        <xsl:with-param name="countcol" select="$count"/>
      </xsl:call-template>
      <xsl:call-template name="generate.colgroup.raw">
        <xsl:with-param name="cols" select="$cols"/>
        <xsl:with-param name="count" select="$count+1"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="generate.colgroup">
  <xsl:param name="cols" select="1"/>
  <xsl:param name="count" select="1"/>

  <xsl:choose>
    <xsl:when test="$count>$cols"></xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="generate.col">
        <xsl:with-param name="countcol" select="$count"/>
      </xsl:call-template>
      <xsl:call-template name="generate.colgroup">
        <xsl:with-param name="cols" select="$cols"/>
        <xsl:with-param name="count" select="$count+1"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="generate.col.raw">
  <!-- generate the table-column for column countcol -->
  <xsl:param name="countcol">1</xsl:param>
  <xsl:param name="colspecs" select="./colspec"/>
  <xsl:param name="count">1</xsl:param>
  <xsl:param name="colnum">1</xsl:param>

  <xsl:choose>
    <xsl:when test="$count>count($colspecs)">
      <fo:table-column column-number="{$countcol}"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="colspec" select="$colspecs[$count=position()]"/>

      <xsl:variable name="colspec.colnum">
        <xsl:choose>
          <xsl:when test="$colspec/@colnum">
            <xsl:value-of select="$colspec/@colnum"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$colnum"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:variable name="colspec.colwidth">
        <xsl:choose>
          <xsl:when test="$colspec/@colwidth">
            <xsl:value-of select="$colspec/@colwidth"/>
          </xsl:when>
          <xsl:otherwise>1*</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$colspec.colnum=$countcol">
          <fo:table-column column-number="{$countcol}">
            <xsl:attribute name="column-width">
              <xsl:value-of select="$colspec.colwidth"/>
            </xsl:attribute>
          </fo:table-column>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="generate.col.raw">
            <xsl:with-param name="countcol" select="$countcol"/>
            <xsl:with-param name="colspecs" select="$colspecs"/>
            <xsl:with-param name="count" select="$count+1"/>
            <xsl:with-param name="colnum">
              <xsl:choose>
                <xsl:when test="$colspec/@colnum">
                  <xsl:value-of select="$colspec/@colnum + 1"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$colnum + 1"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:with-param>
           </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="generate.col">
  <!-- generate the table-column for column countcol -->
  <xsl:param name="countcol">1</xsl:param>
  <xsl:param name="colspecs" select="./colspec"/>
  <xsl:param name="count">1</xsl:param>
  <xsl:param name="colnum">1</xsl:param>

  <xsl:choose>
    <xsl:when test="$count>count($colspecs)">
      <fo:table-column column-number="{$countcol}">
        <xsl:variable name="colwidth">
          <xsl:call-template name="calc.column.width"/>
        </xsl:variable>
        <xsl:if test="$colwidth != 'proportional-column-width(1)'">
          <xsl:attribute name="column-width">
            <xsl:value-of select="$colwidth"/>
          </xsl:attribute>
        </xsl:if>
      </fo:table-column>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="colspec" select="$colspecs[$count=position()]"/>

      <xsl:variable name="colspec.colnum">
        <xsl:choose>
          <xsl:when test="$colspec/@colnum">
            <xsl:value-of select="$colspec/@colnum"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$colnum"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:variable name="colspec.colwidth">
        <xsl:choose>
          <xsl:when test="$colspec/@colwidth">
            <xsl:value-of select="$colspec/@colwidth"/>
          </xsl:when>
          <xsl:otherwise>1*</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$colspec.colnum=$countcol">
          <fo:table-column column-number="{$countcol}">
            <xsl:variable name="colwidth">
              <xsl:call-template name="calc.column.width">
                <xsl:with-param name="colwidth">
                  <xsl:value-of select="$colspec.colwidth"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:variable>
            <xsl:if test="$colwidth != 'proportional-column-width(1)'">
              <xsl:attribute name="column-width">
                <xsl:value-of select="$colwidth"/>
              </xsl:attribute>
            </xsl:if>
          </fo:table-column>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="generate.col">
            <xsl:with-param name="countcol" select="$countcol"/>
            <xsl:with-param name="colspecs" select="$colspecs"/>
            <xsl:with-param name="count" select="$count+1"/>
            <xsl:with-param name="colnum">
              <xsl:choose>
                <xsl:when test="$colspec/@colnum">
                  <xsl:value-of select="$colspec/@colnum + 1"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$colnum + 1"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:with-param>
           </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template name="calc.column.width">
  <xsl:param name="colwidth">1*</xsl:param>

  <!-- Ok, the colwidth could have any one of the following forms: -->
  <!--        1*       = proportional width -->
  <!--         *       = same as 1* -->
  <!--     1unit       = 1.0 units wide -->
  <!--         1       = 1pt wide -->
  <!--  1*+1unit       = proportional width + some fixed width -->
  <!--      1*+1       = proportional width + some fixed width -->

  <!-- If it has a proportional width, translate it to XSL -->
  <xsl:if test="contains($colwidth, '*')">
    <xsl:text>proportional-column-width(</xsl:text>
    <xsl:choose>
      <xsl:when test="substring-before($colwidth, '*') != ''"> 
        <xsl:value-of select="substring-before($colwidth, '*')"/>
      </xsl:when>
      <xsl:otherwise>
         <xsl:text>1.00</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>)</xsl:text>
  </xsl:if>

  <!-- Now grab the non-proportional part of the specification -->
  <xsl:variable name="width-units">
    <xsl:choose>
      <xsl:when test="contains($colwidth, '*')">
        <xsl:value-of
             select="normalize-space(substring-after($colwidth, '*'))"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space($colwidth)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- Ok, now the width-units could have any one of the following forms: -->
  <!--                 = <empty string> -->
  <!--     1unit       = 1.0 units wide -->
  <!--         1       = 1pt wide -->
  <!-- with an optional leading sign -->

  <!-- Grab the width part by blanking out the units part and discarding -->
  <!-- whitespace. It's not pretty, but it works. -->
  <xsl:variable name="width"
       select="normalize-space(translate($width-units,
                                         '+-0123456789.abcdefghijklmnopqrstuvwxyz',
                                         '+-0123456789.'))"/>

  <!-- Grab the units part by blanking out the width part and discarding -->
  <!-- whitespace. It's not pretty, but it works. -->
  <xsl:variable name="units"
       select="normalize-space(translate($width-units,
                                         'abcdefghijklmnopqrstuvwxyz+-0123456789.',
                                         'abcdefghijklmnopqrstuvwxyz'))"/>

  <!-- Output the width -->
  <xsl:value-of select="$width"/>

  <!-- Output the units, translated appropriately -->
  <xsl:choose>
    <xsl:when test="$units = 'pi'">pc</xsl:when>
    <xsl:when test="$units = '' and $width != ''">pt</xsl:when>
    <xsl:otherwise><xsl:value-of select="$units"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ==================================================================== -->


<!-- from DOCBOOK Common\tables.xsl -->
<xsl:template name="blank.spans">
  <xsl:param name="cols" select="1"/>
  <xsl:if test="$cols &gt; 0">
    <xsl:text>0:</xsl:text>
    <xsl:call-template name="blank.spans">
      <xsl:with-param name="cols" select="$cols - 1"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="calculate.following.spans">
  <xsl:param name="colspan" select="1"/>
  <xsl:param name="spans" select="''"/>

  <xsl:choose>
    <xsl:when test="$colspan &gt; 0">
      <xsl:call-template name="calculate.following.spans">
        <xsl:with-param name="colspan" select="$colspan - 1"/>
        <xsl:with-param name="spans" select="substring-after($spans,':')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$spans"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="finaltd">
  <xsl:param name="spans"/>
  <xsl:param name="col" select="0"/>

  <xsl:if test="$spans != ''">
    <xsl:choose>
      <xsl:when test="starts-with($spans,'0:')">
        <xsl:call-template name="empty.table.cell">
          <xsl:with-param name="colnum" select="$col"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>

    <xsl:call-template name="finaltd">
      <xsl:with-param name="spans" select="substring-after($spans,':')"/>
      <xsl:with-param name="col" select="$col+1"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="sfinaltd">
  <xsl:param name="spans"/>

  <xsl:if test="$spans != ''">
    <xsl:choose>
      <xsl:when test="starts-with($spans,'0:')">0:</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring-before($spans,':')-1"/>
        <xsl:text>:</xsl:text>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:call-template name="sfinaltd">
      <xsl:with-param name="spans" select="substring-after($spans,':')"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="entry.colnum">
  <xsl:param name="entry" select="."/>

  <xsl:choose>
    <xsl:when test="$entry/@spanname">
      <xsl:variable name="spanname" select="$entry/@spanname"/>
      <xsl:variable name="spanspec"
                    select="($entry/ancestor::tgroup/spanspec[@spanname=$spanname]
                             |$entry/ancestor::entrytbl/spanspec[@spanname=$spanname])[last()]"/>
      <xsl:variable name="colspec"
                    select="($entry/ancestor::tgroup/colspec[@colname=$spanspec/@namest]
                             |$entry/ancestor::entrytbl/colspec[@colname=$spanspec/@namest])[last()]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$entry/@colname">
      <xsl:variable name="colname" select="$entry/@colname"/>
      <xsl:variable name="colspec"
                    select="($entry/ancestor::tgroup/colspec[@colname=$colname]
                             |$entry/ancestor::entrytbl/colspec[@colname=$colname])[last()]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$entry/@namest">
      <xsl:variable name="namest" select="$entry/@namest"/>
      <xsl:variable name="colspec"
                    select="($entry/ancestor::tgroup/colspec[@colname=$namest]
                             |$entry/ancestor::entrytbl/colspec[@colname=$namest])[last()]"/>
      <xsl:call-template name="colspec.colnum">
        <xsl:with-param name="colspec" select="$colspec"/>
      </xsl:call-template>
    </xsl:when>
    <!-- no idea, return 0 -->
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template name="colspec.colnum">
  <xsl:param name="colspec" select="."/>
  <xsl:choose>
    <xsl:when test="$colspec/@colnum">
      <xsl:value-of select="$colspec/@colnum"/>
    </xsl:when>
    <xsl:when test="$colspec/preceding-sibling::colspec">
      <xsl:variable name="prec.colspec.colnum">
        <xsl:call-template name="colspec.colnum">
          <xsl:with-param name="colspec"
                          select="$colspec/preceding-sibling::colspec[1]"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:value-of select="$prec.colspec.colnum + 1"/>
    </xsl:when>
    <xsl:otherwise>1</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="calculate.colspan">
  <xsl:param name="entry" select="."/>
  <xsl:variable name="spanname" select="$entry/@spanname"/>
  <xsl:variable name="spanspec"
                select="($entry/ancestor::tgroup/spanspec[@spanname=$spanname]
                         |$entry/ancestor::entrytbl/spanspec[@spanname=$spanname])[last()]"/>

  <xsl:variable name="namest">
    <xsl:choose>
      <xsl:when test="@spanname">
        <xsl:value-of select="$spanspec/@namest"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$entry/@namest"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="nameend">
    <xsl:choose>
      <xsl:when test="@spanname">
        <xsl:value-of select="$spanspec/@nameend"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$entry/@nameend"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="scol">
    <xsl:call-template name="colspec.colnum">
      <xsl:with-param name="colspec"
                      select="($entry/ancestor::tgroup/colspec[@colname=$namest]
                               |$entry/ancestor::entrytbl/colspec[@colname=$namest])[last()]"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="ecol">
    <xsl:call-template name="colspec.colnum">
      <xsl:with-param name="colspec"
                      select="($entry/ancestor::tgroup/colspec[@colname=$nameend]
                               |$entry/ancestor::entrytbl/colspec[@colname=$nameend])[last()]"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$namest != '' and $nameend != ''">
      <xsl:choose>
        <xsl:when test="number($ecol) &gt;= number($scol)">
          <xsl:value-of select="number($ecol) - number($scol) + 1"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="number($scol) - number($ecol) + 1"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>1</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="calculate.rowsep">
  <xsl:param name="entry" select="."/>
  <xsl:param name="colnum" select="0"/>

  <xsl:call-template name="inherited.table.attribute">
    <xsl:with-param name="entry" select="$entry"/>
    <xsl:with-param name="colnum" select="$colnum"/>
    <xsl:with-param name="attribute" select="'rowsep'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="calculate.colsep">
  <xsl:param name="entry" select="."/>
  <xsl:param name="colnum" select="0"/>

  <xsl:call-template name="inherited.table.attribute">
    <xsl:with-param name="entry" select="$entry"/>
    <xsl:with-param name="colnum" select="$colnum"/>
    <xsl:with-param name="attribute" select="'colsep'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="inherited.table.attribute">
  <xsl:param name="entry" select="."/>
  <xsl:param name="row" select="$entry/ancestor-or-self::row[1]"/>
  <xsl:param name="colnum" select="0"/>
  <xsl:param name="attribute" select="'colsep'"/>

  <xsl:variable name="tgroup" select="$row/parent::*/parent::tgroup[1]"/>
  <xsl:variable name="tbody" select="$row/parent::*[1]"/>

  <xsl:variable name="table" select="($tgroup/ancestor::table
                                     |$tgroup/ancestor::informaltable
				     |$entry/ancestor::entrytbl)[last()]"/>

  <xsl:variable name="entry.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$entry"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="row.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$row"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="span.value">
    <xsl:if test="$entry/@spanname">
      <xsl:variable name="spanname" select="$entry/@spanname"/>
      <xsl:variable name="spanspec"
                    select="$tgroup/spanspec[@spanname=$spanname]"/>
      <xsl:variable name="span.colspec"
                    select="$tgroup/colspec[@colname=$spanspec/@namest]"/>

      <xsl:variable name="spanspec.value">
        <xsl:call-template name="get-attribute">
          <xsl:with-param name="element" select="$spanspec"/>
          <xsl:with-param name="attribute" select="$attribute"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="scolspec.value">
        <xsl:call-template name="get-attribute">
          <xsl:with-param name="element" select="$span.colspec"/>
          <xsl:with-param name="attribute" select="$attribute"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$spanspec.value != ''">
          <xsl:value-of select="$spanspec.value"/>
        </xsl:when>
        <xsl:when test="$scolspec.value != ''">
          <xsl:value-of select="$scolspec.value"/>
        </xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="namest.value">
    <xsl:if test="$entry/@namest">
      <xsl:variable name="namest" select="$entry/@namest"/>
      <xsl:variable name="colspec"
                    select="$tgroup/colspec[@colname=$namest]"/>

      <xsl:variable name="inner.namest.value">
        <xsl:call-template name="get-attribute">
          <xsl:with-param name="element" select="$colspec"/>
          <xsl:with-param name="attribute" select="$attribute"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$inner.namest.value">
          <xsl:value-of select="$inner.namest.value"/>
        </xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="tgroup.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$tgroup"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="tbody.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$tbody"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="table.value">
    <xsl:call-template name="get-attribute">
      <xsl:with-param name="element" select="$table"/>
      <xsl:with-param name="attribute" select="$attribute"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="default.value">
    <!-- This section used to say that rowsep and colsep have defaults based -->
    <!-- on the frame setting. Further reflection and closer examination of the -->
    <!-- CALS spec reveals I was mistaken. The default is "1" for rowsep and colsep. -->
    <!-- For everything else, the default is the tgroup value -->
    <xsl:choose>
      <xsl:when test="$tgroup.value != ''">
        <xsl:value-of select="$tgroup.value"/>
      </xsl:when>
      <xsl:when test="$attribute = 'rowsep'">1</xsl:when>
      <xsl:when test="$attribute = 'colsep'">1</xsl:when>
      <xsl:otherwise><!-- empty --></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="calc.colvalue">
    <xsl:if test="$colnum &gt; 0">
      <xsl:call-template name="colnum.colspec">
        <xsl:with-param name="colnum" select="$colnum"/>
        <xsl:with-param name="attribute" select="$attribute"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$entry.value != ''">
      <xsl:value-of select="$entry.value"/>
    </xsl:when>
    <xsl:when test="$row.value != ''">
      <xsl:value-of select="$row.value"/>
    </xsl:when>
    <xsl:when test="$span.value != ''">
      <xsl:value-of select="$span.value"/>
    </xsl:when>
    <xsl:when test="$namest.value != ''">
      <xsl:value-of select="$namest.value"/>
    </xsl:when>
    <xsl:when test="$calc.colvalue != ''">
      <xsl:value-of select="$calc.colvalue"/>
    </xsl:when>
    <xsl:when test="$tbody.value != ''">
      <xsl:value-of select="$tbody.value"/>
    </xsl:when>
    <xsl:when test="$tgroup.value != ''">
      <xsl:value-of select="$tgroup.value"/>
    </xsl:when>
    <xsl:when test="$table.value != ''">
      <xsl:value-of select="$table.value"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$default.value"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="colnum.colspec">
  <xsl:param name="colnum" select="0"/>
  <xsl:param name="attribute" select="'colname'"/>
  <xsl:param name="colspec.ancestor" 
             select="(ancestor::tgroup|ancestor::entrytbl)
	             [position() = last()]"/>
  <xsl:param name="colspecs" select="$colspec.ancestor/colspec"/>
  <xsl:param name="count" select="1"/>

  <xsl:choose>
    <xsl:when test="not($colspecs) or $count &gt; $colnum">
      <!-- nop -->
    </xsl:when>
    <xsl:when test="$colspecs[1]/@colnum">
      <xsl:choose>
        <xsl:when test="$colspecs[1]/@colnum = $colnum">
          <xsl:call-template name="get-attribute">
            <xsl:with-param name="element" select="$colspecs[1]"/>
            <xsl:with-param name="attribute" select="$attribute"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="colnum.colspec">
            <xsl:with-param name="colnum" select="$colnum"/>
            <xsl:with-param name="attribute" select="$attribute"/>
            <xsl:with-param name="colspecs"
                            select="$colspecs[position()&gt;1]"/>
            <xsl:with-param name="count"
                            select="$colspecs[1]/@colnum+1"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$count = $colnum">
          <xsl:call-template name="get-attribute">
            <xsl:with-param name="element" select="$colspecs[1]"/>
            <xsl:with-param name="attribute" select="$attribute"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="colnum.colspec">
            <xsl:with-param name="colnum" select="$colnum"/>
            <xsl:with-param name="attribute" select="$attribute"/>
            <xsl:with-param name="colspecs"
                            select="$colspecs[position()&gt;1]"/>
            <xsl:with-param name="count" select="$count+1"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="get-attribute">
  <xsl:param name="element" select="."/>
  <xsl:param name="attribute" select="''"/>

  <xsl:for-each select="$element/@*">
    <xsl:if test="local-name(.) = $attribute">
      <xsl:value-of select="."/>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template name="consume-row">
  <xsl:param name="spans"/>

  <xsl:if test="contains($spans,':')">
    <xsl:value-of select="substring-before($spans,':') - 1"/>
    <xsl:text>:</xsl:text>
    <xsl:call-template name="consume-row">
      <xsl:with-param name="spans" select="substring-after($spans,':')"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<!-- *********************************************** -->
<xsl:template name="widest-html-row">
  <xsl:param name="rows" select="''"/>
  <xsl:param name="count" select="0"/>
  <xsl:choose>
    <xsl:when test="count($rows) = 0">
      <xsl:value-of select="$count"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$count &gt; count($rows[1]/*)">
          <xsl:call-template name="widest-html-row">
            <xsl:with-param name="rows" select="$rows[position() &gt; 1]"/>
            <xsl:with-param name="count" select="$count"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="widest-html-row">
            <xsl:with-param name="rows" select="$rows[position() &gt; 1]"/>
            <xsl:with-param name="count" select="count($rows[1]/*)"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
	
<xsl:template name="copy-string">
  <!-- returns 'count' copies of 'string' -->
  <xsl:param name="string"/>
  <xsl:param name="count" select="0"/>
  <xsl:param name="result"/>

  <xsl:choose>
    <xsl:when test="$count&gt;0">
      <xsl:call-template name="copy-string">
        <xsl:with-param name="string" select="$string"/>
        <xsl:with-param name="count" select="$count - 1"/>
        <xsl:with-param name="result">
          <xsl:value-of select="$result"/>
          <xsl:value-of select="$string"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$result"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


   <!-- Include code to handle CALS tables
<xsl:param name="table.border.thickness" select="'1pt'"/> -->
   <xsl:param name="table.cell.padding.amount" select="'5pt'"/>
   <xsl:param name="thead.tfoot.style">font-weight: bold; </xsl:param>
   <xsl:template name="tgroup.first">
      <xsl:call-template name="disinherit..indents"/>
      <xsl:attribute name="hyphenate">true</xsl:attribute>
   </xsl:template>
   <xsl:template name="tgroup.notfirst">
      <xsl:call-template name="disinherit..indents"/>
      <xsl:attribute name="hyphenate">true</xsl:attribute>
   </xsl:template>
   <xsl:template name="row">
      <xsl:call-template name="disinherit..indents"/>
      <xsl:attribute name="hyphenate">true</xsl:attribute>
   </xsl:template>


</xsl:stylesheet>