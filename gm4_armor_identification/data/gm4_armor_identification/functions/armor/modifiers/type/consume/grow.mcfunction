# run from armor/check_modifier
# @s = player to consume power

# get data
execute store result score $level gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.level
execute store result score $cap gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.cap
execute store result score $step gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.step

# increase level and check to cap
scoreboard players operation $level gm4_ai_data += $step gm4_ai_data
execute store result storage gm4_armor_identification:temp tag.gm4_armor_identification.level int 1 run scoreboard players get $level gm4_ai_data
execute if score $level gm4_ai_data >= $cap gm4_ai_data at @s run function gm4_armor_identification:armor/modifiers/type/consume/satiated

# increase attribute to new level
execute store result storage gm4_armor_identification:temp tag.AttributeModifiers[{Name:"gm4_armor_identification"}].Amount float 0.01 run scoreboard players get $level gm4_ai_data

# put changes on armor piece
scoreboard players set $change gm4_ai_data 1

# sounds
execute at @s run playsound minecraft:entity.vex.ambient player @s ~ ~ ~ 0.8 0.5
