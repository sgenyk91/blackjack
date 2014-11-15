# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.firstDealPlayer()
    @set 'dealerHand', deck.firstDealDealer()
    # console.log(@get('dealerHand'))
    @get('playerHand').on('stand', @dealerPlays, @)
    @get('playerHand').on('playAgain', @restartPlay, @)

  dealerPlays: ->
    # console.log(@get('dealerHand'))
    #setTimeout
    @get('dealerHand').at(0).flip()
    # debugger
    @get('dealerHand').hit() while @get('dealerHand').scores() < 16
    answer = false
    setTimeout (-> alert('test')), 0
    # if @get('dealerHand').scores() > 21 then answer = confirm('Dealer Plays You win! Play again?') else @compareHands()
    # @restartPlay() if answer

  compareHands: ->
    if @get('dealerHand').scores() > @get('playerHand').scores() then answer = confirm('Compare Hands You lose :( Play again?') else answer = confirm('Compare Hands You win! Play again?')
    console.log(@get('dealerHand'))
    @restartPlay() if answer

  restartPlay: ->
    # console.log("RestartPlay");
    # console.log(@get('playerHand'))
    @get('deck').dealPlayer @get('playerHand')
    # console.log(@get('playerHand'))
    @get('deck').dealDealer @get('dealerHand')
    # @get('playerHand').on('stand', @dealerPlays, @)
    # @get('playerHand').on('playAgain', @restartPlay, @)
