<filter>
  <div class="input-field col m6 s12">
    <input id="filter" type="text" class="validate" oninput={ filterInput }>
    <label for="filter">Filter</label>
  </div>
  <div class="input-field col m6 s12">
    <input id="target" type="text" class="validate" oninput={ filterTarget }>
    <label for="target">Target</label>
  </div>

  filterInput(e) {
    var keyword = $(e.target).val();
    RiotControl.trigger('FILTER', keyword)
  }

  filterTarget(e) {
    var targetID = $(e.target).val();
    RiotControl.trigger('SET_TARGET', targetID)
  }
</filter>