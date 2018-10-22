#@s = tnt mine about to explode
#runs from tnt_mines:run/at_mine
#runs from tnt_mines:run/check_entity

#kills landmine
kill @s
#summons landmine tnt
summon tnt ~ ~ ~ {CustomName:"{\"text\":\"TNT Landmine\"}"}
#grants advancement
advancement grant @a[distance=..1] only gm4:tnt_mines_explode