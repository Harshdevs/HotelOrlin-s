function showNav() {
    document.getElementsByClassName("navigation")[0].classList.toggle("active");
}

var ppbutton = document.getElementById("v-btn");
ppbutton.addEventListener("click", playPause);

myVideo = document.getElementById("myvid");
function playPause() {
    if (myVideo.paused) {
        myVideo.play();
        ppbutton.innerHTML = "Pause";
    } else {
        myVideo.pause();
        ppbutton.innerHTML = "Play";
    }
}


var log = document.getElementById("login");
function login() {
    log.innerHTML = "Logged In";
}


// video button

// var myvideo = document.getElementById("video");
// var isPlaying = false;

// function togglePlay() {
//   if (isPlaying) {
//     video.pause()
//   } else {
//     video.play();
//   }
// };
// myvideo.onplaying = function() {
//   isPlaying = true;
// };
// myvideo.onpause = function() {
//   isPlaying = false;
// };


/*clock*/

// function date_time(id)
// {
//         date = new Date;
//         h = date.getHours();
//         if(h<10)
//         {
//                 h = "0"+h;
//         }
//         m = date.getMinutes();
//         if(m<10)
//         {
//                 m = "0"+m;
//         }
//         s = date.getSeconds();
//         if(s<10)
//         {
//                 s = "0"+s;
//         }
//         document.getElementById("s").innerHTML = ''+s;
//         document.getElementById("m").innerHTML = ''+m;
//         document.getElementById("h").innerHTML = ''+h;
//         setTimeout('date_time("'+"s"+'");','1000');
//         return true;
// }
// window.onload = date_time('s');

function a() {
    if ($(".navigation").hasClass("active")) {
        $(".navigation").removeClass("active");
    }
}