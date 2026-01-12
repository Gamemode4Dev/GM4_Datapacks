# deal damage to hit player
# @s = player hit by laser
# at near @s
# run from mob/process/elite/pearlescent/laser_raycast

scoreboard players set $attack_hit gm4_mu_data 1
scoreboard players set $laser_limit gm4_mu_data 0

execute store result score $showDeathMessages gm4_mu_data run gamerule show_death_messages
gamerule show_death_messages false
damage @s 1.0 in_fire
tag @s add gm4_mu_self
execute if score $showDeathMessages gm4_mu_data matches 1 at @s unless entity @e[type=player,tag=gm4_mu_self,distance=..0.1,limit=1] run tellraw @a ["",{"translate":"text.gm4.monsters_unbound.death.pearlescent_elite_laser","fallback":"%s was seen by %s",with:[{"selector":"@s"},{"selector":"@e[type=#gm4_monsters_unbound:elite_types,tag=gm4_mu_elite.pearlescent,distance=..32,limit=1]"}]}]
tag @s remove gm4_mu_self
execute if score $showDeathMessages gm4_mu_data matches 1 run gamerule show_death_messages true
