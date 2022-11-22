window.addEventListener("message", (event) => {
    if(event.data.type == 'show'){
        const data = event.data;
        SetInformation(data);
        $('#nui').removeClass('hidden');
    }
    if(event.data.type == 'hide'){
        $('#nui').addClass('hidden');
    }
})

function SetInformation(info){
    SetVehicleInfo(info.vehname, info.vehplate, info.vehclass, info.vehgears);
    SetPerformanceInfo(info.speed, info.acceleration, info.braking, info.traction);
    SetEngineModInfo(info.enginemod, info.engineimg);
    SetBrakesModInfo(info.brakesmod, info.brakesimg);
    SetTransimisonModInfo(info.transmisionmod, info.transmisionimg);
    SetSuspensionModInfo(info.suspensionmod, info.suspensionimg);
    SetTurboModInfo(info.turbomod, info.turboimg);
    SetVehicleTier(info.vehtier);
}

function SetVehicleInfo(vehname, vehplate, vehclass, vehgears){
    $('#vehname').text(vehname);
    $('#vehplate').text(vehplate);
    $('#vehclass').text(vehclass);
    $('#vehgears').text(vehgears);
}

function SetPerformanceInfo(speed, acceleration, braking, traction){
    $('#speed').val(speed);
    $('#acceleration').val(acceleration);
    $('#braking').val(braking);
    $('#traction').val(traction);
}

function SetEngineModInfo(enginemod, engineimg){
    $('#enginemod').text(enginemod);
    $('#engineimg').attr('src', engineimg);
}

function SetBrakesModInfo(brakesmod, brakesimg){
    $('#brakesmod').text(brakesmod);
    $('#brakesimg').attr('src', brakesimg);
}

function SetTransimisonModInfo(transmisionmod, transmisionimg){
    $('#transmisionmod').text(transmisionmod);
    $('#transmisionimg').attr('src', transmisionimg);
}

function SetSuspensionModInfo(suspensionmod, suspensionimg){
    $('#suspensionmod').text(suspensionmod);
    $('#suspensionimg').attr('src', suspensionimg);
}

function SetTurboModInfo(turbomod, turboimg){
    $('#turbomod').text(turbomod);
    $('#turboimg').attr('src', turboimg);
}

function SetVehicleTier(vehtier){
    $('#vehtier').text(vehtier)
}

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESCAPE
            $('#nui').addClass('hidden');
            $.post(`https://${GetParentResourceName()}/closenui`, JSON.stringify({}))
        break;
    }
});