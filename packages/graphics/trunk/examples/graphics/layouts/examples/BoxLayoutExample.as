/*
  Version: MPL 1.1/GPL 2.0/LGPL 2.1
 
  The contents of this file are subject to the Mozilla Public License Version
  1.1 (the "License"); you may not use this file except in compliance with
  the License. You may obtain a copy of the License at
  http://www.mozilla.org/MPL/
  
  Software distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
  for the specific language governing rights and limitations under the
  License.
  
  The Original Code is [maashaack framework].
  
  The Initial Developers of the Original Code are
  Zwetan Kjukov <zwetan@gmail.com> and Marc Alcaraz <ekameleon@gmail.com>.
  Portions created by the Initial Developers are Copyright (C) 2006-2011
  the Initial Developers. All Rights Reserved.
  
  Contributor(s):
  
  Alternatively, the contents of this file may be used under the terms of
  either the GNU General Public License Version 2 or later (the "GPL"), or
  the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
  in which case the provisions of the GPL or the LGPL are applicable instead
  of those above. If you wish to allow use of your version of this file only
  under the terms of either the GPL or the LGPL, and not to allow others to
  use your version of this file under the terms of the MPL, indicate your
  decision by deleting the provisions above and replace them with the notice
  and other provisions required by the LGPL or the GPL. If you do not delete
  the provisions above, a recipient may use your version of this file under
  the terms of any one of the MPL, the GPL or the LGPL.
*/

package examples 
{
    import graphics.Align;
    import graphics.Direction;
    import graphics.DirectionOrder;
    import graphics.geom.EdgeMetrics;
    import graphics.layouts.BoxLayout;
    import graphics.layouts.Layout;
    
    import system.data.Iterator;
    import system.data.iterators.ArrayIterator;
    
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.display.StageScaleMode;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    import flash.ui.Keyboard;
    
    [SWF(width="980", height="760", frameRate="24", backgroundColor="#666666")]
    
    public class BoxLayoutExample extends Sprite 
    {
        public function BoxLayoutExample()
        {
            ///////////
            
            container   = new Sprite() ;
            container.x = 980/2 ;
            container.y = 760/2 ;
            
            addChild( container ) ;
            
            ///////////
            
            cover   = new Shape() ;
            cover.x = 980/2 ;
            cover.y = 760/2 ;
            
            //container.mask = cover ;
            
            addChild( cover ) ;
            
            ///////////
            
            var colors:Array = [ 0xFF00000 , 0xDD00000 , 0xBB0000 , 0x990000 , 0x770000 , 0x550000 ] ;
            
            var shape:Shape ;
            for ( var i:uint = 0 ; i<6 ; i++ ) 
            {
                shape = new Shape() ;
                
                shape.graphics.beginFill( colors[i] ) ;
                shape.graphics.drawRect(0, 0, 60, 40) ;
                
                container.addChild( shape ) ;
            }
            
            ///////////
            
            layout = new BoxLayout( container ) ;
            
            layout.updater.connect( update ) ;
            
            layout.direction     = Direction.HORIZONTAL ;
            layout.padding       = new EdgeMetrics( 10 , 10 , 10 , 10 ) ;
            layout.horizontalGap = 10 ;
            layout.verticalGap   = 10 ;
            
            layout.align = Align.CENTER ;
            
            layout.run() ;
            
            ///////////
            
            stage.align     = "" ;
            stage.scaleMode = StageScaleMode.NO_SCALE ;
            stage.addEventListener( KeyboardEvent.KEY_DOWN , keyDown   ) ;
            stage.addEventListener( MouseEvent.MOUSE_DOWN  , mouseDown ) ;
        }
        
        public var container:Sprite ;
        
        public var cover:Shape ;
        
        public var layout:BoxLayout ;
        
        public function keyDown( e:KeyboardEvent ):void
        {
            var code:uint = e.keyCode ;
            switch( code )
            {
                case Keyboard.SPACE :
                {
                    layout.direction = layout.direction == Direction.HORIZONTAL ? Direction.VERTICAL : Direction.HORIZONTAL ;
                    break ;
                }
                case Keyboard.UP :
                {
                    layout.childCount = 3 ;
                    // layout.childCount = 7 ;
                    break ;
                }
                case Keyboard.DOWN :
                {
                    layout.childCount = 0 ;
                    // layout.childCount = -1 ;
                    break ;
                }
                case Keyboard.LEFT :
                {
                    layout.order = layout.order == DirectionOrder.NORMAL ? DirectionOrder.REVERSE : DirectionOrder.NORMAL ;
                    break ;
                }
            }
            layout.run() ;
        }
        
        public function mouseDown( e:MouseEvent ):void
        {
            if ( alignIterator.hasNext() )
            {
                layout.align = alignIterator.next() ;
                layout.run() ;
            }
            if ( !alignIterator.hasNext() )
            {
                alignIterator.reset() ;
            }
        }
        
        protected const aligns:Array = 
        [ 
            Align.TOP_LEFT    , Align.TOP          , Align.TOP_RIGHT ,
            Align.RIGHT       , Align.BOTTOM_RIGHT , Align.BOTTOM    ,
            Align.BOTTOM_LEFT , Align.LEFT          
        ] ;
        
        protected const alignIterator:Iterator = new ArrayIterator( aligns ) ;
        
        /**
         * Invoked when the layout is updated.
         */
        protected function update( layout:Layout ):void
        {
            var bounds:Rectangle = layout.bounds ;
            
            container.graphics.clear() ;
            container.graphics.beginFill(0x999999) ;
            container.graphics.drawRect(bounds.x , bounds.y, bounds.width, bounds.height) ;
            
            //cover.graphics.clear() ;
            //cover.graphics.beginFill(0x999999) ;
            //cover.graphics.drawRect(bounds.x , bounds.y, bounds.width, bounds.height) ;
        }
    }
}
