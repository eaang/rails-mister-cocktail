
document.addEventListener("DOMContentLoaded", () => {
  const arrow = document.querySelector("#down")
  arrow.addEventListener("click", () => {
    window.scrollBy({ 
      top: window.innerHeight, // could be negative value
      left: 0, 
      behavior: 'smooth' 
    })
  })
})