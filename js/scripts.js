$( function() {
  // link to page images
  $('.tei-pb[data-facs').append( function(i, str) {
    let id = $(this).data('facs').replace(/^#/, '')
    let src = $('[data-id=' + id + ']').data('src')
    return `<figure class="tei-side-figure">
              <img src="holder.js/150x230?bg=2a9d8f&text=${src}" class="figure-img img-fluid rounded"/>
              <figcaption class="figure-caption">Faksimile <em>${src}</em></figcaption>
            </figure>`
  })

  // link to XML source
  let file = window.location.href.match(/\/([^/]+)\.html/)
  if ( file )
    $('#xml-source').attr( 'href', `../data/${file[1]}.xml` )

  // corpus listing
  $('#pat-list').DataTable({
    "processing": true,
    "ajax": "list.json",
    "columns": [
      {
        "render": function (data, row, type) {
          return `<a href="html/${data}.html">${data}</a>`
        }
      },
      {},
      {},
      {},
      {}
    ],
    "language": {
      "sEmptyTable":     "Keine Daten in der Tabelle vorhanden",
      "sInfo":           "_START_ bis _END_ von _TOTAL_ Einträgen",
      "sInfoEmpty":      "0 bis 0 von 0 Einträgen",
      "sInfoFiltered":   "(gefiltert aus _MAX_ Einträgen)",
      "sInfoPostFix":    "",
      "sInfoThousands":  ".",
      "sLengthMenu":     "_MENU_ Einträge anzeigen",
      "sLoadingRecords": "Wird geladen ...",
      "sProcessing":     "<div class='d-flex justify-content-center'><div class='spinner-border' role='status'><span class='visually-hidden'>Bitte warten …</span></div></div>",
      "sSearch":         "Suchen",
      "sZeroRecords":    "Keine Einträge vorhanden.",
      "oPaginate": {
        "sFirst":    "Erste",
        "sPrevious": "Zurück",
        "sNext":     "Nächste",
        "sLast":     "Letzte"
      },
      "oAria": {
        "sSortAscending":  ": aktivieren, um Spalte aufsteigend zu sortieren",
        "sSortDescending": ": aktivieren, um Spalte absteigend zu sortieren"
      },
      "select": {
        "rows": {
          "_": "%d Zeilen ausgewählt",
          "0": "Zum Auswählen auf eine Zeile klicken",
          "1": "1 Zeile ausgewählt"
        }
      }
    }
  })
})
