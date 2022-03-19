# run from main
# @s = player that was guarded
# at @s

# limit damage to 2 hearts
execute if score @s gm4_ce_guarded matches 41.. run scoreboard players set @s gm4_ce_guarded 40

# translate damage resisted to nearest guarder (not self)
scoreboard players operation @p[tag=gm4_ce_guardian,distance=0.01..] gm4_ce_guard += @s gm4_ce_guarded
tag @s remove gm4_ce_guarded
