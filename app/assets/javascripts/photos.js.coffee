$ ->
  dispatcher = new WebSocketRails("ws://#{gon.ws_host}/websocket")
  channel = dispatcher.subscribe("streaming")
  channel.bind "replace", (photo) ->
    target = $(".photo[data-position=#{photo.position}]").parents(".js-photo-inner")
    target.fadeOut()
    target.find("img").attr("src", photo.url)
    target.find(".js-username").text("photo by #{photo.username}")
    target.fadeIn()

  channel.bind "zoomIn", (photo) ->
    $(".js-panel-container").find(".js-inner").remove()
    $(".js-panel-container").append photo.html
    $(".js-panel-container").removeClass("hidden")
    left = ($(window).width() - 1100) / 2
    $(".js-panel-container").css("left", left)
    $(".barrier").removeClass("hidden")

  $(".js-zoom-in").click ->
    id = $(this).parents(".js-photo-inner").find("img").data("photo-id")
    $.ajax
      url: "/photos/#{id}/zoomin"

  $(".js-close").click ->
    $(".js-panel-container").find(".js-inner").remove()
    $(".barrier").addClass("hidden")
    $(".js-panel-container").addClass("hidden")

  $(".js-replace-photo").click ->
    $.ajax
      url: "/photos/replace"
      data:
        position: $(this).find("img").data("position")
