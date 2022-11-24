<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1"
                xmlns:t="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="t"
                xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <xsl:import href="tei-text.xsl"/>
  <xsl:import href="tei-facsimile.xsl"/>
  <xsl:import href="tei-header.xsl"/>

  <xsl:variable name="force-exclude-all-namespaces" select="true()"/>

  <xsl:output method="html" media-type="text/html" cdata-section-elements="script style"  indent="no" encoding="utf-8"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="/t:TEI">
    <html lang="de">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"/>
        <link href="../css/styles.css" rel="stylesheet"/>

        <title>Patientenbrief</title>
      </head>
      <body>
        <header>
          <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="../index.html">
                <img src="https://www.deutschestextarchiv.de/static/images/dta.svg" height="50"/>
              </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="../index.html">Start</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="../list.html">Übersicht Briefe</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Dokumentation
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item disabled" href="#">Projekt</a></li>
                      <li><a class="dropdown-item disabled" href="#">Erfassungsrichtlinien</a></li>
                      <li><a class="dropdown-item disabled" href="#">Digitale Edition</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link disabled">Impressum</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link disabled">Datenschutz</a>
                  </li>
                </ul>
                <form class="d-flex mb-1" role="search">
                  <input class="form-control me-2" type="search" placeholder="Suche" aria-label="Search" disabled="disabled"/>
                  <button class="btn btn-outline-success" type="submit" disabled="disabled">Suche</button>
                </form>
              </div>
            </div>
          </nav>
        </header>
        <div class="container mt-5">
          <div class="row">
            <div class="col-lg-8 col-md-8 tei mx-auto">
              <xsl:apply-templates/>
            </div>
          </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.8/holder.min.js" integrity="sha512-O6R6IBONpEcZVYJAmSC+20vdsM07uFuGjFf0n/Zthm8sOFW+lAq/OK1WOL8vk93GBDxtMIy6ocbj6lduyeLuqQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="../js/scripts.js"></script>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
