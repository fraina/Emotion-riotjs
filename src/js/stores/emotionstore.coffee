EmotionStore = ->
  riot.observable this

  self = this

  self.KEYS = ['command', 'tarNone', 'tarTarget']
  self.emotions = []
  self.filters = []
  self.targetID = ''
  self.activeCommand = {}

  # ### 表情列表標籤視圖初始化，回傳列表內容 ###
  self.on(actionTypes.TAGS_INIT, () ->
    self.trigger(actionTypes.GET_TAGS_DATA, self.emotions)
  )

  # ### 表情文字視圖初始化，回傳隨機表情內容 ###
  self.on(actionTypes.DESCRIBE_INIT, () ->
    randomCommand = self.emotions[Math.random() * self.emotions.length | 0]
    self.trigger(actionTypes.GET_RANDOM_COMMAND, randomCommand)
  )

  # ### 設定檢索過濾條件，回傳符合條件內容列表 ###
  self.on(actionTypes.SET_FILTER, (keyword) ->
    ret = []
    _.each(self.emotions, (emotion) ->
      match = false
      keys = self.KEYS
      for key in keys
        if (emotion[key].indexOf(keyword.toLowerCase()) != -1)
          match = true
      if (match)
        ret.push(emotion)
    )
    self.filters = ret
    self.trigger(actionTypes.GET_FILTER_RESULT, self.filters)
  )

  # ### 設定目標對象名稱，存值後回傳 ###
  self.on(actionTypes.SET_TARGET, (id) ->
    self.targetID = id
    self.trigger(actionTypes.SET_TARGET_DONE, id)
  )

  # ### 設定目標表情，回傳表情內容及目標對象名稱 ###
  self.on(actionTypes.SET_COMMAND, (command) ->
    rets = if (_.size(self.filters) != 0) then self.filters else self.emotions
    _.each(rets, (ret) ->
      if (ret.command == command)
        self.activeCommand = ret
    )
    self.trigger(actionTypes.SET_COMMAND_DONE, [self.activeCommand, self.targetID])
  )

  return
