jQuery ->
  $('#search_keywords').autocomplete
    source: $('#search_keywords').data('autocomplete-source')
