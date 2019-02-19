<?xml version="1.0" encoding="utf-8" standalone="no"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:param name="AutoGenTitle">TRUE</xsl:param>
	<xsl:param name="footnote.font.size">
 <xsl:value-of select="$body.font.master * 0.8"/><xsl:text>pt</xsl:text>
</xsl:param>
<xsl:param name="body.font.family" select="'serif'"/>
<xsl:param name="symbol.font.family" select="'Symbol,ZapfDingbats'"/>
<xsl:param name="table.footnote.number.format" select="'a'"/>

<xsl:param name="table.footnote.number.symbols" select="''"/>
<xsl:param name="footnote.mark.width">1em</xsl:param>

<xsl:param name="footnote.number.format" select="1"/>
<xsl:attribute-set name="table.properties"/>

<xsl:param name="table.width.default" select="''"/>
<xsl:param name="footnote.number.symbols" select="''"/>
	<xsl:param name="changenum">
		<xsl:if test="//frntcover/chgno">
			<xsl:text>Change </xsl:text>
			<xsl:value-of select="//frntcover/chgno"/>
			<xsl:text>&#x2002;-&#x2002;</xsl:text>
			<xsl:value-of select="//frntcover/chgdate"/>
		</xsl:if>
	</xsl:param>
	<xsl:param name="changetxt"> Change</xsl:param>
	<xsl:param name="chngno">
			<xsl:if test="@chnglevel">
			<xsl:text>Change&#x2002;</xsl:text>
			<xsl:value-of select="@chnglevel"/>
		</xsl:if>
	</xsl:param>
		<xsl:param name="changeno">
			<xsl:if test="//@chngno">
				<xsl:text>Change&#x2002;</xsl:text>
				<xsl:value-of select="@chngno"/>
			</xsl:if>
		</xsl:param>
	<xsl:param name="cover-pubdate" select="//frntcover/date"/>
	<xsl:param name="del-change">
		<xsl:choose>
			<xsl:when test="//paper.frnt/chgsheet/@delchlvl">
				<xsl:value-of select="//paper.frnt/chgsheet/@delchlvl"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="dmwr-inclus">
		<xsl:choose>
			<xsl:when test="@dmwr-incl='parts-tools'">(INCLUDING DEPOT MAINTENANCE REPAIR PARTS AND SPECIAL TOOLS </xsl:when>
			<xsl:when test="//paper.manual/@dmwr-incl='parts'">(INCLUDING DEPOT MAINTENANCE REPAIR PARTS </xsl:when>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="docsecr">
		<xsl:choose>
			<xsl:when test="//paper.manual/@security='ts' or //sam/@security='ts'">
				<xsl:text>TOP SECRET</xsl:text>
			</xsl:when>
			<xsl:when test="//paper.manual/@security='s' or //sam/@security='s'">
				<xsl:choose>
					<xsl:when test="descendant::*[@security='ts']">
						<xsl:text>TOP SECRET</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>SECRET</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="//paper.manual/@security='c' or //sam/@security='c'">
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
			</xsl:when>
			<xsl:when test="//paper.manual/@security='fouo' or //sam/@security='fouo'">
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
			</xsl:when>
			<xsl:when test="//paper.manual/@security='uc' or //paper.manual/@security='' or //sam/@security='uc' or //sam/@security=''">
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
					<xsl:when test="descendant::*[@security='fouo']">
						<xsl:text>FOR OFFICIAL USE ONLY</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="//sys-ts/@security='uc' or //sys-ts/@security=''">
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
					<xsl:when test="descendant::*[@security='fouo']">
						<xsl:text>FOR OFFICIAL USE ONLY</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="SecurHeaderFooterSize">
		<xsl:choose>
			<xsl:when test="string-length($docsecr)>0">24</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="imnotxt">CHAPTER</xsl:param>
	<xsl:param name="imtitletxt">INSTRUCTIONS</xsl:param>
	<xsl:param name="insert-change">
		<xsl:choose>
			<xsl:when test="//paper.frnt/chgsheet">
				<xsl:value-of select="//paper.frnt/chgsheet/chgno"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="linebrk">
		<fo:block span="all"/>
	</xsl:param>
	<xsl:param name="pubdate" select="//frntcover/date"/>
	<xsl:param name="revno" select="//paper.manual/@revno | //destruction_manual/@revno | //ammo/@revno | //sys-ts/@revno | //bdar/@revno | //pmi/@revno | //pms/@revno"/>
	<xsl:param name="rpstl">
		<xsl:if test="//paper.manual/@rpstl= 'yes'">INCLUDING REPAIR PARTS AND SPECIAL TOOLS	LIST</xsl:if>
		<xsl:if test="//paper.manual/@rpstl= 'only'">REPAIR PARTS AND SPECIAL TOOLS LIST </xsl:if>
	</xsl:param>
	<xsl:param name="service-name">
		<xsl:choose>
			<xsl:when test="//servbranch/@service='army'">Headquarters, Department of the Army</xsl:when>
			<xsl:when test="//servbranch/@service='airforce'">Headquarters, Department of the Air Force</xsl:when>
			<xsl:when test="//servbranch/@service='navy'">Headquarters, Department of the Navy</xsl:when>
			<xsl:when test="//servbranch/@service='marines'">Headquarters, Department of the Marine Corps</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="tmnotxt">
		<xsl:choose>
			<xsl:when test="//paper.manual/@maintlvls='dmwr'">DMWR</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
		<xsl:if test="ancestor::*[1][local-name() = 'volume']">
			<xsl:value-of select="volume//tmno"/>
		</xsl:if>
		<xsl:value-of select="//paper.manual/paper.frnt//tmno | //paper.manual/volume/paper.frnt//tmno | //bdar/@pubno | //destruction_manual/paper.frnt//tmno"/>
		<xsl:choose>
			<xsl:when test="//paper.manual/@rpstl='yes'">
				<xsl:text>&amp;P</xsl:text>
			</xsl:when>
			<xsl:when test="//paper.manual/@rpstl='only'">
				<xsl:text>P</xsl:text>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="typelvltitle">
		<xsl:choose>
			<xsl:when test="contains(//paper.manual/@maintlvls, '10')">
				<xsl:text>OPERATOR MANUAL</xsl:text>
			</xsl:when>
			 <xsl:when test="contains(//ammo/@maintlvls, '10')">
				<xsl:text>CONVENTIONAL AND CHEMICAL AMMUNITION OPERATOR MANUAL</xsl:text>
			</xsl:when> 
			<xsl:when test="contains(//paper.manual/@maintlvls, '13')">
				<xsl:text>OPERATOR AND FIELD MAINTENANCE MANUAL</xsl:text>
			</xsl:when>
			<xsl:when test="contains(//paper.manual/@maintlvls, '14')">
				<xsl:text>OPERATOR, FIELD AND SUSTAINMENT MAINTENANCE MANUAL</xsl:text>
			</xsl:when>
			<xsl:when test="contains(//ammo/@maintlvls, '13')">
				<xsl:text>CONVENTIONAL AND CHEMICAL AMMUNITION OPERATOR AND FIELD MAINTENANCE MANUAL</xsl:text>
			</xsl:when>
				<xsl:when test="contains(//ammo/@maintlvls, '14')">
				<xsl:text>CONVENTIONAL AND CHEMICAL AMMUNITION OPERATOR, FIELD AND SUSTAINMENT MAINTENANCE MANUAL</xsl:text>
			</xsl:when>	
			<xsl:when test="contains(//paper.manual/@maintlvls, '23')">
				<xsl:text>FIELD MAINTENANCE MANUAL</xsl:text>
			</xsl:when>
			<xsl:when test="contains(//ammo/@maintlvls, '23')">
				<xsl:text>CONVENTIONAL AND CHEMICAL AMMUNITION FIELD MAINTENANCE MANUAL</xsl:text>
			</xsl:when>	
			<xsl:when test="contains(//paper.manual/@maintlvls, '24')">
				<xsl:text>FIELD AND SUSTAINMENT MAINTENANCE MANUAL</xsl:text>
			</xsl:when>
			<xsl:when test="contains(//ammo/@maintlvls, '24')">
				<xsl:text>CONVENTIONAL AND CHEMICAL AMMUNITION FIELD AND SUSTAINMENT MAINTENANCE MANUAL</xsl:text>
			</xsl:when>
			<xsl:when test="contains(//paper.manual/@maintlvls, '40')">
				<xsl:text>SUSTAINMENT MAINTENANCE MANUAL</xsl:text>
			</xsl:when>
			<xsl:when test="contains(//ammo/@maintlvls, '40')">
				<xsl:text>CONVENTIONAL AND CHEMICAL AMMUNITION SUSTAINMENT MAINTENANCE MANUAL</xsl:text>
			</xsl:when>	
			<xsl:when test="contains(//paper.manual/@maintlvls, 'dmwr')">
				<xsl:text>DEPOT MAINTENANCE WORK REQUIREMENT</xsl:text>
			</xsl:when>
			<xsl:when test="contains(//paper.manual/@maintlvls, 'dmwr-nmwr')">
				<xsl:text>DEPOT MAINTENANCE WORK REQUIREMENT</xsl:text>
			</xsl:when>
			<xsl:when test="contains(//paper.manual/@maintlvls, 'nmwr')">
				<xsl:text>NATIONAL MAINTENANCE WORK REQUIREMENT</xsl:text>
			</xsl:when>
			<xsl:when test="//dmwr_ammo">
				<xsl:text>DEPOT MAINTENANCE WORK REQUIREMENT MAINTENANCE/DEMILITARIZAION</xsl:text>
			</xsl:when>
			<xsl:when test="contains(//pms/@maintlvls, 'PMS')">
				<xsl:text>PREVENTIVE MAINTENANCE SERVICES MANUAL</xsl:text>
			</xsl:when>	
			<xsl:when test="contains(//pms/@maintlvls, 'PMD')">
				<xsl:text>PREVENTIVE MAINTENANCE DAILY MANUAL</xsl:text>
			</xsl:when>			
			<xsl:when test="contains(//pmi/@maintlvls, 'PMI')">
				<xsl:text>PHASED MAINTENANCE INSPECTION CHECKLIST</xsl:text>
			</xsl:when>	
			<xsl:when test="//sys-ts">
				<xsl:text>AVIATION FIELD TROUBLESHOOTING MANUAL</xsl:text>
			</xsl:when>							
			<xsl:when test="//bdar">
				<xsl:text>BATTLE DAMAGE ASSESSMENT AND REPAIR</xsl:text>
			</xsl:when>
			<xsl:when test="//destruction_manual">
				<xsl:text>DESTRUCTION OF EQUIPMENT TO PREVENT ENEMY USE</xsl:text>
			</xsl:when>
			<xsl:when test="//sam">
				<xsl:text>SOFTWARE ADMINISTRATORS MANUAL</xsl:text>
			</xsl:when>
			<xsl:when test="//sum">
				<xsl:text>SOFTWARE USERS MANUAL</xsl:text>
			</xsl:when>
			<xsl:when test="//pmc">
				<xsl:text>PREVENTIVE MAINTENANCE CHECKLISTS</xsl:text>
			</xsl:when>
			<xsl:when test="//luborder">
				<xsl:text>LUBRICATION ORDERS</xsl:text>
			</xsl:when>
		 <xsl:when test="//genmaintman">			
				<xsl:text>GENERAL MAINTENANCE MANUAL</xsl:text>
		 </xsl:when>			
			<!--xsl:when test="contains(//paper.manual/@maintlvls, 'avum-avim')">  Technical and Equipment Publications
				<xsl:text>AVIATION UNIT AND INTERMEDIATE MAINTENANCE MANUAL</xsl:text>DA Pam 25–40
			</xsl:when-->
			<xsl:when test="contains(//paper.manual/@maintlvls, 'na')">
				<xsl:text/>
			</xsl:when>
		</xsl:choose>
	</xsl:param>
	<!--xsl:param name="typelvltitle1">
		<xsl:if test="//paper.manual/@maintlvls= 'dmwr-nmwr'">CONTAINING</xsl:if>
	</xsl:param>
	<xsl:param name="typelvltitle2">
		<xsl:if test="//paper.manual/@maintlvls='dmwr-nmwr'">NATIONAL MAINTENANCE OVERHAUL	STANDARDS</xsl:if>
	</xsl:param-->
	<xsl:param name="passivetex.extensions" select="0"/>

<xsl:param name="title.margin.left">
  <xsl:choose>
    <xsl:when test="$fop.extensions != 0">-4pc</xsl:when>
    <xsl:when test="$passivetex.extensions != 0">0pt</xsl:when>
    <xsl:otherwise>0pt</xsl:otherwise>
  </xsl:choose>
</xsl:param>
	<xsl:attribute-set name="footer.content.properties">
  <xsl:attribute name="margin-left">
    <xsl:value-of select="$title.margin.left"/>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:param name="exsl.node.set.available"> 
  <xsl:choose>
    <xsl:when xmlns:exsl="http://exslt.org/common" exsl:foo="" test="function-available('exsl:node-set') or                        contains(system-property('xsl:vendor'),                          'Apache Software Foundation')">1</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<xsl:param name="footer.rule" select="1"/>

<xsl:param name="footer.table.height">14pt</xsl:param>
<xsl:attribute-set name="footer.table.properties">
  <xsl:attribute name="table-layout">fixed</xsl:attribute>
  <xsl:attribute name="width">100%</xsl:attribute>
</xsl:attribute-set>

	<xsl:variable name="VolCnt">
		<xsl:value-of  select="count(volume)"/>
	</xsl:variable>
<xsl:attribute-set name="footnote.mark.properties">

  <xsl:attribute name="font-size">75%</xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-style">normal</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="footnote.properties">

  <xsl:attribute name="font-size"><xsl:value-of select="$footnote.font.size"/></xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-style">normal</xsl:attribute>
  <xsl:attribute name="text-align"><xsl:value-of select="$alignment"/></xsl:attribute>
  <xsl:attribute name="start-indent">0pt</xsl:attribute>
  <xsl:attribute name="text-indent">0pt</xsl:attribute>
    <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="wrap-option">wrap</xsl:attribute>
  <xsl:attribute name="linefeed-treatment">treat-as-space</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="footnote.sep.leader.properties">
  <xsl:attribute name="color">black</xsl:attribute>
  <xsl:attribute name="leader-pattern">rule</xsl:attribute>
  <xsl:attribute name="leader-length">1in</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="table.footnote.properties">
  <xsl:attribute name="font-size"><xsl:value-of select="$footnote.font.size"/></xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-style">normal</xsl:attribute>
  <xsl:attribute name="space-before">2pt</xsl:attribute>
  <xsl:attribute name="text-align"><xsl:value-of select="$alignment"/></xsl:attribute>
</xsl:attribute-set>
	<xsl:param name="fop.extensions" select="0"/>
<xsl:param name="fop1.extensions" select="0"/>
<xsl:param name="alignment">justify</xsl:param>

<xsl:param name="body.font.master">10</xsl:param>
<xsl:param name="body.font.size">
 <xsl:value-of select="$body.font.master"/><xsl:text>pt</xsl:text>
</xsl:param>

	<xsl:variable name="secmark"> </xsl:variable>
	<xsl:variable name="sectoc"> </xsl:variable>
	<xsl:variable name="wpsecr"> </xsl:variable>
	<xsl:variable name="wpseqno"/>
	<xsl:variable name="wptitle">
		<xsl:choose>
			<xsl:when test="ancestor::refwp">
				<xsl:text>References</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="blankcount"/>
	<xsl:variable name="fg_colorizer">
		<xsl:text> lime=#00ff00; green=#008000; gray3=#c0c0c0;
navy=#000080; maroon=#800000; gray4=#b0b0b0; red=#ff0000; olive=#808000; gray5=#808080;
white=#ffffff; violet=#ff00ff; teal=#008080; brown=#804000; black=#000000;
orange=#ff8000; blue=#0000ff; gray1=#e0e0e0; aqua=#00ffff; yellow=#ffff00;
gray=#c0c0c0; gray2=#d0d0d0;</xsl:text>
	</xsl:variable>
	<xsl:variable name="fg2bg_colorizer">
		<xsl:text> bgreen=#c0ffc0;
gray3=#d0d0d0; green=#c0ffc0; lime=#e0ffe0; bviolet=#ffc0ff; gray4=#c0c0c0;
maroon=#c08080; navy=#a0a0c0; bred=#ffc0cb; borange=#ffc097; gray5=#b0b0b0;
olive=#cccc00; red=#ffc0cb; byellow=#ffffc0; bwhite=#ffffff; bbrown=#deb887;
bblack=#808080; black=#808080; brown=#deb887; teal=#00e0e0; violet=#ffc0ff;
white=#ffffff; bblue=#c0c0ff; blue=#c0c0ff; orange=#ffc097; aqua=#d0ffff;
gray1=#f0f0f0; bgray=#d0d0d0; gray2=#e0e0e0; gray=#d0d0d0; yellow=#ffffc0;</xsl:text>
	</xsl:variable>
	<xsl:variable name="insertpage" select="//insertpg"/>
	<xsl:variable name="removepage" select="//removepg"/>
	<xsl:variable name="RefId">
		<xsl:value-of select="generate-id(indxref[1])"/>
	</xsl:variable>
	<xsl:variable name="UpperCase">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
	<xsl:variable name="LowerCase">abcdefghijklmnopqrstuvwxyz</xsl:variable>
	<xsl:variable name="pagesize">
		<xsl:text>letter</xsl:text>
	</xsl:variable>
	<xsl:variable name="fontsize" select=" '10pt' "/>
	<!-- -->
	<!-- -->
	<xsl:variable name="tmno">
		<xsl:value-of select="//frntcover//tmno"/>
	</xsl:variable>
	<!-- -->
	<!-- -->
	<xsl:variable name="forOf">
		<xsl:choose>
			<xsl:when test="dmwr_ammo">
				<xsl:text>of</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>for</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
<!--	<xsl:variable name="pagesize">
		<xsl:text>logbook</xsl:text>
	</xsl:variable>
	<xsl:variable name="pagesize">
		<xsl:text>pocket</xsl:text>
	</xsl:variable>-->
	
</xsl:stylesheet>
