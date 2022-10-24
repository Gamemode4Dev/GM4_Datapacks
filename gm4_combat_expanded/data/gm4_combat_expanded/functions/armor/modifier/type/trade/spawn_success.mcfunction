# summon the wandering trader if a good location is found
# @s = trader marker
# at @s
# run from armor/modifier/type/trade/spawn_attempt

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 1

# store current day in data
execute store result storage gm4_combat_expanded:temp tag.gm4_combat_expanded.day int 1 run scoreboard players get $day gm4_ce_data

# spawn trader
summon wandering_trader ~ ~ ~ {DespawnDelay:48000,ActiveEffects:[{Id:14,Amplifier:0b,Duration:5000}]}
execute as @a[distance=..12] at @s run playsound entity.wandering_trader.yes neutral @s ~ ~ ~

# use lib_lore to darken the 'Trade' text
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Trade"},{"translate":"item.gm4.combat_expanded.lore.trade"}]}'
data modify storage gm4_lore:temp Input set value ['{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Trade"},{"translate":"item.gm4.combat_expanded.lore.trade"}]}']
function #gm4_lore:replace
data modify storage gm4_combat_expanded:temp tag.display.Lore set from storage gm4_lore:temp Source
