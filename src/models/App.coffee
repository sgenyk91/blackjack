# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # console.log(@get('dealerHand'))
    @get('playerHand').on('stand', @dealerPlays, @)
    # @get('playerHand').on('bust',)

  dealerPlays: ->
    # console.log(@get('dealerHand'))
    #setTimeout
    @get('dealerHand').at(0).flip()
    @get('dealerHand').hit() while @get('dealerHand').scores() < 16
    if @get('dealerHand').scores() > 21 then alert('You win!') else @compareHands()

  compareHands: ->
    if @get('dealerHand').scores() > @get('playerHand').scores() then alert('You lose!') else alert('You win')
