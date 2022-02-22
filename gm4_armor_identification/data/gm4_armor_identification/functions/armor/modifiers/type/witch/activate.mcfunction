# run from armor/modifiers/type/witch/check
# @s = player wearing witch armour
# at @s

# mark for change and store piece cooldown (60sec) in data
scoreboard players set $change gm4_ai_data 1
data modify storage gm4_armor_identification:temp tag.gm4_armor_identification.cooldown set value 75

# release potion
summon potion ~ ~-0.1 ~ {Motion:[0.0,0.1,0.0],Tags:["gm4_ai_witch_potion"],Item:{id:"minecraft:lingering_potion",Count:1b,tag:{Potion:"minecraft:water"}}}
data modify entity @e[type=potion,tag=gm4_ai_witch_potion,limit=1,sort=nearest] Item.tag.CustomPotionEffects set from entity @s ActiveEffects

# use lib_lore to darken the 'Release Potion' text
data modify storage gm4_lore:temp Source set from storage gm4_armor_identification:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Release Potion"},{"translate":"item.gm4.mob_buff.armor.lore.witch"}]}'
data modify storage gm4_lore:temp Input set value ['{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Release Potion"},{"translate":"item.gm4.mob_buff.armor.lore.witch"}]}']
function #gm4_lore:replace
data modify storage gm4_armor_identification:temp tag.display.Lore set from storage gm4_lore:temp Source

# set cooldown (5 sec) before another piece can activate
scoreboard players set @s gm4_ai_t_witch 4
