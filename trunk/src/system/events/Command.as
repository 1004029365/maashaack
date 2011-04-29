﻿/*  Version: MPL 1.1/GPL 2.0/LGPL 2.1   The contents of this file are subject to the Mozilla Public License Version  1.1 (the "License"); you may not use this file except in compliance with  the License. You may obtain a copy of the License at  http://www.mozilla.org/MPL/    Software distributed under the License is distributed on an "AS IS" basis,  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License  for the specific language governing rights and limitations under the  License.    The Original Code is [maashaack framework].    The Initial Developers of the Original Code are  Zwetan Kjukov <zwetan@gmail.com> and Marc Alcaraz <ekameleon@gmail.com>.  Portions created by the Initial Developers are Copyright (C) 2006-2011  the Initial Developers. All Rights Reserved.    Contributor(s):    Alternatively, the contents of this file may be used under the terms of  either the GNU General Public License Version 2 or later (the "GPL"), or  the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),  in which case the provisions of the GPL or the LGPL are applicable instead  of those above. If you wish to allow use of your version of this file only  under the terms of either the GPL or the LGPL, and not to allow others to  use your version of this file under the terms of the MPL, indicate your  decision by deleting the provisions above and replace them with the notice  and other provisions required by the LGPL or the GPL. If you do not delete  the provisions above, a recipient may use your version of this file under  the terms of any one of the MPL, the GPL or the LGPL.*/package system.events {    import system.Reflection;    import system.process.Runnable;
        /**     * ﻿A command is an easy entry with name and value property to launch a global command in the global event flow centralized in a specific FrontController singleton in the application.     */    public class Command implements Runnable     {        /**         * Creates a new Command instance.         * ﻿<p><b>Example :</b></p>         * <pre class="prettyprint">         * var c1:Command = new Command() ;         * var c2:Command = new Command([name:String [, value:*[, channel:String]]]) ;         * var c3:Command = new Command([initObject:Object]) ;          * </pre>         */        public function Command( ...arguments:Array )        {            ﻿if (arguments.length == 1 )            {                var arg:* = arguments[0] ;                if ( arg is String)                 {                    this.name = arg as String ;                }                else if ( arg != null && arg is Object )                {                    if ( ( "channel" in arg ) && ( arg["channel"] is String ) )                    {                        this.channel = arg["channel"] as String ;                    }                     if ( ( "name" in arg ) && ( arg["name"] is String ) )                    {                        this.name = arg["name"] as String ;                    }                      if ( ( "value" in arg ) )                    {                        this.value = arg["value"] ;                    }                 }            }            else if ( arguments.length > 0 )            {                this.name    = arguments[0] as String ;                    this.value   = arguments[1] ;                this.channel = arguments[2] as String ;            }        }                /**         * The channel of this command.         */        public var channel:String ;                /**         * The front controller reference of this command. If the controller property isn't define the internal FrontController  defines with the channel property of the command is used.         */        public function get controller():FrontController        {            return _controller || FrontController.getInstance( channel ) ;        }                /**         * @private         */        public function set controller( fc:FrontController ):void        {            _controller = fc  ;        }                /**         * The command's type name.         */        public var name:String ;                    /**         * The value of this command.         */        public var value:* ;                /**         * Run the process.         */        public function run( ...arguments:Array ):void        {            if ( controller != null && controller.contains( name ) )            {                controller.fireEvent( new BasicEvent( name , this , value ) ) ;            }            else            {                throw new Error( this + "﻿ run() failed with an unknow command '" + name + "' in the FrontController of this command." ) ;            }        }                /**         * Returns the Object representation of the instance.         * @return the Object representation of the instance.         */        public function toObject():Object        {            return { name:name , value:value, channel:channel } ;        }                /**         * Returns the String representation of this object.         * @return the String representation of this object.         */        public function toString( verbose:Boolean = false ):String        {            var s:String = "[" + Reflection.getClassName(this) ;            if ( name != null )            {                s += " name:\"" + name + "\"" ;            }            if ( channel != null )            {                s += " channel:\"" + channel + "\"" ;            }            if ( verbose )            {                if ( value != null )                {                    s += " value:\"" + value + "\"" ;                }            }            s += "]" ;            return s ;        }                /**         * @private         */        private var _controller:FrontController ;    }}