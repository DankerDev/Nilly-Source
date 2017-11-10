﻿package kabam.rotmg.game.view.components {
import flash.display.Sprite;

public class TabBackground extends Sprite {

    public function TabBackground(_arg_1:Number = 25, _arg_2:Number = 30) {
        graphics.beginFill(TabConstants.TAB_COLOR);
        graphics.drawRoundRect(0, 0, _arg_1, _arg_2, TabConstants.TAB_CORNER_RADIUS, TabConstants.TAB_CORNER_RADIUS);
        graphics.endFill();
    }

}
}//package kabam.rotmg.game.view.components
