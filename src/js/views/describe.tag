<describe>
  <h5>{ description }</h5>

  var self = this;
  self.description = '';
  self.currentCommand = {}

  this.on('mount', function() {
    RiotControl.trigger(actionTypes.DESCRIBE_INIT)
  })

  RiotControl.on(actionTypes.GET_RANDOM_COMMAND, function(randomCommand) {
    self.currentCommand = randomCommand;
    self.description = self.currentCommand.tarNone;
    self.update();
  })

  RiotControl.on(actionTypes.SET_COMMAND_DONE, function(opts) {
    self.currentCommand = opts[0];
    getCurrentDescription(opts[1])
    self.update();
  })

  RiotControl.on(actionTypes.SET_TARGET_DONE, function(targetID) {
    getCurrentDescription(targetID)
    self.update();
  })

  getCurrentDescription = function(targetID) {
    var noTargetStr = self.currentCommand.tarNone,
        tarTargetStr = self.currentCommand.tarTarget;
    self.description = (_.size(targetID) > 0) ? tarTargetStr.replace(/:target/, targetID) : noTargetStr;
  }

</describe>