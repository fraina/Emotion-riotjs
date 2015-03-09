EmotionStore = ->
  riot.observable this

  self = this
  emotions = []
  filters = []

  # fetch 回所有資料
  self.on('FETCH_DATA', (url) ->
    $.getJSON(url)
    .done((data) ->
      console.log 'getJSON successful!'
      console.log data[0]
      return
    )
  )

  # SEARCH (params)：Reg 條件查詢，結果存放在 filters   return [filters]
  # GET_NORMAL (params)：根據 params 從 filters 尋找目標，回傳無目標時文字   return string
  # GET_TARGET (params, target)：根據(ry)，回傳有目標時文字   return string
