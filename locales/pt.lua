local Translations = {
    error = {
        needvehicle = "Você deve estar em um veículo para visualizar suas informações.",
        alreadyinstalled = "O veículo já possui uma peça semelhante instalada.",
        nosupport = "O veículo não suporta esta peça.",
        wrong = "Algo deu errado...",
        farfromvehicle = "Você está muito longe do veículo!",
        insidevehicle = "Você não pode instalar esta peça de dentro do veículo!",
        installcancel = "Instalação abortada!",
    },
    text = {
        installing = "Instalando ",
        modlabelunknown = "Desconhecido",
        modlabelengine = "Motor",
        modlabelbrakes = "Freios",
        modlabeltransmision = "Transmissão",
        modlabelsuspension = "Suspensão",
        modlabelarmor = "Blindagem",
        modlabelturbo = "Turbo",
        typenotmodified = "Não modificado",
        typeclassD = "Classe D",
        typeclassC = "Classe C",
        typeclassB = "Classe B",
        typeclassA = "Classe A",
        typeclassS = "Classe S",
        armor1 = "20 %",
        armor2 = "40 %",
        armor3 = "60 %",
        armor4 = "80 %",
        armor5 = "100 %",
        modinstalled = "Instalado",
        modnotinstalled = "Não instalado",
        description = "Ver informações do veículo",
        recoverpart = "Você removeu a peça anterior.",
        installed = "Instalação bem sucedida!",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})