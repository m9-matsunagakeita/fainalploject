float frame1hight = 600;
float frame1wide =1;

float arm1L = 600;
float arm1W =10;

float arm2L = 200;
float arm2W = 10;

float jancL = 80;
float jancW = 10;

float act1 = 0;
float act2 = 0;
float act3 = 0;

float v = 0.6;
float u = 0.6;
float w = 0.6;

float angle0 = 0;
float angle1 = 0;
float angle2 = 0;


void setup() {
  size(1500, 800, P3D);
  background(255);

  camera(0, 600, 100, 0, 0, 0, 0, 0, -1);

  stroke(100);
}



void draw() {

  background(255);

  //wall
  pushMatrix();
  fill(100, 100, 100, 50);

  translate(300, 0, 100);
  box(frame1wide, 600, frame1hight);

  translate(-600, 0, 0);
  box(frame1wide, 600, frame1hight);

  translate(300, -300, 0);
  box(600, frame1wide, frame1hight);

  translate(0, 300, -300);
  box(600, 600, 1);

  popMatrix();

  //ball
  pushMatrix();
  translate(0, 100, -140 );
  sphere(20);
  popMatrix();



  //stick1
  translate(-200+arm1W+act1, 0, 300);
  fill(150);
  box(arm1W, arm1L, arm1W);

  //stick2
  translate(arm1W, -200-arm1W+arm1L/2-act2, -act3+150);
  fill(150);
  box(arm2W, arm2W, 3*arm2L);

  //janction
  rotateZ(radians(angle0));
  translate(0, 0, -3*arm2L/2);
  fill(100);
  box(jancW, jancL, jancW);

  //arm
  pushMatrix();
  translate(0, jancL/2-jancW/2, 0); 
  rotateX(radians(angle1));
  translate(0, 0, -jancL/2+jancW/2);
  fill(50);
  box(40, 10, 60);
  popMatrix();

  //arm
  pushMatrix();
  translate(0, -jancL/2+jancW/2, 0); 
  rotateX(radians(-angle1));
  translate(0, 0, -jancL/2+jancW/2);
  fill(50);
  box(40, 10, 60);
 
  popMatrix();


  if (keyPressed) {

    if (key == CODED) {
      if (keyCode == RIGHT ) {
        act1 = act1 + v;
      }
    }

    if (key == CODED) {
      if (keyCode == UP) {
        act2 = act2 + v;
      }
    }


    if (key == CODED) {
      if (keyCode== LEFT) {
        act1 = act1 - v;
      }
    }

    if (key == CODED) {
      if (keyCode == DOWN ) {
        act2 = act2 - v;
      }
    }

    if (key == BACKSPACE) {
      act3 = act3 - v;
    }
    if (key == 'a') {
      angle0 = angle0 + v;
    }

    if (key == 'z') {
      angle1 = angle1 - v/2;
    }

    if (key == 'x') {
      angle1 = angle1 +v/2;
    }
  }



  if (key== ENTER) {
    act3 = act3 + v;
  }

if ( -act3+150 == -200) {
    v=0;
  }





  if (key== BACKSPACE) {
    act3 = act3 - v;
  }
}
