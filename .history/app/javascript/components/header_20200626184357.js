document.addEventListener("DOMContentLoaded", () => {
  let em;

  function getValue(id){
    const div = document.querySelector(id);
    div.style.height = '1em';
    return ( em = div.offsetHeight );
  }

  getValue("#sizing-box")

  const down_arrow = document.querySelector("#down")
  down_arrow.addEventListener("click", () => {
    window.scrollBy({ 
      top: window.innerHeight - (7 * em),
      left: 0, 
      behavior: 'smooth' 
    })
  })

  const up_arrow = document.querySelector("#up")
  up_arrow.addEventListener("click", () => {
    window.scrollTo(0)
  })
})