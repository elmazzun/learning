#!/usr/bin/env node

// enqueue (to back) -> queue -> dequeue (from front)

'use strict';
module.exports = class Queue {
// class Queue {
	constructor() {
		this.items = [];
		this.front = null;
		this.back = null;
	}
	isEmpty() {
		return this.getSize() === 0;
	}
	getFront() {
		return this.front;
	}
	getBack() {
		return this.back;
	}
	getSize() {
		return this.items.length;
	}
	enqueue(element) {
		this.items.unshift(element);
		this.back = element;
		if (this.getSize() === 1)
			this.front = element;
		// console.log(`enqueue: back ${this.getBack()}, front ${this.getFront()}, ${this.print()}`)
	}
	dequeue() {
		if (this.getSize() === 0) {
			console.log('queue is empty, returning null');
			return null;
		}
		const ret = this.items.pop();
		if (this.getSize() === 0)
			this.back = this.front = null;
		else if (this.getSize() === 1)
			this.back = this.front = this.items[0];
		else {
			this.back = this.items[0];
			this.front = this.items[this.getSize() - 1];
		}
		// console.log(`dequeue: back ${this.getBack()}, front ${this.getFront()}, ${this.print()}`)
		return ret;
	}
	print() {
		return this.items;
	}
}

//  
