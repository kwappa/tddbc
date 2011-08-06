/* -*- coding: utf-8 -*-  */
var vows = require('vows'),
    assert = require('assert');

var stack = require('../lib/stack');

vows.describe('stack').addBatch({
    '空のとき': {
	topic: new stack(),
	'初期状態は空': function (s) {
	    assert.isTrue(s.isEmpty());
	},
	'emptyでのpopは例外発生': function(s) {
	    assert.throws(function() { s.pop(); }, RangeError);
	},
    },
    '1つpush': {
	topic: function() { 
	    var s = new stack(); 
	    s.push(1);
	    return s;
	},
	'top pop': function (s) {
	    assert.equal(s.size(), 1);
	    assert.isFalse(s.isEmpty());

	    assert.equal(s.top(), 1);
	    assert.equal(s.pop(), 1);

	    assert.equal(s.size(), 0);
	    assert.isTrue(s.isEmpty());
	},
    },
    '2つpush': {
 	topic: function(s) {
	    var s = new stack();
	    s.push(1);
	    s.push(3);
	    return s;
	},
	'pop 1つめ': function(s) {
	    assert.equal(s.pop(), 3);
	    assert.equal(s.size(), 1);
	    assert.isFalse(s.isEmpty());
	},
	'pop 2つめ': function(s) {
	    assert.equal(s.pop(), 1);
	    assert.equal(s.size(), 0);
	    assert.isTrue(s.isEmpty());
	}
    },
    'maxSize制限': {
	topic: new stack(),
	'スタック最大サイズは16': function(s) {
	    assert.equal(s.maxSize(), 16);
	},
	'maxSizeまでならpushできる': function(s) {
	    var i = 0;
	    while (s.size() < s.maxSize()) {
		assert.doesNotThrow(function(){ s.push(i++); }, RangeError);
	    }
	},
	'maxSize+1は例外': function(s){
	    assert.equal(s.size(), s.maxSize());
	    assert.throws(function(){ s.push(17); }, RangeError);
	}
    },
}).export(module);
