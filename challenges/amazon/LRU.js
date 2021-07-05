#!/usr/bin/env node

const LRU_SIZE = 3;

class LRU {
    constructor(max = 10) {
        this.max = max;
        this.cache = new Map();
    }
    get(key) {
        let item = this.cache.get(key);
        if (item) {
            // refresh key
            this.cache.delete(key);
            this.cache.set(key, item);
        }
        return item;
    }
    set(key, val) {
        // refresh key
        if (this.cache.has(key))
        	this.cache.delete(key);
        // evict oldest
        else if (this.cache.size == this.max)
        	this.cache.delete(this.first());
        this.cache.set(key, val);
    }
    first() {
        return this.cache.keys().next().value;
    }
}

let cache = new LRU(LRU_SIZE);
cache.set('a', 123);
console.log(cache);
cache.set('b', 456);
console.log(cache);
// lru is 'a'
cache.set('c', 789);
console.log(cache);
// lru is 'b'
// cache.get('a');
// console.log(cache);
// Now max limit 3 is reached. Let's add a new element
// lru 'b' is removed
cache.set('d', 0);
console.log(cache);
console.log('first is', cache.first());
