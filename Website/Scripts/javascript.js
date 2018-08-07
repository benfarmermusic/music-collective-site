let initialized = false;

/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
//OPEN / CLOSE FUNCTIONS
/////////////////////////////////////////////////////////////////////
function openBenSite(){
    window.location.href = "Ben Farmer.php";
}

function openZakSite(){
    window.location.href = "Zakariya Khan.php";
}

function openReeseSite(){
    window.location.href = "Rosegoldreese.php";
}

function openKweySite(){
    window.location.href = "Kwey.php";
}

function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}


function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}


function openTracks() {
    //document.getElementById("myTracks").style.width = "100%";
    document.getElementById("songstable").style.display = "table";
    document.getElementById("showtracks_button").style.display = "none";
    document.getElementById("hidetracks_button").style.display = "inline-block";
    document.getElementById("tablewrapper").style.height = "300px";
}


function closeTracks() {
   // document.getElementById("myTracks").style.width = "0";
    document.getElementById("songstable").style.display = "none";
    document.getElementById("hidetracks_button").style.display = "none";
    document.getElementById("showtracks_button").style.display = "inline-block";
    document.getElementById("tablewrapper").style.height = "70px"; 
}


function openSketches() {
    document.getElementById("mySketches").style.width = "250px";
}

function closeSketches() {
    document.getElementById("mySketches").style.width = "0";
}

function openCharacters() {
    document.getElementById("myCharacters").style.width = "100%";
}

function closeCharacters() {
    document.getElementById("myCharacters").style.width = "0";
}

function openSettings() {
    document.getElementById("showSettings_button").style.display = "none";
    document.getElementById("hideSettings_button").style.display = "inline-block";
    document.getElementById("settingswrapper").style.display = "inline-block";
}


function closeSettings() {
    document.getElementById("hideSettings_button").style.display = "none";
    document.getElementById("showSettings_button").style.display = "inline-block";
    document.getElementById("settingswrapper").style.display = "none";
}
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
//SLIDER FUNCTIONS
/////////////////////////////////////////////////////////////////////

function getSliderValue(){
    
    var slider = document.getElementById("slider");
    var value = slider.value; // Display the default slider value
    
    return value;
}

// Update the current slider value (each time you drag the slider handle)
slider.oninput = function() {
    output.innerHTML = this.value;
}

function getColorSliderValue(){
    
    var colorslider = document.getElementById("colorslider");
    var colorvalue = colorslider.value; // Display the default slider value
    
    return colorvalue;
}

// Update the current slider value (each time you drag the slider handle)
colorslider.oninput = function() {
    output.innerHTML = this.value;
}
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
//LOAD SONG
/////////////////////////////////////////////////////////////////////
function loadSong(url,songname,producerinfo,artistinfo){
     
    document.getElementById("player").src = url;
    player.play();
    document.getElementById("songtitle").innerHTML = songname;
    document.getElementById("producerinfo").innerHTML = producerinfo;
    document.getElementById("artistinfo").innerHTML = artistinfo;
    
    document.getElementById("songinfo").style.display = "block";

    if (!initialized)
    {
        initializeVisualizer($("canvas")[0], $("audio")[0]);
        initialized = true;
        changeSketch(2);
    }
    
    hideTab();
}
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
//SKETCH FUNCTIONS
/////////////////////////////////////////////////////////////////////
var currentsketch;

function changeSketch(num){
    
    var processingInstance;
    var canvasarray = document.getElementsByTagName("canvas");
    var sketchtotal = canvasarray.length;
    
    for (i=0; i<sketchtotal;i++)
    {
        processingInstance = Processing.getInstanceById('canvas'+i);
        if (num == i) processingInstance.loop();
        else processingInstance.noLoop();  
    }
    
    for (i=0;i<sketchtotal;i++)
    {
        if (i == num) canvasarray[i].style.display = "block";
        else canvasarray[i].style.display ="none";
    }
    
    if (num == 1) document.getElementById("slidecontainer").style.display = "block";
    else document.getElementById("slidecontainer").style.display = "none";
    
    
    if (num == 2) document.getElementById("colorslidecontainer").style.display = "block";
    else document.getElementById("colorslidecontainer").style.display = "none";
    
    if (num == 3 || num == 4) {
        audioAnalyserNode.maxDecibels = -30
        audioAnalyserNode.minDecibels = -90
    }
    else if (num == 2){
            audioAnalyserNode.maxDecibels = -20
        audioAnalyserNode.minDecibels = -70
        
    }
    else{
        audioAnalyserNode.maxDecibels = -20
        audioAnalyserNode.minDecibels = -40
    }
    
    currentsketch = num;

    closeSketches();
}


/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
//CHOOSE YOUR CHARACTER
/////////////////////////////////////////////////////////////////////
$('li').on('click',function(e){
  e.preventDefault();
  $('li').removeClass('active');
 
  $(this).addClass('active');
  var $blink = $(this);
  var i = 0;
 var b = setInterval(function() {
		$blink.toggleClass("blink");
     i++;
   if(i==6)
       clearInterval(b);
	}, 200);
});

/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
//AUDIO PLAYER
/////////////////////////////////////////////////////////////////////
