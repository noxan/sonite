class SoniteApp
  constructor: () ->
    console.log "sonite"
    @history = []
    @container = jQuery('#sonite-container')
    @container.val sonite()

    $('#sonite-options-button').popover()

    $('.sonite-options-field').on 'change', (evt) =>
      this.updateOptions()

  options:
    totalLength: 6
    startsWith: ''
    endsWith: ''

  updateOptions: () ->
    this.options.endsWith = $('#sonite-options-endswith').val()
    this.options.startsWith = $('#sonite-options-startswith').val()
    newValue = parseInt($('#sonite-options-totallength').val())
    if not isNaN(newValue) and newValue > 0
      this.options.totalLength = newValue
    else
      return $('#sonite-options-totallength').val(this.options.totalLength)

    this.next()


  next: () ->
    @history.push @container.val()
    jQuery('#sonite-history').attr 'data-content', @history.join(', ')
    $('#sonite-history').popover 'hide'
    length = this.options.totalLength - this.options.startsWith.length - this.options.endsWith.length
    @container.val this.options.startsWith + sonite(length) + this.options.endsWith

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
