﻿package {
import com.company.assembleegameclient.map.Camera;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.options.Options;
import com.company.assembleegameclient.util.AssetLoader;
import com.company.assembleegameclient.util.StageProxy;

import flash.display.LoaderInfo;
import flash.display.Sprite;
import flash.display.Stage;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.system.Capabilities;

import kabam.lib.net.NetConfig;
import kabam.rotmg.account.AccountConfig;
import kabam.rotmg.appengine.AppEngineConfig;
import kabam.rotmg.application.ApplicationConfig;
import kabam.rotmg.application.ApplicationSpecificConfig;
import kabam.rotmg.application.EnvironmentConfig;
import kabam.rotmg.arena.ArenaConfig;
import kabam.rotmg.assets.AssetsConfig;
import kabam.rotmg.build.BuildConfig;
import kabam.rotmg.characters.CharactersConfig;
import kabam.rotmg.classes.ClassesConfig;
import kabam.rotmg.core.CoreConfig;
import kabam.rotmg.core.StaticInjectorContext;
import kabam.rotmg.death.DeathConfig;
import kabam.rotmg.dialogs.DialogsConfig;
import kabam.rotmg.errors.ErrorConfig;
import kabam.rotmg.external.ExternalConfig;
import kabam.rotmg.fame.FameConfig;
import kabam.rotmg.fortune.FortuneConfig;
import kabam.rotmg.game.GameConfig;
import kabam.rotmg.language.LanguageConfig;
import kabam.rotmg.legends.LegendsConfig;
import kabam.rotmg.maploading.MapLoadingConfig;
import kabam.rotmg.minimap.MiniMapConfig;
import kabam.rotmg.mysterybox.MysteryBoxConfig;
import kabam.rotmg.news.NewsConfig;
import kabam.rotmg.packages.PackageConfig;
import kabam.rotmg.pets.PetsConfig;
import kabam.rotmg.promotions.PromotionsConfig;
import kabam.rotmg.protip.ProTipConfig;
import kabam.rotmg.questrewards.QuestRewardsConfig;
import kabam.rotmg.servers.ServersConfig;
import kabam.rotmg.stage3D.Stage3DConfig;
import kabam.rotmg.startup.StartupConfig;
import kabam.rotmg.startup.control.StartupSignal;
import kabam.rotmg.text.TextConfig;
import kabam.rotmg.tooltips.TooltipsConfig;
import kabam.rotmg.ui.UIConfig;
import kabam.rotmg.ui.UIUtils;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.LogLevel;

[SWF(frameRate="40",backgroundColor="#000000",width="800",height="600")]
public class WebMain extends Sprite {

    public static var STAGE:Stage;

    public static var sWidth:Number = 800;

    public static var sHeight:Number = 600;

    protected var context:IContext;

    public function WebMain()
    {
        super();
        if(stage)
        {
            stage.addEventListener(Event.RESIZE,this.onStageResize);
            this.setup();
        }
        else
        {
            addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
        }
    }

    private static function configureForAirIfDesktopPlayer() : void
    {
        if(Capabilities.playerType == "Desktop")
        {
            Parameters.data_.fullscreenMode = false;
            Parameters.save();
        }
    }

    private function onAddedToStage(param1:Event) : void
    {
        removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
        this.setup();
    }

    private function setup() : void
    {
        this.hackParameters();
        this.createContext();
        new AssetLoader().load();
        stage.scaleMode = StageScaleMode.NO_SCALE;
        this.context.injector.getInstance(StartupSignal).dispatch();
        configureForAirIfDesktopPlayer();
        STAGE = stage;
        scaleX = this.scaleX;
        scaleY = this.scaleY;
    }

    private function hackParameters() : void
    {
        Parameters.root = stage.root;
    }

    public function onStageResize(_arg1:Event) : void
    {
        if(stage.scaleMode == StageScaleMode.NO_SCALE)
        {
            scaleX = stage.stageWidth / 800;
            scaleY = stage.stageHeight / 600;
            x = (800 - stage.stageWidth) / 2;
            y = (600 - stage.stageHeight) / 2;
        }
        else
        {
            scaleX = 1;
            scaleY = 1;
            x = 0;
            y = 0;
        }
        sWidth = stage.stageWidth;
        sHeight = stage.stageHeight;
        Camera.resetDimensions();
        Stage3DConfig.resetDimensions();
    }

    private function createContext() : void
    {
        this.context = new StaticInjectorContext();
        this.context.injector.map(LoaderInfo).toValue(root.stage.root.loaderInfo);
        var _local1:StageProxy = new StageProxy(this);
        this.context.injector.map(StageProxy).toValue(_local1);
        this.context.extend(MVCSBundle).extend(SignalCommandMapExtension).configure(BuildConfig).configure(StartupConfig).configure(NetConfig).configure(AssetsConfig).configure(DialogsConfig).configure(EnvironmentConfig).configure(ApplicationConfig).configure(LanguageConfig).configure(TextConfig).configure(AppEngineConfig).configure(AccountConfig).configure(ErrorConfig).configure(CoreConfig).configure(ApplicationSpecificConfig).configure(DeathConfig).configure(CharactersConfig).configure(ServersConfig).configure(GameConfig).configure(UIConfig).configure(MiniMapConfig).configure(LegendsConfig).configure(NewsConfig).configure(FameConfig).configure(TooltipsConfig).configure(PromotionsConfig).configure(ProTipConfig).configure(MapLoadingConfig).configure(ClassesConfig).configure(PackageConfig).configure(PetsConfig).configure(QuestRewardsConfig).configure(Stage3DConfig).configure(ArenaConfig).configure(ExternalConfig).configure(MysteryBoxConfig).configure(FortuneConfig).configure(this);
        this.context.logLevel = LogLevel.DEBUG;
    }
}
}
