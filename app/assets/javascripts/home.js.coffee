# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = undefined

ready = ->
  # Geolocation APIに対応している
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition (position) ->
      data = position.coords
      lat = data.latitude
      long = data.longitude
      $('#query_latitude').val lat
      $('#query_longitude').val long
      return
  else
    # 現在位置を取得できない場合
    $('#submit_btn').prop 'disabled', true
  return

$(document).ready ready
$(document).on 'page:load', ready