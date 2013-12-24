//Code generated with DAME. http://www.dambots.com

package com
{
	import org.flixel.*;
	public class Level_Group1 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="mapCSV_Group1_level1.csv", mimeType="application/octet-stream")] public var CSV_level1:Class;
		[Embed(source="../../data/32tile.png")] public var Img_level1:Class;

		//Tilemaps
		public var layerlevel1:FlxTilemap;

		//Sprites
		public var Layer2Group:FlxGroup = new FlxGroup;

		//Properties


		public function Level_Group1(addToStage:Boolean = true, onAddCallback:Function = null)
		{
			// Generate maps.
			var properties:Array = [];

			properties = generateProperties( null );
			layerlevel1 = addTilemap( CSV_level1, Img_level1, 0.000, 0.000, 32, 32, 1.000, 1.000, false, 1, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(layerlevel1);
			masterLayer.add(Layer2Group);

			if ( addToStage )
				createObjects(onAddCallback);

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 960;
			boundsMaxY = 320;
			bgColor = 0xff000000;
		}

		override public function createObjects(onAddCallback:Function = null):void
		{
			addSpritesForLayerLayer2(onAddCallback);
			generateObjectLinks(onAddCallback);
			FlxG.state.add(masterLayer);
		}

		public function addSpritesForLayerLayer2(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Avatar, Layer2Group , 64.000, 224.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"home"
			addSpriteToLayer(null, Avatar, Layer2Group , 864.000, 96.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"home"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
