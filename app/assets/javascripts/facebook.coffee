jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#
{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true


window.fbAsyncInit = ->
  FB.init(appId: '701707503180248', cookie: true)

  $('#sign_in').click (e) ->
    e.preventDefault()
