execute unless score monsters_unbound gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Monsters Unbound"}
execute unless score monsters_unbound gm4_earliest_version < monsters_unbound gm4_modules run scoreboard players operation monsters_unbound gm4_earliest_version = monsters_unbound gm4_modules
scoreboard players set monsters_unbound gm4_modules 1

# scoreboards
scoreboard objectives add gm4_mu_data dummy
scoreboard objectives add gm4_mu_timer dummy
scoreboard objectives add gm4_mu_generation dummy
scoreboard objectives add gm4_mu_frozen_time dummy
scoreboard objectives add gm4_mu_feared_time dummy
scoreboard objectives add gm4_mu_keep_tick dummy
scoreboard objectives add gm4_mu_config dummy
# add Survival Refightalized objectives for compatibility
scoreboard objectives add gm4_sr_data dummy
scoreboard objectives add gm4_sr_arrow.damage_change dummy
scoreboard objectives add gm4_sr_arrow.fire_delay dummy

# configs
execute unless score $spawn_phantoms gm4_mu_config matches -2147483648..2147483647 run scoreboard players set $spawn_phantoms gm4_mu_config 1

# disable natural phantom spawning
execute unless score $phantoms_disabled gm4_mu_data matches 1 run gamerule spawn_phantoms false
execute unless score $phantoms_disabled gm4_mu_data matches 1 run data modify storage gm4:log queue append value {type:"text",message:{"text":"[INFO] Monsters Unbound changed gamerule spawn_phantoms to false"}}
scoreboard players set $phantoms_disabled gm4_mu_data 1
execute store result score $doinsomnia gm4_mu_data run gamerule spawn_phantoms
execute if score $spawn_phantoms gm4_mu_config matches 1 if score $doinsomnia gm4_mu_data matches 1 run data modify storage gm4:log queue append value {type:"text",message:[{"text":"[WARN]","color":"red"},{"text":" Monsters Unbound requires minecraft:spawn_phantoms to be false, but it is true. ","color":"white"},{"text":"click here to fix","color":"red","clickEvent":{"action":"suggest_command","value":"/gamerule spawn_phantoms false"}}]}

# mob caps
execute unless score $mob_limit.husk_army gm4_mu_config matches -2147483648..2147483647 run scoreboard players set $mob_limit.husk_army gm4_mu_config 128
execute unless score $mob_limit.spore_zombie gm4_mu_config matches -2147483648..2147483647 run scoreboard players set $mob_limit.spore_zombie gm4_mu_config 128
execute unless score $mob_limit.phantom gm4_mu_config matches -2147483648..2147483647 run scoreboard players set $mob_limit.phantom gm4_mu_config 48

# elite teams
team add gm4_mu_elite.glacial
team modify gm4_mu_elite.glacial prefix {"translate":"text.gm4.monsters_unbound.elite_name.glacial","fallback":"Glacial "}
team add gm4_mu_elite.mending
team modify gm4_mu_elite.mending prefix {"translate":"text.gm4.monsters_unbound.elite_name.slate","fallback":"Slate "}
team add gm4_mu_elite.blazing
team modify gm4_mu_elite.blazing prefix {"translate":"text.gm4.monsters_unbound.elite_name.blazing","fallback":"Blazing "}
team add gm4_mu_elite.zephyr
team modify gm4_mu_elite.zephyr prefix {"translate":"text.gm4.monsters_unbound.elite_name.zephyr","fallback":"Zephyr "}
team add gm4_mu_elite.gargantuan
team modify gm4_mu_elite.gargantuan prefix {"translate":"text.gm4.monsters_unbound.elite_name.gargantuan","fallback":"Gargantuan "}
team add gm4_mu_elite.vorpal
team modify gm4_mu_elite.vorpal prefix {"translate":"text.gm4.monsters_unbound.elite_name.vorpal","fallback":"Vorpal "}
team add gm4_mu_elite.splitting
team modify gm4_mu_elite.splitting prefix {"translate":"text.gm4.monsters_unbound.elite_name.splitting","fallback":"Splitting "}
team add gm4_mu_elite.split
team modify gm4_mu_elite.split prefix {"translate":"text.gm4.monsters_unbound.elite_name.split","fallback":"Split "}
team add gm4_mu_elite.volatile
team modify gm4_mu_elite.volatile prefix {"translate":"text.gm4.monsters_unbound.elite_name.volatile","fallback":"Volatile "}
team add gm4_mu_elite.pearlescent
team modify gm4_mu_elite.pearlescent prefix {"translate":"text.gm4.monsters_unbound.elite_name.pearlescent","fallback":"Pearlescent "}

# constants
scoreboard players set #2 gm4_mu_data 2
scoreboard players set #4 gm4_mu_data 4

# start clocks
schedule function gm4_monsters_unbound:tick 1t
schedule function gm4_monsters_unbound:main 1t
schedule function gm4_monsters_unbound:slow_clock 1t
