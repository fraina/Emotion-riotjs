<describe>
  <h5>{ description }</h5>

  var self = this;
  description = '';
  currentCommand = {}

  this.on('mount', function() {
    RiotControl.trigger(actionTypes.DESCRIBE_INIT)
  })

  RiotControl.on(actionTypes.GET_RANDOM_COMMAND, function(randomCommand) {
    currentCommand = randomCommand;
    getCurrentDescription();
    self.update();
  })

  RiotControl.on(actionTypes.SET_COMMAND_DONE, function(opts) {
    currentCommand = opts[0];
    getCurrentDescription(opts[1])
    self.update();
  })

  RiotControl.on(actionTypes.SET_TARGET_DONE, function(targetID) {
    getCurrentDescription(targetID)
    self.update();
  })

  getCurrentDescription = function(targetID) {
    var noTargetStr = currentCommand.tarNone,
        tarTargetStr = currentCommand.tarTarget;
    self.description = (targetID && _.size(targetID) > 0) ? tarTargetStr.replace(/:target/, targetID) : noTargetStr;
  }

</describe>