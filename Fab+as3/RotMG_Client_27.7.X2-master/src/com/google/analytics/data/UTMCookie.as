package com.google.analytics.data
{
   import com.google.analytics.core.Buffer;
   
   public class UTMCookie implements Cookie
   {
       
      
      protected var inURL:String;
      
      protected var name:String;
      
      private var _creation:Date;
      
      private var _expiration:Date;
      
      public var proxy:Buffer;
      
      protected var fields:Array;
      
      private var _timespan:Number;
      
      public function UTMCookie(param1:String, param2:String, param3:Array, param4:Number = 0)
      {
         super();
         this.name = param1;
         this.inURL = param2;
         this.fields = param3;
         this._timestamp(param4);
      }
      
      public function isEmpty() : Boolean
      {
         var _local2:String = null;
         var _local1:int = 0;
         var _local3:int = 0;
         while(_local3 < this.fields.length)
         {
            _local2 = this.fields[_local3];
            if(this[_local2] is Number && Boolean(isNaN(this[_local2])))
            {
               _local1++;
            }
            else if(this[_local2] is String && this[_local2] == "")
            {
               _local1++;
            }
            _local3++;
         }
         if(_local1 == this.fields.length)
         {
            return true;
         }
         return false;
      }
      
      public function resetTimestamp(param1:Number = NaN) : void
      {
         if(!isNaN(param1))
         {
            this._timespan = param1;
         }
         this._creation = null;
         this._expiration = null;
         this._timestamp(this._timespan);
      }
      
      protected function update() : void
      {
         this.resetTimestamp();
         if(this.proxy)
         {
            this.proxy.update(this.name,this.toSharedObject());
         }
      }
      
      public function reset() : void
      {
         var _local1:String = null;
         var _local2:int = 0;
         while(_local2 < this.fields.length)
         {
            _local1 = this.fields[_local2];
            if(this[_local1] is Number)
            {
               this[_local1] = NaN;
            }
            else if(this[_local1] is String)
            {
               this[_local1] = "";
            }
            _local2++;
         }
         this.resetTimestamp();
         this.update();
      }
      
      public function fromSharedObject(param1:Object) : void
      {
         var _local2:String = null;
         var _local3:int = this.fields.length;
         var _local4:int = 0;
         while(_local4 < _local3)
         {
            _local2 = this.fields[_local4];
            if(param1[_local2])
            {
               this[_local2] = param1[_local2];
            }
            _local4++;
         }
         if(param1.creation)
         {
            this.creation = param1.creation;
         }
         if(param1.expiration)
         {
            this.expiration = param1.expiration;
         }
      }
      
      private function _timestamp(param1:Number) : void
      {
         this.creation = new Date();
         this._timespan = param1;
         if(param1 > 0)
         {
            this.expiration = new Date(this.creation.valueOf() + param1);
         }
      }
      
      public function isExpired() : Boolean
      {
         var _local1:Date = new Date();
         var _local2:Number = this.expiration.valueOf() - _local1.valueOf();
         if(_local2 <= 0)
         {
            return true;
         }
         return false;
      }
      
      public function set expiration(param1:Date) : void
      {
         this._expiration = param1;
      }
      
      public function get creation() : Date
      {
         return this._creation;
      }
      
      public function valueOf() : String
      {
         var _local2:String = null;
         var _local3:* = undefined;
         var _local4:Array = null;
         var _local1:Array = [];
         var _local5:String = "";
         var _local6:int = 0;
         while(_local6 < this.fields.length)
         {
            _local2 = this.fields[_local6];
            _local3 = this[_local2];
            if(_local3 is String)
            {
               if(_local3 == "")
               {
                  _local3 = "-";
                  _local1.push(_local3);
               }
               else
               {
                  _local1.push(_local3);
               }
            }
            else if(_local3 is Number)
            {
               if(_local3 == 0)
               {
                  _local1.push(_local3);
               }
               else if(isNaN(_local3))
               {
                  _local3 = "-";
                  _local1.push(_local3);
               }
               else
               {
                  _local1.push(_local3);
               }
            }
            _local6++;
         }
         if(this.isEmpty())
         {
            return "-";
         }
         return "" + _local1.join(".");
      }
      
      public function toURLString() : String
      {
         return this.inURL + "=" + this.valueOf();
      }
      
      public function get expiration() : Date
      {
         if(this._expiration)
         {
            return this._expiration;
         }
         return new Date(new Date().valueOf() + 1000);
      }
      
      public function toSharedObject() : Object
      {
         var _local2:String = null;
         var _local3:* = undefined;
         var _local1:Object = {};
         var _local4:int = 0;
         while(_local4 < this.fields.length)
         {
            _local2 = this.fields[_local4];
            _local3 = this[_local2];
            if(_local3 is String)
            {
               _local1[_local2] = _local3;
            }
            else if(_local3 == 0)
            {
               _local1[_local2] = _local3;
            }
            else if(!isNaN(_local3))
            {
               _local1[_local2] = _local3;
            }
            _local4++;
         }
         _local1.creation = this.creation;
         _local1.expiration = this.expiration;
         return _local1;
      }
      
      public function toString(param1:Boolean = false) : String
      {
         var _local3:String = null;
         var _local4:* = undefined;
         var _local2:Array = [];
         var _local5:int = this.fields.length;
         var _local6:int = 0;
         while(_local6 < _local5)
         {
            _local3 = this.fields[_local6];
            _local4 = this[_local3];
            if(_local4 is String)
            {
               _local2.push(_local3 + ": \"" + _local4 + "\"");
            }
            else if(_local4 == 0)
            {
               _local2.push(_local3 + ": " + _local4);
            }
            else if(!isNaN(_local4))
            {
               _local2.push(_local3 + ": " + _local4);
            }
            _local6++;
         }
         var _local7:* = this.name.toUpperCase() + " {" + _local2.join(", ") + "}";
         if(param1)
         {
            _local7 = _local7 + (" creation:" + this.creation + ", expiration:" + this.expiration);
         }
         return _local7;
      }
      
      public function set creation(param1:Date) : void
      {
         this._creation = param1;
      }
   }
}
