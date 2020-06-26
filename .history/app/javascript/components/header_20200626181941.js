document.addEventListener("DOMContentLoaded", () => {
  const arrow = document.querySelector("#down")
  arrow.addEventListener("click", () => {
    window.scrollBy({ 
      top: window.innerHeight - 128,
      left: 0, 
      behavior: 'smooth' 
    })
  })
})