#execute at tnt player heads
execute as @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"3d80d659-36cd-4aee-8540-8cdb548ede75",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2FmNTk3NzZmMmYwMzQxMmM3YjU5NDdhNjNhMGNmMjgzZDUxZmU2NWFjNmRmN2YyZjg4MmUwODM0NDU2NWU5In19fQ=="}]}}}}}] at @s positioned ~ ~-0.9 ~ unless block ~ ~ ~ air unless entity @e[type=armor_stand,tag=gm4_tnt_mines_mine,limit=1,distance=..0.7,nbt={ArmorItems:[{},{},{},{id:"minecraft:player_head"}]}] run function tnt_mines:run/create
#runs particle at tnt mines to show the player where it's testing for air
execute at @e[type=armor_stand,tag=gm4_tnt_mines_mine] run particle dust 1.000 0.000 0.000 1 ~ ~0.1 ~ 0 0 0 0 1
#kills tnt mines without a tnt item on their head
execute as @e[type=armor_stand,tag=gm4_tnt_mines_mine,nbt=!{ArmorItems:[{},{},{},{id:"minecraft:player_head"}]}] run data merge entity @s {Fire:10000}