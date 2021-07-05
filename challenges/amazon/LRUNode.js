'use stricts';

module.exports = class LRUNode {
	constructor(key, value, prev = null, next = null) {
		this.key = key;
		this.value = value;
		this.prev = prev;
		this.next = next;
	}
}
