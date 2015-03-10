<filter>
  <div class="input-field col m6 s12">
    <input id="filter" type="text" class="validate" oninput={ filterInput }>
    <label for="filter">input filter keyword ...</label>
  </div>
  <div class="input-field col m6 s12">
    <input id="target" type="text" class="validate" oninput={ filterTarget }>
    <label for="target">input Target ID ...</label>
  </div>

  filterInput(e) {
    var keyword = $(e.target).val();
    RiotControl.trigger(actionTypes.SET_FILTER, keyword)
  }

  filterTarget(e) {
    var targetID = $(e.target).val();
    RiotControl.trigger(actionTypes.SET_TARGET, targetID)
  }
</filter>
