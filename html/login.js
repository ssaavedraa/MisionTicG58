function habilitar() {
    usuario_text = document.getElementById("usuario_text").value;
    contrasena_text = document.getElementById("contrasena_text").value;
    val = 0;

    if (usuario_text == "") {
        val = val + 1;
    }
    if (contrasena_text == "") {
        val = val + 1;
    }

    if (val == 0) {
        document.getElementById("btn_aceptar").disabled = false;
    } else {
        document.getElementById("btn_aceptar").disabled = true;
    }

}
document.getElementById("usuario_text").addEventListener("keyup", habilitar);
document.getElementById("contrasena_text").addEventListener("keyup", habilitar);