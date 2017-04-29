//libraries
import java.awt.Frame;
import java.awt.BorderLayout;
import processing.sound.*;

//definitions
AudioIn in;
Amplitude amp;
FFT fft;

//setup
void setup() {
  size(1024, 512);
  background(255);
  
  // create the input stream
  in = new AudioIn(this, 0);
  //amp = new Amplitude(this);
  fft = new FFT(this, bands);
  
  in.start(); // possibly use to delay output and allow more processing time
  //in.play();
  //amp.input(in);
  fft.input(in);
  strokeWeight(2);
}

int bands = 512;
float[] spectrum = new float[bands];

//main
void draw() {
  background(255);
  
  //println(amp.analyze());
  //fft.input(in);
  fft.analyze(spectrum);

  for(int i = 0; i < bands; i++){
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    stroke(abs(255-(i+millis()/10)%bands),i/2,255);
    line( i*2, (height-spectrum[i]*height*100)/2, i*2, height - (height-spectrum[i]*height*100)/2 );
  }
}

//methods
// get gui settings from settings file :: JSON method, read from config file
//String getPlotterConfigString(String id) {
//  String r = "";
//  try {
//    r = plotterConfigJSON.getString(id);
//  } 
//  catch (Exception e) {
//    r = "";
//  }
//  return r;
//}