# apply fear to hit player
# @s = player that was hit
# at @s
# run from mob/process/elite/vorpal/process_fear_cloud

scoreboard players set $player_hit gm4_mu_data 1

execute store result score $fear_seconds gm4_mu_data run random value 10..16
function gm4_monsters_unbound:effect/fear/apply
