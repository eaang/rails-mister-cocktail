document.addEventListener("DOMContentLoaded", () => {
  let em;

  function getValue(id){
    const div = document.querySelector("#sizing-box");
    div.style.height = '1em';
    return ( em = div.offsetHeight );
  }

  getValue(id)

  const arrow = document.querySelector("#down")
  arrow.addEventListener("click", () => {
    window.scrollBy({ 
      top: window.innerHeight - (8 * em),
      left: 0, 
      behavior: 'smooth' 
    })
  })
})