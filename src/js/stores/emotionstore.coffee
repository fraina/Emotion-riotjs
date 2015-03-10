EmotionStore = ->
  riot.observable this

  self = this

  self.KEYS = ['command', 'tarNone', 'tarTarget']
  self.emotions = []
  self.filters = []
  self.targetID = ''
  self.activeCommand = {}

  this.on(actionTypes.TAGS_INIT, () ->
    this.trigger(actionTypes.GET_TAGS_DATA, self.emotions)
  )

  this.on(actionTypes.DESCRIBE_INIT, () ->
    randomCommand = self.emotions[Math.random() * self.emotions.length | 0]
    this.trigger(actionTypes.GET_RANDOM_COMMAND, randomCommand)
  )

  this.on(actionTypes.SET_FILTER, (keyword) ->
    ret = []
    _.each(self.emotions, (emotion) ->
      match = false
      keys = self.KEYS
      for key in keys
        if (self.emotion[key].indexOf(keyword.toLowerCase()) != -1)
          match = true
      if (match)
        ret.push(emotion)
    )
    self.filters = ret
    this.trigger(actionTypes.GET_FILTER_RESULT, self.filters)
  )

  this.on(actionTypes.SET_TARGET, (id) ->
    self.targetID = id
    this.trigger(actionTypes.SET_TARGET_DONE, id)
  )

  this.on(actionTypes.SET_COMMAND, (command) ->
    rets = if (_.size(self.filters) != 0) then self.filters else self.emotions
    _.each(rets, (ret) ->
      if (ret.command == command)
        self.activeCommand = ret
    )
    this.trigger(actionTypes.SET_COMMAND_DONE, [self.activeCommand, targetID])
  )

  return
