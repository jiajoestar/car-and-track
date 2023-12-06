Car[] cars; //<>//
RaceTrack track;
boolean raceOver;
int yInc;

void setup() {
  size(1000, 600);
  track = new RaceTrack();
  cars = new Car[5];
  yInc = 0;
  // make cars spaced out from each other
  for (int index=0; index < cars.length; index++) {
    cars[index] = new Car(track.getStartPosition(), 100+yInc, 60, color(200, 100, 100));
    yInc = yInc + 100;
  }
  raceOver = false;
}

void draw() {
  background(70);
  track.display();
  
  for (int index=0; index < cars.length; index++) {
    cars[index].display();
    if (!raceOver) {
      if (cars[index].getPosition() >= track.getFinishPosition()) {
        raceOver = true;
        detectWinners();
        detectOneWinner();
        println("Press 's' to restart");
      } else {
        cars[index].move();
      }
    }
  }
}

void keyPressed() {
  if (key == 's' && raceOver) {
    float startLine = track.getStartPosition();
    for (int index=0; index < cars.length; index++) {
      cars[index].setPosition(startLine);
    }
    raceOver = false;
  }
}

void detectWinners() {
  for (int index=0; index < cars.length; index++) {
    if (cars[index].getPosition() >= track.getFinishPosition()) {
      cars[index].increaseScore();
    }
  }
}

void detectOneWinner() {
  // first for loop: detects when cars reach finish line
  for (int index=0; index < cars.length; index++) {
    if (cars[index].getPosition() >= track.getFinishPosition()) {
      int winning = 0;
      print(".");
      // second for loop: comparing cars to each other
      for (int index2=0; index2 < cars.length; index2++) {
        if (cars[index].getPosition() > cars[index2].getPosition()) {
          winning = winning + 1;
        }
      }
      if (winning == 5) { // one car is ahead of the others
        cars[index].increaseScore();
      }
    }
  }
}
