@Comments = React.createClass
  getInitialState: ->
    comments: @props.data
  getDefaultProps: ->
    comments: []

  addComment: (comment) ->
    comments = @state.comments.slice()
    comments.push comment
    @setState comments: comments

  deleteComment: (comment) ->
    comments = @state.comments.slice()
    index = comments.indexOf comment
    comments.splice index, 1
    @replaceState comments: comments

  render: ->
    React.DOM.div
      className: 'comments'
      React.DOM.h2
        className: 'title'
        'Comments'
      React.createElement CommentForm, handleNewComment: @addComment
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'ID'
            React.DOM.th null, 'Content'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for comment in @state.comments
            React.createElement Comment, key: comment.id, comment: comment, handleDeleteComment: @deleteComment
