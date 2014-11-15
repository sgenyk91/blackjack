class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  firstDealPlayer: -> new Hand [@pop(), @pop()], @

  firstDealDealer: -> new Hand [@pop().flip(), @pop()], @, true

  dealPlayer : (hand) -> hand.reset([@pop(), @pop()], @)

  dealDealer: (hand) ->
    hand.reset([@pop().flip(), @pop()], @, true)

