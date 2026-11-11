function add_item(e)
	local player = game.players[e.player_index]
	local chest = player.surface.create_entity({name="bot-train-power-start-chest", 
		position={0,0},
	    force=player.force})

    chest.set_infinity_container_filter(1,{name="rail", count=101, mode="exactly"})	                                
    
    chest.set_infinity_container_filter(2,{name="rail-signal", count=51, mode="exactly"})		                                
    chest.set_infinity_container_filter(3,{name="rail-chain-signal", count=51, mode="exactly"})
    chest.set_infinity_container_filter(4,{name="train-stop", count=11, mode="exactly"})
    chest.set_infinity_container_filter(5,{name="locomotive", count=6, mode="exactly"})
    chest.set_infinity_container_filter(6,{name="cargo-wagon", count=6, mode="exactly"})
    chest.set_infinity_container_filter(7,{name="fluid-wagon", count=6, mode="exactly"})
    chest.set_infinity_container_filter(8,{name="pump", count=51, mode="exactly"})
    

    chest.set_infinity_container_filter(9,{name="roboport", count=11, mode="exactly"})
    chest.set_infinity_container_filter(10,{name="logistic-robot", count=51, mode="exactly"})
    chest.set_infinity_container_filter(11,{name="construction-robot", count=51, mode="exactly"})

    -- overwrite to use py bots if they exist
    local call_result, value = pcall(
        function(chest)
            chest.set_infinity_container_filter(9,{name="py-roboport-mk01", count=11, mode="exactly"})
            chest.set_infinity_container_filter(10,{name="py-logistic-robot-mk01", count=51, mode="exactly"})
            chest.set_infinity_container_filter(11,{name="py-construction-robot-mk01", count=51, mode="exactly"})
        end, chest)

    chest.set_infinity_container_filter(12,{name="active-provider-chest", count=51, mode="exactly"})
    chest.set_infinity_container_filter(13,{name="passive-provider-chest", count=51, mode="exactly"})
    chest.set_infinity_container_filter(14,{name="requester-chest", count=51, mode="exactly"})
    chest.set_infinity_container_filter(15,{name="storage-chest", count=51, mode="exactly"})
    chest.set_infinity_container_filter(16,{name="buffer-chest", count=51, mode="exactly"})
    
    chest.set_infinity_container_filter(17,{name="substation", count=51, mode="exactly"})

    chest.set_infinity_container_filter(18,{name="arithmetic-combinator", count=51, mode="exactly"})
    chest.set_infinity_container_filter(19,{name="decider-combinator", count=51, mode="exactly"})
    chest.set_infinity_container_filter(20,{name="selector-combinator", count=51, mode="exactly"})
    chest.set_infinity_container_filter(21,{name="constant-combinator", count=51, mode="exactly"})


    local call_result, value = pcall(
        function(chest)
            chest.set_infinity_container_filter(22,{name="rail-support", count=21, mode="exactly"})  
            chest.set_infinity_container_filter(23,{name="rail-ramp", count=11, mode="exactly"})
        end, chest)

    -- elevated rails do not exist, add more normal rails instead
    -- must always fill up all 46 slots of the chest otherwise bots will use it for other stuff
    if not call_result then
        chest.set_infinity_container_filter(1,{name="rail", count=501, mode="exactly"})
    end

end

function add_item_in_freeplay(e)
	if remote.interfaces["freeplay"] then
		add_item(e)
	end
end

script.on_event(defines.events.on_player_created, add_item)
script.on_event(defines.events.on_cutscene_cancelled, add_item_in_freeplay)
