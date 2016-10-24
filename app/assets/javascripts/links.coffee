# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
 valid = false
 $('#checkbox-generate').on 'click', ->
    if $(this).is(':checked')
       $('#child_link').prop 'readonly', true
       $('#child_link').prop 'disabled', true
    else
       $('#child_link').prop 'readonly', false
       $('#child_link').prop 'disabled', false
    return


 $('#custom_cut_submit').on 'click', ->
   urlexpression = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi
   regex = new RegExp(urlexpression)
   if regex.test($('#parent_link').val())                       # parent -- ok
     valid = true
     pathexpression =  /^[a-zA-Z0-9-_]+$/
     regex = new RegExp(pathexpression)
     if !$('#checkbox-generate').is(':checked')
       if regex.test($('#child_link').val())                                             #child -- ok
         console.log "VSE NORm"
       else                                                                             #child -- ne ok
        valid = false
        $('#mssg').empty()
        $('#mssg').append('Error: wrong child link format')
        $('#mssg').attr('class', 'alert alert-danger')
       return
     return
   else                                                         #parent -- ne ok
     valid = false
     $('#mssg').empty()
     $('#mssg').append('Error: wrong parent link format')
     $('#mssg').attr('class', 'alert alert-danger')
   return






 $('#new_custom_link').on  'ajax:success', (e, data, status, xhr)  ->
  if valid == true
     $('#mssg').empty()
     $('#mssg').append(data)
     if data.indexOf("Success") != -1
       $('#parent_link').val('')
       $('#child_link').val('')
       $('#mssg').attr('class', 'alert alert-success')
     return
  return



