# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

strengthReadable = {
  0: 'Péssimo'
  1: 'Ruim'
  2: 'Fraco'
  3: 'Bom'
  4: 'Forte'
}

$(document).ready () ->
  meter = $('#password-strength-meter')
  text = $('#password-strength-text')

  $('#user_password').on 'input', () ->
    strength = zxcvbn(this.value).score

    meter.val(strength)
    text.text(strengthReadable[strength])
