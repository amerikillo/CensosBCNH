/*
 * 
 * @returns {undefined}
 */

function isNumberKey(evt, obj)
{
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode === 13 || charCode > 31 && (charCode < 48 || charCode > 57)) {
        if (charCode === 13) {
            frm = obj.form;
            for (i = 0; i < frm.elements.length; i++)
                if (frm.elements[i] === obj)
                {
                    if (i === frm.elements.length - 1)
                        i = -1;
                    break
                }
            /*ACA ESTA EL CAMBIO*/
            if (frm.elements[i + 1].disabled === true)
                tabular(e, frm.elements[i + 1]);
            else
                frm.elements[i + 1].focus();
            return false;
        }
        return false;
    }
    return true;

}

function otroChk(obj) {
    //alert(obj.id);
    var id2 = parseInt(obj.id) + 1;
    //alert(id2);
    if (id2 === 31) {
        if (document.getElementById(obj.id).checked) {
            document.getElementById(id2 + "_").readOnly = false;
        } else {
            document.getElementById(id2 + "_").readOnly = true;
        }
    } else if (obj.id === "31__") {
        id2 = parseInt(obj.id) + 1;
        if (document.getElementById(obj.id).checked) {
            document.getElementById(id2 + "__").readOnly = false;
        } else {
            document.getElementById(id2 + "__").readOnly = true;
        }
    } else {
        if (document.getElementById(obj.id).checked) {
            document.getElementById(id2).readOnly = false;
        } else {
            document.getElementById(id2).readOnly = true;
        }
    }
}


function validara() {
    //alert("hola");
    //obteniendo el valor que se puso en campo text del formulario
    for (var i = 1; i <= 23; i++) {
        if (i === 18) {
            var b = 0;
            var chk = document.getElementsByName('campo' + i);
            for (j = 0; j < chk.length; j++) {
                if (chk.item(j).checked === false) {
                    b++;
                }
            }
            if (b === chk.length) {
                alert("Selecciones una o varias opciones del campo " + i);
                chk[0].focus();
                return false;
            }
        } else {
            var miCampoTexto = document.getElementById("campo" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección A esta vacío");
                document.getElementById("campo" + i).focus();
                return false;
            }
        }
    }

    return true;
}
function validar_b() {
    //obteniendo el valor que se puso en campo text del formulario
    for (var i = 24; i <= 27; i++) {
        var miCampoTexto = document.getElementById("campo" + i).value;
        //la condición

        if (miCampoTexto.length === 0) {

            alert("El campo número " + i + " de la sección B esta vacío");
            document.getElementById("campo" + i).focus();
            return false;
        }
    }

    return true;
}

function validar_c() {
    //obteniendo el valor que se puso en campo text del formulario
    for (var i = 28; i <= 31; i++) {
        if (i === 29 || i === 30 || i === 31) {
            var b = 0;
            var chk = document.getElementsByName('campo' + i);
            for (j = 0; j < chk.length; j++) {
                if (chk.item(j).checked === false) {
                    b++;
                }
            }
            if (b === chk.length) {
                alert("Selecciones una o varias opciones del campo " + i);
                chk[0].focus();
                return false;
            }
        } else {
            var miCampoTexto = document.getElementById("campo" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección C esta vacío");
                document.getElementById("campo" + i).focus();
                return false;
            }
        }
    }

    return true;
}

function validar_d() {
    //obteniendo el valor que se puso en campo text del formulario
    for (var i = 32; i <= 33; i++) {
        if (i === 33) {
            var b = 0;
            var chk = document.getElementsByName('campo' + i);
            for (j = 0; j < chk.length; j++) {
                if (chk.item(j).checked === false) {
                    b++;
                }
            }
            if (b === chk.length) {
                alert("Selecciones una o varias opciones del campo " + i);
                chk[0].focus();
                return false;
            }
        } else {
            var miCampoTexto = document.getElementById("campo" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección D esta vacío");
                document.getElementById("campo" + i).focus();
                return false;
            }
        }
    }

    return true;
}

function validar_e() {

    //obteniendo el valor que se puso en campo text del formulario
    for (var i = 34; i <= 81; i++) {
        if (i === 40 || i === 42 || i === 43 || i === 47 || i === 49 || i === 52 || i === 54 || i === 55 || i === 57 || i === 67 || i === 68 || i === 70) {
            var b = 0;
            var chk = document.getElementsByName('campo' + i);
            for (j = 0; j < chk.length; j++) {
                if (chk.item(j).checked === false) {
                    b++;
                }
            }
            if (b === chk.length) {
                alert("Selecciones una o varias opciones del campo " + i);
                chk[0].focus();
                return false;
            }
        } else {
            var miCampoTexto = document.getElementById("campo" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección E esta vacío");
                document.getElementById("campo" + i).focus();
                return false;
            }
        }
    }

    return true;
}

function validar_f() {
    //obteniendo el valor que se puso en campo text del formulario
    for (var i = 82; i <= 129; i++) {
        if (i===83 || i === 89 || i === 91 || i === 92 || i === 95 || i === 100 || i === 103 || i === 105 || i === 106 || i === 114 || i === 116 || i === 118) {
            var b = 0;
            var chk = document.getElementsByName('campo' + i);
            for (j = 0; j < chk.length; j++) {
                if (chk.item(j).checked === false) {
                    b++;
                }
            }
            if (b === chk.length) {
                alert("Selecciones una o varias opciones del campo " + i);
                chk[0].focus();
                return false;
            }
        } else {
            var miCampoTexto = document.getElementById("campo" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección F esta vacío");
                document.getElementById("campo" + i).focus();
                return false;
            }
        }
    }

    return true;
}

function validaServU() {
    var campo = document.getElementById("campo28").value;
    if (campo === "No") {
        document.getElementById("29").checked = 1;
        document.getElementById("30").value = "NA";

        document.getElementById("30_").checked = 1;
        document.getElementById("31_").value = "NA";

        document.getElementById("31__").checked = 1;
        document.getElementById("32__").value = "NA";
    }
    if (campo === "Si") {
        document.getElementById("29").checked = 0;
        document.getElementById("30").value = "";

        document.getElementById("30_").checked = 0;
        document.getElementById("31_").value = "";

        document.getElementById("31__").checked = 0;
        document.getElementById("32__").value = "";
    }
}

function validaTelF() {
    var campo = document.getElementById("campo58").value;
    if (campo === "No") {
        document.getElementById("campo59").value = "NA";
        document.getElementById("campo59").readOnly = true;
    }
    if (campo === "Si") {
        document.getElementById("campo59").value = "";
        document.getElementById("campo59").readOnly = false;
    }
}

function validaPlantaF() {
    var campo = document.getElementById("campo60").value;
    if (campo === "No") {
        document.getElementById("campo61").selectedIndex = 2;
    }
    if (campo === "Si") {
        document.getElementById("campo61").selectedIndex = 0;
    }
}

function validaInternetF() {
    var campo = document.getElementById("campo62").value;
    if (campo === "No") {
        document.getElementById("campo63").selectedIndex = 8;
        document.getElementById("campo64").selectedIndex = 6;
    }
    if (campo === "Si") {
        document.getElementById("campo63").selectedIndex = 0;
        document.getElementById("campo64").selectedIndex = 0;
    }
}

function validaAlmF() {
    var campo = document.getElementById("campo65").value;
    if (campo === "No") {
        document.getElementById("campo66").value = "NA";
        document.getElementById("campo66").readOnly = true;
    }
    if (campo === "Si") {
        document.getElementById("campo66").value = "";
        document.getElementById("campo66").readOnly = false;
    }
}
/******/

function cambiaRefriA() {
    var campo = document.getElementById("campo99").value;
    if (campo === "No") {

        document.getElementById("100").checked = 1;
        document.getElementById("101").value = "NA";
    }
    if (campo === "Si") {

        document.getElementById("100").checked = 0;
        document.getElementById("101").value = "";
    }
}

function cambiaEqCA() {
    var campo = document.getElementById("campo101").value;
    if (campo === "No") {

        document.getElementById("campo102").value = "NA";
        document.getElementById("campo102").readOnly = true;
        document.getElementById("103").checked = 1;
        document.getElementById("104").value = "NA";
        document.getElementById("campo104").selectedIndex = 2;
        document.getElementById("105").checked = 1;
        document.getElementById("106").value = "No cuenta con Sistema Informático en Farmacia";
        document.getElementById("106_").checked = 1;
        document.getElementById("107_").value = "No genera reportes";
    }
    if (campo === "Si") {
        document.getElementById("campo102").value = "";
        document.getElementById("campo102").readOnly = false;
        document.getElementById("103").checked = 0;
        document.getElementById("104").value = "";
        document.getElementById("campo104").selectedIndex = 0;
        document.getElementById("105").checked = 0;
        document.getElementById("106").value = "";
        document.getElementById("106_").checked = 0;
        document.getElementById("107_").value = "";
    }
}


function validaAnden() {
    var campo = document.getElementById("campo95").value;
    if (campo === "No") {
        document.getElementById("campo96").selectedIndex = 2;
        document.getElementById("campo97").value = "NA";
        document.getElementById("campo97").readOnly = true;
        document.getElementById("campo98").selectedIndex = 2;
    }
    if (campo === "Si") {
        document.getElementById("campo96").selectedIndex = 0;
        document.getElementById("campo97").value = "";
        document.getElementById("campo97").readOnly = false;
        document.getElementById("campo98").selectedIndex = 0;
    }
}

function validaTelA() {
    var campo = document.getElementById("campo107").value;
    if (campo === "No") {
        document.getElementById("campo108").value = "NA";
        document.getElementById("campo108").readOnly = true;
    }
    if (campo === "Si") {
        document.getElementById("campo108").value = "";
        document.getElementById("campo108").readOnly = false;
    }
}

function validaPlantaA() {
    var campo = document.getElementById("campo60").value;
    if (campo === "No") {
        document.getElementById("campo61").selectedIndex = 2;
    }
    if (campo === "Si") {
        document.getElementById("campo61").selectedIndex = 0;
    }
}

function validaInternetA() {
    var campo = document.getElementById("campo109").value;
    if (campo === "No") {
        document.getElementById("campo110").selectedIndex = 8;
        document.getElementById("campo111").selectedIndex = 6;
    }
    if (campo === "Si") {
        document.getElementById("campo110").selectedIndex = 0;
        document.getElementById("campo111").selectedIndex = 0;
    }
}

function validaAlmA() {
    var campo = document.getElementById("campo112").value;
    if (campo === "No") {
        document.getElementById("campo113").value = "NA";
        document.getElementById("campo113").readOnly = true;
    }
    if (campo === "Si") {
        document.getElementById("campo113").value = "";
        document.getElementById("campo113").readOnly = false;
    }
}
/******/


function validar_g() {
    //obteniendo el valor que se puso en campo text del formulario
    for (i = 130; i <= 130; i++) {
        miCampoTexto = document.getElementById("campo" + i).value;
        //la condición
        if (miCampoTexto.length === 0) {
            alert("El campo número " + i + " de la sección G esta vacío");
            return false;
        }
    }

    return true;
}

function areaFarm() {
    var lr = document.formularioHospitales.anchoFarm.value;
    var an = document.formularioHospitales.largoFarm.value;
    if (lr === "")
        lr = 0;
    if (an === "")
        an = 0;
    var largo = parseInt(lr);
    var ancho = parseInt(an);
    var area = (largo * ancho);
    //alert (area);
    document.formularioHospitales.campo45.value = ancho + "x" + largo + "=" + area;
}

function areaAlm() {
    var lr = document.formularioHospitales.anchoAlm.value;
    var an = document.formularioHospitales.largoAlm.value;
    if (lr === "")
        lr = 0;
    if (an === "")
        an = 0;
    var largo = parseInt(lr);
    var ancho = parseInt(an);
    var area = (largo * ancho);
    //alert (area);
    document.formularioHospitales.campo93.value = ancho + "x" + largo + "=" + area;
}

function areaRampa() {
    var lr = document.form_a.anchoRampa.value;
    var an = document.form_a.largoRampa.value;
    if (lr === "")
        lr = 0;
    if (an === "")
        an = 0;
    var largo = parseInt(lr);
    var ancho = parseInt(an);
    var area = (largo * ancho);
    //alert (area);
    document.form_a.campo_121.value = ancho + "x" + largo + "=" + area;
}


function cambiaC() {
    campo = document.getElementById("campo28").value;
    if (campo === "NO") {

        document.getElementById("campo30").selectedIndex = 1;
        document.getElementById("campo31").selectedIndex = 1;

        document.getElementById("29").checked = 1;
        document.getElementById("30").value = "NA";
        /*
         document.getElementById("campo_35").value = "NA";
         document.getElementById("campo_35").readOnly = true;
         */
    }
    if (campo === "SI") {

        document.getElementById("campo30").selectedIndex = 0;
        document.getElementById("campo31").selectedIndex = 0;

        document.getElementById("29").checked = 0;
        document.getElementById("30").value = "";
    }
}

function cambiaD() {
    campo = document.getElementById("campo32").value;
    if (campo === "NO") {


        document.getElementById("33").checked = 1;
        document.getElementById("34").value = "NA";
    }
    if (campo === "SI") {

        document.getElementById("33").checked = 0;
        document.getElementById("34").value = "";
    }
}

function cambiaRefriF() {
    var campo = document.getElementById("campo48").value;
    if (campo === "No") {

        document.getElementById("49").checked = 1;
        document.getElementById("50").value = "NA";
    }
    if (campo === "Si") {

        document.getElementById("49").checked = 0;
        document.getElementById("50").value = "";
    }
}

function cambiaSisF() {
    var campo = document.getElementById("campo53").value;
    if (campo === "No") {

        document.getElementById("54").checked = 1;
        document.getElementById("55").value = "No cuenta con Sistema Informático en Farmacia";
        document.getElementById("55_").checked = 1;
        document.getElementById("56_").value = "No genera reportes";
    }
    if (campo === "Si") {

        document.getElementById("54").checked = 0;
        document.getElementById("55").value = "";
        document.getElementById("55_").checked = 0;
        document.getElementById("56_").value = "";
    }
}

function cambiaSisA() {
    var campo = document.getElementById("campo104").value;
    if (campo === "No") {

        document.getElementById("105").checked = 1;
        document.getElementById("106").value = "No cuenta con Sistema Informático en Almacén";
        document.getElementById("106_").checked = 1;
        document.getElementById("107_").value = "No genera reportes";
    }
    if (campo === "Si") {
        document.getElementById("105").checked = 0;
        document.getElementById("106").value = "";
        document.getElementById("106_").checked = 0;
        document.getElementById("107_").value = "";
    }
}



function cambiaEqCF() {
    var campo = document.getElementById("campo50").value;
    if (campo === "No") {

        document.getElementById("campo51").value = "NA";
        document.getElementById("campo51").readOnly = true;
        document.getElementById("52").checked = 1;
        document.getElementById("53").value = "NA";
        document.getElementById("campo53").selectedIndex = 2;
        document.getElementById("54").checked = 1;
        document.getElementById("55").value = "No cuenta con Sistema Informático en Farmacia";
        document.getElementById("55_").checked = 1;
        document.getElementById("56_").value = "No genera reportes";
    }
    if (campo === "Si") {
        document.getElementById("campo51").value = "";
        document.getElementById("campo51").readOnly = false;
        document.getElementById("52").checked = 0;
        document.getElementById("53").value = "";
        document.getElementById("campo53").selectedIndex = 0;
        document.getElementById("54").checked = 0;
        document.getElementById("55").value = "";
        document.getElementById("55_").checked = 0;
        document.getElementById("56_").value = "";
    }
}

function ValidaOriPac() {
    var campo = document.getElementById("campo56").value;
    if (campo === "No") {

        document.getElementById("57").checked = 1;
        document.getElementById("58").value = "No se realiza ninguna validación del origen del paciente";
    }
    if (campo === "Si") {
        document.getElementById("57").checked = 0;
        document.getElementById("58").value = "";
    }
}


function servFarmacia() {
    var campo = document.getElementById("campo34").value;
    if (campo === "NO") {
        document.getElementById("campo35").selectedIndex = 0;
        document.getElementById("campo36").selectedIndex = 0;

        document.getElementById("campo37").value = "NA";
        document.getElementById("campo37").readOnly = true;
        document.getElementById("campo38").value = "NA";
        document.getElementById("campo38").readOnly = true;

        document.getElementById("campo39").selectedIndex = 2;

        document.getElementById("40").checked = 1;
        document.getElementById("41").value = "NA";

        document.getElementById("campo41").selectedIndex = 2;

        document.getElementById("42").checked = 1;
        document.getElementById("43").value = "NA";

        document.getElementById("43_").checked = 1;
        document.getElementById("44").value = "NA";

        document.getElementById("campo44").selectedIndex = 2;

        document.getElementById("campo45").value = "NA";

        document.getElementById("campo46").value = "NA";
        document.getElementById("campo46").readOnly = true;

        document.getElementById("47").checked = 1;
        document.getElementById("48").value = "NA";

        document.getElementById("campo48").selectedIndex = 3;

        document.getElementById("49").checked = 1;
        document.getElementById("50").value = "NA";

        document.getElementById("campo50").selectedIndex = 2;

        document.getElementById("campo51").value = "NA";
        document.getElementById("campo51").readOnly = true;

        document.getElementById("52").checked = 1;
        document.getElementById("53").value = "NA";

        document.getElementById("campo53").selectedIndex = 2;

        document.getElementById("54").checked = 1;
        document.getElementById("55").value = "No cuenta con Sistema Informático en Farmacia";

        document.getElementById("55_").checked = 1;
        document.getElementById("56").value = "No genera reportes";

        document.getElementById("campo56").selectedIndex = 2;

        document.getElementById("57").checked = 1;
        document.getElementById("58").value = "No se realiza ninguna validación del origen del paciente";

        document.getElementById("campo58").selectedIndex = 2;

        document.getElementById("campo59").value = "NA";
        document.getElementById("campo59").readOnly = true;

        document.getElementById("campo60").selectedIndex = 2;
        document.getElementById("campo61").selectedIndex = 2;
        document.getElementById("campo62").selectedIndex = 2;
        document.getElementById("campo63").selectedIndex = 8;
        document.getElementById("campo64").selectedIndex = 6;
        document.getElementById("campo65").selectedIndex = 2;

        document.getElementById("campo66").value = "NA";
        document.getElementById("campo66").readOnly = true;

        document.getElementById("67").checked = 1;
        document.getElementById("68").value = "NA";

        document.getElementById("68_").checked = 1;
        document.getElementById("69").value = "No se realiza ninguna acción";

        document.getElementById("campo69").selectedIndex = 1;

        document.getElementById("70").checked = 1;
        document.getElementById("71").value = "No se realiza ninguna acción";

        document.getElementById("campo71").selectedIndex = 2;
        document.getElementById("campo72").selectedIndex = 2;
        document.getElementById("campo73").selectedIndex = 2;
        document.getElementById("campo74").selectedIndex = 0;
        document.getElementById("campo76").selectedIndex = 2;
        document.getElementById("campo78").selectedIndex = 2;
        document.getElementById("campo79").selectedIndex = 2;
        document.getElementById("campo80").selectedIndex = 2;
        document.getElementById("campo81").selectedIndex = 2;

        document.getElementById("campo75").value = "NA";
        document.getElementById("campo75").readOnly = true;
        document.getElementById("campo77").value = "NA";
        document.getElementById("campo77").readOnly = true;
    }
    if (campo === "SI") {
        document.getElementById("campo35").selectedIndex = 0;
        document.getElementById("campo36").selectedIndex = 0;

        document.getElementById("campo37").value = "";
        document.getElementById("campo37").readOnly = false;
        document.getElementById("campo38").value = "";
        document.getElementById("campo38").readOnly = false;

        document.getElementById("campo39").selectedIndex = 0;

        document.getElementById("40").checked = 0;
        document.getElementById("41").value = "";

        document.getElementById("campo41").selectedIndex = 0;

        document.getElementById("42").checked = 0;
        document.getElementById("43").value = "";

        document.getElementById("43_").checked = 0;
        document.getElementById("44").value = "";

        document.getElementById("campo44").selectedIndex = 0;

        document.getElementById("campo45").value = "";

        document.getElementById("campo46").value = "";
        document.getElementById("campo46").readOnly = false;

        document.getElementById("47").checked = 0;
        document.getElementById("48").value = "";

        document.getElementById("campo48").selectedIndex = 0;

        document.getElementById("49").checked = 0;
        document.getElementById("50").value = "";

        document.getElementById("campo50").selectedIndex = 0;

        document.getElementById("campo51").value = "";
        document.getElementById("campo51").readOnly = false;

        document.getElementById("52").checked = 0;
        document.getElementById("53").value = "";

        document.getElementById("campo53").selectedIndex = 0;

        document.getElementById("54").checked = 0;
        document.getElementById("55").value = "";

        document.getElementById("55_").checked = 0;
        document.getElementById("56").value = "";

        document.getElementById("campo56").selectedIndex = 0;

        document.getElementById("57").checked = 0;
        document.getElementById("58").value = "";

        document.getElementById("campo58").selectedIndex = 0;

        document.getElementById("campo59").value = "";
        document.getElementById("campo59").readOnly = false;

        document.getElementById("campo60").selectedIndex = 0;
        document.getElementById("campo61").selectedIndex = 0;
        document.getElementById("campo62").selectedIndex = 0;
        document.getElementById("campo63").selectedIndex = 0;
        document.getElementById("campo64").selectedIndex = 0;
        document.getElementById("campo65").selectedIndex = 0;

        document.getElementById("campo66").value = "";
        document.getElementById("campo66").readOnly = false;

        document.getElementById("67").checked = 0;
        document.getElementById("68").value = "";

        document.getElementById("68_").checked = 0;
        document.getElementById("69").value = "";

        document.getElementById("campo69").selectedIndex = 0;

        document.getElementById("70").checked = 0;
        document.getElementById("71").value = "";

        document.getElementById("campo71").selectedIndex = 0;
        document.getElementById("campo72").selectedIndex = 0;
        document.getElementById("campo73").selectedIndex = 0;
        document.getElementById("campo74").selectedIndex = 0;
        document.getElementById("campo76").selectedIndex = 0;
        document.getElementById("campo78").selectedIndex = 0;
        document.getElementById("campo79").selectedIndex = 0;
        document.getElementById("campo80").selectedIndex = 0;
        document.getElementById("campo81").selectedIndex = 0;

        document.getElementById("campo75").value = "";
        document.getElementById("campo75").readOnly = false;
        document.getElementById("campo77").value = "";
        document.getElementById("campo77").readOnly = false;
    }
}

function servAlmacen() {
    var campo = document.getElementById("campo82").value;
    if (campo === "No") {
        
        document.getElementById("83").checked = 1;
        document.getElementById("84").value = "NA";
        
        document.getElementById("campo84").selectedIndex = 0;
        document.getElementById("campo85").selectedIndex = 0;

        document.getElementById("campo86").value = "NA";
        document.getElementById("campo86").readOnly = true;
        document.getElementById("campo87").value = "NA";
        document.getElementById("campo87").readOnly = true;

        document.getElementById("campo88").selectedIndex = 2;

        document.getElementById("89").checked = 1;
        document.getElementById("90").value = "NA";

        document.getElementById("campo90").selectedIndex = 2;

        document.getElementById("91").checked = 1;
        document.getElementById("92").value = "NA";

        document.getElementById("92_").checked = 1;
        document.getElementById("93").value = "NA";

        document.getElementById("campo93").value = "NA";
        document.getElementById("campo93").readOnly = true;

        document.getElementById("campo94").value = "NA";
        document.getElementById("campo94").readOnly = true;

        document.getElementById("95_").checked = 1;
        document.getElementById("96").value = "NA";

        document.getElementById("campo96").selectedIndex = 2;
        document.getElementById("campo97").selectedIndex = 2;

        document.getElementById("campo98").value = "NA";
        document.getElementById("campo98").readOnly = true;

        document.getElementById("campo98").selectedIndex = 2;
        document.getElementById("campo99").selectedIndex = 3;

        document.getElementById("100").checked = 1;
        document.getElementById("101").value = "NA";

        document.getElementById("campo101").selectedIndex = 2;

        document.getElementById("campo102").value = "NA";
        document.getElementById("campo102").readOnly = true;

        document.getElementById("103").checked = 1;
        document.getElementById("104").value = "NA";

        document.getElementById("campo104").selectedIndex = 2;

        document.getElementById("105").checked = 1;
        document.getElementById("106").value = "No cuenta con Sistema Informático en Almacén";

        document.getElementById("106_").checked = 1;
        document.getElementById("107").value = "No genera reportes";

        document.getElementById("campo107").selectedIndex = 2;

        document.getElementById("campo108").value = "NA";
        document.getElementById("campo108").readOnly = true;

        document.getElementById("campo109").selectedIndex = 2;
        document.getElementById("campo110").selectedIndex = 8;
        document.getElementById("campo111").selectedIndex = 6;
        document.getElementById("campo112").selectedIndex = 2;

        document.getElementById("campo113").value = "NA";
        document.getElementById("campo113").readOnly = true;

        document.getElementById("114").checked = 1;
        document.getElementById("115").value = "NA";

        document.getElementById("campo115").selectedIndex = 2;

        document.getElementById("116").checked = 1;
        document.getElementById("117").value = "No se realiza ninguna acción";

        document.getElementById("campo117").selectedIndex = 1;

        document.getElementById("118").checked = 1;
        document.getElementById("119").value = "No se realiza ninguna acción";

        document.getElementById("campo119").selectedIndex = 2;
        document.getElementById("campo120").selectedIndex = 2;
        document.getElementById("campo121").selectedIndex = 2;
        document.getElementById("campo122").selectedIndex = 0;
        document.getElementById("campo124").selectedIndex = 2;
        document.getElementById("campo126").selectedIndex = 2;
        document.getElementById("campo127").selectedIndex = 2;
        document.getElementById("campo128").selectedIndex = 2;
        document.getElementById("campo129").selectedIndex = 2;

        document.getElementById("campo123").value = "NA";
        document.getElementById("campo123").readOnly = true;
        document.getElementById("campo125").value = "NA";
        document.getElementById("campo125").readOnly = true;
    }
    if (campo === "Si") {
        document.getElementById("83").checked = 0;
        document.getElementById("84").value = "";
        
        document.getElementById("campo84").selectedIndex = 0;
        document.getElementById("campo85").selectedIndex = 0;

        document.getElementById("campo86").value = "";
        document.getElementById("campo86").readOnly = false;
        document.getElementById("campo87").value = "";
        document.getElementById("campo87").readOnly = false;

        document.getElementById("campo88").selectedIndex = 0;

        document.getElementById("89").checked = 0;
        document.getElementById("90").value = "";

        document.getElementById("campo90").selectedIndex = 0;

        document.getElementById("91").checked = 0;
        document.getElementById("92").value = "";

        document.getElementById("92_").checked = 0;
        document.getElementById("93").value = "";

        document.getElementById("campo93").value = "";
        document.getElementById("campo93").readOnly = false;

        document.getElementById("campo94").value = "";
        document.getElementById("campo94").readOnly = false;

        document.getElementById("95_").checked = 0;
        document.getElementById("96").value = "";

        document.getElementById("campo96").selectedIndex = 0;
        document.getElementById("campo97").selectedIndex = 0;

        document.getElementById("campo97").value = "";
        document.getElementById("campo97").readOnly = false;

        document.getElementById("campo98").value = "";
        document.getElementById("campo98").readOnly = false;
        
        document.getElementById("campo99").selectedIndex = 0;

        document.getElementById("100").checked = 0;
        document.getElementById("101").value = "";

        document.getElementById("campo101").selectedIndex = 0;

        document.getElementById("campo102").value = "";
        document.getElementById("campo102").readOnly = false;

        document.getElementById("103").checked = 0;
        document.getElementById("104").value = "";

        document.getElementById("campo104").selectedIndex = 0;

        document.getElementById("105").checked = 0;
        document.getElementById("106").value = "";

        document.getElementById("106_").checked = 0;
        document.getElementById("107").value = "";

        document.getElementById("campo107").selectedIndex = 0;

        document.getElementById("campo108").value = "";
        document.getElementById("campo108").readOnly = false;

        document.getElementById("campo109").selectedIndex = 0;
        document.getElementById("campo110").selectedIndex = 0;
        document.getElementById("campo111").selectedIndex = 0;
        document.getElementById("campo112").selectedIndex = 0;

        document.getElementById("campo113").value = "";
        document.getElementById("campo113").readOnly = false;

        document.getElementById("114").checked = 0;
        document.getElementById("115").value = "";

        document.getElementById("campo115").selectedIndex = 0;

        document.getElementById("116").checked = 0;
        document.getElementById("117").value = "";

        document.getElementById("campo117").selectedIndex = 0;

        document.getElementById("118").checked = 0;
        document.getElementById("119").value = "";

        document.getElementById("campo119").selectedIndex = 0;
        document.getElementById("campo120").selectedIndex = 0;
        document.getElementById("campo121").selectedIndex = 0;
        document.getElementById("campo122").selectedIndex = 0;
        document.getElementById("campo124").selectedIndex = 0;
        document.getElementById("campo126").selectedIndex = 0;
        document.getElementById("campo127").selectedIndex = 0;
        document.getElementById("campo128").selectedIndex = 0;
        document.getElementById("campo129").selectedIndex = 0;

        document.getElementById("campo123").value = "";
        document.getElementById("campo123").readOnly = false;
        document.getElementById("campo125").value = "";
        document.getElementById("campo125").readOnly = false;
    }
}



function tabular(e, obj)
{
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla !== 13)
        return;
    frm = obj.form;
    for (i = 0; i < frm.elements.length; i++)
        if (frm.elements[i] === obj)
        {
            if (i === frm.elements.length - 1)
                i = -1;
            break
        }
    /*ACA ESTA EL CAMBIO*/
    if (frm.elements[i + 1].readOnly === true)
        tabular(e, frm.elements[i + 1]);
    else
        frm.elements[i + 1].focus();
    return false;
}




var otro = 0;
function LP_data() {
    var key = window.event.keyCode;//codigo de tecla. 
    if (key < 48 || key > 57) {//si no es numero 
        window.event.keyCode = 0;//anula la entrada de texto. 
    }
}
function anade(esto) {
    if (esto.value.length === 0) {
        if (esto.value.length === 0) {
            esto.value += "(";
        }
    }
    if (esto.value.length > otro) {
        if (esto.value.length === 4) {
            esto.value += ") ";
        }
    }
    if (esto.value.length > otro) {
        if (esto.value.length === 9) {
            esto.value += "-";
        }
    }
    if (esto.value.length < otro) {
        if (esto.value.length === 4 || esto.value.length === 9) {
            esto.value = esto.value.substring(0, esto.value.length - 1);
        }
    }
    otro = esto.value.length
}
