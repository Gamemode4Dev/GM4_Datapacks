# process anything player related
# @s = unspecified
# at unspecified
# scheduled from main (8t)

# prep sword_ring armor
scoreboard players reset @a gm4_ce_sword_ring

# check natural regeneation
execute unless score $natural_regen gm4_ce_data matches -1 store result score $natural_regen gm4_ce_data run gamerule naturalRegeneration

# prep link armor
scoreboard players set $link.calc_max_health gm4_ce_data 1
tag @a remove gm4_ce_linked
scoreboard players reset @a gm4_ce_link_id

# process players
execute as @a[gamemode=!spectator] run function gm4_combat_expanded:player/process

# linked armor after player processing
tag @a[tag=!gm4_ce_linked] remove gm4_ce_was_linked

# apply horse speed effect
execute as @a on vehicle if score @s gm4_ce_horse.speed_level matches 1.. run function gm4_combat_expanded:armor/modifier/type/horse/apply_effect

# timers
scoreboard players remove @a[scores={gm4_ce_t_shield=1..}] gm4_ce_t_shield 1
scoreboard players remove @a[scores={gm4_ce_t_wolf=1..}] gm4_ce_t_wolf 1
scoreboard players remove @a[scores={gm4_ce_t_soothe=1..}] gm4_ce_t_soothe 1
scoreboard players remove @a[scores={gm4_ce_t_reactive=1..}] gm4_ce_t_reactive 1
scoreboard players remove @a[scores={gm4_ce_natural_regen_damage=1..}] gm4_ce_natural_regen_damage 1
scoreboard players remove @a[scores={gm4_ce_pvp_timer=1..}] gm4_ce_pvp_timer 1

# reset scoreboards
scoreboard players reset @a gm4_ce_hurt
scoreboard players reset @a gm4_ce_kill
scoreboard players reset @a gm4_ce_kill2
scoreboard players reset @a gm4_ce_sprinting
scoreboard players reset @a gm4_ce_swimming
