<?php

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="Styles/css.css" rel="stylesheet">
    <link href="Styles/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito">
    
      
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <!--<script src="js/jquery.js"></script>-->
    <script src="Scripts/javascript.js"></script>
    <script src="Scripts/audioanalyser.js"></script>
    <script src="Scripts/processing.js"></script>
    <script src="Scripts/js/bootstrap.min.js"></script>


        
	<script type="text/javascript">
		//let initialized = false;
        
		window.onload = function() {
			fileinput.onchange = function() {
				var files = this.files;
				var file = URL.createObjectURL(files[0]);
                
				player.src = file;
			    player.play();
                
				
				if (!initialized) {
					initializeVisualizer($("canvas")[0], $("audio")[0]);
					initialized = true;
                    changeSketch(3);
				}
				updateSongText(files[0].name);
                document.getElementById("songtitle").innerHTML = files[0].name;
			}
		};
	</script>    
      
    <title>Home</title>
  </head>
  <body>
      
    <div class="container-fluid">
        
        <div class="row buttonblock"> 
        <!--NAV TABS -->
        <button class ="col-3 responsive-width navbutton" onclick="openNav()">&#9776;</button>

        <button class ="col-3 responsive-width navbutton" onclick="openSketches()">Sketches</button>

        <button class ="col-6 responsive-width navbutton" onclick="openCharacters()">Choose Your Character</button>
            
        </div>
        
        <!--SIDE NAV --><!--SIDE NAV --><!--SIDE NAV --><!--SIDE NAV --><!--SIDE NAV --><!--SIDE NAV --><!--SIDE NAV -->
            
        <!--SIDE NAV -->
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a class="menulinks" href="#">Discography</a>
            <a class="menulinks" href="#">Contact</a>
        </div>
        
        <!--SKETCHES NAV -->
        
        <div id="mySketches" class="sketches">
            <a href="javascript:void(0)" class="closebtn" onclick="closeSketches();">&times;</a>

            <img class="sketchimages" src="Images/Circular_Drawing.png" onclick="changeSketch(1);"> <h4 class = "sketchtitles">  Circular Drawing</h4> <br>  
            <img class="sketchimages" src="Images/Sunset.png" onclick="changeSketch(2);" id="img2">  <h4 class = "sketchtitles"> Sunset </h4><br> 
            <img class="sketchimages" src="Images/Fourier_FFT_Web.png" onclick="changeSketch(3);" id="img3">  <h4 class = "sketchtitles"> Fourier Transform </h4> <br>  
            <img class="sketchimages" src="Images/Rorschach.png" onclick="changeSketch(4);" id="img4">  <h4 class = "sketchtitles"> Rorschach   </h4> 
            <img class="sketchimages" src="Images/Purple_Rain.png" onclick="changeSketch(5);" id="img5">  <h4 class = "sketchtitles"> Purple Rain </h4><br>    
            
        </div>
               
        <!--CHARACTERS NAV -->
        <div id="myCharacters" class="tracks">
            <a href="javascript:void(0)" class="closebtn" onclick="closeCharacters()">&times;</a>
            <h1 class="characterh1">CHOOSE YOUR CHARACTER</h1>
            <ul class="characterul turtlesul">
                <li class="t1" onclick="openZakSite();">Zakariya Khan</li>
                <li class="t2" onclick="openKweySite();">Kwey</li>
                <li class="t3" onclick="openBenSite();">Ben Farmer</li>
                <li class="t4" onclick="openReeseSite();">Rosegoldreese</li>
            </ul>     
        </div>
        
        <!--SIDE NAV --><!--SIDE NAV --><!--SIDE NAV --><!--SIDE NAV --><!--SIDE NAV --><!--SIDE NAV --><!--SIDE NAV -->
        
        <br>

         <!--AUDIO PLAYER -->
        <div id="songinfo" class="text-center songinfo"> 
            <p><span id="songtitle" class="songtitle" ></span> </p>
            <span id="artistinfo" class="artistinfo"></span>
            <p> Prod. <span id="producerinfo" class="producerinfo" ></span> </p>
             <audio class="col-4" controls controlslist="nodownload" id="player" loop></audio>  
        </div>
        
        <br>
        
        <div class="tabblock">
 
            <ul id="myTab" class="nav nav-tabs justify-content-center">
                <li class="nav-item">
                    <a data-toggle="tab" class="nav-link" href="#tracksTab">All Tracks</a>      
                </li>
                <li class="nav-item">
                    <a data-toggle="tab" class="nav-link" href="#beatsTab">Beats</a>
                </li>
                <li class="nav-item">
                    <a data-toggle="tab" class="nav-link" href="#songsTab">Songs</a>
                </li>
            </ul>


            <script>
                function hideTab () {$('#myTab a').click(function (e) {
                    var tab = $(this);
                    if(tab.hasClass('active')){
                        window.setTimeout(function(){
                            $(".tab-pane").removeClass('active');
                            tab.removeClass('active');
                        },1);
                    }
                });}
            </script>

            <br>

            <div class="tab-content">

                <div id="tracksTab" class="tab-pane fade">
                    <?php
                    include 'db_connection.php';

                    $conn = OpenCon();

                    $query = "SELECT songname, url, producer, type, songartist
                    FROM music WHERE `producer` LIKE '%Kwey%'
                    ORDER BY songname";

                    $result = mysqli_query($conn,$query)
                        or die ("Couldn't execute query.");

                    /* Display results in a table */
                    echo "<table id=\"songstable\" class=\"songstable\">";
                    echo "<tr>
                    <th scope=\"col\" class=\"headcell\"><span>Title</span></td>
                    <th scope=\"col\" class=\"headcell\"><span>Artist</span></td>
                    <th scope=\"col\" class=\"headcell\"><span>Producer(s)</span></td>
                    <th scope=\"col\" class=\"headcell\" style=\"display:none;\"><span>url</span></td>";
                    while($row = mysqli_fetch_assoc($result))
                    {   
                        extract($row);
                        echo "<tr class=\"clickablerow\">\n
                        <td class=\"songnamecell\" width=\"20%\">$songname</td>\n
                        <td class=\"songartistcell\" width=\"30%\">$songartist</td>\n
                        <td class=\"producercell\" width=\"30%\">$producer</td>\n
                        <td style=\"display:none;\" width=\"20%\">$url</td>\n
                        </tr>\n";
                    }
                    echo "</table>\n";
                    CloseCon($conn);
                    ?>   

                    <script type="text/javascript">
                        $(".clickablerow").click(function(){
                        var url = String($(this).children('td')[3].innerHTML);
                        var songname = $(this).children('td')[0].innerHTML;
                        var producer = String($(this).children('td')[2].innerHTML);
                        var songartist = $(this).children('td')[1].innerHTML;
                        loadSong(url,songname,producer,songartist);
                        });
                    </script>
                </div>

                <div id="beatsTab" class="tab-pane fade">
                    <?php

                    $conn = OpenCon();

                    $query = "SELECT songname, url, producer, type, songartist
                    FROM music WHERE `producer` LIKE '%Kwey%' AND `type` = 'Beat'
                    ORDER BY songname";

                    $result = mysqli_query($conn,$query)
                        or die ("Couldn't execute query.");

                    /* Display results in a table */
                    echo "<table id=\"songstable\" class=\"songstable\">";
                    echo "<tr>
                    <th scope=\"col\" class=\"headcell\"><span>Title</span></td>
                    <th scope=\"col\" class=\"headcell\"><span>Artist</span></td>
                    <th scope=\"col\" class=\"headcell\"><span>Producer(s)</span></td>
                    <th scope=\"col\" class=\"headcell\" style=\"display:none;\"><span>url</span></td>";
                    while($row = mysqli_fetch_assoc($result))
                    {   
                        extract($row);
                        echo "<tr class=\"clickablerow\">\n
                        <td class=\"songnamecell\" width=\"20%\">$songname</td>\n
                        <td class=\"songartistcell\" width=\"30%\">$songartist</td>\n
                        <td class=\"producercell\" width=\"30%\">$producer</td>\n
                        <td style=\"display:none;\" width=\"20%\">$url</td>\n
                        </tr>\n";
                    }
                    echo "</table>\n";
                    CloseCon($conn);
                    ?>   

                    <script type="text/javascript">
                        $(".clickablerow").click(function(){
                        var url = String($(this).children('td')[3].innerHTML);
                        var songname = $(this).children('td')[0].innerHTML;
                        var producer = String($(this).children('td')[2].innerHTML);
                        var songartist = $(this).children('td')[1].innerHTML;
                        loadSong(url,songname,producer,songartist);
                        });

                    </script>
                </div>

                <div id="songsTab" class="tab-pane fade">
                    <?php

                    $conn = OpenCon();

                    $query = "SELECT songname, url, producer, type, songartist
                    FROM `music` WHERE `producer` LIKE '%Kwey%' AND `type` = 'Song'
                    ORDER BY songname";

                    $result = mysqli_query($conn,$query)
                        or die ("Couldn't execute query.");

                    /* Display results in a table */
                    echo "<table id=\"songstable\" class=\"songstable\">";
                    echo "<tr>
                    <th scope=\"col\" class=\"headcell\"><span>Title</span></td>
                    <th scope=\"col\" class=\"headcell\"><span>Artist</span></td>
                    <th scope=\"col\" class=\"headcell\"><span>Producer(s)</span></td>
                    <th scope=\"col\" class=\"headcell\" style=\"display:none;\"><span>url</span></td>";
                    while($row = mysqli_fetch_assoc($result))
                    {   
                        extract($row);
                        echo "<tr class=\"clickablerow\">\n
                        <td class=\"songnamecell\" width=\"20%\">$songname</td>\n
                        <td class=\"songartistcell\" width=\"30%\">$songartist</td>\n
                        <td class=\"producercell\" width=\"30%\">$producer</td>\n
                        <td style=\"display:none;\" width=\"20%\">$url</td>\n
                        </tr>\n";
                    }
                    echo "</table>\n";
                    CloseCon($conn);
                    ?>   

                    <script type="text/javascript">
                        $(".clickablerow").click(function(){
                        var url = String($(this).children('td')[3].innerHTML);
                        var songname = $(this).children('td')[0].innerHTML;
                        var producer = String($(this).children('td')[2].innerHTML);
                        var songartist = $(this).children('td')[1].innerHTML;
                        loadSong(url,songname,producer,songartist);
                        });

                    </script>
                </div>

            </div>
            
        </div>
        
        <br>
   
        <div name="canvasblock">
            <!--CANVAS AREA -->
            <canvas data-processing-sources="Sketches/canvasWelcome_Web.pde"  style="padding-left: 0; padding-right: 0; margin-left: auto;margin-right: auto;display: block; border: 1px solid white; " id="canvas0"></canvas>

            <canvas data-processing-sources="Sketches/Circular_Drawing_Web.pde"  style="padding-left: 0; padding-right: 0; margin-left: auto;margin-right: auto;display: none; border: 1px solid white;" id="canvas1"></canvas>

            <canvas data-processing-sources="Sketches/Sunset_Web.pde"  style="padding-left: 0; padding-right: 0; margin-left: auto;margin-right: auto;display: none; border: 1px solid white;" id="canvas2"></canvas>

            <canvas data-processing-sources="Sketches/Fourier_FFT_Web.pde"  style="padding-left: 0; padding-right: 0; margin-left: auto;margin-right: auto;display: none; border: 1px solid white;" id="canvas3"></canvas>

            <canvas data-processing-sources="Sketches/Rorschach_Web.pde"  style="padding-left: 0; padding-right: 0; margin-left: auto;margin-right: auto;display: none; border: 1px solid white;" id="canvas4"></canvas>

            <canvas data-processing-sources="Sketches/Purple_Rain_Web.pde"  style="padding-left: 0; padding-right: 0; margin-left: auto;margin-right: auto;display: none; border: 1px solid white;" id="canvas5"></canvas>
            
            <script>         
         
                $(document).keydown(function(e){
                  var k = e.which; 
                  if(k==37||k==39){
                    var i = currentsketch;
                    var canvasarray = document.getElementsByTagName("canvas");
                    var sketchtotal = canvasarray.length;
                    var i = (k==39? ++i : --i) <0? sketchtotal-1 : i%sketchtotal;
                    changeSketch(i);
                  } 
                });
            </script>
              
        </div>

        <br>
        
        <div class="text-center">
	
            <div id="keyboard"></div>
            
        </div>
        
        <br>
        
        <div class="container soundDesignBlock">
            
        
            
        </div>
            
        <br>
        
        <div class="settingsblock">
            
            <div class="text-center">
                <button id="showSettings_button" class ="settingsbutton responsive-width-small" style="font-family: 'Courier New', Courier, monospace; display:inline-block;" onclick="openSettings()">Sketch Settings</button> 
                <button id="hideSettings_button" class ="settingsbutton responsive-width-small" style="font-family: 'Courier New', Courier, monospace; display:none;" onclick="closeSettings()">Close</button> 
            </div>

            <br>

            <div class="text-center">
                <div id="settingswrapper" class="settingswrapper"> 
                    <div class="slidecontainer" style="display:none" id="slidecontainer">
                        <h6 style="color:black;"> Opacity Slider </h6>
                        <input type="range" min="0" max="100" value="0" class="slider" id="slider" >
                        <br>
                        <br>
                        <p>
                          Press 'SPACE' to clear the canvas;<br>
                          Press 'M' to change the drawing mode;<br>
                          Press 'S' to change the size of the shape;<br>
                          Press 'C' to change the color scheme;<br>
                          Press 'L' to change the number of lines;
                        </p>

                    </div>    

                    <div class="colorslidecontainer" style="display:none" id="colorslidecontainer">
                        <h6 style="color:black;"> Color Slider </h6>
                        <input type="range" min="0" max="85" value="0" class="slider" id="colorslider" >
                        <br>
                        <br>
                        <h6> Press 'SPACE' to get lit. </h6>
                        <br>
                        <br>
                    </div>
                    <div>
                        <br>
                        <h6> Use the 'ARROW' keys to change sketches. </h6>
                    </div>     
                </div>
                    </div>

        </div>
        
        <br>

        <div class="fileinputblock"> 
       
        <br>
            <div class="text-center">
            <p style="color:white;"> Or, upload your own track</p>
            <input id="fileinput" style="color:white;" type="file" accept="audio/*"/>
            </div>
        <br>
            
        </div>
       
      
        <div id="block_container" class="footerblock">

    <div id="bloc1"> <img src="" width="400px"></div>  
    <div id="bloc2"> 
        <h1> Kwey </h1>
        <h3> Producer </h3
     
    </div>

</div>
    </div>
 
      
    <script src="Scripts/qwerty-hancock.js"></script>
    <script src="Scripts/synth.js"></script>
      
  </body>
</html>