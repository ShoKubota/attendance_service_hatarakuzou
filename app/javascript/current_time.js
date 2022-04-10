getCurrentTime = () => {
  var currentTime = new Date ();
  var currentHour = currentTime.getHours();
  var currentMin  = currentTime.getMinutes();
  var currentSec  = currentTime.getSeconds();
  var showCurrentTime = currentHour + ":" + currentMin + ":" + currentSec;
  document.getElementById("currentTime").innerHTML = showCurrentTime;
}

setInterval('getCurrentTime()',1000);