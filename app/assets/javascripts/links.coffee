# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
 $('#checkbox-generate').on 'click', ->
   if $(this).is(':checked')
      $('#child_link').prop 'readonly', true
      $('#child_link').prop 'disabled', true
   else
      $('#child_link').prop 'readonly', false
      $('#child_link').prop 'disabled', false
 return
return