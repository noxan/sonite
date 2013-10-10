class SoniteApp
  constructor: () ->
    console.log "sonite"
    @history = []
    @container = $('#sonite-container')
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
    minLength = Math.max(1, this.options.endsWith.length + this.options.startsWith.length)
    newLength = parseInt($('#sonite-options-totallength').val())
    if not isNaN(newLength)
      this.options.totalLength = Math.max(newLength, minLength)
      this.next()
    $('#sonite-options-totallength').val(this.options.totalLength)

  next: () ->
    @history.push @container.val()
    $('#sonite-history').attr 'data-content', @history.join(', ')
    $('#sonite-history').popover 'hide'
    length = this.options.totalLength - this.options.startsWith.length - this.options.endsWith.length
    if length > 0
      @container.val this.options.startsWith + sonite(length) + this.options.endsWith
    else
      @container.val this.options.startsWith + this.options.endsWith

  isPrev: () ->
    @history.length > 0

  prev: () ->
    @container.val @history.pop()



$('#sonite-button').on 'click', (evt) ->
  document.soniteapp.next()
  $('#sonite-history').fadeIn('slow')

$(document).ready () ->
  document.soniteapp = new SoniteApp()

$('#sonite-history').popover {
  'placement': 'bottom'
}
