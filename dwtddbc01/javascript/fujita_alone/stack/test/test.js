/* -*- coding: utf-8 -*-  */
var vows = require('vows'),
assert = require('assert');

var stack = require('../lib/stack');

vows.describe('stack').addBatch({
    '初期状態の時': {
        topic: new stack(),
        '初期状態は空': function (s) {
            assert.isTrue(s.isEmpty());
        },
        '空でのpopは例外発生': function(s) {
            assert.throws(function() { s.pop(); }, RangeError);
        },
    },
    '1つpushされた状態で': {
        topic: function() { 
            var s = new stack(); 
            s.push(1);
            return s;
        },
        'topとpopは同じ結果': function (s) {
            assert.equal(s.size(), 1);
            assert.isFalse(s.isEmpty());

            assert.equal(s.top(), 1);
            assert.equal(s.top(), s.pop());

            assert.equal(s.size(), 0);
            assert.isTrue(s.isEmpty());
        },
        '2つめpopは例外発生': function (s) {
            assert.throws(function () { s.pop(); }, RangeError);
        }   
    },
    '2つpushしている時': {
        topic: function(s) {
            var s = new stack();
            s.push(1);
            s.push(3);
            return s;
        },
        'pop 1つできる': function(s) {
            assert.equal(s.pop(), 3);
            assert.equal(s.size(), 1);
            assert.isFalse(s.isEmpty());
        },
        'pop 2つできる': function(s) {
            assert.equal(s.pop(), 1);
            assert.equal(s.size(), 0);
            assert.isTrue(s.isEmpty());
        },
        'pop 3つめは例外発生':function(s) {
            assert.throws(function () { s.pop(); }, RangeError);
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
