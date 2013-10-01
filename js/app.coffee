class SoniteApp
  constructor: () ->
    console.log "sonite"
    @history = []
    @container = jQuery('#sonite-container')
    @container.val sonite()

  next: () ->
    @history.push @container.val()
    jQuery('#sonite-history').attr 'data-content', @history.join(', ')
    $('#sonite-history').popover 'hide'
    @container.val sonite()

  isPrev: () ->
    @history.length > 0

  prev: () ->
    @container.val @history.pop()



jQuery('#sonite-button').on 'click', (evt) ->
  document.soniteapp.next()
  jQuery('#sonite-history').fadeIn('slow')

jQuery(document).ready () ->
  document.soniteapp = new SoniteApp()

$('#sonite-history').popover()
