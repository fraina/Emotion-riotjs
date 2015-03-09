EmotionStore = ->
  riot.observable this

  KEYS = ['command', 'tarNone', 'tarTarget']
  emotions = []
  filters = []
  targetID = ''
  activeCommand = {}

  # fetch 所有資料
  this.on('FETCH_DATA', (url) ->
    $.getJSON(url)
    .done((data) ->
      _.each(data, (emotion) ->
        emotions.push(emotion)
      )
    )
  )

  this.on('EMOTIONS_INIT', () ->
    this.trigger('GET_DATA', emotions)
  )

  this.on('FILTER', (keyword) ->
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
    this.trigger('FILTER_DONE', filters)
  )

  this.on('SET_TARGET', (id) ->
    targetID = id
    this.trigger('SET_TARGET_DONE')
  )

  this.on('SET_COMMAND', (command) ->
    rets = if (_.size(filters) != 0) then filters else emotions
    _.each(rets, (ret) ->
      if (ret.command == command)
        activeCommand = ret
    )
    this.trigger('SET_COMMAND_DONE', activeCommand)
  )

  return
