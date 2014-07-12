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
  
  change(String to){
    c.innerHtml = slides[to];
    c.querySelectorAll('button').forEach((Element button){
      button.onClick.listen((_) => change(button.id));
    });
  }
  
  change('slide1');
}



