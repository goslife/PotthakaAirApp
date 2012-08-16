﻿////////////////////////////////////////////////////////////////////////////////////  OpenZoom SDK////  Version: MPL 1.1/GPL 3/LGPL 3////  The contents of this file are subject to the Mozilla Public License Version//  1.1 (the "License"); you may not use this file except in compliance with//  the License. You may obtain a copy of the License at//  http://www.mozilla.org/MPL/////  Software distributed under the License is distributed on an "AS IS" basis,//  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License//  for the specific language governing rights and limitations under the//  License.////  The Original Code is the OpenZoom SDK.////  The Initial Developer of the Original Code is Daniel Gasienica.//  Portions created by the Initial Developer are Copyright (c) 2007-2010//  the Initial Developer. All Rights Reserved.////  Contributor(s)://    Daniel Gasienica <daniel@gasienica.ch>////  Alternatively, the contents of this file may be used under the terms of//  either the GNU General Public License Version 3 or later (the "GPL"), or//  the GNU Lesser General Public License Version 3 or later (the "LGPL"),//  in which case the provisions of the GPL or the LGPL are applicable instead//  of those above. If you wish to allow use of your version of this file only//  under the terms of either the GPL or the LGPL, and not to allow others to//  use your version of this file under the terms of the MPL, indicate your//  decision by deleting the provisions above and replace them with the notice//  and other provisions required by the GPL or the LGPL. If you do not delete//  the provisions above, a recipient may use your version of this file under//  the terms of any one of the MPL, the GPL or the LGPL.//////////////////////////////////////////////////////////////////////////////////package org.openzoom.examples.ityl.pages{import flash.display.SimpleButton;import flash.events.MouseEvent;import flash.geom.Rectangle;import org.openzoom.examples.ityl.ReturnButtonAsset;import org.openzoom.flash.events.RendererEvent;import org.openzoom.flash.renderers.Renderer;import org.openzoom.flash.viewport.IViewportTransform;import org.openzoom.flash.viewport.SceneViewport;import org.openzoom.flash.viewport.transformers.SmoothTransformer;public class Page extends Renderer{    //--------------------------------------------------------------------------    //    //  Constructor    //    //--------------------------------------------------------------------------    /**     * Constructor.     */    public function Page()    {        addEventListener(RendererEvent.ADDED_TO_SCENE,                         addedToSceneHandler,                         false, 0, true)        returnButton = new ReturnButtonAsset()        returnButton.scaleX = returnButton.scaleY = 0.6        returnButton.x = width - returnButton.width - 40        returnButton.y = 40        addChild(returnButton)    }    //--------------------------------------------------------------------------    //    //  Variables    //    //--------------------------------------------------------------------------    private var returnButton:SimpleButton    private var transformer:SmoothTransformer    //--------------------------------------------------------------------------    //    //  Methods    //    //--------------------------------------------------------------------------    public function focus():void    {//        var svp:ISceneViewport = SceneViewport.getInstance(viewport)//        svp.fitToBounds(getBounds(scene.targetCoordinateSpace), 0.8)        var t:IViewportTransform = viewport.transform        var bounds:Rectangle = getBounds(scene.targetCoordinateSpace)        bounds.x /= scene.sceneWidth        bounds.y /= scene.sceneHeight        bounds.width /= scene.sceneWidth        bounds.height /= scene.sceneHeight        t.fitToBounds(bounds, 0.8)        transformer.transform(t)    }    //--------------------------------------------------------------------------    //    //  Event handlers    //    //--------------------------------------------------------------------------    private function addedToSceneHandler(event:RendererEvent):void    {        transformer = SmoothTransformer.getInstance(viewport)        transformer.speed = 2        returnButton.addEventListener(MouseEvent.CLICK,                                      returnButton_clickHandler,                                      false, 0, true)    }    private function returnButton_clickHandler(event:MouseEvent):void    {        viewport.showAll()    }}}