riot.tag('filter', '<div class="input-field col m6 s12"> <input id="filter" type="text" class="validate" oninput="{filterInput}"> <label for="filter">input filter keyword ...</label> </div> <div class="input-field col m6 s12"> <input id="target" type="text" class="validate" oninput="{filterTarget}"> <label for="target">input Target ID ...</label> </div>', function(opts) {this.filterInput = function(e) {
  var keyword;
  keyword = $(e.target).val();
  return RiotControl.trigger(actionTypes.SET_FILTER, keyword);
};

this.filterTarget = function(e) {
  var targetID;
  targetID = $(e.target).val();
  return RiotControl.trigger(actionTypes.SET_TARGET, targetID);
};

});
