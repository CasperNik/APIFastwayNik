# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

gcd = (a,b) -> if (b==0) then a else gcd(b, a % b)
$("#button").click ->
  a = $("#a").val()
  b = $("#b").val()
  $("#c").html "<h1><Hellow/h1>"
