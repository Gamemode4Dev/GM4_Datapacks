# @s = player that consumed any multi_use_bottle 1 tick ago that had at least 2 sips remaining
# at @s
# run from player/multi_use_bottle/cache/load

# call utility function to remove one sip and store resulting item into yellow shulker box (gamemode 4 lib_forceload standard)
function gm4_zauber_cauldrons:soulution/use_sip

# return modified items to player inventory, depending on offhand or mainhand use
execute if entity @s[tag=gm4_zc_used_mainhand] if predicate gm4_zauber_cauldrons:player/equipment/glass_bottle/in_mainhand in overworld run loot replace entity @s weapon.mainhand 1 mine 29999998 1 7134 minecraft:stick[custom_data={drop_contents:1b}]
execute if entity @s[tag=gm4_zc_used_offhand] if predicate gm4_zauber_cauldrons:player/equipment/glass_bottle/in_offhand in overworld run loot replace entity @s weapon.offhand 1 mine 29999998 1 7134 minecraft:stick[custom_data={drop_contents:1b}]
