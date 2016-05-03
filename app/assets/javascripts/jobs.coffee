# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  do ->
    [].slice.call(document.querySelectorAll('.tabs')).forEach (el) ->
      new CBPFWTabs(el)
      console.log 'hi'
      return
    return
