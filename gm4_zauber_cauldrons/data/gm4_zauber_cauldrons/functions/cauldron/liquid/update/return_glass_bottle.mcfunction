# returns an empty bottle to a player who has tried to fill up a bottle from a custom liquid zauber cauldron
# @s = player who has interacted with the zauber cauldron
# at position of cauldron, align xyz
# run from gm4_zauber_cauldrons:cauldron/liquid/update/<level>/item_used/

execute store success score $found_hand gm4_zc_data if predicate gm4_zauber_cauldrons:player/equipment/water_bottle/in_mainhand run item replace entity @s weapon.mainhand with minecraft:glass_bottle
execute unless score $found_hand gm4_zc_data matches 1.. if predicate gm4_zauber_cauldrons:player/equipment/water_bottle/in_offhand run item replace entity @s weapon.offhand with minecraft:glass_bottle

# reset fake player and prevent bottle fill sound
stopsound @s block minecraft:item.bottle.fill
scoreboard players reset $found_hand gm4_zc_data
