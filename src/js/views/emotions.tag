<emotions>
  <button each={ tags } class="waves-effect waves-light btn light-blue darken-3 mrs mbs">
    { command }
  </button>

  var self = this;
  this.tags = [];

  $(document).on('click', 'button', function(e) {
    var command = ($(e.target).text()).trim();
    RiotControl.trigger(actionTypes.SET_COMMAND, command);
  })

  this.on('mount', function() {
    RiotControl.trigger(actionTypes.TAGS_INIT)
  })

  RiotControl.on(actionTypes.GET_TAGS_DATA, function(data) {
    self.tags = data
    self.update()
  })

  RiotControl.on(actionTypes.GET_FILTER_RESULT, function(result) {
    self.tags = result
    self.update()
  })

</emotions>