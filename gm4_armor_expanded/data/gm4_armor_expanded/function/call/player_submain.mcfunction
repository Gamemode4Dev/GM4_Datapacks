# process anything player related
# @s = unspecified
# at unspecified
# run from base combat_expanded module, from function clocks/player_submain

# prep sword_ring armor
scoreboard players reset @a gm4_ae_sword_ring

# prep link armor
scoreboard players set $link.calc_max_health gm4_ae_data 1
tag @a remove gm4_ae_linked
scoreboard players reset @a gm4_ae_link_id

# linked armor after player processing
tag @a[tag=!gm4_ae_linked] remove gm4_ae_was_linked

# apply horse speed effect
execute as @a on vehicle if score @s gm4_ae_horse.speed_level matches 1.. run function gm4_armor_expanded:armor/modifier/type/horse/apply_effect

# timers
scoreboard players remove @a[scores={gm4_ae_t_shield=1..}] gm4_ae_t_shield 1
scoreboard players remove @a[scores={gm4_ae_t_wolf=1..}] gm4_ae_t_wolf 1
scoreboard players remove @a[scores={gm4_ae_t_soothe=1..}] gm4_ae_t_soothe 1
scoreboard players remove @a[scores={gm4_ae_t_reactive=1..}] gm4_ae_t_reactive 1
scoreboard players remove @a[scores={gm4_ae_pvp_timer=1..}] gm4_ae_pvp_timer 1

# reset scoreboards
scoreboard players reset @a gm4_ae_hurt
scoreboard players reset @a gm4_ae_kill
scoreboard players reset @a gm4_ae_kill2
scoreboard players reset @a gm4_ae_sprinting
scoreboard players reset @a gm4_ae_swimming
