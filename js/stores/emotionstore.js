var EmotionStore;

EmotionStore = function() {
  var self;
  riot.observable(this);
  self = this;
  self.KEYS = ['command', 'tarNone', 'tarTarget'];
  self.emotions = [];
  self.filters = [];
  self.targetID = '';
  self.activeCommand = {};
  self.on(actionTypes.TAGS_INIT, function() {
    return self.trigger(actionTypes.GET_TAGS_DATA, self.emotions);
  });
  self.on(actionTypes.DESCRIBE_INIT, function() {
    var randomCommand;
    randomCommand = self.emotions[Math.random() * self.emotions.length | 0];
    return self.trigger(actionTypes.GET_RANDOM_COMMAND, randomCommand);
  });
  self.on(actionTypes.SET_FILTER, function(keyword) {
    var ret;
    ret = [];
    _.each(self.emotions, function(emotion) {
      var i, key, keys, len, match;
      match = false;
      keys = self.KEYS;
      for (i = 0, len = keys.length; i < len; i++) {
        key = keys[i];
        if (emotion[key].indexOf(keyword.toLowerCase()) !== -1) {
          match = true;
        }
      }
      if (match) {
        return ret.push(emotion);
      }
    });
    self.filters = ret;
    return self.trigger(actionTypes.GET_FILTER_RESULT, self.filters);
  });
  self.on(actionTypes.SET_TARGET, function(id) {
    self.targetID = id;
    return self.trigger(actionTypes.SET_TARGET_DONE, id);
  });
  self.on(actionTypes.SET_COMMAND, function(command) {
    var rets;
    rets = _.size(self.filters) !== 0 ? self.filters : self.emotions;
    _.each(rets, function(ret) {
      if (ret.command === command) {
        return self.activeCommand = ret;
      }
    });
    return self.trigger(actionTypes.SET_COMMAND_DONE, [self.activeCommand, self.targetID]);
  });
};
