# run from armor/active/guardian/process
# @s = player guarding
# at @s

# tag self for easy finding
tag @s add gm4_ai_guardian

# set new players
execute as @a[gamemode=!spectator,gamemode=!creative,tag=!gm4_ai_guarded,distance=0.01..12] run function gm4_armor_identification:armor/modifiers/type/guardian/guard_start

# cooldown
scoreboard players set @s gm4_ai_t_guard 1
