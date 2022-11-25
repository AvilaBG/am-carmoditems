local Translations = {
    error = {
        needvehicle = "Debes estar en un vehículo para ver su información.",
        alreadyinstalled = "El vehìculo ya tiene una pieza igual instalada.",
        nosupport = "El vehículo no soporta esta pieza.",
        wrong = "Algo salio mal...",
        farfromvehicle = "¡Está demasiado lejos del vehículo!",
        insidevehicle = "¡No puedes instalar esta pieza desde el interior del vehículo!",
        installcancel = "¡Se cancelo la instalación!",
    },
    text = {
        installing = "Instalando ",
        modlabelunknown = "Desconocido",
        modlabelengine = "Motor",
        modlabelbrakes = "Frenos",
        modlabeltransmision = "Transmision",
        modlabelsuspension = "Suspensión",
        modlabelarmor = "Blindaje",
        modlabelturbo = "Turbo",
        typenotmodified = "Sin modificar",
        typeclassD = "Clase D",
        typeclassC = "Clase C",
        typeclassB = "Clase B",
        typeclassA = "Clase A",
        typeclassS = "Clase S",
        armor1 = "20 %",
        armor2 = "40 %",
        armor3 = "60 %",
        armor4 = "80 %",
        armor5 = "100 %",
        modinstalled = "Instalado",
        modnotinstalled = "No instalado",
        description = "Ver información sobre el vehículo",
        recoverpart = "Has retirado la pieza anterior.",
        installed = "¡Instalación exitosa!",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})