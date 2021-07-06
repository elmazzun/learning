#!/usr/bin/env node

// https://www.geeksforgeeks.org/implementation-graph-javascript/

class Graph {
	constructor(verticesNumber) {
		this.verticesNumber = verticesNumber;
		this.adjList = new Map();
	}
	addVertex(v) {
		this.adjList.set(v, []);
	}
	addEdge(v, w) {
		this.adjList.get(v).push(w);
		this.adjList.get(w).push(v);
	}
	printGraph() {
		const vertices = this.adjList.keys();
		for (const vertex of vertices) {
			let res = '';
			const adjacentVertices = this.adjList.get(vertex);
			for (const j of adjacentVertices) {
				res += j + ' ';
			}
			console.log(vertex + ' -> ' + res);
		}
	}
	bfs(v) {

	}
	dfs(v) {

	}
}

const g = new Graph(6);
var vertices = [ 'A', 'B', 'C', 'D', 'E', 'F' ];
  
// adding vertices
for (var i = 0; i < vertices.length; i++) {
    g.addVertex(vertices[i]);
}

g.addEdge('A', 'B');
g.addEdge('A', 'D');
g.addEdge('A', 'E');
g.addEdge('B', 'C');
g.addEdge('D', 'E');
g.addEdge('E', 'F');
g.addEdge('E', 'C');
g.addEdge('C', 'F');

g.printGraph();
