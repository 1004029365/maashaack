﻿/*
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
  Portions created by the Initial Developers are Copyright (C) 2006-2012
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

package graphics.events 
{
    import graphics.transitions.TweenEntry;
    
    import system.events.BasicEvent;
    
    import flash.events.Event;
    
    /**
     * This event dispatch a TweenEntry.
     */
    public class TweenEntryEvent extends BasicEvent 
    {
        /**
         * Creates a new TweenEntryEvent instance.
         * @param type the string type of the instance. 
         * @param target the target of the event.
         * @param context the optional context object of the event.
         * @param bubbles indicates if the event is a bubbling event.
         * @param cancelable indicates if the event is a cancelable event.
         * @param time this parameter is used in the Eden deserialization.
         */
        public function TweenEntryEvent(type:String, target:Object = null, entry:TweenEntry=null, context:* = null, bubbles:Boolean = false, cancelable:Boolean = false, time:Number = 0)
        {
            super( type, target, context, bubbles, cancelable, time );
            this.entry = entry ;
        }
        
        /**
         * Default event type when a tween entry is added.
         */
        public static var ADD_ENTRY:String = "onAddEntry" ;
        
        /**
          * Default event type when all tween entries are removed.
          */
        public static var CLEAR_ENTRY:String = "onClearEntry" ;
        
        /**
         * Default event type when a tween entry is removed.
         */
        public static var REMOVE_ENTRY:String = "onRemoveEntry" ;
        
        /**
         * Indicates the TweenEntry reference of this event.
         */
        public var entry:TweenEntry ;
        
        /**
         * Returns the shallow copy of this object.
         * @return the shallow copy of this object.
         */
        public override function clone():Event 
        {
            return new TweenEntryEvent( type, target, entry, context ) ;
        }
    }
}
