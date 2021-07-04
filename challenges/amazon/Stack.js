#!/usr/bin/env node

'use strict';
module.exports = class Stack {
// class Stack {
	constructor() {
		this.items = [];
		this.top = null;
	}
	getTop() {
		if (this.items.length === 0)
			return null;
		return this.top;
	}
	isEmpty() {
		return this.items.length === 0;
	}
	getSize() {
		return this.items.length;
	}
	push(element) {
		this.items.push(element);
		this.top = element;
	}
	pop() {
		if (this.isEmpty())
			return null;
		const popped = this.items.pop();
		if (this.isEmpty())
			this.top = null;
		else
			this.top = this.items[this.getSize() - 1];
		return popped;
	}
	print() {
		console.log(...this.items);
	}
}

