local Translations = {
    error = {
        needvehicle = "You must be in a vehicle to view the information.",
        alreadyinstalled = "The vehicle already has a similar part installed.",
        nosupport = "The vehicle does not support this part.",
        wrong = "Something went wrong...",
        farfromvehicle = "You are too far from the vehicle!",
        insidevehicle = "You cannot install this part from inside the vehicle!",
        installcancel = "Installation aborted!",
    },
    text = {
        installing = "Installing ",
        modlabelunknown = "Unknown",
        modlabelengine = "Engine",
        modlabelbrakes = "Brakes",
        modlabeltransmision = "Transmission",
        modlabelsuspension = "Suspension",
        modlabelarmor = "Armor",
        modlabelturbo = "Turbo",
        typenotmodified = "Unmodified",
        typeclassD = "Class D",
        typeclassC = "Class C",
        typeclassB = "Class B",
        typeclassA = "Class A",
        typeclassS = "Class S",
        armor1 = "20 %",
        armor2 = "40 %",
        armor3 = "60 %",
        armor4 = "80 %",
        armor5 = "100 %",
        modinstalled = "Installed",
        modnotinstalled = "Not installed",
        description = "View vehicle information",
        recoverpart = "You have removed the previous piece.",
        installed = "Installation successful!",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})