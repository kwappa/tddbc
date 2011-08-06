(function() {
    var Stack = function() {
	this._maxSize = 16;
	this._top = new this.Entry(undefined, undefined);
    };
    Stack.prototype = new function() {
	this.Entry = function(prev, value) {
	    //var e = new Object();
	    if (prev != undefined) {
		this.index = prev.index+1;
	    } else {
		this.index = 0;
	    }
	    this.value = value;
	    this.prev = prev;
	};
	this.isEmpty = function() {
	    return this._top.index == 0;
	};
	this.maxSize = function () {
	    return this._maxSize;
	};
	this.push = function (v) {
	    if (this._top.index == 16) {
		throw new RangeError('stack overflow maxSize is '+this._maxSize);
	    }
	    this._top = new this.Entry(this._top, v);
	    return v;
	};

	this.pop = function() {
	    if (this._top.index == 0) {
		throw new RangeError('stack is empty');
	    }

	    var e = this._top;
	    this._top = this._top.prev;
	    return e.value;
	};

	this.top = function() {
	    return this._top.value;
	};

	this.size = function() {
	    if (this._top == undefined) {
		return 0;
	    } else {
		return this._top.index;
	    }
	};
    };

    module.exports = Stack;
}).call(this);
