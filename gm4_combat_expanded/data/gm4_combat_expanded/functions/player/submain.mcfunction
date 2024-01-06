# process anything player related
# @s = unspecified
# at unspecified
# scheduled from main (8t)

# process players
execute as @a[gamemode=!spectator] run function gm4_combat_expanded:player/process

# timers
scoreboard players remove @a[scores={gm4_ce_t_hurt=1..}] gm4_ce_t_hurt 1
scoreboard players remove @a[scores={gm4_ce_t_shield=1..}] gm4_ce_t_shield 1
scoreboard players remove @a[scores={gm4_ce_t_guard=1..}] gm4_ce_t_guard 1
scoreboard players remove @a[scores={gm4_ce_t_wolf=1..}] gm4_ce_t_wolf 1
scoreboard players remove @a[scores={gm4_ce_t_kill=1..}] gm4_ce_t_kill 1
scoreboard players remove @a[scores={gm4_ce_t_soothe=1..}] gm4_ce_t_soothe 1
scoreboard players remove @a[scores={gm4_ce_t_reactive=1..}] gm4_ce_t_reactive 1
scoreboard players remove @a[scores={gm4_ce_natural_regen_damage=1..}] gm4_ce_natural_regen_damage 1

# reset scoreboards
scoreboard players reset @a gm4_ce_hurt
scoreboard players reset @a gm4_ce_hurt2
scoreboard players reset @a gm4_ce_kill
scoreboard players reset @a gm4_ce_sprinting
scoreboard players reset @a gm4_ce_swimming
