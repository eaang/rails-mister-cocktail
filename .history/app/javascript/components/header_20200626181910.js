document.addEventListener("DOMContentLoaded", () => {
  const arrow = document.querySelector("#down")
  arrow.addEventListener("click", () => {
    window.scrollBy({ 
      top: window.innerHeight - 112,
      left: 0, 
      behavior: 'smooth' 
    })
  })
})