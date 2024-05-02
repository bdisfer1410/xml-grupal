// Selectores de elementos del HTML
const nav = document.querySelector("nav");
const dropdown = document.querySelector("#dropdown");
const button = dropdown.querySelector("button");



// Funcionalidad para mostrar u ocultar el desplegable
let dropdown_visible = false;

function set_dropdown(visible) {
    nav.classList.remove("closed");
    nav.classList.remove("opened");

    nav.classList.add(
        visible ? "opened" : "closed"
    );

    dropdown_visible = visible;
}



// Para acortar el código en el "addEventListener"
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
button.addEventListener("mouseover", ()=>{
    // Esto arregla un bug que:
    //    1. En móvil, se daba al mismo tiempo "button:mouseover" y "dropdown:click"
    //       al hacer click ya que esta plataforma no tiene "hover".
    //
    //    2. Provocaba que desplegar el índice funcionase incorrectamente.
    //
    if (window.matchMedia("(min-width: 1200px)").matches) {
        show_dropdown()
    }
});
nav.addEventListener("mouseleave", hide_dropdown);



// Función que pregunta si quiere llamar al teléfono
function ask_call_telephone(number) {
    if (confirm(`El número de teléfono es: ${number}\n¿Quieres llamarlo?`)) {
        window.open(`tel:${number}`);
    }
}