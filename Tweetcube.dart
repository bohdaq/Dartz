#import('dart:html');
#import('dart:json');
#source('ParseTweet.dart');

dataReceived(MessageEvent e) {
  Map<String, String> parsedData=JSON.parse(e.data);
  List<Map<String, String>> tweets=parsedData['results'];
  ParseTweet output=new ParseTweet(tweets);
  document.query('.one').innerHTML=output.toString();
}
// print the raw json response text from the server
getTweet(){
// listen for the postMessage from the main page
  window.on.message.add(dataReceived);
  
  Element script = new Element.tag("script");
   script.src = "http://search.twitter.com/search.json?q=%23darthack&callback=callbackForJsonpApi";
  // script.src = "https://ajax.googleapis.com/ajax/services/search/news?v=1.0&q=barack%20obama&callback=callbackForJsonpApi";
  document.body.elements.add(script);
}

void main() {
  getTweet();
  document.on.keyDown.add(rotateHandler(event){var xAngle = 0, yAngle = 0;
  switch(event.keyCode)
  {

          case 37: // left
                  yAngle -= 90;
                  break;

          case 38: // up
                  xAngle += 90;
                  break;

          case 39: // right
                  yAngle += 90;
                  break;

          case 40: // down
                  xAngle -= 90;
                  break;
  };
  document.query('#cube').style.setProperty('-webkit-transform', "rotateX("+xAngle+"deg) rotateY("+yAngle+"deg)");});
}

void rotateHandlerTEMP(event) {
  var xAngle = 0, yAngle = 0;
  switch(event.keyDown)
  {

          case 37: // left
                  yAngle -= 90;
                  break;

          case 38: // up
                  xAngle += 90;
                  break;

          case 39: // right
                  yAngle += 90;
                  break;

          case 40: // down
                  xAngle -= 90;
                  break;
  };
  document.query('#cube').style.setProperty('-webkitTransform',"rotateX("+xAngle+"deg) rotateY("+yAngle+"deg)");
}
