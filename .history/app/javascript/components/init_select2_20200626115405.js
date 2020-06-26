import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2();
  console.log("hi i exist!")
};

export { initSelect2 };
