<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1"
                xmlns:t="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="t"
                xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <xsl:output method="text" indent="no" encoding="utf-8"/>

  <xsl:template match="/">
    <xsl:value-of select="$filename"/>
    <xsl:text>&#x9;</xsl:text>
    <xsl:choose>
      <xsl:when test="string-length(//t:creation/t:persName[@type='sender']/t:surname)">
        <xsl:value-of select="normalize-space(//t:creation/t:persName[@type='sender']/t:surname)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(//t:creation/t:persName[@type='sender'])"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#x9;</xsl:text>
    <xsl:value-of select="normalize-space(//t:creation/t:date[@type='sent'])"/>
    <xsl:text>&#x9;</xsl:text>
    <xsl:choose>
      <xsl:when test="string-length(//t:creation/t:persName[@type='addressee']/t:surname)">
        <xsl:value-of select="normalize-space(//t:creation/t:persName[@type='addressee']/t:surname)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(//t:creation/t:persName[@type='addressee'])"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#x9;</xsl:text>
    <xsl:value-of select="normalize-space(//t:creation/t:date[@type='received'])"/>
    <xsl:text>&#x0a;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
