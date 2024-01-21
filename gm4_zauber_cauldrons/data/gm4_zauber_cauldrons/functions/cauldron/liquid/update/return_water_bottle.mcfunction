# returns a water bottle to a player who has tried to fill up a into a custom liquid zauber cauldron
# @s = player who has interacted with the zauber cauldron
# at position of cauldron, align xyz
# run from gm4_zauber_cauldrons:cauldron/liquid/update/<>/item_used/

execute store success score $found_hand gm4_zc_data if predicate gm4_zauber_cauldrons:player/equipment/glass_bottle/in_mainhand run item replace entity @s weapon.mainhand with minecraft:potion{Potion:"minecraft:water"}
execute unless score $found_hand gm4_zc_data matches 1.. if predicate gm4_zauber_cauldrons:player/equipment/glass_bottle/in_offhand run item replace entity @s weapon.offhand with minecraft:potion{Potion:"minecraft:water"}

# reset fake player and prevent bottle empty sound
stopsound @s block minecraft:item.bottle.empty
scoreboard players reset $found_hand gm4_zc_data
