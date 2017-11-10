package com.company.assembleegameclient.map.partyoverlay
{
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.ui.tooltip.PlayerGroupToolTip;
   import com.company.assembleegameclient.ui.menu.Menu;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.ui.menu.PlayerGroupMenu;
   import com.company.assembleegameclient.objects.GameObject;
   
   public class PlayerArrow extends GameObjectArrow
   {
       
      
      public function PlayerArrow()
      {
         super(16777215,4179794,false);
      }
      
      override protected function onMouseOver(param1:MouseEvent) : void
      {
         super.onMouseOver(param1);
         setToolTip(new PlayerGroupToolTip(this.getFullPlayerVec(),false));
      }
      
      override protected function onMouseOut(param1:MouseEvent) : void
      {
         super.onMouseOut(param1);
         setToolTip(null);
      }
      
      override protected function onMouseDown(param1:MouseEvent) : void
      {
         super.onMouseDown(param1);
         removeMenu();
         setMenu(this.getMenu());
      }
      
      protected function getMenu() : Menu
      {
         var _local1:Player = go_ as Player;
         if(_local1 == null || _local1.map_ == null)
         {
            return null;
         }
         var _local2:Player = _local1.map_.player_;
         if(_local2 == null)
         {
            return null;
         }
         return new PlayerGroupMenu(_local1.map_,this.getFullPlayerVec());
      }
      
      private function getFullPlayerVec() : Vector.<Player>
      {
         var _local2:GameObject = null;
         var _local1:Vector.<Player> = new <Player>[go_ as Player];
         for each(_local2 in extraGOs_)
         {
            _local1.push(_local2 as Player);
         }
         return _local1;
      }
   }
}
