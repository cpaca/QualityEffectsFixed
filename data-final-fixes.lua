local function apply_qef_to_type(prototype_name)
    for name, obj in pairs(data.raw[prototype_name]) do
        if obj["qef_ignore"] or obj["qef-ignore"] or obj["qef ignore"] then
            goto continue
        end

        data.raw[name]["quality_affects_module_slots"] = true

        ::continue::
    end
end

if settings.startup["qef-affects-assembling-machines"] then
    apply_qef_to_type("assembling-machine")
end

if settings.startup["qef-affects-furnaces"] then
    apply_qef_to_type("furnace")
end

if settings.startup["qef-affects-silos"] then
    apply_qef_to_type("rocket-silo")
end

if settings.startup["qef-affects-beacons"] then
    apply_qef_to_type("beacon")
end

if settings.startup["qef-affects-mining-drills"] then
    apply_qef_to_type("mining-drill")
end

if settings.startup["qef-affects-labs"] then
    apply_qef_to_type("lab")
end