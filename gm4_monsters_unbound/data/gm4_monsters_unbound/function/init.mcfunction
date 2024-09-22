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

scoreboard objectives add gm4_mu_boss dummy
scoreboard objectives add gm4_mu_boss.id dummy
scoreboard objectives add gm4_mu_boss.tick_delay dummy
scoreboard objectives add gm4_mu_boss.attack_id dummy
scoreboard objectives add gm4_mu_boss.attack_progress dummy
scoreboard objectives add gm4_mu_boss.health dummy
scoreboard objectives add gm4_mu_boss.phase dummy
scoreboard objectives add gm4_mu_boss.last_attack dummy
scoreboard objectives add gm4_mu_boss.secondary_id dummy

# configs
execute unless score $spawn_phantoms gm4_sr_config matches -2147483648..2147483647 run scoreboard players set $spawn_phantoms gm4_sr_config 1

# disable natural phantom spawning
execute unless score $phantoms_disabled gm4_mu_data matches 1 run gamerule doInsomnia false
execute unless score $phantoms_disabled gm4_mu_data matches 1 run data modify storage gm4:log queue append value {type:"text",message:'{"text":"[INFO] Monsters Unbound changed gamerule doInsomnia to false"}'}
scoreboard players set $phantoms_disabled gm4_mu_data 1
execute store result score $doinsomnia gm4_mu_data run gamerule doInsomnia
execute if score $spawn_phantoms gm4_sr_config matches 1 if score $doinsomnia gm4_mu_data matches 1 run data modify storage gm4:log queue append value {type:"text",message:'[{"text":"[WARN]","color":"red"},{"text":" Monsters Unbound requires doInsomnia to be false, but it is true. ","color":"white"},{"text":"click here to fix","color":"red","clickEvent":{"action":"suggest_command","value":"/gamerule doInsomnia false"}}]'}

# mob caps
execute unless score $mob_limit.husk_army gm4_sr_config matches -2147483648..2147483647 run scoreboard players set $mob_limit.husk_army gm4_sr_config 128
execute unless score $mob_limit.spore_zombie gm4_sr_config matches -2147483648..2147483647 run scoreboard players set $mob_limit.spore_zombie gm4_sr_config 128
execute unless score $mob_limit.phantom gm4_sr_config matches -2147483648..2147483647 run scoreboard players set $mob_limit.phantom gm4_sr_config 48

# elite teams
team add gm4_mu_elite.glacial
team modify gm4_mu_elite.glacial prefix {"text":"Glacial "}
team add gm4_mu_elite.mending
team modify gm4_mu_elite.mending prefix {"text":"Slate "}
team add gm4_mu_elite.blazing
team modify gm4_mu_elite.blazing prefix {"text":"Blazing "}
team add gm4_mu_elite.zephyr
team modify gm4_mu_elite.zephyr prefix {"text":"Zephyr "}
team add gm4_mu_elite.gargantuan
team modify gm4_mu_elite.gargantuan prefix {"text":"Gargantuan "}
team add gm4_mu_elite.vorpal
team modify gm4_mu_elite.vorpal prefix {"text":"Vorpal "}
team add gm4_mu_elite.splitting
team modify gm4_mu_elite.splitting prefix {"text":"Splitting "}
team add gm4_mu_elite.split
team modify gm4_mu_elite.split prefix {"text":"Split "}
team add gm4_mu_elite.volatile
team modify gm4_mu_elite.volatile prefix {"text":"Volatile "}
team add gm4_mu_elite.pearlescent
team modify gm4_mu_elite.pearlescent prefix {"text":"Pearlescent "}

# constants
scoreboard players set #2 gm4_mu_data 2
scoreboard players set #4 gm4_mu_data 4

# start clocks
schedule function gm4_monsters_unbound:tick 1t
schedule function gm4_monsters_unbound:main 1t
schedule function gm4_monsters_unbound:slow_clock 1t
