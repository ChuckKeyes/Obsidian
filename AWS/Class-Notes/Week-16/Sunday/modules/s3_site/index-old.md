..


  content = <<-HTML
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>KCS Slideshow</title>
  <style>
    body {
      margin: 0;
      mybackground: #0b1f0b;
      font-family: Arial, sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }
  <h1 id="siteTitle"></h1>
  audio {
    display: none;
        }


  <audio id="beachAudio" loop>
  <source src="sounds/beach-waves.mp3" type="audio/mpeg">
  Your browser does not support the audio element.
  </audio>

#siteTitle {
  position: absolute;
  top: 20px;
  left: 50%;
  transform: translateX(-50%);
  font-size: 36px;
  font-weight: 700;
  color: white;
  letter-spacing: 2px;
  text-shadow: 0 4px 12px rgba(0,0,0,0.6);
  z-index: 10;
}

<script>
  const host = window.location.hostname;
  const subdomain = host.split(".")[0];

  document.getElementById("siteTitle").textContent =
    subdomain.charAt(0).toUpperCase() + subdomain.slice(1);
</script>


.slideshow {
  width: 100%;
  height: 100vh;
  position: relative;
  overflow: hidden;
  mybackground: #000;
}

.slideshow img {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;   /* fills the screen */
  opacity: 0;
  transition: opacity 1s ease-in-out;
}

    .slideshow img.active {
      opacity: 1;
    }
  </style>
</head>
<body>
<div class="slideshow">
  <img src="images/mybackground1.jpg" class="active" alt="mybackground 1">
  <img src="images/mybackground2.jpg" alt="mybackground 2">
  <img src="images/mybackground3.jpg" alt="mybackground 3">
  <img src="images/mybackground4.jpg" alt="mybackground 4">
  <img src="images/mybackground5.jpg" alt="mybackground 5">
</div>

<button onclick="toggleAudio()" style="
  position: fixed;
  top: 15px;
  right: 15px;
  z-index: 1000;
  padding: 8px 14px;
  border-radius: 20px;
  cursor: pointer;">
🌊 Sound
</button>

<script>
  function toggleAudio() {
    if (audio.paused) {
      audio.play();
    } else {
      audio.pause();
    }
  }
</script>


<script>
  const slides = document.querySelectorAll(".slideshow img");
  let index = 0;

  setInterval(() => {
    slides[index].classList.remove("active");
    index = (index + 1) % slides.length;
    slides[index].classList.add("active");
  }, 4000);
</script>

<script>
  const audio = document.getElementById("beachAudio");

  function startAudio() {
    audio.volume = 0.4; // softer background sound
    audio.play();
    document.removeEventListener("click", startAudio);
  }

  document.addEventListener("click", startAudio);
</script>


</body>
</html>
HTML
}