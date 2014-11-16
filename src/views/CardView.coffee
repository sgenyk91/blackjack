class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img width="150" height="225" src="img/cards/<%=suitName%>/<%=rankName%>.png"/>'
  #template: _.template '<%=rankName%> of <%=suitName%>'
  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    # @el.removeClass 'card' if @model.get
    @$el.addClass 'covered' unless @model.get 'revealed'
