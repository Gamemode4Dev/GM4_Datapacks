# grant ramping move speed and hunger to sprinting player
# @s = player wearing husk armour above 50% health and sprinting
# at unspecified
# run from armor/modifier/check_modifier/equip

# advance sprinting timer (can advance by 1 for every husk armor piece) if player is sprinting
scoreboard players add @s[scores={gm4_ce_sprinting=1..}] gm4_ce_t_sprinting 1

# give effect
execute if score @s gm4_ce_t_sprinting matches 1..9 run effect give @s speed 2 0
execute if score @s gm4_ce_t_sprinting matches 1..9 run effect give @s[tag=!gm4_ce_immune_hunger] hunger 2 0 true

execute if score @s gm4_ce_t_sprinting matches 10..19 run effect give @s speed 2 1
execute if score @s gm4_ce_t_sprinting matches 10..19 run effect give @s[tag=!gm4_ce_immune_hunger] hunger 2 1 true

execute if score @s gm4_ce_t_sprinting matches 20..29 run effect give @s speed 2 2
execute if score @s gm4_ce_t_sprinting matches 20..29 run effect give @s[tag=!gm4_ce_immune_hunger] hunger 2 2 true

execute if score @s gm4_ce_t_sprinting matches 30..39 run effect give @s speed 2 3
execute if score @s gm4_ce_t_sprinting matches 30..39 run effect give @s[tag=!gm4_ce_immune_hunger] hunger 2 3 true

execute if score @s gm4_ce_t_sprinting matches 40.. run effect give @s speed 2 4
execute if score @s gm4_ce_t_sprinting matches 40.. run effect give @s[tag=!gm4_ce_immune_hunger] hunger 2 4 true

# keep effect for a bit after you stop sprinting, refresh this timer when you sprint or swim
scoreboard players reset @s[scores={gm4_ce_sprinting=1..}] gm4_ce_sprinting_timeout
scoreboard players reset @s[scores={gm4_ce_swimming=1..}] gm4_ce_sprinting_timeout
