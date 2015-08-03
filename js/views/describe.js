riot.tag('describe', '<h5>{description}</h5>', function(opts) {var getCurrentDescription, self;

self = this;

self.description = '';

self.currentCommand = {};

self.on('mount', function() {
  return RiotControl.trigger(actionTypes.DESCRIBE_INIT);
});

RiotControl.on(actionTypes.GET_RANDOM_COMMAND, function(randomCommand) {
  self.currentCommand = randomCommand;
  getCurrentDescription();
  return self.update();
}).on(actionTypes.SET_COMMAND_DONE, function(opts) {
  self.currentCommand = opts[0];
  getCurrentDescription(opts[1]);
  return self.update();
}).on(actionTypes.SET_TARGET_DONE, function(targetID) {
  getCurrentDescription(targetID);
  return self.update();
});

getCurrentDescription = function(targetID) {
  var noTargetStr, tarTargetStr;
  noTargetStr = self.currentCommand.tarNone;
  tarTargetStr = self.currentCommand.tarTarget;
  return self.description = targetID && _.size(targetID) > 0 ? tarTargetStr.replace(/:target/g, targetID) : noTargetStr;
};

});
