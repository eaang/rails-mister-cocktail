import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
      theme: "bootstrap"
    }
    
    console.log("I'm working!"));
};

export { initSelect2 };