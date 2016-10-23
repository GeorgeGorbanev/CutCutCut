# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
 $ ->
  $('#new_link').on 'ajax:success', (e, data, status, xhr) ->
    console.log e
    console.log data
    console.log status
    console.log xhr
    $('#input_link').val('')
    $('#result_new_link').append(data)
  return
  $('#new_link').on 'ajax:error', (e, data, status, xhr) ->
    console.log e
    console.log data
    console.log status
    console.log xhr
  return
 return
