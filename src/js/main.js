/*global requirejs*/
requirejs.config({

  paths: {
    jquery: '../bower/jquery/dist/jquery.min',
    underscore: '../bower/underscore/underscore-min',
    backbone: '../bower/backbone/backbone',
    i18n: '../bower/requirejs-i18n/i18n',
    text: '../bower/requirejs-text/text',
    mock: '../bower/mockjs/dist/mock'
  },

  shim: {
    underscore: {
      exports: '_'
    },

    backbone: {
      deps: ['underscore', 'jquery'],
      exports: 'Backbone'
    }
  }
});

require([
  'jquery',
  'underscore',
  'backbone'
], function ($, _, Backbone) {

  'use strict';

  Backbone.history.start();
});
