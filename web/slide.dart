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
  var active = c.children[0];
  var ready = c.children[1];
  
  change(String to){
    // Gives ready new html
    ready.innerHtml  = slides[to];
    ready.querySelectorAll('button').forEach((Element button){
      button.onClick.listen((_) => change(button.id));
    });
    
    // Activate 
    ready.style.removeProperty('transition-duration');
    ready.style.left = '0%';
    active.style.left = '-100%';
    
    ready.onTransitionEnd.first.then((_){
      // swap active and ready. The animation is done.
      var temp = ready;
      ready = active;
      active = temp;
      
      //disable transition on ready so i can jump it back to start
      ready.style.transitionDuration = "0";
      ready.style.left = '100%';
      
      //Clears readys content
      ready.innerHtml = '';
            
    });
  }
  
  // sets active upp with the fist slide.
  active.innerHtml  = slides['slide1'];
  active.querySelectorAll('button').forEach((Element button){
    button.onClick.listen((_) => change(button.id));
  });
  active.style.left = '0%';
  
  // move ready to start.
  ready.style.left = '100%';
}



