var vows = require('vows'),
    assert = require('assert');

var stack = require('./index.js');

vows.describe('stack').addBatch({
    'empty': {
	topic: new stack(),
	'初期状態はempty': function (s) {
	    assert.isTrue(s.isEmpty());
	},
	'emptyでのpopはエラー': function(s) {
	    assert.throws(function() { s.pop(); }, RangeError);
	},
    },
    'push and pop': {
	topic: new stack(),
	'ひとつpush': function (s) {
	    s.push(1);
	    assert.equal(s.top(), 1);
	    assert.equal(s.size(), 1);
	},
	'二つpush':function(s) {
	    s.push(3);
	    assert.equal(s.top(), 3);
	    assert.equal(s.size(), 2);
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
    'stack overflow': {
	topic: new stack(),
	'スタック最大値は16': function(s) {
	    assert.equal(s.maxSize(), 16);
	},
	'16個までならOK': function(s) {
	    var i = 0;
	    while (s.size() < 16) {
		assert.doesNotThrow(function(){ s.push(i++); }, RangeError);
	    }
	    assert.equal(s.size(), 16);
	},
	'17個目は例外':	function(s){
	    assert.throws(function(){ s.push(17); }, RangeError);
	}
    },
}).export(module);
