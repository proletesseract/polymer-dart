import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:async';

@CustomTag('site-intro')
class SiteIntro extends PolymerElement {
  
  static const ms = const Duration(milliseconds: 1);
  
  @observable
  String placeName;
  
  int _cloudSpeed = 50, _cloudOffset = 1;
  StreamSubscription<int> _subscription;
  
  SiteIntro.created() : super.created(){
        
  }//created
  

  @override
  void attached() {
    super.attached();    
    
    //attach event listeners
    
    shadowRoot.querySelector("#site-intro-form").onSubmit.listen((e) => formSubmit(e));
    
    //setup timer for clouds
    var duration = ms*(_cloudSpeed);    
    Stream _cloudStream = new Stream.periodic(duration, animateClouds);
    
    _subscription = _cloudStream.listen((result){
      //callback
    });    
    
        
  }//enteredView
  
  void formSubmit(e){
    e.preventDefault();
    
    print(placeName);
    
    //look up the placename
    
  }
  
  void animateClouds(int count){
    
    
    //check the clouds aren't off the screen    
    
    List clouds = shadowRoot.querySelectorAll(".site-intro-cloud");
    
    clouds.forEach((DivElement cloud){
      
      if(cloud.offsetLeft >= window.innerWidth){
        cloud.style.left = "-"+cloud.offsetWidth.toString()+"px";        
      }else{
        cloud.style.left = (cloud.offsetLeft + _cloudOffset).toString()+"px";
      }
      
    });
    
  }//animateClouds
  
  
}
