class window.AppView extends Backbone.View

  className: "cardLayout"

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="playAgain">Play Again?</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .playAgain': -> @model.restartPlay()

  initialize: ->
    @render()
    @model.on 'change:gameOver', => @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
