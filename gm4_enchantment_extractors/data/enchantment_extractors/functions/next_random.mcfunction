scoreboard players operation seed gm4_ench_random *= mult gm4_ench_random
scoreboard players operation seed gm4_ench_random += incr gm4_ench_random
scoreboard players operation result gm4_ench_random = seed gm4_ench_random
scoreboard players operation result gm4_ench_random /= #100 gm4_ench_random
scoreboard players operation result gm4_ench_random %= #100 gm4_ench_random
