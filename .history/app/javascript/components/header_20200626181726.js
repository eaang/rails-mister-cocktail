
import 'getEmPixels.js'

document.addEventListener("DOMContentLoaded", () => {
  const navbar = document.querySelector('#navbar');
  const em = getEmPixels(navbar) / 8;
  const arrow = document.querySelector("#down")
  arrow.addEventListener("click", () => {
    window.scrollBy({ 
      top: window.innerHeight,
      left: 0, 
      behavior: 'smooth' 
    })
  })
})