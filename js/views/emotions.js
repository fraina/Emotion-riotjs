riot.tag('emotions', '<button each="{tags}" class="waves-effect waves-light btn light-blue darken-3 mrs mbs"> {command} </button>', function(opts) {var self;

self = this;

self.tags = [];

$(document).on('click', 'button', function(e) {
  var command;
  command = ($(e.target).text()).trim();
  return RiotControl.trigger(actionTypes.SET_COMMAND, command);
});

self.on('mount', function() {
  return RiotControl.trigger(actionTypes.TAGS_INIT);
});

RiotControl.on(actionTypes.GET_TAGS_DATA, function(data) {
  self.tags = data;
  return self.update();
}).on(actionTypes.GET_FILTER_RESULT, function(result) {
  self.tags = result;
  return self.update();
});

});
