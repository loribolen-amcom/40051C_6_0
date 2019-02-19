<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<!--<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="pim">
    <xsl:apply-templates/>
  </xsl:template>-->

  <xsl:template match="stl_partswp | kitswp | nsnindxwp | refdesindxwp">
  <xsl:call-template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="wp-pageset"/>
  </xsl:template>
  <xsl:template match="plwp">
		<xsl:call-template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="wp-pageset"/>
	</xsl:template>
    </xsl:stylesheet>