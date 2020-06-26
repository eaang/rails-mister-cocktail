var em;
function getValue(id){
  var div = document.getElementById(id);
  div.style.height = '1em';
  return ( em = div.offsetHeight );
}

document.addEventListener("DOMContentLoaded", () => {
  const arrow = document.querySelector("#down")
  arrow.addEventListener("click", () => {
    window.scrollBy({ 
      top: window.innerHeight,
      left: 0, 
      behavior: 'smooth' 
    })
  })
})