# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
 valid = false
 $ ->
  $('#anon_cut_submit').on 'click', ->
   regex = new RegExp("(?:(?:ht|f)tps?://)?(?:[\\-\\w]+:[\\-\\w]+@)?(?:[0-9a-z][\\-0-9a-z]*[0-9a-z]\\.)+[a-z]{2,6}(?::\\d{1,5})?(?:[?/\\\\#][?!^$.(){}:|=[\\]+\\-/\\\\*;&~#@,%\\wА-Яа-я]*)?")
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
     if data.indexOf("Error") != -1
       $('#mssg').attr('class', 'alert alert-danger')
     return
   return
