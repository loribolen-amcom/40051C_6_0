<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="destruct-materialwp">
			<xsl:call-template name="wp-pageset">
</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="essential_spares">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	</xsl:stylesheet>