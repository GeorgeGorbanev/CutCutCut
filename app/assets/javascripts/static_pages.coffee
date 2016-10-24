# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
 valid = false
 $ ->
  $('#anon_cut_submit').on 'click', ->
   urlexpression = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi
   regex = new RegExp(urlexpression)
   if ($('#input_link').val().match(regex))
     valid = true
   else
     valid = false
     $('#result_new_link').empty()
     $('#result_new_link').append('Error: wrong link format')
     $('#result_new_link').attr('class', 'alert alert-danger')
   return
  $('#new_link').on 'ajax:success', (e, data, status, xhr) ->
   if valid == true
     $('#input_link').val('')
     $('#result_new_link').empty()
     $('#result_new_link').append(data)
     $('#result_new_link').attr('class', 'alert alert-success')
   return
