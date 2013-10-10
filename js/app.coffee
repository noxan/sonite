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
    $('#sonite-options-startswith').on 'change', (evt) =>
      this.optionsUpdateStartsWith()
    $('#sonite-options-endswith').on 'change', (evt) =>
      this.optionsUpdateEndsWith()

  optionsUpdateLength: () ->
    newValue = parseInt($('#sonite-options-length').val())
    if not isNaN(newValue) and newValue > 0
      this.options.length = newValue
      this.next()
    else
      $('#sonite-options-length').val(this.options.length)

  optionsUpdateStartsWith: () ->
    this.options.startsWith = $('#sonite-options-startswith').val()
    this.next()

  optionsUpdateEndsWith: () ->
    this.options.endsWith = $('#sonite-options-endswith').val()
    this.next()

  options:
    length: 6
    startsWith: ''
    endsWith: ''

  next: () ->
    @history.push @container.val()
    jQuery('#sonite-history').attr 'data-content', @history.join(', ')
    $('#sonite-history').popover 'hide'
    @container.val this.options.startsWith + sonite(this.options.length) + this.options.endsWith

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
