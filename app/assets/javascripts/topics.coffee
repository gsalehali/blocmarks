# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.flashMsg = (topicId, msg, statusClass) ->
  htmlMsg = decodeHTMLEntities(msg)
  $(topicId).before(" <div id='alert' style='display: none;'></div> ")
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