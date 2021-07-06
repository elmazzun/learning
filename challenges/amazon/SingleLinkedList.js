"use strict";
const Node = require('./SingleLinkedListNode.js');

// [head] -> [x|next] -> [y|next] -> null

module.exports = class SingleLinkedList {
  constructor() {
    this.head = null;
  }
  insertAtHead(newData) {
    let newNode = new Node(newData);
    newNode.next = this.head;
    this.head = newNode;
    return this; // return updated list
  }
  isEmpty() {
    return this.head == null;
  }
  printList() {
    if (this.isEmpty()) {
      return false;
    }
    let tmp = this.head;
    while (tmp) {
      console.log(tmp.val);
      tmp = tmp.next;
    }
    console.log('null');
    return true;
  }
  getHead() {
    return this.head;
  }
  setHead(newHead) {
    this.head = newHead;
    return this;
  }
  insertAtTail(newData) {
    const newNode = new Node();
    if (this.isEmpty()) {
      
    }

    let tmp = this.head;
    while (tmp.next != null) {
      tmp = tmp.next;
    }
    tmp.next = newNode;
    return this;
  }
}