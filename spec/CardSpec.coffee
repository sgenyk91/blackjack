assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52

  it "should calculate score appropriately", ->
    playerHand = new Hand([new Card({rank:3, suit:1}),new Card({rank:5, suit:1})])
    assert.strictEqual playerHand.scores(), 8
    playerHand = new Hand([new Card({rank:1, suit:1}),new Card({rank:4, suit:1})])
    assert.strictEqual playerHand.scores(), 15
    playerHand = new Hand([new Card({rank:1, suit:1}),new Card({rank:4, suit:1}),new Card({rank:0, suit:1})])
    assert.strictEqual playerHand.scores(), 15



