# run from armor/active/guardian/process
# @s = player guarding
# at @s

# tag self for easy finding
tag @s add gm4_ce_guardian

# set new players
execute as @a[gamemode=!spectator,gamemode=!creative,tag=!gm4_ce_guarded,distance=0.01..12] run function gm4_combat_evolved:armor/modifiers/type/guardian/guard_start

# cooldown
scoreboard players set @s gm4_ce_t_guard 1