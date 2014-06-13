$ ->
  dispatcher = new WebSocketRails("ws://localhost:3000/websocket")
  channel = dispatcher.subscribe("streaming")
  channel.bind "replace", (photo) ->
    target = $(".photo[data-position=#{photo.position}]").parents(".js-photo-inner")
    target.fadeOut()
    target.find("img").attr("src", photo.url)
    target.find(".js-username").text("photo by #{photo.username}")
    target.fadeIn()

  $(".js-replace-photo").click ->
    $.ajax
      url: "/photos/replace"
      data:
        position: $(this).find("img").data("position")
