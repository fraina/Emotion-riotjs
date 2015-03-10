EmotionStore = ->
  riot.observable this

  KEYS = ['command', 'tarNone', 'tarTarget']
  emotions = []
  filters = []
  targetID = ''
  activeCommand = {}

  # fetch 所有資料
  this.on(actionTypes.FETCH_DATA, (url) ->
    $.getJSON(url)
    .done((data) ->
      _.each(data, (emotion) ->
        emotions.push(emotion)
      )
    )
  )

  this.on(actionTypes.TAGS_INIT, () ->
    this.trigger(actionTypes.FETCH_DATA_DONE, emotions)
  )

  this.on(actionTypes.DESCRIBE_INIT, () ->
    randomCommand = emotions[Math.random() * emotions.length | 0]
    this.trigger(actionTypes.GET_RANDOM_COMMAND, randomCommand)
  )

  this.on(actionTypes.SET_FILTER, (keyword) ->
    ret = []
    _.each(emotions, (emotion) ->
      match = false
      for key in KEYS
        if (emotion[key].indexOf(keyword.toLowerCase()) != -1)
          match = true
      if (match)
        ret.push(emotion)
    )
    filters = ret
    this.trigger(actionTypes.GET_FILTER_RESULT, filters)
  )

  this.on(actionTypes.SET_TARGET, (id) ->
    targetID = id
    this.trigger(actionTypes.SET_TARGET_DONE, id)
  )

  this.on(actionTypes.SET_COMMAND, (command) ->
    rets = if (_.size(filters) != 0) then filters else emotions
    _.each(rets, (ret) ->
      if (ret.command == command)
        activeCommand = ret
    )
    this.trigger(actionTypes.SET_COMMAND_DONE, [activeCommand, targetID])
  )

  return
