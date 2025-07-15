import $ from 'jquery'


$('#articlePost-post-btn').on('click', () => {
  if ($('#articlePost-post-btn').hasClass('active')) {
    $('#articlePost-submit-btn').trigger('click')
  }
})

$('#articlePost-input-images').on('change', () => {
  if ($('#articlePost-input-images').val() !== ""){
    $('#articlePost-post-btn').addClass('active')
  }else{
    $('#articlePost-post-btn').removeClass('active')
  }
})