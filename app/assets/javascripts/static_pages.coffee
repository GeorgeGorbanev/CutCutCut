# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#new_link').on 'ajax:success', (e, data, status, xhr) ->
    $('#input_link').val('')
    $('#result_new_link').append(data)

  $('#new_link').on 'ajax:error', (e, data, status, xhr) ->
    console.log e
    console.log data
    console.log status
    console.log xhr