# process a player that took damage (after damage is processed)
# @s = damaged player
# at @s
# run from base survival_refightalized module, from function player/health/damaged/run

# set the player to be in combat for ~5 seconds
scoreboard players set @s[advancements={gm4_survival_refightalized:damaged={combat_damage=true}}] gm4_aa_in_combat_timer 7
