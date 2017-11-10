package com.company.assembleegameclient.map.partyoverlay
{
   import com.company.assembleegameclient.map.Map;
   import flash.utils.getTimer;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.ui.tooltip.ToolTip;
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.ui.tooltip.QuestToolTip;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.ui.tooltip.PortraitToolTip;
   import com.company.assembleegameclient.map.Quest;
   import com.company.assembleegameclient.map.Camera;
   
   public class QuestArrow extends GameObjectArrow
   {
       
      
      public var map_:Map;
      
      public function QuestArrow(param1:Map)
      {
         super(16352321,12919330,true);
         this.map_ = param1;
      }
      
      public function refreshToolTip() : void
      {
         setToolTip(this.getToolTip(go_,getTimer()));
      }
      
      override protected function onMouseOver(param1:MouseEvent) : void
      {
         super.onMouseOver(param1);
         this.refreshToolTip();
      }
      
      override protected function onMouseOut(param1:MouseEvent) : void
      {
         super.onMouseOut(param1);
         this.refreshToolTip();
      }
      
      private function getToolTip(param1:GameObject, param2:int) : ToolTip
      {
         if(param1 == null || param1.texture_ == null)
         {
            return null;
         }
         if(this.shouldShowFullQuest(param2))
         {
            return new QuestToolTip(go_);
         }
         if(Parameters.data_.showQuestPortraits)
         {
            return new PortraitToolTip(param1);
         }
         return null;
      }
      
      private function shouldShowFullQuest(param1:int) : Boolean
      {
         var _local2:Quest = this.map_.quest_;
         return Boolean(mouseOver_) || Boolean(_local2.isNew(param1));
      }
      
      override public function draw(param1:int, param2:Camera) : void
      {
         var _local4:* = false;
         var _local5:Boolean = false;
         var _local3:GameObject = this.map_.quest_.getObject(param1);
         if(_local3 != go_)
         {
            setGameObject(_local3);
            setToolTip(this.getToolTip(_local3,param1));
         }
         else if(go_ != null)
         {
            _local4 = tooltip_ is QuestToolTip;
            _local5 = this.shouldShowFullQuest(param1);
            if(_local4 != _local5)
            {
               setToolTip(this.getToolTip(_local3,param1));
            }
         }
         super.draw(param1,param2);
      }
   }
}
