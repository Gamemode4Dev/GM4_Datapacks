#@s = valid tnt mine
#runs from tnt_mines:pulse_check

#checks a block above and tests if there is a valid entity to make it explode
execute positioned ~ ~0.9 ~ run function tnt_mines:run/check_entity
#explodes if in air
execute if block ~ ~ ~ air run function tnt_mines:run/explode