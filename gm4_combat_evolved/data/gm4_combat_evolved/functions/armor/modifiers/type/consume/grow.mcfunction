# increase the damage bonus on the consuming armor
# @s = player to consume power
# run from armor/check_modifier

# get data
execute store result score $level gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level
execute store result score $cap gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.cap
execute store result score $step gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.step

# increase level and check to cap
scoreboard players operation $level gm4_ce_data += $step gm4_ce_data
execute store result storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level int 1 run scoreboard players get $level gm4_ce_data
execute if score $level gm4_ce_data >= $cap gm4_ce_data at @s run function gm4_combat_evolved:armor/modifiers/type/consume/satiated

# increase attribute to new level
execute store result storage gm4_combat_evolved:temp tag.AttributeModifiers[{Name:"gm4_combat_evolved"}].Amount float 0.01 run scoreboard players get $level gm4_ce_data

# put changes on armor piece
scoreboard players set $change gm4_ce_data 1

# sounds
execute at @s run playsound minecraft:entity.vex.ambient player @s ~ ~ ~ 0.8 0.5
