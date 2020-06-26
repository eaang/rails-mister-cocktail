document.addEventListener("DOMContentLoaded", () => {
  const arrow = document.querySelector("#down")
  const title = document.querySelector("#page-title")
  const line_height = 
  arrow.addEventListener("click", () => {
    window.scrollBy({ 
      top: window.innerHeight,
      left: 0, 
      behavior: 'smooth' 
    })
  })
})