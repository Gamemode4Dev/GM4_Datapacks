# process anything player related
# @s = unspecified
# at unspecified
# scheduled from main (8t)

# check natural regeneation
execute unless score $natural_regen gm4_ce_data matches -1 store result score $natural_regen gm4_ce_data run gamerule naturalRegeneration

# | Armor Expanded (expansion pack, run from here to keep in sync)
execute if score combat_expanded_armor gm4_modules matches 1 run function gm4_combat_expanded_armor:call/player_submain

# process players
execute as @a[gamemode=!spectator] run function gm4_combat_expanded:player/process

# timers
scoreboard players remove @a[scores={gm4_ce_combat_regen_timer=1..}] gm4_ce_combat_regen_timer 1
scoreboard players remove @a[scores={gm4_ce_fast_regen_timer=1..}] gm4_ce_fast_regen_timer 1

# reset scoreboards
scoreboard players reset @a gm4_ce_hurt
scoreboard players reset @a gm4_ce_kill
scoreboard players reset @a gm4_ce_kill2
scoreboard players reset @a gm4_ce_sprinting
scoreboard players reset @a gm4_ce_swimming
