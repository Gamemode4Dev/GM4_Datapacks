#@s = item that needs additional data
#run from reel_in/reel_loot

execute if entity @s[nbt={Item:{tag:{gm4_end_fishing:{set_data:{type:"lore"}}}}}] run function gm4_end_fishing:reel_in/set_lore
execute if entity @s[nbt={Item:{tag:{gm4_end_fishing:{set_data:{type:"entity"}}}}}] run function gm4_end_fishing:reel_in/summon_entity
