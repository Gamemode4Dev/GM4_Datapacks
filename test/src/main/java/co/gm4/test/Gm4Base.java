package co.gm4.test;

import net.minecraft.gametest.framework.GameTest;
import net.minecraft.gametest.framework.GameTestHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.fabricmc.fabric.api.gametest.v1.FabricGameTest;

public class Gm4Base implements FabricGameTest {
	public static final Logger LOGGER = LoggerFactory.getLogger("GM4");

	@GameTest(template = EMPTY_STRUCTURE)
	public void test(GameTestHelper helper) {
		LOGGER.info("Test!");
		helper.succeed();
		LOGGER.info("Succeeded!");
	}
}
