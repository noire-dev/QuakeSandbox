// ------------------------------------------------------------
// Shaders for Q3Rally Cars - rewritten by insellium
// based on all car shader files
// using in Quake Sandbox
// ------------------------------------------------------------

// ------------------------------------------------------------
// 1.ALPINE
// ------------------------------------------------------------

//ALPINE SHARED


ptex/props/veh_alpine/res/tlites
{
  	{
	  	map ptex/props/veh_alpine/res/tlites.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_alpine/res/tlites_g.tga
            blendFunc add
		rgbGen identity
	}    
}

//ALPINE COLORS

//DEFAULT - YELLOW

ptex/props/veh_alpine/res/yellowglass
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		blendFunc	add
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_alpine/res/yellow.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_alpine/res/yellow
{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg            
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/yellow.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/yellowhglass
{      

      {
	  	map ptex/props/veh_alpine/res/yellowhglass_t.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		blendFunc add         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/yellowhglass.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/yellowhlite
{
  	{
	  	map ptex/props/veh_alpine/res/yellowhlite.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_alpine/res/hliteglow.tga
            blendFunc add
		rgbGen identity
	}    
}


//BLUE

ptex/props/veh_alpine/res/blueglass
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg            
		tcGen environment
		blendFunc	add
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_alpine/res/blue.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_alpine/res/blue
{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg            
		tcGen environment
			rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_alpine/res/blue.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/bluehglass
{      

	{
		map ptex/props/veh_alpine/res/bluehglass_t.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		blendFunc add         
		tcGen environment
		rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/bluehglass.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/bluehlite
{
  	{
	  	map ptex/props/veh_alpine/res/bluehlite.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_alpine/res/hliteglow.tga
            blendFunc add
		rgbGen identity
	}    
}


//RED


ptex/props/veh_alpine/res/redglass
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		tcGen environment
		blendFunc	add
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_alpine/res/red.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_alpine/res/red
{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/red.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/redhglass
{      

      {
	  	map ptex/props/veh_alpine/res/redhglass_t.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		blendFunc add         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/redhglass.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/redhlite
{
  	{
	  	map ptex/props/veh_alpine/res/redhlite.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_alpine/res/hliteglow.tga
            blendFunc add
		rgbGen identity
	}    
}

//GREEN


ptex/props/veh_alpine/res/greenglass
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		tcGen environment
		blendFunc	add
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_alpine/res/green.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_alpine/res/green
{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/green.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/greenhglass
{      

      {
	  	map ptex/props/veh_alpine/res/greenhglass_t.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		blendFunc add         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/greenhglass.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/greenhlite
{
  	{
	  	map ptex/props/veh_alpine/res/greenhlite.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_alpine/res/hliteglow.tga
            blendFunc add
		rgbGen identity
	}    
}


//FRENCH FRAG FACTORY SKIN


ptex/props/veh_alpine/res/fffglass
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		tcGen environment
		blendFunc	add
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_alpine/res/fff.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_alpine/res/fff
{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/fff.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/fffhglass
{      

      {
	  	map ptex/props/veh_alpine/res/fffhglass_t.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		blendFunc add         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/fffhglass.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/fffhlite
{
  	{
	  	map ptex/props/veh_alpine/res/fffhlite.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_alpine/res/hliteglow.tga
            blendFunc add
		rgbGen identity
	}    
}

ptex/props/veh_alpine/res/fffflite
{
  	{
	  	map ptex/props/veh_alpine/res/fffflite.tga
		depthWrite
		rgbGen lightingdiffuse
	} 
}

//STOMPED SPONSOR SKIN

ptex/props/veh_alpine/res/stompedglass
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		tcGen environment
		blendFunc	add
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_alpine/res/stomped.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_alpine/res/stomped
{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/stomped.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/stompedhglass
{      

      {
	  	map ptex/props/veh_alpine/res/stompedhglass_t.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		blendFunc add         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/stompedhglass.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}

}

ptex/props/veh_alpine/res/stompedhlite
{
  	{
	  	map ptex/props/veh_alpine/res/stompedhlite.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_alpine/res/hliteglow.tga
            blendFunc add
		rgbGen identity
	}    
}

ptex/props/veh_alpine/res/stompedflite
{
  	{
	  	map ptex/props/veh_alpine/res/stompedflite.tga
		depthWrite
		rgbGen lightingdiffuse
	} 
}

//Noire.dev SKIN

ptex/props/veh_alpine/res/noiredevglass
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		tcGen environment
		blendFunc	add
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_alpine/res/noiredev.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_alpine/res/noiredev
{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/noiredev.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}


         
}

ptex/props/veh_alpine/res/noiredevhglass
{      

      {
	  	map ptex/props/veh_alpine/res/noiredevhglass_t.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg   
		blendFunc add         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_alpine/res/noiredevhglass.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}

}

ptex/props/veh_alpine/res/noiredevhlite
{
  	{
	  	map ptex/props/veh_alpine/res/noiredevhlite.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_alpine/res/hliteglow.tga
            blendFunc add
		rgbGen identity
	}    
}

ptex/props/veh_alpine/res/noiredevflite
{
  	{
	  	map ptex/props/veh_alpine/res/noiredevflite.tga
		depthWrite
		rgbGen lightingdiffuse
	} 
}

// ------------------------------------------------------------
// 2.CAMARO
// ------------------------------------------------------------

//CAMARO COLORS

//DEFAULT - YELLOW


ptex/props/veh_camaro/res/body_yellow
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/body_yellow.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines1_yellow
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines1_yellow.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines2_yellow
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines2_yellow.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/mirror_yellow
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/mirror_yellow.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

//DEFAULT - BLUE


ptex/props/veh_camaro/res/body_blue
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/body_blue.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines1_blue
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines1_blue.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines2_blue
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines2_blue.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/mirror_blue
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/mirror_blue.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

//DEFAULT - GREEN

ptex/props/veh_camaro/res/body_green
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/body_green.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines1_green
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines1_green.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines2_green
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines2_green.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/mirror_green
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/mirror_green.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

//DEFAULT - RED


ptex/props/veh_camaro/res/body_red
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/body_red.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines1_red
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines1_red.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines2_red
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines2_red.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/mirror_red
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/mirror_red.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

//DEFAULT - WHITE

ptex/props/veh_camaro/res/body_white
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/body_white.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines1_white
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines1_white.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines2_white
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines2_white.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/mirror_white
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/mirror_white.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

//DEFAULT - BLACK


ptex/props/veh_camaro/res/body_black
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/body_black.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines1_black
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines1_black.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/lines2_black
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/lines2_black.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_camaro/res/mirror_black
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/mirror_black.tga
		alphaGen const 0.8
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

//SHARED - GLASS


ptex/props/veh_camaro/res/glass
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_camaro/res/glass.tga
		alphaGen const 0.2
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

// ------------------------------------------------------------
// 3.MACDADDY
// ------------------------------------------------------------

//MACDADDY SHARED

ptex/props/veh_macdaddy/res/tlites

{
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
  	{
	  	map ptex/props/veh_macdaddy/res/tlites.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_macdaddy/res/tlites_g.tga
            blendFunc add
		rgbGen identity
	}    
}

//MACDADDY COLORS

//RED

ptex/props/veh_macdaddy/res/red_main

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg              
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/red_main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_macdaddy/res/red_hlites

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg              
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/red_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_macdaddy/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}  
         
}

//BLACK

ptex/props/veh_macdaddy/res/black_main

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/black_main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_macdaddy/res/red_hlites

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/black_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_macdaddy/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}  
         
}

//BLUE

ptex/props/veh_macdaddy/res/blue_main

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/blue_main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_macdaddy/res/blue_hlites

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/blue_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_macdaddy/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}  
         
}


//CHECKER

ptex/props/veh_macdaddy/res/checker_main

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/checker_main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_macdaddy/res/checker_hlites

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/checker_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_macdaddy/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}  
         
}

ptex/props/veh_macdaddy/res/checker_ornament

{
	cull disable
	
	{
		map ptex/props/veh_macdaddy/res/checker_main.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}
}



//CLASSIC

ptex/props/veh_macdaddy/res/classic_main

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/classic_main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_macdaddy/res/classic_hlites

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/classic_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_macdaddy/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}  
         
}

ptex/props/veh_macdaddy/res/classic_ornament

{
	cull disable
	
	{
		map ptex/props/veh_macdaddy/res/classic_main.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}
}


//GREEN

ptex/props/veh_macdaddy/res/green_main

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/green_main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_macdaddy/res/green_hlites

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/green_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_macdaddy/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}  
         
}

ptex/props/veh_macdaddy/res/green_ornament

{
	cull disable
	
	{
		map ptex/props/veh_macdaddy/res/green_main.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}
}


//PINK

ptex/props/veh_macdaddy/res/pink_main

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/pink_main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_macdaddy/res/pink_hlites

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/pink_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_macdaddy/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}  
         
}


//PURPLE

ptex/props/veh_macdaddy/res/purple_main

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/purple_main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_macdaddy/res/purple_hlites

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/purple_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_macdaddy/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}  
         
}

ptex/props/veh_macdaddy/res/purple_ornament

{
	cull disable
	
	{
		map ptex/props/veh_macdaddy/res/purple_main.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}
}

//WHITE

ptex/props/veh_macdaddy/res/white_main

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/white_main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_macdaddy/res/white_hlites

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/white_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_macdaddy/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}  
         
}


//YELLOW

ptex/props/veh_macdaddy/res/yellow_main

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/yellow_main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_macdaddy/res/yellow_hlites

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/yellow_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_macdaddy/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}  
         
}

ptex/props/veh_macdaddy/res/yellow_ornament

{
	cull disable
	
	{
		map ptex/props/veh_macdaddy/res/yellow_main.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}
}

//Hit or Miss

ptex/props/veh_macdaddy/res/hitormiss_main

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/hitormiss_main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_macdaddy/res/hitormiss_hlites

{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_macdaddy/res/hitormiss_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_macdaddy/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}  
         
}

// ------------------------------------------------------------
// 4.MINI
// ------------------------------------------------------------

//MINI SHADERS

ptex/props/veh_mini/res/main
{      
      {
	  	map ptex/props/veh_mini/res/main.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add       
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/main.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_mini/res/hlites
{

      {
	  	map ptex/props/veh_mini/res/hlites.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
  	{
		map ptex/props/veh_alpine/res/reflect.jpg     
		blendFunc add             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
      {
		map ptex/props/veh_mini/res/hlites_g.tga
            blendFunc add
		rgbGen lightingdiffuse
	}    
}

ptex/props/veh_mini/res/tlites
{
  	{
	  	map ptex/props/veh_mini/res/tlites.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_mini/res/tlites_g.tga
            blendFunc add
		rgbGen lightingdiffuse
	}    
}

ptex/props/veh_mini/res/roof
{      
      {
	  	map ptex/props/veh_mini/res/roof.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
            tcGen environment
		blendFunc add
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/roof.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_mini/res/glass_int
{
	{
		map ptex/props/veh_mini/res/glass_int.tga
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_mini/res/glass
{
	{
		map ptex/props/veh_mini/res/glass.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		tcGen environment
		blendFunc add
	}
	{
		map ptex/props/veh_mini/res/glass_r.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
}


ptex/props/veh_mini/res/int
{
	{
		map ptex/props/veh_mini/res/int.tga
		rgbGen lightingdiffuse
	}
}
/*
ptex/props/veh_mini/res/fogflare
{
	{
		map ptex/props/veh_mini/res/fogflare.tga
		blendFunc add
		rgbGen lightingdiffuse
	}
}
*/
ptex/props/veh_mini/res/foglite
{
	{
		map ptex/props/veh_mini/res/foglite.tga
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_mini/res/foglite_g.tga
		blendFunc add
		rgbGen lightingdiffuse
	}
}
/*
ptex/props/veh_mini/res/rfoglite
{
	{
		map ptex/props/veh_mini/res/rfoglite.tga
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_mini/res/rfoglite_g.tga
		blendFunc add
		rgbGen lightingdiffuse
	}
}
*/

//UNION JACK VERSION

ptex/props/veh_mini/res/main_uj
{      
      {
	  	map ptex/props/veh_mini/res/main_uj.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add       
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/main_uj.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_mini/res/hlites_uj
{

      {
	  	map ptex/props/veh_mini/res/hlites_uj.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
  	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/hlites_uj.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
      {
		map ptex/props/veh_mini/res/hlites_g.tga
            blendFunc add
		rgbGen lightingdiffuse
	}    
}

ptex/props/veh_mini/res/roof_uj
{      
      {
	  	map ptex/props/veh_mini/res/roof_uj.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
            tcGen environment
            blendFunc add
	}
      {
	  	map ptex/props/veh_mini/res/roof_uj.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_mini/res/glass_uj
{
	{
		map ptex/props/veh_mini/res/glass_uj.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		tcGen environment
		blendFunc add
	}
	{
		map ptex/props/veh_mini/res/glass_uj_r.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
}

//YELLOW VERSION

ptex/props/veh_mini/res/main_yellow
{      
      {
	  	map ptex/props/veh_mini/res/main_yellow.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add       
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/main_yellow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_mini/res/hlites_yellow
{

      {
	  	map ptex/props/veh_mini/res/hlites_yellow.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
  	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/hlites_yellow.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
      {
		map ptex/props/veh_mini/res/hlites_g.tga
            blendFunc add
		rgbGen lightingdiffuse
	}    
}

ptex/props/veh_mini/res/roof_yellow
{      
      {
	  	map ptex/props/veh_mini/res/roof_yellow.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
            tcGen environment
            blendFunc add
	}
      {
	  	map ptex/props/veh_mini/res/roof_yellow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_mini/res/glass_yellow
{
	{
		map ptex/props/veh_mini/res/glass_yellow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		tcGen environment
		blendFunc add
	}
	{
		map ptex/props/veh_mini/res/glass_yellow_r.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
}


//GREEN VERSION

ptex/props/veh_mini/res/main_green
{      
      {
	  	map ptex/props/veh_mini/res/main_green.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add       
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/main_green.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_mini/res/hlites_green
{

      {
	  	map ptex/props/veh_mini/res/hlites_green.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
  	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/hlites_green.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
      {
		map ptex/props/veh_mini/res/hlites_g.tga
            blendFunc add
		rgbGen lightingdiffuse
	}    
}


ptex/props/veh_mini/res/glass_green
{
	{
		map ptex/props/veh_mini/res/glass_green.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		tcGen environment
		blendFunc add
	}
	{
		map ptex/props/veh_mini/res/glass_green_r.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
}


//GAMESPY VERSION

ptex/props/veh_mini/res/gamespy_main
{      
      {
	  	map ptex/props/veh_mini/res/gamespy_main.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add       
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/gamespy_main.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_mini/res/gamespy_hlites
{

      {
	  	map ptex/props/veh_mini/res/gamespy_hlites.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
  	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/gamespy_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
      {
		map ptex/props/veh_mini/res/hlites_g.tga
            blendFunc add
		rgbGen lightingdiffuse
	}    
}


ptex/props/veh_mini/res/gamespy_glass
{
	{
		map ptex/props/veh_mini/res/gamespy_glass.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		tcGen environment
		blendFunc add
	}
	{
		map ptex/props/veh_mini/res/gamespy_glass_r.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
}


ptex/props/veh_mini/res/gamespy_roof
{      
      {
	  	map ptex/props/veh_mini/res/gamespy_roof.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
            tcGen environment
		blendFunc add
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/gamespy_roof.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}



//TELEFRAGGED VERSION

ptex/props/veh_mini/res/telefragged_main
{      
      {
	  	map ptex/props/veh_mini/res/telefragged_main.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add       
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/telefragged_main.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_mini/res/telefragged_hlites
{

      {
	  	map ptex/props/veh_mini/res/telefragged_hlites.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
  	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/telefragged_hlites.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
      {
		map ptex/props/veh_mini/res/hlites_g.tga
            blendFunc add
		rgbGen lightingdiffuse
	}    
}


ptex/props/veh_mini/res/telefragged_glass
{
	{
		map ptex/props/veh_mini/res/telefragged_glass.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		tcGen environment
		blendFunc add
	}
	{
		map ptex/props/veh_mini/res/telefragged_glass_r.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_mini/res/telefragged_roof
{      
      {
	  	map ptex/props/veh_mini/res/telefragged_roof.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
            tcGen environment
		blendFunc add
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/telefragged_roof.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

//VAPORWAVE VERSION

ptex/props/veh_mini/res/main_vaporwave
{      
      {
	  	map ptex/props/veh_mini/res/main_vaporwave.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add       
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/main_vaporwave.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_mini/res/hlites_vaporwave
{

      {
	  	map ptex/props/veh_mini/res/hlites_vaporwave.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
  	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/hlites_vaporwave.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
      {
		map ptex/props/veh_mini/res/hlites_g.tga
            blendFunc add
		rgbGen lightingdiffuse
	}    
}

ptex/props/veh_mini/res/roof_vaporwave
{      
      {
	  	map ptex/props/veh_mini/res/roof_vaporwave.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg  
            tcGen environment
            blendFunc add
	}
      {
	  	map ptex/props/veh_mini/res/roof_vaporwave.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_mini/res/glass_vaporwave
{
	{
		map ptex/props/veh_mini/res/glass_vaporwave.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg  
		tcGen environment
		blendFunc add
	}
	{
		map ptex/props/veh_mini/res/glass_uj_r.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
}

//BROWN

ptex/props/veh_mini/res/brown_main
{      
      {
	  	map ptex/props/veh_mini/res/brown_main.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add       
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/brown_main.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//          blendFunc GL_SRC_ALPHA GL_ONE
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_mini/res/hlites_brown
{

      {
	  	map ptex/props/veh_mini/res/hlites_brown.tga
		depthWrite
		rgbGen lightingdiffuse
	}       
  	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg  
		blendFunc add             
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_mini/res/hlites_brown.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
      {
		map ptex/props/veh_mini/res/hlites_g.tga
            blendFunc add
		rgbGen lightingdiffuse
	}    
}


ptex/props/veh_mini/res/glass_brown
{
	{
		map ptex/props/veh_mini/res/glass_brown.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg  
		tcGen environment
		blendFunc add
	}
	{
		map ptex/props/veh_mini/res/glass_brown_r.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
}

// ------------------------------------------------------------
// 5.MURCIELAGO
// ------------------------------------------------------------

//moddb
ptex/props/veh_murcielago/res/moddb_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/moddb_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//flame
ptex/props/veh_murcielago/res/flame_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/flame_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//whitestripe
ptex/props/veh_murcielago/res/silverstripe_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/silverstripe_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//bluestripe
ptex/props/veh_murcielago/res/bluestripe_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/bluestripe_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//redstripe
ptex/props/veh_murcielago/res/redstripe_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/redstripe_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//whitehot
ptex/props/veh_murcielago/res/whitehot_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/whitehot_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//yellow
ptex/props/veh_murcielago/res/yellow_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/yellow_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_murcielago/res/yellow_under
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/yellow_under.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//green
ptex/props/veh_murcielago/res/green_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/green_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_murcielago/res/green_under
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/green_under.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//black
ptex/props/veh_murcielago/res/black_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/black_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_murcielago/res/black_under
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/black_under.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//silver
ptex/props/veh_murcielago/res/silver_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/silver_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_murcielago/res/silver_under
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/silver_under.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//red
ptex/props/veh_murcielago/res/red_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/red_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_murcielago/res/red_under
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/red_under.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//blue
ptex/props/veh_murcielago/res/blue_main
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/blue_main.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_murcielago/res/blue_under
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/blue_under.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

// standard
ptex/props/veh_murcielago/res/glass
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/glass.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_murcielago/res/blite
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/blite.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
	{
		map ptex/props/veh_murcielago/res/blite_g.tga
		blendfunc add
		rgbGen identity
	}
}

ptex/props/veh_murcielago/res/blitec
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/blitec.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_murcielago/res/hlite
{
	{
		map ptex/props/veh_murcielago/res/hlite.tga
		rgbGen lightingDiffuse
	}
	{
		map ptex/props/veh_murcielago/res/hlite_g.tga
		blendfunc add
		rgbGen identity
	}
}

ptex/props/veh_murcielago/res/hglass
{
	{
		map ptex/props/veh_murcielago/res/hglass_t.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GT0
	}
	{
		map ptex/props/veh_alpine/res/reflect.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map ptex/props/veh_murcielago/res/hglass.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

// ------------------------------------------------------------
// 6.RAPTOR
// ------------------------------------------------------------

ptex/props/veh_raptor/res/hlites
{
  	{
	  	map ptex/props/veh_raptor/res/hlites.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_raptor/res/hlites_g.tga
            blendFunc add
		rgbGen identity
	}    
}


ptex/props/veh_raptor/res/flites
{
  	{
	  	map ptex/props/veh_raptor/res/flites.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_raptor/res/flites_g.tga
            blendFunc add
		rgbGen identity
	}    
}



ptex/props/veh_raptor/res/tlites
{
  	{
	  	map ptex/props/veh_raptor/res/tlites.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_raptor/res/tlites.tga
            blendFunc add
		rgbGen identity
	}    
}

//GREEN

ptex/props/veh_raptor/res/green
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/green.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_raptor/res/green_parts
{      

	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/green_parts.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


//BLACK

ptex/props/veh_raptor/res/black
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/black.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_raptor/res/black_parts
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/black_parts.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


//BLUE

ptex/props/veh_raptor/res/blue
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/blue.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_raptor/res/blue_parts
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/blue_parts.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}

//JP

ptex/props/veh_raptor/res/jp
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/jp.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_raptor/res/jp_parts
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/jp_parts.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


//PINK

ptex/props/veh_raptor/res/pink
{      

	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/pink.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_raptor/res/pink_parts
{      

	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/pink_parts.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


//RED

ptex/props/veh_raptor/res/red
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/red.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_raptor/res/red_parts
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/red_parts.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


//YELLOW

ptex/props/veh_raptor/res/yellow
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/yellow.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_raptor/res/yellow_parts
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/yellow_parts.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}

//WEBDOG - WWW.WEBDOG.ORG

ptex/props/veh_raptor/res/webdog
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/webdog.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_raptor/res/webdog_parts
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/webdog_parts.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_raptor/res/webdog_lites
{
  	{
	  	map ptex/props/veh_raptor/res/webdog_lites2.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_raptor/res/flites_g.tga
            blendFunc add
		rgbGen identity
	}    
}

ptex/props/veh_raptor/res/webdog_lites2
{
  	{
	  	map ptex/props/veh_raptor/res/webdog_lites.tga
		depthWrite
		rgbGen lightingdiffuse
	}
}



//..::LvL - WWW.PLANETQUAKE.COM/LVL

ptex/props/veh_raptor/res/lvl
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/lvl.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}


ptex/props/veh_raptor/res/lvl_parts
{      
	{
	//	map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/lvl_parts.tga
       //     blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_raptor/res/lvl_lites
{
  	{
	  	map ptex/props/veh_raptor/res/lvl_lites.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_raptor/res/flites_g.tga
            blendFunc add
		rgbGen identity
	}    
}

// DREAMCAST

ptex/props/veh_raptor/res/dreamcast
{      
	{
		map ptex/props/veh_alpine/res/reflect.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_raptor/res/dreamcast.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

// ------------------------------------------------------------
// 7.REAPER
// ------------------------------------------------------------

//REAPER SHARED

ptex/props/veh_reaper/res/net
{

	{
		map ptex/props/veh_reaper/res/parts.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}

//REAPER COLORS

//DEFAULT SKIN

ptex/props/veh_reaper/res/main
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/parts
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/parts.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/hlites
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/main.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/tlites
{
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
  	{
	  	map ptex/props/veh_reaper/res/tlites.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_reaper/res/bumper

{
	{
		map ptex/props/veh_reaper/res/parts.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}



//RED SKIN

ptex/props/veh_reaper/res/net_red
{

	{
		map ptex/props/veh_reaper/res/parts_red.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}


ptex/props/veh_reaper/res/main_red
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/main_red.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/parts_red
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/parts_red.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/hlites_red
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/main_red.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/tlites_red
{
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
  	{
	  	map ptex/props/veh_reaper/res/tlites_red.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_reaper/res/bumper_red

{
	{
		map ptex/props/veh_reaper/res/parts_red.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}


//YELLOW SKIN

ptex/props/veh_reaper/res/net_yellow
{

	{
		map ptex/props/veh_reaper/res/parts_yellow.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}


ptex/props/veh_reaper/res/main_yellow
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/main_yellow.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/parts_yellow
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/parts_yellow.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/hlites_yellow
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/main_yellow.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/tlites_yellow
{
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
  	{
	  	map ptex/props/veh_reaper/res/tlites_yellow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_reaper/res/bumper_yellow

{
	{
		map ptex/props/veh_reaper/res/parts_yellow.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}


//GREEN SKIN

ptex/props/veh_reaper/res/net_green
{

	{
		map ptex/props/veh_reaper/res/parts_green.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}


ptex/props/veh_reaper/res/main_green
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/main_green.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/parts_green
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/parts_green.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/hlites_green
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/main_green.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/tlites_green
{
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
  	{
	  	map ptex/props/veh_reaper/res/tlites_green.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_reaper/res/bumper_green

{
	{
		map ptex/props/veh_reaper/res/parts_green.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}


//BLUE SKIN

ptex/props/veh_reaper/res/net_blue
{

	{
		map ptex/props/veh_reaper/res/parts_blue.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}


ptex/props/veh_reaper/res/main_blue
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/main_blue.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/parts_blue
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/parts_blue.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/hlites_blue
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/main_blue.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/tlites_blue
{
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
  	{
	  	map ptex/props/veh_reaper/res/tlites_blue.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_reaper/res/bumper_blue

{
	{
		map ptex/props/veh_reaper/res/parts_blue.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}


//TEAM RACE SKINS

//BARRYSWORLD SKIN

ptex/props/veh_reaper/res/net_bw
{

	{
		map ptex/props/veh_reaper/res/bw_parts.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}


ptex/props/veh_reaper/res/main_bw
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/bw.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/parts_bw
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/bw_parts.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/hlites_bw
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/bw.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/tlites_bw
{
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
  	{
	  	map ptex/props/veh_reaper/res/bw_tlites.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_reaper/res/bumper_bw

{
	{
		map ptex/props/veh_reaper/res/bw_parts.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}


//SHUGASHACK SKIN

ptex/props/veh_reaper/res/net_shack
{

	{
		map ptex/props/veh_reaper/res/shack_parts.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}


ptex/props/veh_reaper/res/main_shack
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/shack.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/parts_shack
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/shack_parts.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/hlites_shack
{      
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_reaper/res/shack.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}       
}

ptex/props/veh_reaper/res/tlites_shack
{
	{
		map ptex/props/veh_alpine/res/chrometest2.jpg
            tcGen environment
            rgbGen lightingdiffuse
	}
  	{
	  	map ptex/props/veh_reaper/res/shack_tlites.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
}

ptex/props/veh_reaper/res/bumper_shack

{
	{
		map ptex/props/veh_reaper/res/shack_parts.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}
}

// ------------------------------------------------------------
// 8.SIDEPIPE
// ------------------------------------------------------------

//SIDEPIPE MAPS

//SIDEPIPE SHARED

//HEADLITE AND TAILLITE 

ptex/props/veh_sidepipe/res/facias

{
  	{
	  	map ptex/props/veh_sidepipe/res/facias.tga
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_sidepipe/res/facias_g.tga
            blendFunc add
		rgbGen identity
	}    
}


//TRANSMISSION CASING

ptex/props/veh_sidepipe/res/tranny

{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
            tcGen environment
            rgbGen identity
	}
      {
	  	map ptex/props/veh_sidepipe/res/tranny.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
         
}




//SIDEPIPE COLORS

//ORANGE

ptex/props/veh_sidepipe/res/orange
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
            tcGen environment
            rgbGen identity
	}
      {
	  	map ptex/props/veh_sidepipe/res/orange.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}


//RED

ptex/props/veh_sidepipe/res/red
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_sidepipe/res/red.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}



//BLUE

ptex/props/veh_sidepipe/res/blue
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_sidepipe/res/blue.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
         
}


//GREEN

ptex/props/veh_sidepipe/res/green
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_sidepipe/res/green.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
         
}


//YELLOW

ptex/props/veh_sidepipe/res/yellow
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg           
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_sidepipe/res/yellow.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
         
}

//POLYCOUNT SPONSOR SKIN - www.planetquake.com/polycount
//SKIN BY

ptex/props/veh_sidepipe/res/polycount
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_sidepipe/res/polycount.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_sidepipe/res/polycount_f
{
  	{
	  	map ptex/props/veh_sidepipe/res/polycount_f.tga
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_sidepipe/res/facias_g.tga
            blendFunc add
		rgbGen identity
	}    
}


//ROCKET ARENA 3 SPONSOR SKIN - www.planetquake.com/arena

ptex/props/veh_sidepipe/res/ra3
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_sidepipe/res/ra3.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
         
}

ptex/props/veh_sidepipe/res/ra3_f
{
  	{
	  	map ptex/props/veh_sidepipe/res/ra3_f.tga
		depthWrite
		rgbGen lightingdiffuse
	}
      {
		map ptex/props/veh_sidepipe/res/facias_g.tga
            blendFunc add
		rgbGen identity
	}    
}

// ------------------------------------------------------------
// 9.SLINGSHOT
// ------------------------------------------------------------

//COMMON

ptex/props/veh_slingshot/res/glass
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
            rgbGen lightingdiffuse
	}
	{
		map ptex/props/veh_slingshot/res/glass.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}

ptex/props/veh_slingshot/res/glass_conv
{
	cull none

	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
		blendFunc add
            rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_slingshot/res/glass.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}


ptex/props/veh_slingshot/res/roof
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
            rgbGen lightingdiffuse

	}
	{
		map ptex/props/veh_slingshot/res/roof.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}



//ptex/props/veh_slingshot/res/int
//
//{
//	{
//		map ptex/props/veh_slingshot/res/int.tga
//            rgbGen lightingdiffuse
//
//	}
//}

ptex/props/veh_slingshot/res/tlites

{
	{
		map ptex/props/veh_slingshot/res/tlites.tga
            rgbGen lightingdiffuse

	}
}
ptex/props/veh_slingshot/res/hlites

{
	{
		map ptex/props/veh_slingshot/res/hlites.tga
            rgbGen lightingdiffuse

	}
}

//SLINGSHOT COLORS

ptex/props/veh_slingshot/res/main
{

	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
          rgbGen lightingdiffuse
	}
{
		map ptex/props/veh_slingshot/res/blue_main.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}

ptex/props/veh_slingshot/res/blue_main
{

	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
          rgbGen lightingdiffuse
	}
{
		map ptex/props/veh_slingshot/res/blue_main.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}

ptex/props/veh_slingshot/res/yellow_main
{

	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
          rgbGen lightingdiffuse
	}
{
		map ptex/props/veh_slingshot/res/yellow_main.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}

ptex/props/veh_slingshot/res/red_main
{

	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
          rgbGen lightingdiffuse
	}
{
		map ptex/props/veh_slingshot/res/red_main.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}

ptex/props/veh_slingshot/res/green_main
{

	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
          rgbGen lightingdiffuse
	}
{
		map ptex/props/veh_slingshot/res/green_main.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}

//PS2
ptex/props/veh_slingshot/res/ps2_main
{

	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
          rgbGen lightingdiffuse
	}
{
		map ptex/props/veh_slingshot/res/ps2_main.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}

ptex/props/veh_slingshot/res/ps2_roof
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
            rgbGen lightingdiffuse

	}
	{
		map ptex/props/veh_slingshot/res/ps2_roof.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}

//PLANETQUAKE.DE 

ptex/props/veh_slingshot/res/pqde_main
{

	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
          rgbGen lightingdiffuse
	}
{
		map ptex/props/veh_slingshot/res/pqde_main.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}


ptex/props/veh_slingshot/res/pqde_roof
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
            rgbGen lightingdiffuse

	}
	{
		map ptex/props/veh_slingshot/res/pqde_roof.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}

ptex/props/veh_slingshot/res/pqde_tlites

{
	{
		map ptex/props/veh_slingshot/res/pqde_tlites.tga
            rgbGen lightingdiffuse

	}
}

//THE BIG HOUSE 

ptex/props/veh_slingshot/res/tbh_main
{

	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
          rgbGen lightingdiffuse
	}
{
		map ptex/props/veh_slingshot/res/tbh_main.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}


ptex/props/veh_slingshot/res/tbh_roof
{
	{
		map ptex/props/veh_alpine/res/reflect.jpg
		tcGen environment
            rgbGen lightingdiffuse

	}
	{
		map ptex/props/veh_slingshot/res/tbh_roof.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
            rgbGen lightingdiffuse

	}
}

ptex/props/veh_slingshot/res/tbh_tlites

{
	{
		map ptex/props/veh_slingshot/res/tbh_tlites.tga
            rgbGen lightingdiffuse

	}
}

// ------------------------------------------------------------
// 10.VIPER
// ------------------------------------------------------------

//red

ptex/props/veh_viper/res/red
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/red.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/windows
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/windows.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/r_lites_red
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/r_lites_red.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/f_lites_red
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/f_lites_red.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

//blue

ptex/props/veh_viper/res/blue
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/blue.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/windows
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/windows.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/r_lites_blue
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/r_lites_blue.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/f_lites_blue
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/f_lites_blue.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

//yellow

ptex/props/veh_viper/res/yellow
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/yellow.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/windows
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/windows.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/r_lites_yellow
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/r_lites_yellow.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/f_lites_yellow
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/f_lites_yellow.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

//graphite

ptex/props/veh_viper/res/grey
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/grey.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/windows
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/windows.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/r_lites_grey
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/r_lites_grey.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/f_lites_grey
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/f_lites_grey.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

//stripe_red

ptex/props/veh_viper/res/stripe_red
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/stripe_red.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/windows
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/windows.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/r_lites_red
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/r_lites_red.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/f_lites_red
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/f_lites_red.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

//stripe_blue

ptex/props/veh_viper/res/stripe_blue
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/stripe_blue.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/windows
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/windows.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/r_lites_blue
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/r_lites_blue.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/f_lites_blue
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/f_lites_blue.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

//white

ptex/props/veh_viper/res/white
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/white.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/windows
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/windows.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/r_lites_white
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/r_lites_white.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/f_lites_white
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/f_lites_white.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

//green

ptex/props/veh_viper/res/green
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/green.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/windows
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/windows.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/r_lites_green
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/r_lites_green.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

ptex/props/veh_viper/res/f_lites_green
{
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
		tcGen environment
		rgbGen lightingdiffuse
	}

	{
		map ptex/props/veh_viper/res/f_lites_green.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		alphaFunc GT0
		depthWrite
		rgbGen lightingdiffuse
	}


}

//GRAVELORD

ptex/props/veh_gravelord/res/default
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map ptex/props/veh_gravelord/res/default.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//TEAM COLOR SKINS

ptex/props/veh_gravelord/res/green
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map ptex/props/veh_gravelord/res/green.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_gravelord/res/blue
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map ptex/props/veh_gravelord/res/blue.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_gravelord/res/yellow
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map ptex/props/veh_gravelord/res/yellow.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_gravelord/res/red
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map ptex/props/veh_gravelord/res/red.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

//ECTO-1 GHOSTBUSTERS SKIN

ptex/props/veh_gravelord/res/ecto
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map ptex/props/veh_gravelord/res/ecto.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_gravelord/res/windows
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map ptex/props/veh_gravelord/res/windows.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

ptex/props/veh_gravelord/res/curtain
{
	cull disable
	{
		map ptex/props/veh_gravelord/res/curtain.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_gravelord/res/coffin
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map ptex/props/veh_gravelord/res/coffin.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_gravelord/res/no_curtain
{

	{
		map ptex/props/veh_gravelord/res/no_curtain.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_gravelord/res/no_coffin
{

	{
		map ptex/props/veh_gravelord/res/no_coffin.tga
		blendfunc blend
		rgbGen lightingDiffuse
		depthWrite
	}
}

ptex/props/veh_gravelord/res/gb_windows
{
	{
		map ptex/props/veh_alpine/res/reflect.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map ptex/props/veh_gravelord/res/gb_windows.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//GRAVELORD
//ORANGE

ptex/props/veh_gremlin/res/orange
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
            tcGen environment
            rgbGen identity
	}
      {
	  	map ptex/props/veh_gremlin/res/orange.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}


//RED

ptex/props/veh_gremlin/res/red
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_gremlin/res/red.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}



//BLUE

ptex/props/veh_gremlin/res/blue
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_gremlin/res/blue.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
         
}


//GREEN

ptex/props/veh_gremlin/res/green
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg         
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_gremlin/res/green.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
         
}


//YELLOW

ptex/props/veh_gremlin/res/yellow
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg           
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_gremlin/res/yellow.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
         
}

//WHITE

ptex/props/veh_gremlin/res/white
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg           
            tcGen environment
            rgbGen lightingdiffuse
	}
      {
	  	map ptex/props/veh_gremlin/res/white.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingdiffuse
	}
         
}

//BLACK

ptex/props/veh_gremlin/res/black
{      
	{
//		map ptex/props/veh_alpine/res/tinfx2b.tga
		map ptex/props/veh_alpine/res/reflect.jpg          
            tcGen environment
            rgbGen identity
	}
      {
	  	map ptex/props/veh_gremlin/res/black.tga
            blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
		rgbGen lightingdiffuse
	}
         
}