import processing.video.*;

Capture cam;

int xp = 1;
char ch;
int spacing = 30;


//String str = "***************************************";
String str = "!@#$%^&*(^%$##$(#@@#$%&!@#$%^&^%$)%#^&*";
int[] chary = new int[str.length()];

void setup() {
  size(1280,720);

  textSize(32);
  
  for(int i=0; i<chary.length; i++){
    chary[i]=0;
  }
  
  String[] cameras = Capture.list();
  
  
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);

  for (int i = 0; i < str.length(); i=i+1) {
    ch = str.charAt(i);
    chary[i]=chary[i]+int((brightness(get((i+1)*spacing,chary[i]))-80)/20);
    if((chary[i]>720)||(chary[i]<0)) {
      chary[i]=0;
    }
    fill(0,102,153);
    text(ch,(i+1)*spacing,chary[i]);
    
    
  }
  
  
  //println((brightness(get(mouseX,mouseY)))-100);
}
