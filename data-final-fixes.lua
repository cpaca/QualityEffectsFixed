local function apply_qef_to_type(prototype_name)
    for name, obj in pairs(data.raw[prototype_name]) do
        if obj["qef_ignore"] then
            goto continue
        end

        if obj["allowed_effects"] ~= nil and table_size(obj["allowed_effects"]) == 0 then
            -- Not sure if I want to change this in 1.2.0, possibly by adding a setting to force override this.
            goto continue
        end

        data.raw[prototype_name][name]["quality_affects_module_slots"] = true

        ::continue::
    end
end

if settings.startup["qef-affects-assembling-machines"].value then
    apply_qef_to_type("assembling-machine")
end

if settings.startup["qef-affects-furnaces"].value then
    apply_qef_to_type("furnace")
end

if settings.startup["qef-affects-rocket-silos"].value then
    apply_qef_to_type("rocket-silo")
end

if settings.startup["qef-affects-beacons"].value then
    apply_qef_to_type("beacon")
end

if settings.startup["qef-affects-mining-drills"].value then
    apply_qef_to_type("mining-drill")
end

if settings.startup["qef-affects-labs"].value then
    apply_qef_to_type("lab")
end