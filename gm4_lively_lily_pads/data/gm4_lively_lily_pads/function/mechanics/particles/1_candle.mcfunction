# displays flames for a 1 candle display
# @s = candle display
# at @s
# run from mechanics/particles/candle_count

particle small_flame ~ ~.42 ~
execute if score $rand gm4_llp.data matches 1 run particle smoke ~ ~.43 ~
