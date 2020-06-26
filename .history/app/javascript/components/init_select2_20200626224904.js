import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $("#list-markets").select2({
   });
  console.log("I'm working!")
};

export { initSelect2 };