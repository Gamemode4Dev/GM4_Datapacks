# process anything player related
# @s = unspecified
# at unspecified
# scheduled from main (8t)

# check natural regeneration
execute unless score $natural_regen gm4_ce_data matches -1 store result score $natural_regen gm4_ce_data run gamerule naturalRegeneration

# process players
execute as @a[gamemode=!spectator] run function gm4_ce_base:clocks/player_process

# timers
scoreboard players remove @a[scores={gm4_ce_natural_regen_damage=1..}] gm4_ce_natural_regen_damage 1
scoreboard players remove @a[scores={gm4_ce_pvp_timer=1..}] gm4_ce_pvp_timer 1

# reset scoreboards
scoreboard players reset @a gm4_ce_hurt
scoreboard players reset @a gm4_ce_kill
scoreboard players reset @a gm4_ce_kill2
scoreboard players reset @a gm4_ce_sprinting
scoreboard players reset @a gm4_ce_swimming

