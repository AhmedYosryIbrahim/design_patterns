class Tuner {
  void on() {
    print('Tuner is open');
  }

  void off() {
    print('Tuner is off');
  }

  void setAm() {
    print('Tuner set am');
  }

  void setFm() {
    print('Tuner set fm');
  }

  void setFrequency() {
    print('Tuner set frequency');
  }
}

class DvdPlayer {
  void on() {
    print('Dvd player is on');
  }

  void off() {
    print('Dvd player is off');
  }

  void eject() {
    print('Dvd player eject');
  }

  void pause() {
    print('Dvd player pause');
  }

  void play() {
    print('Dvd player play');
  }

  void setSurroundAudio() {
    print('Dvd player set surround audio');
  }

  void setTwoChannelAudio() {
    print('Dvd player set two channel audio');
  }

  void stop() {
    print('Dvd player stop');
  }
}

class CdPlayer {
  void on() {
    print('Cd player is on');
  }

  void off() {
    print('Cd player is off');
  }

  void eject() {
    print('Cd player eject');
  }

  void pause() {
    print('Cd player pause');
  }

  void play() {
    print('Cd player play');
  }

  void stop() {
    print('Cd player stop');
  }
}

class Projector {
  void on() {
    print('Projector is on');
  }

  void off() {
    print('Projector is off');
  }

  void tvMode() {
    print('Projector tv mode');
  }

  void wideScreenMode() {
    print('Projector wide screen mode');
  }
}

class TheaterLights {
  void on() {
    print('Theater lights is on');
  }

  void off() {
    print('Theater lights is off');
  }

  void dim() {
    print('Theater lights dim');
  }
}

class Screen {
  void up() {
    print('Screen is up');
  }

  void down() {
    print('Screen is down');
  }
}

class PopcornPopper {
  void on() {
    print('Popcorn popper is on');
  }

  void off() {
    print('Popcorn popper is off');
  }

  void pop() {
    print('Popcorn popper pop');
  }
}

class Amplifier {
  final Tuner tuner = Tuner();
  final DvdPlayer dvdPlayer = DvdPlayer();
  final CdPlayer cdPlayer = CdPlayer();

  void on() {
    print('Amplifier is on');
  }

  void off() {
    print('Amplifier is off');
  }

  void setDvd() {
    print('Amplifier set dvd');
  }

  void setSurroundSound() {
    print('Amplifier set surround sound');
  }

  void setVolume() {
    print('Amplifier set volume');
  }

  void setTuner() {
    print('Amplifier set tuner');
  }
}

class HomeTheaterFacade {
  final Amplifier amplifier;
  final Tuner tuner;
  final DvdPlayer dvdPlayer;
  final CdPlayer cdPlayer;
  final Projector projector;
  final TheaterLights theaterLights;
  final Screen screen;
  final PopcornPopper popcornPopper;

  HomeTheaterFacade(this.amplifier, this.tuner, this.dvdPlayer, this.cdPlayer,
      this.projector, this.theaterLights, this.screen, this.popcornPopper);

  void watchMovie(String movie) {
    print('Get ready to watch a movie...$movie');
    popcornPopper.on();
    popcornPopper.pop();
    theaterLights.dim();
    screen.down();
    projector.on();
    projector.wideScreenMode();
    amplifier.on();
    amplifier.setDvd();
    amplifier.setSurroundSound();
    amplifier.setVolume();
    dvdPlayer.on();
    dvdPlayer.play();
  }

  void endMovie() {
    print('Shutting movie theater down...');
    popcornPopper.off();
    theaterLights.on();
    screen.up();
    projector.off();
    amplifier.off();
    dvdPlayer.stop();
    dvdPlayer.eject();
    dvdPlayer.off();
  }
}
