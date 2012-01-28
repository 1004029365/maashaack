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

package graphics.process.display 
{
    import system.process.Task;
    
    import flash.display.DisplayObjectContainer;
    
    /**
     * This process remove a DisplayObject with a specific index in a DisplayObjectContainer.
     */
    public class RemoveChildAt extends Task 
    {
        /**
         * Creates a new RemoveChildAt instance.
         * @param target The DisplayObjectContainer reference.
         * @param at The index position to remove the display.
         */
        public function RemoveChildAt( target:DisplayObjectContainer = null , at:uint = 0 )
        {
            this.target = target ;
            this.at     = at  ;
        }
        
        /**
         * The index position to remove a display in the container.
         */
        public var at:uint ;
        
        /**
         * Specifies whether errors encountered by the object are reported to the application.
         * When enableErrorChecking is <code>true</code> methods are synchronous and can throw errors.
         * When enableErrorChecking is <code>false</code>, the default, the methods are asynchronous and errors are not reported.
         * Enabling error checking reduces parsing performance.
         * You should only enable error checking when debugging.
         */
        public var enableErrorChecking:Boolean;
        
        /**
         * The DisplayObject reference.
         */
        public var target:DisplayObjectContainer ;
        
        /**
         * Specifies the verbose mode.
         */
        public var verbose:Boolean ;
        
        /**
         * Returns a shallow copy of this object.
         * @return a shallow copy of this object.
         */
        public override function clone():*
        {
            return new RemoveChildAt( target , at ) ;
        }
        
        /**
         * Run the process.
         */
        public override function run( ...arguments:Array ):void 
        {
            notifyStarted() ;
            try
            {
               target.removeChildAt( at ) ;
            }
            catch( e:Error )
            {
                warn( this + " run failed with the target:" + target + " at:" + at + ", " + e.toString() , verbose , enableErrorChecking ) ;
            }
            notifyFinished() ;
        }
    }
}
