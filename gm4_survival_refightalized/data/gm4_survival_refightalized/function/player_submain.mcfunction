# process anything player related
# @s = unspecified
# at unspecified
# scheduled from main (8t)

# check natural regeneation
execute unless score $natural_regen gm4_sr_config matches -1 store result score $natural_regen gm4_sr_config run gamerule naturalRegeneration

# process players
execute as @a[gamemode=!spectator] run function gm4_survival_refightalized:player/process

# timers
scoreboard players remove @a[scores={gm4_sr_combat_regen_timer=1..}] gm4_sr_combat_regen_timer 10
scoreboard players remove @a[scores={gm4_sr_fast_regen_timer=1..}] gm4_sr_fast_regen_timer 1

# function tag call for expansions to keep clocks sync'd
function #gm4_survival_refightalized:player_submain
