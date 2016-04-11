window.flashMsg = (id, tag, msg, statusClass) ->
  htmlMsg = decodeHTMLEntities(msg)
  if id == tag
    $(id).before(" <div id='alert' style='display: none;'></div> ")
  else
    $(id).closest(tag).before(" <div id='alert' style='display: none;'></div> ")
  $('#alert').append('<div class=\'alert alert-' + statusClass + '\'>' + htmlMsg + '</div>').slideDown(500, ->
  ).delay(3000).slideUp 500
  setTimeout (->
    $('#alert').remove()
  ), 4000
  return


decodeHTMLEntities = (text) ->
  entities = [
    [
      'apos'
      '\''
    ]
    [
      'amp'
      '&'
    ]
    [
      'lt'
      '<'
    ]
    [
      'gt'
      '>'
    ]
  ]
  i = 0
  max = entities.length
  while i < max
    text = text.replace(new RegExp('&' + entities[i][0] + ';', 'g'), entities[i][1])
    ++i
  text