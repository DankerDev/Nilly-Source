package com.google.analytics.utils
{
   public class Version
   {
       
      
      private var _revision:uint;
      
      private var _maxBuild:uint = 255;
      
      private var _maxMinor:uint = 15;
      
      private var _maxMajor:uint = 15;
      
      private var _separator:String = ".";
      
      private var _maxRevision:uint = 65535;
      
      private var _build:uint;
      
      private var _major:uint;
      
      private var _minor:uint;
      
      public function Version(param1:uint = 0, param2:uint = 0, param3:uint = 0, param4:uint = 0)
      {
         var _local5:Version = null;
         super();
         if(param1 > this._maxMajor && param2 == 0 && param3 == 0 && param4 == 0)
         {
            _local5 = Version.fromNumber(param1);
            param1 = _local5.major;
            param2 = _local5.minor;
            param3 = _local5.build;
            param4 = _local5.revision;
         }
         this.major = param1;
         this.minor = param2;
         this.build = param3;
         this.revision = param4;
      }
      
      public static function fromString(param1:String = "", param2:String = ".") : Version
      {
         var _local4:Array = null;
         var _local3:Version = new Version();
         if(param1 == "" || param1 == null)
         {
            return _local3;
         }
         if(param1.indexOf(param2) > -1)
         {
            _local4 = param1.split(param2);
            _local3.major = parseInt(_local4[0]);
            _local3.minor = parseInt(_local4[1]);
            _local3.build = parseInt(_local4[2]);
            _local3.revision = parseInt(_local4[3]);
         }
         else
         {
            _local3.major = parseInt(param1);
         }
         return _local3;
      }
      
      public static function fromNumber(param1:Number = 0) : Version
      {
         var _local2:Version = new Version();
         if(Boolean(isNaN(param1)) || param1 == 0 || param1 < 0 || param1 == Number.MAX_VALUE || param1 == Number.POSITIVE_INFINITY || param1 == Number.NEGATIVE_INFINITY)
         {
            return _local2;
         }
         _local2.major = param1 >>> 28;
         _local2.minor = (param1 & 251658240) >>> 24;
         _local2.build = (param1 & 16711680) >>> 16;
         _local2.revision = param1 & 65535;
         return _local2;
      }
      
      public function toString(param1:int = 0) : String
      {
         var _local2:Array = null;
         if(param1 <= 0 || param1 > 4)
         {
            param1 = this.getFields();
         }
         switch(param1)
         {
            case 1:
               _local2 = [this.major];
               break;
            case 2:
               _local2 = [this.major,this.minor];
               break;
            case 3:
               _local2 = [this.major,this.minor,this.build];
               break;
            case 4:
            default:
               _local2 = [this.major,this.minor,this.build,this.revision];
         }
         return _local2.join(this._separator);
      }
      
      public function set revision(param1:uint) : void
      {
         this._revision = Math.min(param1,this._maxRevision);
      }
      
      public function get revision() : uint
      {
         return this._revision;
      }
      
      public function set build(param1:uint) : void
      {
         this._build = Math.min(param1,this._maxBuild);
      }
      
      public function set minor(param1:uint) : void
      {
         this._minor = Math.min(param1,this._maxMinor);
      }
      
      public function get build() : uint
      {
         return this._build;
      }
      
      public function set major(param1:uint) : void
      {
         this._major = Math.min(param1,this._maxMajor);
      }
      
      public function get minor() : uint
      {
         return this._minor;
      }
      
      private function getFields() : int
      {
         var _local1:int = 4;
         if(this.revision == 0)
         {
            _local1--;
         }
         if(_local1 == 3 && this.build == 0)
         {
            _local1--;
         }
         if(_local1 == 2 && this.minor == 0)
         {
            _local1--;
         }
         return _local1;
      }
      
      public function valueOf() : uint
      {
         return this.major << 28 | this.minor << 24 | this.build << 16 | this.revision;
      }
      
      public function get major() : uint
      {
         return this._major;
      }
      
      public function equals(param1:*) : Boolean
      {
         if(!(param1 is Version))
         {
            return false;
         }
         if(param1.major == this.major && param1.minor == this.minor && param1.build == this.build && param1.revision == this.revision)
         {
            return true;
         }
         return false;
      }
   }
}
