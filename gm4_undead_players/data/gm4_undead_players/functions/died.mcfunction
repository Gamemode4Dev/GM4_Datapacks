#@s = @a[scores={gm4_undead=1..},gamemode=!creative,gamemode=!spectator] at @s

execute if entity @s[gamemode=!creative,gamemode=!spectator] run summon zombie ~ ~1 ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Undead Player",{"translate":"entity.gm4.undead_player"}]}',CustomNameVisible:1,CanPickUpLoot:1b,PersistenceRequired:1,IsBaby:0,HandItems:[],ArmorItems:[],Tags:["gm4_undead_player"]}
execute if entity @s[gamemode=!creative,gamemode=!spectator] run advancement grant @s only gm4:undead_players
scoreboard players reset @s gm4_undead
