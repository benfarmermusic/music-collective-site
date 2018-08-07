var keyboard = new QwertyHancock({
     id: 'keyboard',
     width: 600,
     height: 150,
     octaves: 2,
     startNote: 'A3',
     whiteNotesColour: 'white',
     blackNotesColour: 'black',
     hoverColour: '#f3e939'
});

var context = new AudioContext(),
    envelope = context.createGain(),
    a = d = r = .1, s = 1, velocity = 1,
    masterVolume = context.createGain();

masterVolume.gain.setValueAtTime(0.1,context.currentTime);
masterVolume.connect(context.destination);

var oscillators = {};

keyboard.keyDown = function (note, frequency) {
    var osc = context.createOscillator(),
    osc2 = context.createOscillator();
 
    osc.frequency.value = frequency;
    osc.type = 'sine';
 
    osc2.frequency.value = frequency;
    osc2.type = 'triangle';
 
    osc.connect(masterVolume);
    osc2.connect(masterVolume);
 
    masterVolume.connect(context.destination);
 
    oscillators[frequency] = [osc, osc2];
 
    osc.start(context.currentTime);
    osc2.start(context.currentTime);
    
    
};
 
keyboard.keyUp = function (note, frequency) {
      oscillators[frequency].forEach(function (oscillator) {
        oscillator.stop(context.currentTime);
    });
};



