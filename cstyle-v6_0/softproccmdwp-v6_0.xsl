<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="softproccmdwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
<xsl:template match="softproccmdwp/proc">
		<xsl:apply-templates select="node()"/>
	<fo:block text-align="start" font-weight="bold" keep-with-previous="1" font-family="sans-serif" space-before=".2in" space-before.conditionality="retain" space-after=".2in" space-after.conditionality="retain">
          END OF TASK</fo:block>
	</xsl:template>
</xsl:stylesheet>
