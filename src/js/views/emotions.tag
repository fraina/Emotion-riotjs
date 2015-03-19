<emotions>
  <button each={ tags } class="waves-effect waves-light btn light-blue darken-3 mrs mbs">
    { command }
  </button>

  <script type="coffeescript">
    self = this
    self.tags = []

    $(document).on('click', 'button', (e) ->
      command = ($(e.target).text()).trim()
      RiotControl.trigger(actionTypes.SET_COMMAND, command)
    )

    self.on('mount', () ->
      RiotControl.trigger(actionTypes.TAGS_INIT)
    )

    RiotControl
      .on(actionTypes.GET_TAGS_DATA, (data) ->
        self.tags = data
        self.update()
      )
      .on(actionTypes.GET_FILTER_RESULT, (result) ->
        self.tags = result
        self.update()
      )
  </script>

</emotions>
