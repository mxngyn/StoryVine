$(document).ready(function() {

  var vineGraph = document.getElementById('vine-graph');

  if(vineGraph){

    var vineData = rootJSON;
    var vineDataKeys = Object.keys(vineData).sort(function(a, b) {return a - b;});

    var graph = new joint.dia.Graph;

    var paper = new joint.dia.Paper({
      el: $('#vine-graph'),
      width: "100%",
      height: "100%",
      model: graph,
      gridSize: 1
    });

    paper.fitToContent({
      padding: '40',
      allowNewOrigin: 'any'
    });

    var cells = [];
    var nodes = {};

    joint.shapes.custom = {};
    joint.shapes.custom.ElementLabelLink = joint.shapes.basic.Rect.extend({
    // Note the `<a>` SVG element surrounding the rest of the markup.
    markup: '<g class="rotatable"><g class="scalable"><rect/></g><a><text/></a></g>',
    defaults: joint.util.deepSupplement({
      type: 'custom.ElementLabelLink'
    }, joint.shapes.basic.Rect.prototype.defaults)
  });

    function strip(html)
    {
       var tmp = document.createElement("DIV");
       tmp.innerHTML = html;
       return tmp.textContent || tmp.innerText || "";
    }

    function makeTree(node, tree) {
      if(node.published){

        var box = new joint.shapes.custom.ElementLabelLink({
          position: node.pos,
          size: {width: 150, height: 90},
          attrs: {
            rect: { fill: '#000000', rx: 5, ry: 5, 'stroke-width': 2, stroke: '#65b6b0' },
            a: { 'xlink:href': '/' + node.type + '/' + node.id , cursor: 'pointer' },
            text: { text: joint.util.breakText(strip(node.content).substr(0, 20) + "...", { width: 135 }) }
          }
        });
        box.attr({
          rect: { fill: '#97cfcc', rx: 20, ry: 20 },
          text: { fill: 'white', 'font-size': 15 },
          '.myrect2': { fill: 'red' },
        })
        tree.push(box);
      }
      for(var i = 0; i < node.children.length; i++){
        if(node.children[i].published){
        var child = makeTree(node.children[i], tree);
        var link = new joint.dia.Link({
          source: {id: box.id},
          target: {id: child.id},
        });
        link.attr({
          '.connection': { stroke: '#65b6b0', 'stroke-width': 2 },
          '.marker-source': { stroke: '#65b6b0', fill: '#65b6b0', d: 'M 10 0 L 0 5 L 10 10 z' },
          '.marker-target': { stroke: '#F39C12', fill: '#F39C12', d: 'M14.615,4.928c0.487-0.986,1.284-0.986,1.771,0l2.249,4.554c0.486,0.986,1.775,1.923,2.864,2.081l5.024,0.73c1.089,0.158,1.335,0.916,0.547,1.684l-3.636,3.544c-0.788,0.769-1.28,2.283-1.095,3.368l0.859,5.004c0.186,1.085-0.459,1.553-1.433,1.041l-4.495-2.363c-0.974-0.512-2.567-0.512-3.541,0l-4.495,2.363c-0.974,0.512-1.618,0.044-1.432-1.041l0.858-5.004c0.186-1.085-0.307-2.6-1.094-3.368L3.93,13.977c-0.788-0.768-0.542-1.525,0.547-1.684l5.026-0.73c1.088-0.158,2.377-1.095,2.864-2.081L14.615,4.928z' }
        });
        tree.push(link);
      }
    }
      return box;
    }


    function flowTree(root) {
      var queue = [root];
      root.depth = 0;
      var layers = [];
      var all = [];
      while (queue.length > 0) {
        var node = queue.shift();
        all.push(node);
        for(var i = 0; i < node.children.length; i++){
          node.children[i].depth = node.depth + 1;
          queue.push(node.children[i]);
        }
        layers[node.depth] = layers[node.depth] || 0;
        node.pos = {
          x: 200 * layers[node.depth]++,
          y: 200 * node.depth
        };
      }
      var longestLayer = Math.max.apply(null, layers);
      var midpoint = 200 * (longestLayer / 2);
      var i = all.length;
      while (--i >= 0) {
        var node = all[i];
        var width = layers[node.depth] * 200;
        node.pos.x += midpoint - width / 2;
      }
    }

    flowTree(vineData);
    makeTree(vineData, cells);

    graph.addCells(cells);
  }
})
