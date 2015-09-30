@Comment = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/comments/#{@props.comment.id}"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteComment @props.comment

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.comment.id
      React.DOM.td null, @props.comment.content
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
