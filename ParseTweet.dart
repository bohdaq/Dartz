class ParseTweet {
  List<Map<String, String>> parsedData;
  ParseTweet(List<Map<String, String>> data){
    this.parsedData=data;
  }
  String decoreTweet(Map<String, String> tweetMap){
    String output='<div class="tweet-item">';
      output+='<div class="date">'+tweetMap['created_at']+'</div>';
      output+='<div class="user">'+tweetMap['from_user']+'</div>';
      output+='<div class="user-image"><img src="'+tweetMap['profile_image_url']+'" weight="50px" height="50px"/></div>';
      output+='<div class="message">'+tweetMap['text']+'</div>';
      return output;
  }
  String decoreSide(){
    String output='<div class="tweets-cube-side">';
    this.parsedData.forEach((item){
      output+=this.decoreTweet(item);
    });
    return output;
  }
  String toString(){
    return this.decoreSide();
  }
}

