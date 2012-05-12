class FillSide{  
  String dataReceived(MessageEvent e) {
    Map<String, String> parsedData=JSON.parse(e.data);
    ParseTweet cubeSide=new ParseTweet(parsedData['results']); 
  }
  getTweet(String url){
// listen for the postMessage from the main page
    window.on.message.add(dataReceived);
    Element script = new Element.tag("script");
     script.src = "http://search.twitter.com/search.json?q=%23"+url+"&callback=callbackForJsonpApi";
    document.body.elements.add(script);
  }

}
