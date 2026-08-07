document.addEventListener('DOMContentLoaded', function () {
  var burger = document.getElementById('burgerBtn');
    var links = document.getElementById('navLinks');
      if (burger && links) {
          burger.addEventListener('click', function () {
                links.classList.toggle('open');
                    });
                      }
                      });
                      
