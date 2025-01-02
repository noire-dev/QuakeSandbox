// 
// Noire's Mod
// 
// Copyright (C) 1999-2005 ID Software, Inc.
// Copyright (C) 2008-2012 OpenArena Team
// Copyright (C) 2023-2024 Noire.dev
// Copyright (C) 2025 Noctis Team
// 
// This file is part of Noire's Mod.
// 
// Noire's Mod is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License, version 2,
// as published by the Free Software Foundation.
// 
// This modified code is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this project. If not, see <http://www.gnu.org/licenses/>.
// 
// Contact: noctisdevs@gmail.com
// 

/*****************************************************************************
 * name:		be_aas_routealt.h
 *
 * desc:		AAS
 *
 * $Archive: /source/code/botlib/be_aas_routealt.h $
 *
 *****************************************************************************/

#ifdef AASINTERN
void AAS_InitAlternativeRouting(void);
void AAS_ShutdownAlternativeRouting(void);
#endif //AASINTERN


int AAS_AlternativeRouteGoals(vec3_t start, int startareanum, vec3_t goal, int goalareanum, int travelflags,
										aas_altroutegoal_t *altroutegoals, int maxaltroutegoals,
										int type);
