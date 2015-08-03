<describe>
  <h5>{ description }</h5>

  <script type="coffeescript">
    self = this

    self.description = ''
    self.currentCommand = {}

    self.on('mount', ->
      RiotControl.trigger(actionTypes.DESCRIBE_INIT)
    )

    RiotControl
      .on(actionTypes.GET_RANDOM_COMMAND, (randomCommand) ->
        self.currentCommand = randomCommand
        getCurrentDescription()
        self.update()
      )
      .on(actionTypes.SET_COMMAND_DONE, (opts) ->
        self.currentCommand = opts[0]
        getCurrentDescription(opts[1])
        self.update()
      )
      .on(actionTypes.SET_TARGET_DONE, (targetID) ->
        getCurrentDescription(targetID)
        self.update()
      )

    getCurrentDescription = (targetID) ->
      noTargetStr = self.currentCommand.tarNone
      tarTargetStr = self.currentCommand.tarTarget
      self.description = if (targetID && _.size(targetID) > 0) then tarTargetStr.replace(/:target/g, targetID) else noTargetStr
  </script>

</describe>
