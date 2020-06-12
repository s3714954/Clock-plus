// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
document.addEventListener('turbolinks:load', ()=>{ 
    document.querySelector("body").className = "light-theme";
    document.getElementById("format-toggle").addEventListener("change", function(){
        if (this.checked) {
            for (let el of document.getElementsByClassName("format-12")) {
                el.classList.add("d-none");
            }
            for (let el of document.getElementsByClassName("format-24")) {
                el.classList.remove("d-none");
            }
        } else {
            for (let el of document.getElementsByClassName("format-12")) {
                el.classList.remove("d-none");
            }
            for (let el of document.getElementsByClassName("format-24")) {
                el.classList.add("d-none");
            }
        }
    })

    let cards = document.getElementsByClassName("time-card");
    Array.from(cards).forEach(card => {
        card.addEventListener("mouseover", e=>{
            card.querySelector("form").classList.remove("d-none");
        })
        card.addEventListener("mouseout", e=>{
            card.querySelector("form").classList.add("d-none");
        })
    });

    let buttons = document.getElementsByClassName("theme-button");
    Array.from(buttons).forEach(button => {
        button.addEventListener("click", e=>{
            document.querySelector("body").className = button.dataset.themeName;
        })
    })
})