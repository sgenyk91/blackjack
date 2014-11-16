# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.firstDealPlayer()
    @set 'dealerHand', deck.firstDealDealer()
    @set 'gameOver', false
    # console.log(@get('dealerHand'))
    @get('playerHand').on('stand', @dealerPlays, @)
    @get('playerHand').on('handDisplay', @displayBadMessage, @)
    @get('playerHand').on('gameOverEvent', @changeGameOver, @)

  dealerPlays: ->
    # console.log(@get('dealerHand'))
    #setTimeout
    @get('dealerHand').at(0).flip()
    # debugger
    @get('dealerHand').hit() while @get('dealerHand').scores() < 17
    answer = false
    # setTimeout (-> alert('test')), 0
    if @get('dealerHand').scores() > 21 then @displayGoodMessage(); @changeGameOver()  else @compareHands()


  compareHands: ->
    if @get('dealerHand').scores() > @get('playerHand').scores() then @displayBadMessage() else @displayGoodMessage()
    @changeGameOver()

  restartPlay: ->
    if @get 'gameOver'
        @get('deck').dealPlayer @get('playerHand')
        @get('deck').dealDealer @get('dealerHand')
        $('.resultMessage').html('');

  changeGameOver: ->
    @set 'gameOver', true

  displayGoodMessage: ->
    $('.cardLayout').prepend('<div class="resultMessage">You win!</div>')

  displayBadMessage: ->
    $('.cardLayout').prepend('<div class="resultMessage">You lose!</div>')
