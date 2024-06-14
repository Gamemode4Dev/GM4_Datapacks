# returns an empty bucket to a player who has tried to fill up a bucket from a custom liquid zauber cauldron
# @s = player who has interacted with the zauber cauldron
# at position of cauldron, align xyz
# run from gm4_zauber_cauldrons:cauldron/liquid/update/<level>/item_used/

execute store success score $found_hand gm4_zc_data if predicate gm4_zauber_cauldrons:player/equipment/water_bucket/in_mainhand run item replace entity @s weapon.mainhand with minecraft:bucket
execute unless score $found_hand gm4_zc_data matches 1.. if predicate gm4_zauber_cauldrons:player/equipment/water_bucket/in_offhand run item replace entity @s weapon.offhand with minecraft:bucket

# reset fake player and prevent bucket fill sound
stopsound @s block minecraft:item.bucket.fill
scoreboard players reset $found_hand gm4_zc_data
