<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1"
                xmlns:t="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="t"
                xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <xsl:output method="html" media-type="text/html" cdata-section-elements="script style" indent="no" encoding="utf-8"/>

  <xsl:template match="t:teiHeader">
    <div class="tei-header">
      <h1>
        <xsl:apply-templates select="t:fileDesc/t:titleStmt/t:title"/>
      </h1>

      <xsl:apply-templates select="t:profileDesc/t:creation"/>

      <p class="text-center">
        <button class="btn btn-outline-secondary btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-metadata" aria-expanded="false" aria-controls="collapse-metadata">
          Weitere Metadaten
        </button>
        <a class="btn btn-outline-secondary btn-sm ms-3" id="xml-source" target="_blank">XML</a>
      </p>

      <div class="collapse" id="collapse-metadata">
        <h2>Quelle</h2>
        <xsl:apply-templates select="t:fileDesc/t:sourceDesc"/>

        <h2>Herausgeber</h2>
        <ul>
          <xsl:for-each select="t:fileDesc/t:titleStmt/t:editor/*">
            <li style="font-size:medium"><xsl:apply-templates/></li>
          </xsl:for-each>
        </ul>

        <h2>Verfügbarkeit</h2>
        <xsl:apply-templates select="t:fileDesc/t:publicationStmt"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="t:profileDesc/t:creation">
    <table class="table">
      <tr>
        <th>von</th>
        <td>
          <xsl:apply-templates select="t:persName[@type='sender']"/>
          <xsl:text> (</xsl:text>
          <xsl:apply-templates select="t:settlement[@type='sent']"/>
          <xsl:text>, </xsl:text>
          <xsl:apply-templates select="t:date[@type='sent']"/>
          <xsl:text>)</xsl:text>
        </td>
      </tr>
      <tr>
        <th>an</th>
        <td>
          <xsl:apply-templates select="t:persName[@type='addressee']"/>
          <xsl:text> (</xsl:text>
          <xsl:apply-templates select="t:settlement[@type='received']"/>
          <xsl:text>, </xsl:text>
          <xsl:apply-templates select="t:date[@type='received']"/>
          <xsl:text>)</xsl:text>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="t:fileDesc/t:sourceDesc">
    <table class="table">
      <tr>
        <th>Archiv</th>
        <td>
          <xsl:apply-templates select="t:msDesc/t:msIdentifier/t:repository"/>
        </td>
      </tr>
      <tr>
        <th>Sammlung</th>
        <td>
          <xsl:apply-templates select="t:msDesc/t:msIdentifier/t:collection"/>
        </td>
      </tr>
      <tr>
        <th>Signatur</th>
        <td>
          <xsl:apply-templates select="t:msDesc/t:msIdentifier/t:idno"/>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="t:fileDesc/t:publicationStmt">
    <table class="table">
      <tr>
        <th>Institution</th>
        <td>
          <xsl:apply-templates select="t:authority"/>
        </td>
      </tr>
      <tr>
        <th>Rechte</th>
        <td>
          <xsl:apply-templates select="t:availability"/>
        </td>
      </tr>
    </table>
  </xsl:template>

</xsl:stylesheet>
