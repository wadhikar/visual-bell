{$, $$} = require 'atom'

module.exports =
  configDefaults:
    enabled: true

  activate: ->
    rootView.on 'beep', =>
      return unless config.get('visual-beep.enabled')
      @addOverlay()
      setTimeout((=> @removeOverlay()), 300)

  deactivate: ->
    @removeOverlay()

  addOverlay: ->
    @overlay = $$ -> @div class: 'visual-beep'
    $('body').append @overlay

  removeOverlay: ->
    console.log "bye", @overlay
    @overlay?.remove()
    @overlay = null
