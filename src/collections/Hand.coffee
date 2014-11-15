class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if @minScore() < 21
      card = @deck.pop();
      @add(card)
    if @scores() > 21 and !@isDealer
      answer = confirm('Player Hand You lose :( Play again?')
      @trigger('playAgain',@) if answer
    console.log(card)
    card

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    if @minScore() + 10 * @hasAce() > 21 then @minScore() else @minScore() + 10 * @hasAce()

  stand: ->
    @trigger('stand',@)
