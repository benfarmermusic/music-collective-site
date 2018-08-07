//Note: bins needs to be a power of 2
var fftBins = 512;
let backgroundColour = "#2C2E3B";
let barColour = "#EC1A55";
let songFont = "15px 'Open Sans'";

let audioContext;
let audioBuffer;
var audioAnalyserNode;
let audioVisualizerInitialized = false;
let songText = "";
let textSize;
let canvasContext;
let canvasWidth;
let canvasHeight;
let finalBins = [];
let javaamp;


function initializeVisualizer(canvasElement, audioElement) {
	try {
		let ctxt = window.AudioContext || window.webkitAudioContext;
		if (ctxt) {
			initCanvas(canvasElement);
			audioContext = new ctxt();
			setupAudioApi(audioElement);
		}
	} catch(e) {
		console.log(e);
	}
}

function updateSongText(newText) {
	songText = newText;
	if (canvasContext)
		textSize = canvasContext.measureText(songText);
}

function setupAudioApi(audioElement) {
	let src = audioContext.createMediaElementSource(audioElement);

	audioAnalyserNode = audioContext.createAnalyser();
	audioAnalyserNode.fftSize = fftBins * 2;
	finalBins = [];
	for (let i = 0; i < fftBins; i++) {
		finalBins.push(0);
	}
    
	src.connect(audioAnalyserNode);
	audioAnalyserNode.connect(audioContext.destination);
	audioVisualizerInitialized = true;
}

function initCanvas(canvasElement) {
	canvasContext = canvasElement.getContext('2d');
	//canvasWidth = canvas.width;
	//canvasHeight = canvas.height;
	requestAnimationFrame(paint);
	//canvasContext.font = songFont;
	//canvasContext.strokeStyle = barColour;
	//textSize = canvasContext.measureText(songText);
}

//Render some fancy bars
function paint() {
	requestAnimationFrame(paint);

	if(!audioVisualizerInitialized)
		return;

	//canvasContext.fillStyle = backgroundColour;
	//canvasContext.fillRect(0, 0, canvasWidth, canvasHeight);

	let bins = audioAnalyserNode.frequencyBinCount;
	let data = new Uint8Array(bins);
	audioAnalyserNode.getByteFrequencyData(data);
	//canvasContext.fillStyle = barColour;

    updateBins(data);
    
    javaamp = getBinValue(0);

    //for (let i = 0; i < fftBins; i++) 
    paintSingleBin(javaamp);
    //}
}


function updateBins(data) {
	for (let i = 0; i < fftBins; i++) {
		finalBins[i] = data[i];
	}
}


function getBinValue(i) {
    let binValue = finalBins[i];
    return binValue;
}


function paintSingleBin(javaamp) {
	//canvasContext.fillRect(canvasWidth/2, canvasHeight - javaamp, 100, javaamp);
    //document.getElementById("debug1").innerHTML = javaamp;
}

