class SoniteApp
  constructor: () ->
    console.log "sonite"
    @history = []
    @container = jQuery('#sonite-container')
    @container.val sonite()

    $('#sonite-options-button').popover()

    this.optionsUpdateLength()
    $('#sonite-options-length').on 'change', (evt) =>
      this.optionsUpdateLength()

  optionsUpdateLength: () ->
    newValue = parseInt($('#sonite-options-length').val())
    if not isNaN(newValue) and newValue > 0
      this.options.length = newValue
      this.next()
    else
      $('#sonite-options-length').val(this.options.length)

  options:
    length: 6

  next: () ->
    @history.push @container.val()
    jQuery('#sonite-history').attr 'data-content', @history.join(', ')
    $('#sonite-history').popover 'hide'
    @container.val sonite(this.options.length)

  isPrev: () ->
    @history.length > 0

  prev: () ->
    @container.val @history.pop()



jQuery('#sonite-button').on 'click', (evt) ->
  document.soniteapp.next()
  jQuery('#sonite-history').fadeIn('slow')

jQuery(document).ready () ->
  document.soniteapp = new SoniteApp()

$('#sonite-history').popover {
  'placement': 'bottom'
}
