// modification of /liquids/justwater for island ctf
textures/mitech/bluesky
{
	qer_editorimage env/sky1/sky001_ft.jpg
	nopicmip
	noMipMaps
//	q3map_lightmapFilterRadius self other
//	q3map_lightmapFilterRadius 0 8 //to blur q3map_skylight when it has less than 4 iterations, to avoid the "stadium effect"
//	q3map_skylight amount iterations
	q3map_skylight 70 1
	q3map_lightRGB 0.4 0.75 1
//	q3map_lightmapBrightness 2.0 
//	q3map_sunExt red green blue intensity degrees elevation deviance samples
	q3map_sunExt 1 0.84 0.51 120 200 40 1 1
//	q3map_lightsubdivide 256
	q3map_globaltexture
	skyParms env/sky1/sky001 512 -
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
}
textures/mitech/water
{
	qer_editorimage textures/liquids/pool3d_4b2.tga
	qer_trans 80
//	surfaceparm lightfilter
	surfaceparm nomarks
	surfaceparm trans
//	surfaceparm fog
	surfaceparm water
//	surfaceparm alphashadow
	surfaceparm nolightmap
	//deformVertexes wave <div> <func> <base> <amplitude> <phase> <freq>
    deformVertexes wave 555 sin 0 3 0 0.3
	tessSize 256
	q3map_globaltexture
	q3map_flare textures/flares/twilightflare
//	fogparms ( 0.215686 0.278431 0.333333 ) 512
	cull disable
	
	{
		//map $lightmap
		map env/sky1/sky001_ft.jpg
		blendfunc blend
        tcGen environment
		tcmod scale 1 1 
		rgbGen identity   
		alphaGen wave inversesawtooth 0.20 0 0 1 
	}

	{
		map textures/liquids/pool3d_4b2.tga
		blendfunc blend
		rgbGen const ( 0.384314 0.501961 0.568627 )
		tcMod scroll 0.05 -0.05
		alphaGen wave inversesawtooth 0.30 0 0 1 
	}

	{
		map textures/liquids/bubbles.tga
		blendfunc blend
		rgbGen const ( 0.384314 0.501961 0.568627 )
		tcmod scale .2 .2 
		alphaGen wave inversesawtooth 0.03 0 0 1 
	}
	
	{
		map textures/liquids/bubbles.tga
		blendfunc blend
		rgbGen const ( 0.384314 0.501961 0.568627 )
		tcmod scale .1 .1 
		alphaGen wave inversesawtooth 0.03 0 0 1 
	}

	{
		map textures/liquids/bubbles.tga
		blendfunc blend
		rgbGen const ( 0.384314 0.501961 0.568627 )
		tcmod scale .05 .05 
		alphaGen wave inversesawtooth 0.03 0 0 1 
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}	
}
textures/mitech/watercover
{
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm fog
	surfaceparm nolightmap
	cull disable
	qer_trans 0.20
	fogparms ( 0.215686 0.278431 0.333333 ) 512
}