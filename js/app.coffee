class SoniteApp
  constructor: () ->
    console.log "sonite"
    @history = []
    @container = jQuery('#sonite-container')
    @container.val sonite()

  next: () ->
    @history.push @container.val()
    jQuery('#sonite-history').attr('data-content').append @container.val()
    @container.val sonite()

  isPrev: () ->
    @history.length > 0

  prev: () ->
    @container.val @history.pop()



jQuery('#sonite-button').on 'click', (evt) ->
  document.soniteapp.next()
  jQuery('#sonite-history').css 'visibility', 'initial'

jQuery(document).ready () ->
  document.soniteapp = new SoniteApp()

$('#sonite-history').popover()
