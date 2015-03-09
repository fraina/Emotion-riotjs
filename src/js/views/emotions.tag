<emotions>
  <button each={ tags } class="waves-effect waves-light btn mrs mbs">
    { command }
  </button>

  var self = this;

  this.tags = [];

  this.on('mount', function() {
    RiotControl.trigger('EMOTIONS_INIT');
  })

  $(document).on('click', 'button', function(e) {
    var command = ($(e.target).text()).trim();
    RiotControl.trigger('SET_COMMAND', command);
  })

  RiotControl.on('GET_DATA', function(data) {
    self.tags = data
    self.update()
  })

  RiotControl.on('FILTER_DONE', function(data) {
    self.tags = data
    self.update()
  })

</emotions>