# drop potion with all of the player's effects at their feet
# @s = player wearing armour
# at @s
# run from armor/modifier/type/witch/check

# mark for change and store piece cooldown (60sec) in data
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.cooldown set value 75

# release potion
summon potion ~ ~-0.1 ~ {Motion:[0.0,0.1,0.0],Tags:["gm4_ce_witch_potion"],Item:{id:"minecraft:lingering_potion",Count:1b,tag:{Potion:"minecraft:water"}}}
data modify entity @e[type=potion,tag=gm4_ce_witch_potion,limit=1,sort=nearest] Item.tag.CustomPotionEffects set from entity @s ActiveEffects

# use lib_lore to darken the 'Discharge' text
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Discharge"},{"translate":"item.gm4.combat_expanded.lore.witch"}]}'
data modify storage gm4_lore:temp Input set value ['{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Discharge"},{"translate":"item.gm4.combat_expanded.lore.witch"}]}']
function #gm4_lore:replace
data modify storage gm4_combat_expanded:temp tag.display.Lore set from storage gm4_lore:temp Source

# set cooldown (5 sec) before another piece can activate
scoreboard players set @s gm4_ce_t_witch 4
