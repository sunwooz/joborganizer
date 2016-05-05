# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#next, #prev').hide()

  $('.pagination').click ->
    query = $('#hidden_query').val()
    location = $('#hidden_location').val()
    start = +$('#hidden_start').val()

    if $(this).attr('id')
      start = start + 1
    else
      start = start - 1

    $.ajax '/jobs/search',
      type: 'GET'
      dataType: 'script'
      data:
        query: query
        location: location
        start: start