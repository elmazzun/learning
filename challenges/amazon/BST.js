#!/usr/bin/env node

const BstNode = require('./BstNode.js')

class BST {
  constructor() {
    this.root = null;
  }
  // Add node helper function
  insert(node, newNode) {
    // left insertion
    if (newNode.value < node.value)
      if (node.leftChild === null)
        node.leftChild = newNode;
      else
        this.insert(node.leftChild, newNode);
    // right insertion
    else
      if (node.rightChild === null)
        node.rightChild = newNode;
      else
        this.insert(node.rightChild, newNode);
  }
  // Add node main function
  add(data) {
    const newNode = new BstNode(data);
    if (this.root === null)
      this.root = newNode;
    else
      this.insert(this.root, newNode);
  }
  // Remove node helper function
  remove(node, data) {
    if (node === null) {
      // Empty tree
      return null;
    }
    else if (data < node.value) {
     
    }
    else if (data > node.value) {
     
    }
  }
  // Remove node main function
  delete(data) {
    // Re-init root with modified tree root
    this.root = this.remove(this.root, data);
  }
  inorder(node) {
    if (node !== null) {
      this.inorder(node.leftChild);
      console.log(node.value);
      this.inorder(node.rightChild);
    }
  }
  preorder(node) {
    if (node !== null) {
      console.log(node.value);
      this.preorder(node.leftChild);
      this.preorder(node.rightChild);
    }
  }
  postorder(node) {
    if (node !== null) {
      this.postorder(node.leftChild);
      this.postorder(node.rightChild);
      console.log(node.value);
    }
  }
  findMinNode(node) {
    if (node.leftChild === null)
      return node;
    return this.findMinNode(node.leftChild);
  }
  findMaxNode(node) {
    if (node.rightChild === null)
      return node;
    return this.findMaxNode(node.rightChild);
  }
  getRootNode() {
    return this.root;
  }
  search(node, data) {
    // Empty tree
    if (node === null)
      return null;
    else if (data < node.value)
      return this.search(node.leftChild, data);
    else if (data > node.value)
      return this.search(node.rightChild, data);
    else // data === node.value && node !== null
      return node;
  }
  // This function returns pointer to LCA of two given values n1 and n2.
  // This function assumes that n1 and n2 are present in Binary Tree
  lca(root, val1, val2) {
    if (!root || root.value === val1 || root.value === val2) {
      console.log('caso base')
      return root;
    }

    // Look for keys in left and right subtrees
    let leftLca  = this.lca(root.leftChild, val1, val2);
    let rightLca = this.lca(root.rightChild, val1, val2);
 
    // If both of the above calls return Non-NULL, then one key
    // is present in once subtree and other is present in other,
    // So this node is the LCA
    if (leftLca && rightLca)
      return root;
 
    // Otherwise check if left subtree or right subtree is LCA
    return leftLca ? leftLca: rightLca;
  }
}

const bst = new BST();
 
// Inserting nodes to the BinarySearchTree
bst.add(15);
bst.add(25);
bst.add(10);
bst.add(7);
bst.add(22);
bst.add(17);
bst.add(13);
bst.add(5);
bst.add(9);
bst.add(27);
const root = bst.getRootNode();
console.log('got root', root)
bst.lca(root, 7, 13);
// console.log('About to inorder()')
// bst.inorder(root);
// console.log('About to preorder()')
// bst.preorder(root);
// console.log('About to postorder()')
// bst.postorder(root);
// console.log('min is', bst.findMinNode(root));
// console.log('max is', bst.findMaxNode(root));
// console.log('find existing node (22)', bst.search(root, 22));
// console.log('find not existing node (99)', bst.search(root, 99));
