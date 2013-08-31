function showcar(carType, carPz) {
    switch (carType) {
        <#list clist as car>
            case "${car.c_type}" :
                var caroptions = new Array(${car.plist});
                break;
        </#list>

        default:
            var caroptions = new Array("");
            break;
    }

    carPz.options.length = 0;
    for(var i = 0; i < caroptions.length; i++) {
        carPz.options[i]=new Option(caroptions[i],caroptions[i]);
    }
}

function init_car(pField, carType, cField, carPz) {
    for(var i = 0; i < pField.options.length; i++) {
        if (pField.options[i].value==carType)
        {
            pField.selectedIndex = i;
        }
    }
    showcar(carType, cField);
    for(var i = 0; i < cField.options.length; i++) {
        if (cField.options[i].value==carPz)
        {
            cField.selectedIndex = i;
        }
    }
}
