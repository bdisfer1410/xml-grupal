// Selectores de elementos del HTML
const nav = document.querySelector("nav");

const dropdown = document.querySelector("#dropdown");
const button = dropdown.querySelector("button");
const list = dropdown.querySelector("ul");



// Funcionalidad para mostrar u ocultar el desplegable
let dropdown_visible = false;

function set_dropdown(visible) {
    list.style.display = visible ? "block" : "none";
    dropdown_visible = visible;
}

function show_dropdown() {
    set_dropdown(true);
}

function hide_dropdown() {
    set_dropdown(false);
}

function toggle_dropdown() {
    set_dropdown(!dropdown_visible);
}



// Implementación de dicha funcionalidad
dropdown.addEventListener("click", toggle_dropdown);
button.addEventListener("mouseover", show_dropdown);
nav.addEventListener("mouseleave", hide_dropdown);