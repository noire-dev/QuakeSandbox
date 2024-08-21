whitecolor
{
	{
		map whitecolor.tga
		rgbGen entity
		alphaGen entity
	}
}

models/fogtex1
{
	nopicmip
	cull back
	{
		map models/fogtex1.tga
		blendFunc blend
		rgbGen entity
		alphaGen entity
	}
}

models/skytex1
{
	nopicmip
	cull back
	sort 2
	{
		map models/fogtex1.tga
		blendFunc blend
		rgbGen entity
		alphaGen entity
	}
}