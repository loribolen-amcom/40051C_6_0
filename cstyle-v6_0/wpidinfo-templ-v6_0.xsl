<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="wpidinfo" name="wp-wpidinfo">
		<xsl:if test="ancestor::lubewp">
			<fo:block break-before="page"/>
		</xsl:if>
<!--	<fo:wrapper  id="{generate-id(.)}">-->
	<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="sans-serif" font-size="10pt" font-weight="bold" text-align="center" id="{generate-id(.)}">
			<xsl:choose>
	  <xsl:when test="string-length(//@secuirty) != 0">
			<fo:block span="all" margin-top="2em">
				<xsl:apply-templates select="maintlvl"/>
				 <xsl:apply-templates select="title"/> 
				<xsl:apply-templates select="config"/>
			</fo:block>
			<fo:block span="all">
			<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="2pt" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
			</fo:block>
			</xsl:when>
			<xsl:otherwise>
			<fo:block span="all">
				<xsl:apply-templates select="maintlvl"/>
				 <xsl:apply-templates select="title"/> 
				<xsl:apply-templates select="config"/>
			</fo:block>
			<fo:block span="all">
			<!--<fo:leader leader-pattern="rule" rule-style="solid" rule-thickness="2pt" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>-->
				<fo:leader leader-length="100%" leader-pattern="rule" rule-style="solid" rule-thickness="2pt"/>
			</fo:block>
			</xsl:otherwise>
			</xsl:choose>
		</fo:block>
<!--		</fo:wrapper>-->
	</xsl:template>
	<xsl:template match="wpidinfo" mode="count" name="wp-count">
		<fo:block>
			<xsl:choose>
				<xsl:when test="ancestor::*/@wpseq">
					<xsl:value-of disable-output-escaping="no" select="ancestor::*/@wpseq"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
					<xsl:when test="ancestor::sum">
							<xsl:number count="wpidinfo" format="0000" from="sum" level="any"/>
						</xsl:when>
						<xsl:when test="ancestor::sam">
							<xsl:number count="wpidinfo" format="0000" from="sam" level="any"/>
						</xsl:when>
						<xsl:when test="ancestor::dmwr_ammo">
							<xsl:number count="wpidinfo" format="0000" from="dmwr_ammo" level="any"/>
						</xsl:when>
						<xsl:when test="ancestor::ammo">
							<xsl:number count="wpidinfo" format="0000" from="ammo" level="any"/>
						</xsl:when>
						<xsl:when test="ancestor::lubeorder">
							<xsl:number count="wpidinfo" format="0000" from="lubeorder" level="any"/>
						</xsl:when>
						<xsl:when test="ancestor::bdar">
							<xsl:number count="wpidinfo" format="0000" from="bdar" level="any"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:number count="wpidinfo" format="0000" from="paper.manual" level="any"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
	</xsl:template>
	<xsl:template match="wpidinfo/maintlvl">
	<xsl:if test="ancestor::emergencywp">
	<fo:block span="all" space-before="12pt">
	<xsl:text> </xsl:text>
	</fo:block>
	</xsl:if>
	<!--<fo:block>test 1</fo:block>
	<fo:block>test 2 </fo:block>
	<fo:block>test 3</fo:block>-->
		<fo:block span="all">
		  <xsl:choose>
			  <xsl:when test="ancestor-or-self::*/@deletewp='yes'">DELETED -</xsl:when> 
			  <xsl:when test="ancestor::macintrowp"></xsl:when>
			  <xsl:when test="ancestor::macwp"></xsl:when>
			  <xsl:when test="ancestor::gim[parent::bdar]">BDAR</xsl:when>
			  <xsl:when test="ancestor::sim[parent::bdar]">BDAR</xsl:when>
				<xsl:when test="@level='depot'">DEPOT</xsl:when>
				<xsl:when test="@level='tasmg'">THEATER AVIATION SUSTAINMENT MAINTENANCE GROUP</xsl:when>
				<xsl:when test="@level='asb'">AVIATION SUPPORT BATTALION</xsl:when>
				<xsl:when test="@level='amc'">AVIATION MAINTENANCE COMPANY</xsl:when>
				<xsl:when test="@level='crew'">CREW</xsl:when>
				<xsl:when test="@level='below_depot'">BELOW DEPOT</xsl:when>
				<xsl:when test="@level='maintainer'">MAINTAINER</xsl:when>
				<xsl:when test="@level='operator'">OPERATOR</xsl:when>
				<xsl:when test="@level='user'">USER&#x2002;</xsl:when>
				<xsl:when test="@level='administrator'">ADMINISTRATOR&#x2002;</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="ancestor::opim">
			    <xsl:text disable-output-escaping="no">&#x2002;INSTRUCTIONS</xsl:text>
				</xsl:when>
				<xsl:when test="ancestor::sopim">
					<xsl:text disable-output-escaping="no">&#x2002;INSTRUCTIONS</xsl:text>
				</xsl:when>
				
				<xsl:when test="ancestor::softdescdata">
					<xsl:text disable-output-escaping="no">&#x2002;SOFTWARE DESCRIPTION/DATA</xsl:text>
				</xsl:when>
				<xsl:when test="ancestor::baim">
					<xsl:text disable-output-escaping="no">&#x2002;BATTLE DAMAGE ASSESSMENT</xsl:text>
				</xsl:when>
				<xsl:when test="ancestor::brim">
					<xsl:text disable-output-escaping="no">&#x2002;BATTLE DAMAGE REPAIR</xsl:text>
				</xsl:when>
				<xsl:when test="ancestor::tim">
				  <xsl:text disable-output-escaping="no">&#x2002;TROUBLESHOOTING</xsl:text>
			  </xsl:when>
				<xsl:when test="ancestor::mim">
		      <xsl:text disable-output-escaping="no">&#x2002;MAINTENANCE</xsl:text>
				</xsl:when>
				<xsl:when test="ancestor::dim">
				  <xsl:text disable-output-escaping="no">&#x2002;DESTRUCTION</xsl:text>
				</xsl:when>
			</xsl:choose>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="wpidinfo/eicnomen">
		<xsl:apply-templates select="node()"> </xsl:apply-templates>
	</xsl:template>
	<xsl:template match="wpidinfo/eicnomen/sysnomen">
		<xsl:apply-templates select="name | node()[2]"/>
	</xsl:template>
	<xsl:template match="wpidinfo/eicnomen/subsystem-system/sysnomen/name">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block span="all" text-transform="uppercase">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="wpidinfo/eicnomen/sysnomen/name">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block span="all" text-transform="uppercase">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>

		<xsl:template match="wpidinfo/title">
		<fo:block space-before="10pt" text-transform="uppercase"	id="{generate-id(.)}">
		<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates select="node()"/>
			<xsl:if test="../../@army='yes' or ../../@airforce='yes' or ../../@navy='yes' or ../../@marines='yes'">
				<xsl:text disable-output-escaping="no">&#x2002;(</xsl:text>
				<xsl:if test="../../@army='yes'">
									<xsl:text disable-output-escaping="no">ARMY</xsl:text>
					<xsl:if test="../../@airforce='yes' or ../../@navy='yes' or ../../@marines='yes'">
						<xsl:text disable-output-escaping="no">, </xsl:text>
					</xsl:if>
				</xsl:if>
				<xsl:if test="../../@airforce='yes'">
									<xsl:text disable-output-escaping="no">AIR FORCE</xsl:text>
					<xsl:if test="../../@navy='yes' or ../../@marines='yes'">
						<xsl:text disable-output-escaping="no">, </xsl:text>
					</xsl:if>
				</xsl:if>
				<xsl:if test="../../@navy='yes'">
									<xsl:text disable-output-escaping="no">NAVY</xsl:text>
					<xsl:if test="../../@marines='yes'">
						<xsl:text disable-output-escaping="no">, </xsl:text>
					</xsl:if>
				</xsl:if>
				<xsl:if test="../../@marines='yes'">
								<xsl:text disable-output-escaping="no">USMC</xsl:text>
				</xsl:if>
				<xsl:text disable-output-escaping="no"> ONLY)</xsl:text>
			</xsl:if>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="wpidinfo/config">
		<fo:block space-before="10pt">
			<fo:inline text-decoration="underline">EFFECTIVITY NOTICE</fo:inline>
		</fo:block>
		<xsl:apply-templates select="config/trim.para"/>
		<fo:block font-weight="normal" space-before="0pt">
			<xsl:apply-templates select="config-setup-item/name[1]"/>
		</fo:block>
	</xsl:template>
	
	    <xsl:template name="effectivity.Notice">
        <xsl:for-each select="wpidinfo/config">
            <fo:block font-weight="bold" text-decoration="underline">
                <xsl:apply-templates select="trim.para"/>
            </fo:block>
            <fo:block font-weight="normal">
                <xsl:for-each select="config-setup-item">
                    <xsl:value-of select="name"/>
                    <xsl:if test="not(position()=last())">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </fo:block>
        </xsl:for-each>
    </xsl:template>
    
	<xsl:template match="config-setup-item/name">
	<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="config/trim.para">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block font-weight="normal" space-before="0pt">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
