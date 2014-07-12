import 'dart:html';

Map slides = {
  'slide1': 'This is test slide 1. <button id="slide2">To 2</button><button id="slide5">To 5</button>',
  'slide2': 'This is test slide 2. <button id="slide3">To 3</button><button id="slide4">To 4</button>',
  'slide3': 'This is test slide 3. <button id="slide4">To 4</button><button id="slide1">To 1</button>',
  'slide4': 'This is test slide 4. <button id="slide5">To 5</button><button id="slide2">To 2</button>',
  'slide5': 'This is test slide 5. <button id="slide1">To 1</button><button id="slide3">To 3</button>'
};

void main() {
  var c = querySelector('.container');
  // toList to get a real list not a HtmlCollection.
  var pages = c.children.toList();
  
  change(String to){
    pages[1].innerHtml  = slides[to];
    pages[1].querySelectorAll('button').forEach((Element button){
      button.onClick.listen((_) => change(button.id));
    });
    
    pages[1].style.left = '0%';
    pages[0].style.left = '-100%';
    
    pages[1].onTransitionEnd.first.then((_){
      
      //move page[0] back to start;
      //removes anim so that elem don't slide over view.
      pages[0].classes.remove('anim');
      pages[0].style.left = '100%';
      pages[0].classes.add('anim');
      
      // swap plases [0] is alwayse the one shown.
      var temp = pages[0];
      pages[0] = pages[1];
      pages[1] = temp;
            
    });
  }
  
  pages[0].innerHtml  = slides['slide1'];
  pages[0].querySelectorAll('button').forEach((Element button){
    button.onClick.listen((_) => change(button.id));
  });
  pages[0].style.left = '0%';
  pages[1].style.left = '100%';
}



