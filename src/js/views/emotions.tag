<emotions>
  <button each={ tags } class="waves-effect waves-light btn light-blue darken-3 mrs mbs">
    { command }
  </button>

  var self = this;

  this.tags = [];

  this.on('mount', function() {
    RiotControl.trigger(actionTypes.TAGS_INIT)
  })

  $(document).on('click', 'button', function(e) {
    var command = ($(e.target).text()).trim();
    RiotControl.trigger(actionTypes.SET_COMMAND, command);
  })

  RiotControl.on(actionTypes.FETCH_DATA_DONE, function(data) {
    self.tags = data
    self.update()
  })

  RiotControl.on(actionTypes.GET_FILTER_RESULT, function(data) {
    self.tags = data
    self.update()
  })

</emotions>