# run from armor/modifiers/type/trade/spawn_attempt
# @s = trader marker
# at @s

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_evolved:temp tag.gm4_combat_evolved.active set value 1

# store current day in data
execute store result storage gm4_combat_evolved:temp tag.gm4_combat_evolved.day int 1 run scoreboard players get $day gm4_ce_data

# spawn trader
summon wandering_trader ~ ~ ~ {ActiveEffects:[{Id:24b,Amplifier:0b,Duration:50}]}
playsound entity.wandering_trader.reappeared neutral @a ~ ~ ~ 1 1
kill @s

# use lib_lore to darken the 'Spawn Trader' text
data modify storage gm4_lore:temp Source set from storage gm4_combat_evolved:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Spawn Trader"},{"translate":"item.gm4_combat_evolved.armor.lore.trade"}]}'
data modify storage gm4_lore:temp Input set value ['{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Spawn Trader"},{"translate":"item.gm4_combat_evolved.armor.lore.trade"}]}']
function #gm4_lore:replace
data modify storage gm4_combat_evolved:temp tag.display.Lore set from storage gm4_lore:temp Source