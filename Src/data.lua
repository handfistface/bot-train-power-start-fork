local infinity_buffer_chest = util.table.deepcopy(data.raw["infinity-container"]["infinity-chest"])

infinity_buffer_chest.name = "bot-train-power-start-chest"
infinity_buffer_chest.logistic_mode = "storage"
infinity_buffer_chest.minable = nil
infinity_buffer_chest.inventory_size = 46
infinity_buffer_chest.max_logistics_slots = 1
infinity_buffer_chest.logistic_slots_count = nil
infinity_buffer_chest.gui_mode = "none"

local infinity_buffer_chest_item = util.table.deepcopy(data.raw.item["infinity-chest"])
infinity_buffer_chest_item.name = "bot-train-power-start-chest-item"
infinity_buffer_chest_item.place_result = "bot-train-power-start-chest"

data:extend({infinity_buffer_chest, infinity_buffer_chest_item})
