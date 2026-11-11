local chest = data.raw["infinity-container"]["bot-train-power-start-chest"]
if chest then
    chest.logistic_mode = "storage"
    chest.max_logistic_slots = 1
    chest.logistic_slots_count = nil
end
