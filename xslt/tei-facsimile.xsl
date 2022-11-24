<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1"
                xmlns:t="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="t"
                xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <xsl:output method="html" media-type="text/html" cdata-section-elements="script style" indent="no" encoding="utf-8"/>

  <xsl:template match="t:facsimile">
    <xsl:variable name="base">
      <xsl:value-of select="@xml:base"/>
    </xsl:variable>
    <xsl:for-each select="t:graphic">
      <xsl:call-template name="graphic">
        <xsl:with-param name="base" select="$base"/>
        <xsl:with-param name="el" select="current()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="graphic">
    <xsl:param name="base"/>
    <xsl:param name="el"/>
    <span>
      <xsl:attribute name="data-id">
        <xsl:value-of select="$el/@xml:id"/>
      </xsl:attribute>
      <xsl:attribute name="data-src">
        <xsl:value-of select="$base"/>
        <xsl:value-of select="$el/@url"/>
      </xsl:attribute>
    </span>
  </xsl:template>

</xsl:stylesheet>
