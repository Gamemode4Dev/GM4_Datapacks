package co.gm4.test.module;

import net.fabricmc.fabric.api.gametest.v1.FabricGameTest;
import net.minecraft.gametest.framework.GameTest;
import net.minecraft.gametest.framework.GameTestHelper;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.item.Items;
import net.minecraft.world.level.block.Blocks;

public class Chairs implements FabricGameTest {
    @GameTest(template = EMPTY_STRUCTURE)
    public void create(GameTestHelper helper) {
        helper.setBlock(0, 1, 0, Blocks.ACACIA_STAIRS.defaultBlockState());
        helper.spawnItem(Items.SADDLE, 0.5f, 2, 0.75f);
        helper.succeedWhenEntityPresent(EntityType.PIG, 0, 0, 0);
    }
}
