#!/usr/bin/env node

'use strict';
module.exports = class BinTreeNode {
	constructor(value) {
		this.val = value;
		this.leftChild = null;
		this.rightChild = null;
	}
}