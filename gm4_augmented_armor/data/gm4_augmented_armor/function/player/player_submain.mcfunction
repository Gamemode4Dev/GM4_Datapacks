# process anything player related
# @s = unspecified
# at unspecified
# run from base survival_refightalized module, from function clocks/player_submain

# prep sword_ring armor
scoreboard players reset @a gm4_aa_sword_ring

# prep link armor
scoreboard players set $link.calc_max_health gm4_aa_data 1
tag @a remove gm4_aa_linked
scoreboard players reset @a gm4_aa_link_id

# process players
execute as @a[gamemode=!spectator] run function gm4_augmented_armor:player/process

# linked armor after player processing
tag @a[tag=!gm4_aa_linked] remove gm4_aa_was_linked

# apply horse speed effect
execute as @a on vehicle if score @s gm4_aa_horse.speed_level matches 1.. run function gm4_augmented_armor:armor/modifier/type/horse/apply_effect

# timers
scoreboard players remove @a[scores={gm4_aa_t_shield=1..}] gm4_aa_t_shield 1
scoreboard players remove @a[scores={gm4_aa_t_wolf=1..}] gm4_aa_t_wolf 1
scoreboard players remove @a[scores={gm4_aa_t_soothe=1..}] gm4_aa_t_soothe 1
scoreboard players remove @a[scores={gm4_aa_t_reactive=1..}] gm4_aa_t_reactive 1
scoreboard players remove @a[scores={gm4_aa_pvp_timer=1..}] gm4_aa_pvp_timer 1

# reset scoreboards
scoreboard players reset @a gm4_aa_hurt
scoreboard players reset @a gm4_aa_kill
scoreboard players reset @a gm4_aa_kill2
scoreboard players reset @a gm4_aa_sprinting
scoreboard players reset @a gm4_aa_swimming
