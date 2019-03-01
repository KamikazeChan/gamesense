require("lib_gamesense")
local maf = require("lib_maf")
-- [About]------------------------------------------------------------------------------------------------------------------------------------------------------
-- Made by: w7rus (Astolfo)
-- Credits: Aviarita [lib_gamesense]
--          bjornbytes [lib_maf]

-- [Configuration] ["Do not edit below this line"]-------------------------------- [Description] ---------------------------------------------------------------

    b_esp_enable                                            = ui.new_checkbox("VISUALS", "Player ESP", "Ext-ESP")

    str_esp_filter_player                                   = ui.new_combobox("VISUALS", "Player ESP", "Players", {"Off", "On (Ally/Enemy)", "On (CT/T)"})
    str_esp_filter_playerType                               = ui.new_multiselect("VISUALS", "Player ESP", "Player Type", {"Ally", "Enemy", "CT", "T"})

    b_esp_filter_weapon                                     = ui.new_checkbox("VISUALS", "Player ESP", "Weapons")
    b_esp_filter_mapObjective                               = ui.new_checkbox("VISUALS", "Player ESP", "Objectives")
    b_esp_filter_other                                      = ui.new_checkbox("VISUALS", "Player ESP", "Other")

    str_esp_draw_box                                        = ui.new_combobox("VISUALS", "Player ESP", "Any > Box", {"Off", "On (Static 3D)", "On (Static 2D)"})
    b_esp_draw_snapline                                     = ui.new_checkbox("VISUALS", "Player ESP", "Any > Snapline")
    f_esp_anchorScreenX                                     = ui.new_slider("VISUALS", "Player ESP", "Any > Snapline (Center X)", 0, 100, 50, true, "%", 1)
    f_esp_anchorScreenY                                     = ui.new_slider("VISUALS", "Player ESP", "Any > Snapline (Center Y)", 0, 100, 50, true, "%", 1)
    b_esp_draw_snaplineEndPoint                             = ui.new_checkbox("VISUALS", "Player ESP", "Any > Origin Point")
    b_esp_draw_name                                         = ui.new_checkbox("VISUALS", "Player ESP", "Any > Name/Classname")
    b_esp_draw_health                                       = ui.new_checkbox("VISUALS", "Player ESP", "Any > Health")
    b_esp_draw_armor                                        = ui.new_checkbox("VISUALS", "Player ESP", "Any > Armor")
    str_esp_draw_distance                                   = ui.new_combobox("VISUALS", "Player ESP", "Any > Distance", {"Off", "Units", "Metric", "Imperial"})
    b_esp_draw_navlocation                                  = ui.new_checkbox("VISUALS", "Player ESP", "Any > NAV Location")
    b_esp_draw_weapons                                      = ui.new_checkbox("VISUALS", "Player ESP", "Any > Weapons")
    b_esp_draw_ammo                                         = ui.new_checkbox("VISUALS", "Player ESP", "Any > Weapons > Ammo")
    b_esp_draw_state                                        = ui.new_checkbox("VISUALS", "Player ESP", "Any > State Flags")

    i_esp_paddingScreenXY                                   = ui.new_slider("VISUALS", "Player ESP", "Any > Screen Padding", 0, math.floor(math.min(client.screen_size()) / 2), 128, true, "px", 1)
    
    b_esp_filter_playerEnemy_accentColor01                  = {255, 0, 170, 255} -- <array typeof uInt8_t> Invisible enemy players color
    b_esp_filter_playerEnemy_accentColor02                  = {170, 255, 0, 255} -- <array typeof uInt8_t> Visible enemy players color
    b_esp_filter_playerAlly_accentColor01                   = {0, 170, 255, 255} -- <array typeof uInt8_t> Invisible ally players color
    b_esp_filter_playerAlly_accentColor02                   = {0, 255, 170, 255} -- <array typeof uInt8_t> Visible ally players color
    b_esp_filter_playerEnemy_accentColor01_label            = ui.new_checkbox("VISUALS", "Player ESP", "Players > Enemy (Color Invis.)")
    b_esp_filter_playerEnemy_accentColor01_colorPicker      = ui.new_color_picker("VISUALS", "Player ESP", "Players > Enemy (Color Invis.)", 255, 0, 170, 255)
    ui.set_callback(b_esp_filter_playerEnemy_accentColor01_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_playerEnemy_accentColor01_colorPicker);
        b_esp_filter_playerEnemy_accentColor01 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_playerEnemy_accentColor01_colorPicker);
        b_esp_filter_playerEnemy_accentColor01 = {r, g, b , a}
    end
    b_esp_filter_playerEnemy_accentColor02_label            = ui.new_checkbox("VISUALS", "Player ESP", "Players > Enemy (Color Vis.)")
    b_esp_filter_playerEnemy_accentColor02_colorPicker      = ui.new_color_picker("VISUALS", "Player ESP", "Players > Enemy (Color Vis.)", 170, 255, 0, 255)
    ui.set_callback(b_esp_filter_playerEnemy_accentColor02_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_playerEnemy_accentColor02_colorPicker);
        b_esp_filter_playerEnemy_accentColor02 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_playerEnemy_accentColor02_colorPicker);
        b_esp_filter_playerEnemy_accentColor02 = {r, g, b , a}
    end
    b_esp_filter_playerAlly_accentColor01_label             = ui.new_checkbox("VISUALS", "Player ESP", "Players > Ally (Color Invis.)")
    b_esp_filter_playerAlly_accentColor01_colorPicker       = ui.new_color_picker("VISUALS", "Player ESP", "Players > Ally (Color Invis.)", 0, 170, 255, 255)
    ui.set_callback(b_esp_filter_playerAlly_accentColor01_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_playerAlly_accentColor01_colorPicker);
        b_esp_filter_playerAlly_accentColor01 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_playerAlly_accentColor01_colorPicker);
        b_esp_filter_playerAlly_accentColor01 = {r, g, b , a}
    end
    b_esp_filter_playerAlly_accentColor02_label             = ui.new_checkbox("VISUALS", "Player ESP", "Players > Ally (Color Vis.)")
    b_esp_filter_playerAlly_accentColor02_colorPicker       = ui.new_color_picker("VISUALS", "Player ESP", "Players > Ally (Color Vis.)", 0, 255, 170, 255)
    ui.set_callback(b_esp_filter_playerAlly_accentColor02_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_playerAlly_accentColor02_colorPicker);
        b_esp_filter_playerAlly_accentColor02 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_playerAlly_accentColor02_colorPicker);
        b_esp_filter_playerAlly_accentColor02 = {r, g, b , a}
    end

    b_esp_filter_playerT_accentColor01                      = {255, 0, 170, 255} -- <array typeof uInt8_t> Invisible Terrorist Team players color
    b_esp_filter_playerT_accentColor02                      = {170, 255, 0, 255} -- <array typeof uInt8_t> Visible Terrorist Team players color
    b_esp_filter_playerCT_accentColor01                     = {0, 170, 255, 255} -- <array typeof uInt8_t> Invisible Counter-Terrorist Team players color
    b_esp_filter_playerCT_accentColor02                     = {0, 255, 170, 255} -- <array typeof uInt8_t> Visible Counter-Terrorist Team players color
    b_esp_filter_playerT_accentColor01_label                = ui.new_checkbox("VISUALS", "Player ESP", "Players > T (Color Invis.)")
    b_esp_filter_playerT_accentColor01_colorPicker          = ui.new_color_picker("VISUALS", "Player ESP", "Players > T (Color Invis.)", 255, 0, 170, 255)
    ui.set_callback(b_esp_filter_playerT_accentColor01_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_playerT_accentColor01_colorPicker);
        b_esp_filter_playerT_accentColor01 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_playerT_accentColor01_colorPicker);
        b_esp_filter_playerT_accentColor01 = {r, g, b , a}
    end
    b_esp_filter_playerT_accentColor02_label                = ui.new_checkbox("VISUALS", "Player ESP", "Players > T (Color Vis.)")
    b_esp_filter_playerT_accentColor02_colorPicker          = ui.new_color_picker("VISUALS", "Player ESP", "Players > T (Color Vis.)", 170, 255, 0, 255)
    ui.set_callback(b_esp_filter_playerT_accentColor02_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_playerT_accentColor02_colorPicker);
        b_esp_filter_playerT_accentColor02 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_playerT_accentColor02_colorPicker);
        b_esp_filter_playerT_accentColor02 = {r, g, b , a}
    end
    b_esp_filter_playerCT_accentColor01_label               = ui.new_checkbox("VISUALS", "Player ESP", "Players > CT (Color Invis.)")
    b_esp_filter_playerCT_accentColor01_colorPicker         = ui.new_color_picker("VISUALS", "Player ESP", "Players > CT (Color Invis.)", 0, 170, 255, 255)
    ui.set_callback(b_esp_filter_playerCT_accentColor01_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_playerCT_accentColor01_colorPicker);
        b_esp_filter_playerCT_accentColor01 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_playerCT_accentColor01_colorPicker);
        b_esp_filter_playerCT_accentColor01 = {r, g, b , a}
    end
    b_esp_filter_playerCT_accentColor02_label               = ui.new_checkbox("VISUALS", "Player ESP", "Players > CT (Color Vis.)")
    b_esp_filter_playerCT_accentColor02_colorPicker         = ui.new_color_picker("VISUALS", "Player ESP", "Players > CT (Color Vis.)", 0, 255, 170, 255)
    ui.set_callback(b_esp_filter_playerCT_accentColor02_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_playerCT_accentColor02_colorPicker);
        b_esp_filter_playerCT_accentColor02 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_playerCT_accentColor02_colorPicker);
        b_esp_filter_playerCT_accentColor02 = {r, g, b , a}
    end

    b_esp_filter_weapons_accentColor01                      = {127, 127, 127, 63}-- <array typeof uInt8_t> Invisible weapon Entities color
    b_esp_filter_weapons_accentColor02                      = {255, 255, 255, 63}-- <array typeof uInt8_t> Visible weapon Entities color
    b_esp_filter_weapons_accentColor01_label                = ui.new_checkbox("VISUALS", "Player ESP", "Weapons (Color Invis.)")
    b_esp_filter_weapons_accentColor01_colorPicker          = ui.new_color_picker("VISUALS", "Player ESP", "Weapons (Color Invis.)", 127, 127, 127, 63)
    ui.set_callback(b_esp_filter_weapons_accentColor01_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_weapons_accentColor01_colorPicker);
        b_esp_filter_weapons_accentColor01 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_weapons_accentColor01_colorPicker);
        b_esp_filter_weapons_accentColor01 = {r, g, b , a}
    end
    b_esp_filter_weapons_accentColor02_label                = ui.new_checkbox("VISUALS", "Player ESP", "Weapons (Color Vis.)")
    b_esp_filter_weapons_accentColor02_colorPicker          = ui.new_color_picker("VISUALS", "Player ESP", "Weapons (Color Vis.)", 255, 255, 255, 63)
    ui.set_callback(b_esp_filter_weapons_accentColor02_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_weapons_accentColor02_colorPicker);
        b_esp_filter_weapons_accentColor02 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_weapons_accentColor02_colorPicker);
        b_esp_filter_weapons_accentColor02 = {r, g, b , a}
    end

    b_esp_filter_mapObjective_accentColor01                 = {}                 -- <array typeof uInt8_t> Invisible map objective Entities color
    b_esp_filter_mapObjective_accentColor02                 = {}                 -- <array typeof uInt8_t> Visible map objective Entities color

    b_esp_filter_other_accentColor01                        = {127, 127, 127, 63}-- <array typeof uInt8_t> Invisible all other Entities color
    b_esp_filter_other_accentColor02                        = {255, 255, 255, 63}-- <array typeof uInt8_t> Visible all other Entities color
    b_esp_filter_other_accentColor01_label                  = ui.new_checkbox("VISUALS", "Player ESP", "Other (Color Invis.)")
    b_esp_filter_other_accentColor01_colorPicker            = ui.new_color_picker("VISUALS", "Player ESP", "Other (Color Invis.)", 127, 127, 127, 63)
    ui.set_callback(b_esp_filter_other_accentColor01_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_other_accentColor01_colorPicker);
        b_esp_filter_other_accentColor01 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_other_accentColor01_colorPicker);
        b_esp_filter_other_accentColor01 = {r, g, b , a}
    end
    b_esp_filter_other_accentColor02_label                  = ui.new_checkbox("VISUALS", "Player ESP", "Other (Color Vis.)")
    b_esp_filter_other_accentColor02_colorPicker            = ui.new_color_picker("VISUALS", "Player ESP", "Other (Color Vis.)", 255, 255, 255, 63)
    ui.set_callback(b_esp_filter_other_accentColor02_colorPicker, function ()
        local r, g, b, a = ui.get(b_esp_filter_other_accentColor02_colorPicker);
        b_esp_filter_other_accentColor02 = {r, g, b , a}
    end)
    do
        local r, g, b, a = ui.get(b_esp_filter_other_accentColor02_colorPicker);
        b_esp_filter_other_accentColor02 = {r, g, b , a}
    end


-- [Calculated configuration] ----------------------------------------------------------------------------------------------------------------------------------

    entIndex_localEntCCSPlayer                              = entity.get_local_player()
    entIndex_localEntCCSPlayer_kTeamid                      = entity.get_prop(entIndex_localEntCCSPlayer, "m_iTeamNum", array_index)
    i_esp_drawScreenWidth,
    i_esp_drawScreenHeight                                  = client.screen_size()

-- [Functions] -------------------------------------------------------------------------------------------------------------------------------------------------

function func_esp_clamptoscreen(mediaScreenWidth, mediaScreenHeight, mediaScreenAnchorX, mediaScreenAnchorY, entityScreenPosX, entityScreenPosY, entityScreenPosPadding)
    if entityScreenPosX <= 0 + entityScreenPosPadding then
        local X_XC_DELTA = math.abs(entityScreenPosX - mediaScreenAnchorX);
        local Y_YC_DELTA = math.abs(entityScreenPosY - mediaScreenAnchorY);
        local DELTA_YX_RATIO = Y_YC_DELTA / X_XC_DELTA;
        if entityScreenPosY > mediaScreenAnchorY then
            entityScreenPosY = entityScreenPosY + math.floor(entityScreenPosX * DELTA_YX_RATIO);
        end
        if entityScreenPosY < mediaScreenAnchorY then
            entityScreenPosY = entityScreenPosY - math.floor(entityScreenPosX * DELTA_YX_RATIO);
        end
        entityScreenPosX = 0 + entityScreenPosPadding;
        if entityScreenPosY > mediaScreenAnchorY then
            entityScreenPosY = entityScreenPosY - math.floor(entityScreenPosX * DELTA_YX_RATIO);
        end
        if entityScreenPosY < mediaScreenAnchorY then
            entityScreenPosY = entityScreenPosY + math.floor(entityScreenPosX * DELTA_YX_RATIO);
        end
    end

    if entityScreenPosX >= mediaScreenWidth - entityScreenPosPadding then
        local X_XC_DELTA = math.abs(entityScreenPosX - mediaScreenAnchorX);
        local Y_YC_DELTA = math.abs(entityScreenPosY - mediaScreenAnchorY);
        local DELTA_YX_RATIO = -(Y_YC_DELTA / X_XC_DELTA);
        if entityScreenPosY > mediaScreenAnchorY then
            entityScreenPosY = entityScreenPosY + math.floor((entityScreenPosX - mediaScreenWidth) * DELTA_YX_RATIO);
        end
        if entityScreenPosY < mediaScreenAnchorY then
            entityScreenPosY = entityScreenPosY - math.floor((entityScreenPosX - mediaScreenWidth) * DELTA_YX_RATIO);
        end
        entityScreenPosX = mediaScreenWidth - entityScreenPosPadding;
        if entityScreenPosY > mediaScreenAnchorY then
            entityScreenPosY = entityScreenPosY - math.floor((entityScreenPosX - mediaScreenWidth) * DELTA_YX_RATIO);
        end
        if entityScreenPosY < mediaScreenAnchorY then
            entityScreenPosY = entityScreenPosY + math.floor((entityScreenPosX - mediaScreenWidth) * DELTA_YX_RATIO);
        end
    end

    if entityScreenPosY <= 0 + entityScreenPosPadding then
        local X_XC_DELTA = math.abs(entityScreenPosX - mediaScreenAnchorX);
        local Y_YC_DELTA = math.abs(entityScreenPosY - mediaScreenAnchorY);
        local DELTA_XY_RATIO = X_XC_DELTA / Y_YC_DELTA;
        if entityScreenPosX > mediaScreenAnchorX then
            entityScreenPosX = entityScreenPosX + math.floor(entityScreenPosY * DELTA_XY_RATIO);
        end
        if entityScreenPosX < mediaScreenAnchorX then
            entityScreenPosX = entityScreenPosX - math.floor(entityScreenPosY * DELTA_XY_RATIO);
        end
        entityScreenPosY = (0 + entityScreenPosPadding);
        if entityScreenPosX > mediaScreenAnchorX then
            entityScreenPosX = entityScreenPosX - math.floor(entityScreenPosY * DELTA_XY_RATIO);
        end
        if entityScreenPosX < mediaScreenAnchorX then
            entityScreenPosX = entityScreenPosX + math.floor(entityScreenPosY * DELTA_XY_RATIO);
        end
    end

    if entityScreenPosY >= mediaScreenHeight - entityScreenPosPadding then
        local X_XC_DELTA = math.abs(entityScreenPosX - mediaScreenAnchorX);
        local Y_YC_DELTA = math.abs(entityScreenPosY - mediaScreenAnchorY);
        local DELTA_XY_RATIO = -(X_XC_DELTA / Y_YC_DELTA);
        if entityScreenPosX > mediaScreenAnchorX then
            entityScreenPosX = entityScreenPosX + math.floor((entityScreenPosY - mediaScreenHeight) * DELTA_XY_RATIO);
        end
        if entityScreenPosX < mediaScreenAnchorX then
            entityScreenPosX = entityScreenPosX - math.floor((entityScreenPosY - mediaScreenHeight) * DELTA_XY_RATIO);
        end
        entityScreenPosY = mediaScreenHeight - entityScreenPosPadding;
        if entityScreenPosX > mediaScreenAnchorX then
            entityScreenPosX = entityScreenPosX - math.floor((entityScreenPosY - mediaScreenHeight) * DELTA_XY_RATIO);
        end
        if entityScreenPosX < mediaScreenAnchorX then
            entityScreenPosX = entityScreenPosX + math.floor((entityScreenPosY - mediaScreenHeight) * DELTA_XY_RATIO);
        end
    end

    return entityScreenPosX, entityScreenPosY;
end
function func_esp_rainbowize(a,b,c,d,e,f,g)local h,i,j=math.cos(a*(f+g))*b+math.floor(b/2),math.cos(a*(f+g)+2*math.pi/3*c)*b+math.floor(b/2),math.cos(a*(f+g)-2*math.pi/3*c)*b+math.floor(b/2)if h<d then h=d end;if j<d then j=d end;if i<d then i=d end;if h>e then h=e end;if j>e then j=e end;if i>e then i=e end;return {h,i,j} end

local rotate = function(pitch, yaw, roll, nodes)
    for i = 1, #nodes do
        local vec = maf.vec3(nodes[i].x, nodes[i].y, nodes[i].z)

        local p, y, r = .5 * math.rad(pitch), .5 * math.rad(yaw), .5 * math.rad(roll)
        local cx = math.cos(p)
        local sx = math.sin(p)
        local cy = math.cos(y)
        local sy = math.sin(y)
        local cz = math.cos(r)
        local sz = math.sin(r)

        local x = sx * cy * cz - cx * sy * sz
        local y = cx * sy * cz + sx * cy * sz
        local z = cx * cy * sz - sx * sy * cz
        local w = cx * cy * cz + sx * sy * sz

        local rot = maf.quat(x, y, z, w)
        vec:rotate(rot)
        nodes[i] = vec
    end
end

local function table_contains_str(table, str)
    for _, v in ipairs(table) do
        if v == str then
            return true
        end
    end
    return false
end

local getStaticBoundingBox = function(entIndex_serverEntCAny)
    local obj_serverEntCAny = Entity(entIndex_serverEntCAny)

    local vec_serverEntCAny_WorldPos = {x, y, z}
    vec_serverEntCAny_WorldPos.x = 0
    vec_serverEntCAny_WorldPos.y = 0
    vec_serverEntCAny_WorldPos.z = 0

    local vec_serverEntCAny_WorldAng = {pitch, yaw, roll}
    vec_serverEntCAny_WorldAng.pitch = 0
    vec_serverEntCAny_WorldAng.yaw = 0
    vec_serverEntCAny_WorldAng.roll = 0

    vec_serverEntCAny_WorldPos = obj_serverEntCAny:get_vec_origin()
    vec_serverEntCAny_WorldAng.pitch, vec_serverEntCAny_WorldAng.yaw, vec_serverEntCAny_WorldAng.roll = entity.get_prop(entIndex_serverEntCAny, "m_angRotation", array_index)

    local vec_serverEntCAny_WorldPosVecMins = obj_serverEntCAny:get_vec_mins()
    local vec_serverEntCAny_WorldPosVecMaxs = obj_serverEntCAny:get_vec_maxs()

    local vec_serverEntCAny_WorldPosP1 = {x, y, z}
    vec_serverEntCAny_WorldPosP1.x = vec_serverEntCAny_WorldPosVecMins.x
    vec_serverEntCAny_WorldPosP1.y = vec_serverEntCAny_WorldPosVecMins.y
    vec_serverEntCAny_WorldPosP1.z = vec_serverEntCAny_WorldPosVecMins.z

    local vec_serverEntCAny_WorldPosP2 = {x, y, z}
    vec_serverEntCAny_WorldPosP2.x = vec_serverEntCAny_WorldPosVecMaxs.x
    vec_serverEntCAny_WorldPosP2.y = vec_serverEntCAny_WorldPosVecMins.y
    vec_serverEntCAny_WorldPosP2.z = vec_serverEntCAny_WorldPosVecMins.z

    local vec_serverEntCAny_WorldPosP3 = {x, y, z}
    vec_serverEntCAny_WorldPosP3.x = vec_serverEntCAny_WorldPosVecMaxs.x
    vec_serverEntCAny_WorldPosP3.y = vec_serverEntCAny_WorldPosVecMaxs.y
    vec_serverEntCAny_WorldPosP3.z = vec_serverEntCAny_WorldPosVecMins.z

    local vec_serverEntCAny_WorldPosP4 = {x, y, z}
    vec_serverEntCAny_WorldPosP4.x = vec_serverEntCAny_WorldPosVecMins.x
    vec_serverEntCAny_WorldPosP4.y = vec_serverEntCAny_WorldPosVecMaxs.y
    vec_serverEntCAny_WorldPosP4.z = vec_serverEntCAny_WorldPosVecMins.z

    local vec_serverEntCAny_WorldPosP5 = {x, y, z}
    vec_serverEntCAny_WorldPosP5.x = vec_serverEntCAny_WorldPosVecMins.x
    vec_serverEntCAny_WorldPosP5.y = vec_serverEntCAny_WorldPosVecMins.y
    vec_serverEntCAny_WorldPosP5.z = vec_serverEntCAny_WorldPosVecMaxs.z

    local vec_serverEntCAny_WorldPosP6 = {x, y, z}
    vec_serverEntCAny_WorldPosP6.x = vec_serverEntCAny_WorldPosVecMaxs.x
    vec_serverEntCAny_WorldPosP6.y = vec_serverEntCAny_WorldPosVecMins.y
    vec_serverEntCAny_WorldPosP6.z = vec_serverEntCAny_WorldPosVecMaxs.z

    local vec_serverEntCAny_WorldPosP7 = {x, y, z}
    vec_serverEntCAny_WorldPosP7.x = vec_serverEntCAny_WorldPosVecMaxs.x
    vec_serverEntCAny_WorldPosP7.y = vec_serverEntCAny_WorldPosVecMaxs.y
    vec_serverEntCAny_WorldPosP7.z = vec_serverEntCAny_WorldPosVecMaxs.z

    local vec_serverEntCAny_WorldPosP8 = {x, y, z}
    vec_serverEntCAny_WorldPosP8.x = vec_serverEntCAny_WorldPosVecMins.x
    vec_serverEntCAny_WorldPosP8.y = vec_serverEntCAny_WorldPosVecMaxs.y
    vec_serverEntCAny_WorldPosP8.z = vec_serverEntCAny_WorldPosVecMaxs.z

    local vec_serverEntCAny_WorldPosP1P8 = {vec_serverEntCAny_WorldPosP1, vec_serverEntCAny_WorldPosP2, vec_serverEntCAny_WorldPosP3, vec_serverEntCAny_WorldPosP4, vec_serverEntCAny_WorldPosP5, vec_serverEntCAny_WorldPosP6, vec_serverEntCAny_WorldPosP7, vec_serverEntCAny_WorldPosP8}

    rotate(vec_serverEntCAny_WorldAng.roll, vec_serverEntCAny_WorldAng.pitch, vec_serverEntCAny_WorldAng.yaw, vec_serverEntCAny_WorldPosP1P8)

    vec_serverEntCAny_WorldPosP1.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[1].x
    vec_serverEntCAny_WorldPosP1.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[1].y
    vec_serverEntCAny_WorldPosP1.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[1].z

    vec_serverEntCAny_WorldPosP2.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[2].x
    vec_serverEntCAny_WorldPosP2.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[2].y
    vec_serverEntCAny_WorldPosP2.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[2].z

    vec_serverEntCAny_WorldPosP3.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[3].x
    vec_serverEntCAny_WorldPosP3.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[3].y
    vec_serverEntCAny_WorldPosP3.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[3].z

    vec_serverEntCAny_WorldPosP4.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[4].x
    vec_serverEntCAny_WorldPosP4.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[4].y
    vec_serverEntCAny_WorldPosP4.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[4].z

    vec_serverEntCAny_WorldPosP5.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[5].x
    vec_serverEntCAny_WorldPosP5.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[5].y
    vec_serverEntCAny_WorldPosP5.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[5].z

    vec_serverEntCAny_WorldPosP6.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[6].x
    vec_serverEntCAny_WorldPosP6.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[6].y
    vec_serverEntCAny_WorldPosP6.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[6].z

    vec_serverEntCAny_WorldPosP7.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[7].x
    vec_serverEntCAny_WorldPosP7.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[7].y
    vec_serverEntCAny_WorldPosP7.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[7].z

    vec_serverEntCAny_WorldPosP8.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[8].x
    vec_serverEntCAny_WorldPosP8.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[8].y
    vec_serverEntCAny_WorldPosP8.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[8].z

    local vec_serverEntCAny_ScreenPosP1 = {x, y}
    vec_serverEntCAny_ScreenPosP1.x, vec_serverEntCAny_ScreenPosP1.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP1.x, vec_serverEntCAny_WorldPosP1.y, vec_serverEntCAny_WorldPosP1.z)

    local vec_serverEntCAny_ScreenPosP2 = {x, y}
    vec_serverEntCAny_ScreenPosP2.x, vec_serverEntCAny_ScreenPosP2.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP2.x, vec_serverEntCAny_WorldPosP2.y, vec_serverEntCAny_WorldPosP2.z)

    local vec_serverEntCAny_ScreenPosP3 = {x, y}
    vec_serverEntCAny_ScreenPosP3.x, vec_serverEntCAny_ScreenPosP3.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP3.x, vec_serverEntCAny_WorldPosP3.y, vec_serverEntCAny_WorldPosP3.z)

    local vec_serverEntCAny_ScreenPosP4 = {x, y}
    vec_serverEntCAny_ScreenPosP4.x, vec_serverEntCAny_ScreenPosP4.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP4.x, vec_serverEntCAny_WorldPosP4.y, vec_serverEntCAny_WorldPosP4.z)

    local vec_serverEntCAny_ScreenPosP5 = {x, y}
    vec_serverEntCAny_ScreenPosP5.x, vec_serverEntCAny_ScreenPosP5.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP5.x, vec_serverEntCAny_WorldPosP5.y, vec_serverEntCAny_WorldPosP5.z)

    local vec_serverEntCAny_ScreenPosP6 = {x, y}
    vec_serverEntCAny_ScreenPosP6.x, vec_serverEntCAny_ScreenPosP6.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP6.x, vec_serverEntCAny_WorldPosP6.y, vec_serverEntCAny_WorldPosP6.z)

    local vec_serverEntCAny_ScreenPosP7 = {x, y}
    vec_serverEntCAny_ScreenPosP7.x, vec_serverEntCAny_ScreenPosP7.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP7.x, vec_serverEntCAny_WorldPosP7.y, vec_serverEntCAny_WorldPosP7.z)

    local vec_serverEntCAny_ScreenPosP8 = {x, y}
    vec_serverEntCAny_ScreenPosP8.x, vec_serverEntCAny_ScreenPosP8.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP8.x, vec_serverEntCAny_WorldPosP8.y, vec_serverEntCAny_WorldPosP8.z)

    local vec_serverEntCAny_ScreenPosP1P8 = {vec_serverEntCAny_ScreenPosP1, vec_serverEntCAny_ScreenPosP2, vec_serverEntCAny_ScreenPosP3, vec_serverEntCAny_ScreenPosP4, vec_serverEntCAny_ScreenPosP5, vec_serverEntCAny_ScreenPosP6, vec_serverEntCAny_ScreenPosP7, vec_serverEntCAny_ScreenPosP8}

    local returnObj = {x, y, width, height, onScreen}

    for i = 1, #vec_serverEntCAny_ScreenPosP1P8 do
        if vec_serverEntCAny_ScreenPosP1P8[i].x == nil or vec_serverEntCAny_ScreenPosP1P8[i].y == nil then
            returnObj.onScreen = false
            return returnObj
        end
    end

    local vec_serverEntCAny_ScreenPosOffsetX = 0;
    local vec_serverEntCAny_ScreenPosOffsetY = 0;
    local vec_serverEntCAny_ScreenPosStartX = i_esp_drawScreenWidth;
    local vec_serverEntCAny_ScreenPosStartY = i_esp_drawScreenHeight;

    for i = 1, 8 do
        for j = i + 1, 8 do
            vec_serverEntCAny_ScreenPosOffsetX = math.max(vec_serverEntCAny_ScreenPosOffsetX, math.abs(vec_serverEntCAny_ScreenPosP1P8[i].x - vec_serverEntCAny_ScreenPosP1P8[j].x))
            vec_serverEntCAny_ScreenPosOffsetY = math.max(vec_serverEntCAny_ScreenPosOffsetY, math.abs(vec_serverEntCAny_ScreenPosP1P8[i].y - vec_serverEntCAny_ScreenPosP1P8[j].y))
        end
        vec_serverEntCAny_ScreenPosStartX = math.min(vec_serverEntCAny_ScreenPosStartX, vec_serverEntCAny_ScreenPosP1P8[i].x)
        vec_serverEntCAny_ScreenPosStartY = math.min(vec_serverEntCAny_ScreenPosStartY, vec_serverEntCAny_ScreenPosP1P8[i].y)
    end

    returnObj.x = vec_serverEntCAny_ScreenPosStartX
    returnObj.y = vec_serverEntCAny_ScreenPosStartY
    returnObj.width = vec_serverEntCAny_ScreenPosOffsetX
    returnObj.height = vec_serverEntCAny_ScreenPosOffsetY
    returnObj.onScreen = true

    return returnObj
end

local isInClampedViewport = function(mediaScreenWidth, mediaScreenHeight, entityScreenPosX, entityScreenPosY, entityScreenPosPadding)
    if entityScreenPosX <= 0 + entityScreenPosPadding then
        return false
    end
    if entityScreenPosX >= mediaScreenWidth - entityScreenPosPadding then
        return false
    end
    if entityScreenPosY <= 0 + entityScreenPosPadding then
        return false
    end
    if entityScreenPosY >= mediaScreenHeight - entityScreenPosPadding then
        return false
    end
    return true
end

function func_esp_drawSnapLine(entIndex_serverEntCAny, accentColor01, accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
    local obj_serverEntCAny = Entity(entIndex_serverEntCAny)
    local obj_localEntCCSPlayer = Player(entIndex_localEntCCSPlayer)

    local vec_serverEntCAny_WorldPos = obj_serverEntCAny:get_vec_origin()

    local i_serverEntCAny_ScreenPosX, i_serverEntCAny_ScreenPosY = renderer.world_to_screen(vec_serverEntCAny_WorldPos.x, vec_serverEntCAny_WorldPos.y, vec_serverEntCAny_WorldPos.z)

    if i_serverEntCAny_ScreenPosX ~= nil and i_serverEntCAny_ScreenPosY ~= nil then
        i_serverEntCAny_ScreenPosX, i_serverEntCAny_ScreenPosY = func_esp_clamptoscreen(i_esp_drawScreenWidth, i_esp_drawScreenHeight, i_esp_anchorPosX, i_esp_anchorPosY, i_serverEntCAny_ScreenPosX, i_serverEntCAny_ScreenPosY, ui.get(i_esp_paddingScreenXY))

        if obj_serverEntCAny:is_player() == true then
            obj_serverEntCAny = Player(entIndex_serverEntCAny)
            vec_serverEntCAny_WorldPos = obj_serverEntCAny:get_hitbox_pos("head_0")
        end

        b_serverEntCAny_IsVisible = obj_localEntCCSPlayer:can_see_point(vec_serverEntCAny_WorldPos)

        if ui.get(b_esp_draw_snaplineEndPoint) then
            renderer.rectangle(i_serverEntCAny_ScreenPosX - 3, i_serverEntCAny_ScreenPosY - 3, 7, 7, 0, 0, 0, 127)

            if b_serverEntCAny_IsVisible == true then
                renderer.rectangle(i_serverEntCAny_ScreenPosX - 2, i_serverEntCAny_ScreenPosY - 2, 5, 5, accentColor02[1], accentColor02[2], accentColor02[3], accentColor02[4])
            else
                renderer.rectangle(i_serverEntCAny_ScreenPosX - 2, i_serverEntCAny_ScreenPosY - 2, 5, 5, accentColor01[1], accentColor01[2], accentColor01[3], accentColor01[4])
            end
        end

        if ui.get(b_esp_draw_snapline) then
            if b_serverEntCAny_IsVisible == true then
                renderer.line(i_serverEntCAny_ScreenPosX, i_serverEntCAny_ScreenPosY, i_esp_anchorPosX, i_esp_anchorPosY, accentColor02[1], accentColor02[2], accentColor02[3], accentColor02[4])
            else
                renderer.line(i_serverEntCAny_ScreenPosX, i_serverEntCAny_ScreenPosY, i_esp_anchorPosX, i_esp_anchorPosY, accentColor01[1], accentColor01[2], accentColor01[3], accentColor01[4])
            end
        end
    end
end

function func_esp_drawBoxStatic(entIndex_serverEntCAny, accentColor01, accentColor02)
    local obj_serverEntCAny = Entity(entIndex_serverEntCAny)
    local obj_localEntCCSPlayer = Player(entIndex_localEntCCSPlayer)

    local vec_serverEntCAny_WorldPos = {x, y, z}
    vec_serverEntCAny_WorldPos.x = 0
    vec_serverEntCAny_WorldPos.y = 0
    vec_serverEntCAny_WorldPos.z = 0

    local vec_serverEntCAny_WorldAng = {pitch, yaw, roll}
    vec_serverEntCAny_WorldAng.pitch = 0
    vec_serverEntCAny_WorldAng.yaw = 0
    vec_serverEntCAny_WorldAng.roll = 0

    vec_serverEntCAny_WorldPos = obj_serverEntCAny:get_vec_origin()
    vec_serverEntCAny_WorldAng.pitch, vec_serverEntCAny_WorldAng.yaw, vec_serverEntCAny_WorldAng.roll = entity.get_prop(entIndex_serverEntCAny, "m_angRotation", array_index)
    local vec_serverEntCAny_WorldPosVecMins = obj_serverEntCAny:get_vec_mins()
    local vec_serverEntCAny_WorldPosVecMaxs = obj_serverEntCAny:get_vec_maxs()

    local vec_serverEntCAny_WorldPosP1 = {x, y, z}
    vec_serverEntCAny_WorldPosP1.x = vec_serverEntCAny_WorldPosVecMins.x
    vec_serverEntCAny_WorldPosP1.y = vec_serverEntCAny_WorldPosVecMins.y
    vec_serverEntCAny_WorldPosP1.z = vec_serverEntCAny_WorldPosVecMins.z

    local vec_serverEntCAny_WorldPosP2 = {x, y, z}
    vec_serverEntCAny_WorldPosP2.x = vec_serverEntCAny_WorldPosVecMaxs.x
    vec_serverEntCAny_WorldPosP2.y = vec_serverEntCAny_WorldPosVecMins.y
    vec_serverEntCAny_WorldPosP2.z = vec_serverEntCAny_WorldPosVecMins.z

    local vec_serverEntCAny_WorldPosP3 = {x, y, z}
    vec_serverEntCAny_WorldPosP3.x = vec_serverEntCAny_WorldPosVecMaxs.x
    vec_serverEntCAny_WorldPosP3.y = vec_serverEntCAny_WorldPosVecMaxs.y
    vec_serverEntCAny_WorldPosP3.z = vec_serverEntCAny_WorldPosVecMins.z

    local vec_serverEntCAny_WorldPosP4 = {x, y, z}
    vec_serverEntCAny_WorldPosP4.x = vec_serverEntCAny_WorldPosVecMins.x
    vec_serverEntCAny_WorldPosP4.y = vec_serverEntCAny_WorldPosVecMaxs.y
    vec_serverEntCAny_WorldPosP4.z = vec_serverEntCAny_WorldPosVecMins.z

    local vec_serverEntCAny_WorldPosP5 = {x, y, z}
    vec_serverEntCAny_WorldPosP5.x = vec_serverEntCAny_WorldPosVecMins.x
    vec_serverEntCAny_WorldPosP5.y = vec_serverEntCAny_WorldPosVecMins.y
    vec_serverEntCAny_WorldPosP5.z = vec_serverEntCAny_WorldPosVecMaxs.z

    local vec_serverEntCAny_WorldPosP6 = {x, y, z}
    vec_serverEntCAny_WorldPosP6.x = vec_serverEntCAny_WorldPosVecMaxs.x
    vec_serverEntCAny_WorldPosP6.y = vec_serverEntCAny_WorldPosVecMins.y
    vec_serverEntCAny_WorldPosP6.z = vec_serverEntCAny_WorldPosVecMaxs.z

    local vec_serverEntCAny_WorldPosP7 = {x, y, z}
    vec_serverEntCAny_WorldPosP7.x = vec_serverEntCAny_WorldPosVecMaxs.x
    vec_serverEntCAny_WorldPosP7.y = vec_serverEntCAny_WorldPosVecMaxs.y
    vec_serverEntCAny_WorldPosP7.z = vec_serverEntCAny_WorldPosVecMaxs.z

    local vec_serverEntCAny_WorldPosP8 = {x, y, z}
    vec_serverEntCAny_WorldPosP8.x = vec_serverEntCAny_WorldPosVecMins.x
    vec_serverEntCAny_WorldPosP8.y = vec_serverEntCAny_WorldPosVecMaxs.y
    vec_serverEntCAny_WorldPosP8.z = vec_serverEntCAny_WorldPosVecMaxs.z

    local vec_serverEntCAny_WorldPosP1P8 = {vec_serverEntCAny_WorldPosP1, vec_serverEntCAny_WorldPosP2, vec_serverEntCAny_WorldPosP3, vec_serverEntCAny_WorldPosP4, vec_serverEntCAny_WorldPosP5, vec_serverEntCAny_WorldPosP6, vec_serverEntCAny_WorldPosP7, vec_serverEntCAny_WorldPosP8}

    rotate(vec_serverEntCAny_WorldAng.roll, vec_serverEntCAny_WorldAng.pitch, vec_serverEntCAny_WorldAng.yaw, vec_serverEntCAny_WorldPosP1P8)

    vec_serverEntCAny_WorldPosP1.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[1].x
    vec_serverEntCAny_WorldPosP1.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[1].y
    vec_serverEntCAny_WorldPosP1.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[1].z

    vec_serverEntCAny_WorldPosP2.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[2].x
    vec_serverEntCAny_WorldPosP2.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[2].y
    vec_serverEntCAny_WorldPosP2.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[2].z

    vec_serverEntCAny_WorldPosP3.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[3].x
    vec_serverEntCAny_WorldPosP3.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[3].y
    vec_serverEntCAny_WorldPosP3.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[3].z

    vec_serverEntCAny_WorldPosP4.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[4].x
    vec_serverEntCAny_WorldPosP4.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[4].y
    vec_serverEntCAny_WorldPosP4.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[4].z

    vec_serverEntCAny_WorldPosP5.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[5].x
    vec_serverEntCAny_WorldPosP5.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[5].y
    vec_serverEntCAny_WorldPosP5.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[5].z

    vec_serverEntCAny_WorldPosP6.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[6].x
    vec_serverEntCAny_WorldPosP6.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[6].y
    vec_serverEntCAny_WorldPosP6.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[6].z

    vec_serverEntCAny_WorldPosP7.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[7].x
    vec_serverEntCAny_WorldPosP7.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[7].y
    vec_serverEntCAny_WorldPosP7.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[7].z

    vec_serverEntCAny_WorldPosP8.x = vec_serverEntCAny_WorldPos.x + vec_serverEntCAny_WorldPosP1P8[8].x
    vec_serverEntCAny_WorldPosP8.y = vec_serverEntCAny_WorldPos.y + vec_serverEntCAny_WorldPosP1P8[8].y
    vec_serverEntCAny_WorldPosP8.z = vec_serverEntCAny_WorldPos.z + vec_serverEntCAny_WorldPosP1P8[8].z

    local vec_serverEntCAny_ScreenPosP1 = {x, y}
    vec_serverEntCAny_ScreenPosP1.x, vec_serverEntCAny_ScreenPosP1.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP1.x, vec_serverEntCAny_WorldPosP1.y, vec_serverEntCAny_WorldPosP1.z)

    local vec_serverEntCAny_ScreenPosP2 = {x, y}
    vec_serverEntCAny_ScreenPosP2.x, vec_serverEntCAny_ScreenPosP2.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP2.x, vec_serverEntCAny_WorldPosP2.y, vec_serverEntCAny_WorldPosP2.z)

    local vec_serverEntCAny_ScreenPosP3 = {x, y}
    vec_serverEntCAny_ScreenPosP3.x, vec_serverEntCAny_ScreenPosP3.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP3.x, vec_serverEntCAny_WorldPosP3.y, vec_serverEntCAny_WorldPosP3.z)

    local vec_serverEntCAny_ScreenPosP4 = {x, y}
    vec_serverEntCAny_ScreenPosP4.x, vec_serverEntCAny_ScreenPosP4.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP4.x, vec_serverEntCAny_WorldPosP4.y, vec_serverEntCAny_WorldPosP4.z)

    local vec_serverEntCAny_ScreenPosP5 = {x, y}
    vec_serverEntCAny_ScreenPosP5.x, vec_serverEntCAny_ScreenPosP5.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP5.x, vec_serverEntCAny_WorldPosP5.y, vec_serverEntCAny_WorldPosP5.z)

    local vec_serverEntCAny_ScreenPosP6 = {x, y}
    vec_serverEntCAny_ScreenPosP6.x, vec_serverEntCAny_ScreenPosP6.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP6.x, vec_serverEntCAny_WorldPosP6.y, vec_serverEntCAny_WorldPosP6.z)

    local vec_serverEntCAny_ScreenPosP7 = {x, y}
    vec_serverEntCAny_ScreenPosP7.x, vec_serverEntCAny_ScreenPosP7.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP7.x, vec_serverEntCAny_WorldPosP7.y, vec_serverEntCAny_WorldPosP7.z)

    local vec_serverEntCAny_ScreenPosP8 = {x, y}
    vec_serverEntCAny_ScreenPosP8.x, vec_serverEntCAny_ScreenPosP8.y = renderer.world_to_screen(vec_serverEntCAny_WorldPosP8.x, vec_serverEntCAny_WorldPosP8.y, vec_serverEntCAny_WorldPosP8.z)

    local vec_serverEntCAny_ScreenPosP1P8 = {vec_serverEntCAny_ScreenPosP1, vec_serverEntCAny_ScreenPosP2, vec_serverEntCAny_ScreenPosP3, vec_serverEntCAny_ScreenPosP4, vec_serverEntCAny_ScreenPosP5, vec_serverEntCAny_ScreenPosP6, vec_serverEntCAny_ScreenPosP7, vec_serverEntCAny_ScreenPosP8}

    for i = 1, #vec_serverEntCAny_ScreenPosP1P8 do
        if vec_serverEntCAny_ScreenPosP1P8[i].x == nil or vec_serverEntCAny_ScreenPosP1P8[i].y == nil then
            return
        end
    end

    if obj_serverEntCAny:is_player() == true then
        obj_serverEntCAny = Player(entIndex_serverEntCAny)
        vec_serverEntCAny_WorldPos = obj_serverEntCAny:get_hitbox_pos("head_0")
    end

    b_serverEntCAny_IsVisible = obj_localEntCCSPlayer:can_see_point(vec_serverEntCAny_WorldPos)

    if ui.get(str_esp_draw_box) == "On (Static 3D)" then
        local Color = {r, g, b, a};

        if b_serverEntCAny_IsVisible == true then
            Color.r, Color.g, Color.b, Color.a = accentColor02[1], accentColor02[2], accentColor02[3], accentColor02[4]
        else
            Color.r, Color.g, Color.b, Color.a = accentColor01[1], accentColor01[2], accentColor01[3], accentColor01[4]
        end

        -- Bottom
        renderer.line(vec_serverEntCAny_ScreenPosP1.x, vec_serverEntCAny_ScreenPosP1.y, vec_serverEntCAny_ScreenPosP2.x, vec_serverEntCAny_ScreenPosP2.y, Color.r, Color.g, Color.b, Color.a)
        renderer.line(vec_serverEntCAny_ScreenPosP2.x, vec_serverEntCAny_ScreenPosP2.y, vec_serverEntCAny_ScreenPosP3.x, vec_serverEntCAny_ScreenPosP3.y, Color.r, Color.g, Color.b, Color.a)
        renderer.line(vec_serverEntCAny_ScreenPosP3.x, vec_serverEntCAny_ScreenPosP3.y, vec_serverEntCAny_ScreenPosP4.x, vec_serverEntCAny_ScreenPosP4.y, Color.r, Color.g, Color.b, Color.a)
        renderer.line(vec_serverEntCAny_ScreenPosP4.x, vec_serverEntCAny_ScreenPosP4.y, vec_serverEntCAny_ScreenPosP1.x, vec_serverEntCAny_ScreenPosP1.y, Color.r, Color.g, Color.b, Color.a)
        -- Top
        renderer.line(vec_serverEntCAny_ScreenPosP5.x, vec_serverEntCAny_ScreenPosP5.y, vec_serverEntCAny_ScreenPosP6.x, vec_serverEntCAny_ScreenPosP6.y, Color.r, Color.g, Color.b, Color.a)
        renderer.line(vec_serverEntCAny_ScreenPosP6.x, vec_serverEntCAny_ScreenPosP6.y, vec_serverEntCAny_ScreenPosP7.x, vec_serverEntCAny_ScreenPosP7.y, Color.r, Color.g, Color.b, Color.a)
        renderer.line(vec_serverEntCAny_ScreenPosP7.x, vec_serverEntCAny_ScreenPosP7.y, vec_serverEntCAny_ScreenPosP8.x, vec_serverEntCAny_ScreenPosP8.y, Color.r, Color.g, Color.b, Color.a)
        renderer.line(vec_serverEntCAny_ScreenPosP8.x, vec_serverEntCAny_ScreenPosP8.y, vec_serverEntCAny_ScreenPosP5.x, vec_serverEntCAny_ScreenPosP5.y, Color.r, Color.g, Color.b, Color.a)
        -- Sides
        renderer.line(vec_serverEntCAny_ScreenPosP1.x, vec_serverEntCAny_ScreenPosP1.y, vec_serverEntCAny_ScreenPosP5.x, vec_serverEntCAny_ScreenPosP5.y, Color.r, Color.g, Color.b, Color.a)
        renderer.line(vec_serverEntCAny_ScreenPosP2.x, vec_serverEntCAny_ScreenPosP2.y, vec_serverEntCAny_ScreenPosP6.x, vec_serverEntCAny_ScreenPosP6.y, Color.r, Color.g, Color.b, Color.a)
        renderer.line(vec_serverEntCAny_ScreenPosP3.x, vec_serverEntCAny_ScreenPosP3.y, vec_serverEntCAny_ScreenPosP7.x, vec_serverEntCAny_ScreenPosP7.y, Color.r, Color.g, Color.b, Color.a)
        renderer.line(vec_serverEntCAny_ScreenPosP4.x, vec_serverEntCAny_ScreenPosP4.y, vec_serverEntCAny_ScreenPosP8.x, vec_serverEntCAny_ScreenPosP8.y, Color.r, Color.g, Color.b, Color.a)
    end

    if ui.get(str_esp_draw_box) == "On (Static 2D)" then
        local vec_serverEntCAny_ScreenPosOffsetX = 0;
        local vec_serverEntCAny_ScreenPosOffsetY = 0;
        local vec_serverEntCAny_ScreenPosStartX = i_esp_drawScreenWidth;
        local vec_serverEntCAny_ScreenPosStartY = i_esp_drawScreenHeight;

        for i = 1, 8 do
            for j = i + 1, 8 do
                vec_serverEntCAny_ScreenPosOffsetX = math.max(vec_serverEntCAny_ScreenPosOffsetX, math.abs(vec_serverEntCAny_ScreenPosP1P8[i].x - vec_serverEntCAny_ScreenPosP1P8[j].x))
                vec_serverEntCAny_ScreenPosOffsetY = math.max(vec_serverEntCAny_ScreenPosOffsetY, math.abs(vec_serverEntCAny_ScreenPosP1P8[i].y - vec_serverEntCAny_ScreenPosP1P8[j].y))
            end
            vec_serverEntCAny_ScreenPosStartX = math.min(vec_serverEntCAny_ScreenPosStartX, vec_serverEntCAny_ScreenPosP1P8[i].x)
            vec_serverEntCAny_ScreenPosStartY = math.min(vec_serverEntCAny_ScreenPosStartY, vec_serverEntCAny_ScreenPosP1P8[i].y)
        end

        local Color = {r, g, b, a};

        if b_serverEntCAny_IsVisible == true then
            Color.r, Color.g, Color.b, Color.a = accentColor02[1], accentColor02[2], accentColor02[3], accentColor02[4]
        else
            Color.r, Color.g, Color.b, Color.a = accentColor01[1], accentColor01[2], accentColor01[3], accentColor01[4]
        end

        -- Bottom
        renderer.line(vec_serverEntCAny_ScreenPosStartX, vec_serverEntCAny_ScreenPosStartY + vec_serverEntCAny_ScreenPosOffsetY, vec_serverEntCAny_ScreenPosStartX + vec_serverEntCAny_ScreenPosOffsetX, vec_serverEntCAny_ScreenPosStartY + vec_serverEntCAny_ScreenPosOffsetY, Color.r, Color.g, Color.b, Color.a)
        -- Top
        renderer.line(vec_serverEntCAny_ScreenPosStartX, vec_serverEntCAny_ScreenPosStartY, vec_serverEntCAny_ScreenPosStartX + vec_serverEntCAny_ScreenPosOffsetX, vec_serverEntCAny_ScreenPosStartY, Color.r, Color.g, Color.b, Color.a)
        -- Sides
        renderer.line(vec_serverEntCAny_ScreenPosStartX, vec_serverEntCAny_ScreenPosStartY, vec_serverEntCAny_ScreenPosStartX, vec_serverEntCAny_ScreenPosStartY + vec_serverEntCAny_ScreenPosOffsetY, Color.r, Color.g, Color.b, Color.a)
        renderer.line(vec_serverEntCAny_ScreenPosStartX + vec_serverEntCAny_ScreenPosOffsetX, vec_serverEntCAny_ScreenPosStartY, vec_serverEntCAny_ScreenPosStartX + vec_serverEntCAny_ScreenPosOffsetX, vec_serverEntCAny_ScreenPosStartY + vec_serverEntCAny_ScreenPosOffsetY, Color.r, Color.g, Color.b, Color.a)
    end
end

function func_esp_drawPlayerInfo(entIndex_serverEntCCSPlayer, accentColor01, accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
    local obj_serverEntCCSPlayer = Player(entIndex_serverEntCCSPlayer)
    local obj_localEntCCSPlayer = Player(entIndex_localEntCCSPlayer)

    local i_serverEntCCSPlayer_WorldPos = obj_serverEntCCSPlayer:get_vec_origin()

    local i_serverEntCCSPlayer_ScreenPosX, i_serverEntCCSPlayer_ScreenPosY = renderer.world_to_screen(i_serverEntCCSPlayer_WorldPos.x, i_serverEntCCSPlayer_WorldPos.y, i_serverEntCCSPlayer_WorldPos.z)

    if i_serverEntCCSPlayer_ScreenPosX ~= nil and i_serverEntCCSPlayer_ScreenPosY ~= nil then
        if isInClampedViewport(i_esp_drawScreenWidth, i_esp_drawScreenHeight, i_serverEntCCSPlayer_ScreenPosX, i_serverEntCCSPlayer_ScreenPosY, ui.get(i_esp_paddingScreenXY)) == false then
            i_serverEntCCSPlayer_ScreenPosX, i_serverEntCCSPlayer_ScreenPosY = func_esp_clamptoscreen(i_esp_drawScreenWidth, i_esp_drawScreenHeight, i_esp_anchorPosX, i_esp_anchorPosY, i_serverEntCCSPlayer_ScreenPosX, i_serverEntCCSPlayer_ScreenPosY, ui.get(i_esp_paddingScreenXY))

            local i_esp_draw_strOffset = 1
            --
            --
            --  Name
            --
            --
            if ui.get(b_esp_draw_name) then
                local i_esp_draw_name_strSizeX, i_esp_draw_name_strSizeY = renderer.measure_text("b", "Name: " .. obj_serverEntCCSPlayer:get_name())

                renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_name_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_name_strSizeY * i_esp_draw_strOffset, i_esp_draw_name_strSizeX + 8, i_esp_draw_name_strSizeY, 0, 0, 0, 127)

                renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_name_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_name_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "Name: " .. obj_serverEntCCSPlayer:get_name())

                i_esp_draw_strOffset = i_esp_draw_strOffset + 1
            end
            --
            --
            --  Health
            --
            --
            if ui.get(b_esp_draw_health) then
                local i_esp_draw_health_strSizeX, i_esp_draw_health_strSizeY = renderer.measure_text("b", "Health: " .. obj_serverEntCCSPlayer:get_health() .. "%")

                renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_health_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_health_strSizeY * i_esp_draw_strOffset, i_esp_draw_health_strSizeX + 8, i_esp_draw_health_strSizeY, 0, 0, 0, 127)

                renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_health_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_health_strSizeY * i_esp_draw_strOffset, 255 - 255 * obj_serverEntCCSPlayer:get_health() / 100, 255 * obj_serverEntCCSPlayer:get_health() / 100, 0, 255, "b", 0, "Health: " .. obj_serverEntCCSPlayer:get_health() .. "%")

                i_esp_draw_strOffset = i_esp_draw_strOffset + 1
            end
            --
            --
            --  Armor
            --
            --
            if ui.get(b_esp_draw_armor) then
                if obj_serverEntCCSPlayer:playerresource():get_armor() > 0 then
                    local i_esp_draw_armor_strSizeX, i_esp_draw_armor_strSizeY = renderer.measure_text("b", "Armor: " .. obj_serverEntCCSPlayer:playerresource():get_armor() .. "%")

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_armor_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_armor_strSizeY * i_esp_draw_strOffset, i_esp_draw_armor_strSizeX + 8, i_esp_draw_armor_strSizeY, 0, 0, 0, 127)

                    renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_armor_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_armor_strSizeY * i_esp_draw_strOffset, 127 + 127 * obj_serverEntCCSPlayer:playerresource():get_armor() / 100, 127 + 127 * obj_serverEntCCSPlayer:playerresource():get_armor() / 100, 127 + 127 * obj_serverEntCCSPlayer:playerresource():get_armor() / 100, 255, "b", 0, "Armor: " .. obj_serverEntCCSPlayer:playerresource():get_armor() .. "%")

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end
            end
            --
            --
            --  Distance
            --
            --
            if ui.get(str_esp_draw_distance) ~= "Off" then
                local i_localEntCCSPlayer_WorldPos = obj_localEntCCSPlayer:get_vec_origin()

                local value = math.sqrt((i_serverEntCCSPlayer_WorldPos.x - i_localEntCCSPlayer_WorldPos.x) ^ 2 + (i_serverEntCCSPlayer_WorldPos.y - i_localEntCCSPlayer_WorldPos.y) ^ 2 + (i_serverEntCCSPlayer_WorldPos.z - i_localEntCCSPlayer_WorldPos.z) ^ 2)
                local valueUnit = " u."

                if ui.get(str_esp_draw_distance) == "Metric" then
                    value = value * 0.01905
                    valueUnit = " m."
                end

                if ui.get(str_esp_draw_distance) == "Imperial" then
                    value = value * 0.075
                    valueUnit = " ft."
                end

                local i_esp_draw_distance_strSizeX, i_esp_draw_distance_strSizeY = renderer.measure_text("b", "Distance: " .. string.format("%d", value) .. valueUnit)

                renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_distance_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_distance_strSizeY * i_esp_draw_strOffset, i_esp_draw_distance_strSizeX + 8, i_esp_draw_distance_strSizeY, 0, 0, 0, 127)

                renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_distance_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_distance_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "Distance: " .. string.format("%d", value) .. valueUnit)

                i_esp_draw_strOffset = i_esp_draw_strOffset + 1
            end
            --
            --
            --  NAV Location
            --
            --
            if ui.get(b_esp_draw_navlocation) then
                local str_esp_draw_navlocation = entity.get_prop(entIndex_serverEntCCSPlayer, "m_szLastPlaceName", array_index)

                local i_esp_draw_navlocation_strSizeX, i_esp_draw_navlocation_strSizeY = renderer.measure_text("b", "Location: " .. str_esp_draw_navlocation)

                renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_navlocation_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_navlocation_strSizeY * i_esp_draw_strOffset, i_esp_draw_navlocation_strSizeX + 8, i_esp_draw_navlocation_strSizeY, 0, 0, 0, 127)

                renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_navlocation_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_navlocation_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "Location: " .. str_esp_draw_navlocation)

                i_esp_draw_strOffset = i_esp_draw_strOffset + 1
            end

            --
            --
            --  Weapons
            --
            --
            if ui.get(b_esp_draw_weapons) then
                i_esp_draw_strOffset = i_esp_draw_strOffset + 1

                local arr_esp_draw_weapons = obj_serverEntCCSPlayer:get_all_weapons()
                for i = 1, #arr_esp_draw_weapons do
                    local ent_esp_draw_weapon = arr_esp_draw_weapons[i]

                    local str_esp_draw_weapon = ""

                    if ui.get(b_esp_draw_ammo) and not(ent_esp_draw_weapon:is_knife()) and ent_esp_draw_weapon:get_current_ammo() ~= nil and ent_esp_draw_weapon:get_max_ammo() ~= nil then
                        str_esp_draw_weapon = ent_esp_draw_weapon:get_name() .. " (" .. ent_esp_draw_weapon:get_current_ammo() .. "/" .. ent_esp_draw_weapon:get_max_ammo() .. ")"
                    else
                        str_esp_draw_weapon = ent_esp_draw_weapon:get_name()
                    end

                    local i_esp_draw_weapon_strSizeX, i_esp_draw_weapon_strSizeY = renderer.measure_text("b", str_esp_draw_weapon)

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_weapon_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_weapon_strSizeY * i_esp_draw_strOffset, i_esp_draw_weapon_strSizeX + 8, i_esp_draw_weapon_strSizeY, 0, 0, 0, 127)

                    if ent_esp_draw_weapon:get_index() == obj_serverEntCCSPlayer:get_active_weapon():get_index() then
                        renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_weapon_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_weapon_strSizeY * i_esp_draw_strOffset, 255, 255, 0, 255, "b", 0, str_esp_draw_weapon)
                    else
                        renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_weapon_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_weapon_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, str_esp_draw_weapon)
                    end

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end
            end

            --
            --
            --  Player State
            --
            --
            if ui.get(b_esp_draw_state) then
                i_esp_draw_strOffset = i_esp_draw_strOffset + 1

                --
                --
                --  Is Scoped
                --
                --
                if obj_serverEntCCSPlayer:is_scoped() then
                    local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "Scoped")

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                    renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 255, 255, 0, 255, "b", 0, "Scoped")

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end
                --
                --
                --  Is Flashed
                --
                --
                if obj_serverEntCCSPlayer:is_flashed() then
                    local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "Flashed")

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                    renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 193, 240, 255, 255, "b", 0, "Flashed")

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end
                --
                --
                --  Has Bomb
                --
                --
                if obj_serverEntCCSPlayer:has_bomb() then
                    local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "Bombcarrier")

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                    renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 255, 127, 0, 255, "b", 0, "Bombcarrier")

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end
                --
                --
                --  Has Defuser
                --
                --
                if obj_serverEntCCSPlayer:has_defuser() then
                    local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "Has Kit")

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                    renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 0, 127, 255, 255, "b", 0, "Has Kit")

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end
                --
                --
                --  Is In Air
                --
                --
                if bit.band(obj_serverEntCCSPlayer:get_flags(), 1) ~= 1 then
                    local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "In Air")

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                    renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "In Air")

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end
                --
                --
                --  Is Ducking
                --
                --
                if bit.band(obj_serverEntCCSPlayer:get_flags(), 2) == 2 and bit.band(obj_serverEntCCSPlayer:get_flags(), 3) == 3 and bit.band(obj_serverEntCCSPlayer:get_flags(), 4) == 4 then
                    local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "Ducking")

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                    renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "Ducking")

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end
                --
                --
                --  Is In Water
                --
                --
                if bit.band(obj_serverEntCCSPlayer:get_flags(), 10) == 10 then
                    local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "In Water")

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                    renderer.text(i_serverEntCCSPlayer_ScreenPosX - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosY + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "In Water")

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end
            end
        else
            local i_serverEntCCSPlayer_ScreenBoundingBox = getStaticBoundingBox(entIndex_serverEntCCSPlayer)
            if i_serverEntCCSPlayer_ScreenBoundingBox.onScreen == false then
                return
            end
            local i_serverEntCCSPlayer_ScreenPosTop = {x = i_serverEntCCSPlayer_ScreenBoundingBox.x + math.floor(i_serverEntCCSPlayer_ScreenBoundingBox.width / 2), y = i_serverEntCCSPlayer_ScreenBoundingBox.y - 4}
            local i_serverEntCCSPlayer_ScreenPosBottom = {x = i_serverEntCCSPlayer_ScreenBoundingBox.x + math.floor(i_serverEntCCSPlayer_ScreenBoundingBox.width / 2), y = i_serverEntCCSPlayer_ScreenBoundingBox.y + i_serverEntCCSPlayer_ScreenBoundingBox.height - 8}
            local i_serverEntCCSPlayer_ScreenPosSideLeft = {x = i_serverEntCCSPlayer_ScreenBoundingBox.x - 8, y = i_serverEntCCSPlayer_ScreenBoundingBox.y}
            local i_serverEntCCSPlayer_ScreenPosSideRight = {x = i_serverEntCCSPlayer_ScreenBoundingBox.x + i_serverEntCCSPlayer_ScreenBoundingBox.width + 5, y = i_serverEntCCSPlayer_ScreenBoundingBox.y}

            --Top
            do
                local i_esp_draw_strOffset = -1

                --
                --
                --  Name
                --
                --
                if ui.get(b_esp_draw_name) then
                    local i_esp_draw_name_strSizeX, i_esp_draw_name_strSizeY = renderer.measure_text("b", "Name: " .. obj_serverEntCCSPlayer:get_name())

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_name_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_name_strSizeY * i_esp_draw_strOffset, i_esp_draw_name_strSizeX + 8, i_esp_draw_name_strSizeY, 0, 0, 0, 127)

                    renderer.text(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_name_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_name_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "Name: " .. obj_serverEntCCSPlayer:get_name())

                    i_esp_draw_strOffset = i_esp_draw_strOffset - 1
                end

                --
                --
                --  Player State
                --
                --
                if ui.get(b_esp_draw_state) then
                    i_esp_draw_strOffset = i_esp_draw_strOffset - 1

                    --
                    --
                    --  Is Scoped
                    --
                    --
                    if obj_serverEntCCSPlayer:is_scoped() then
                        local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "Scoped")

                        renderer.rectangle(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                        renderer.text(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 255, 255, 0, 255, "b", 0, "Scoped")

                        i_esp_draw_strOffset = i_esp_draw_strOffset - 1
                    end
                    --
                    --
                    --  Is Flashed
                    --
                    --
                    if obj_serverEntCCSPlayer:is_flashed() then
                        local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "Flashed")

                        renderer.rectangle(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                        renderer.text(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 193, 240, 255, 255, "b", 0, "Flashed")

                        i_esp_draw_strOffset = i_esp_draw_strOffset - 1
                    end
                    --
                    --
                    --  Has Bomb
                    --
                    --
                    if obj_serverEntCCSPlayer:has_bomb() then
                        local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "Bombcarrier")

                        renderer.rectangle(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                        renderer.text(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 255, 127, 0, 255, "b", 0, "Bombcarrier")

                        i_esp_draw_strOffset = i_esp_draw_strOffset - 1
                    end
                    --
                    --
                    --  Has Defuser
                    --
                    --
                    if obj_serverEntCCSPlayer:has_defuser() then
                        local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "Has Kit")

                        renderer.rectangle(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                        renderer.text(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 0, 127, 255, 255, "b", 0, "Has Kit")

                        i_esp_draw_strOffset = i_esp_draw_strOffset - 1
                    end
                    --
                    --
                    --  Is In Air
                    --
                    --
                    if bit.band(obj_serverEntCCSPlayer:get_flags(), 1) ~= 1 then
                        local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "In Air")

                        renderer.rectangle(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                        renderer.text(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "In Air")

                        i_esp_draw_strOffset = i_esp_draw_strOffset - 1
                    end
                    --
                    --
                    --  Is Ducking
                    --
                    --
                    if bit.band(obj_serverEntCCSPlayer:get_flags(), 2) == 2 and bit.band(obj_serverEntCCSPlayer:get_flags(), 3) == 3 and bit.band(obj_serverEntCCSPlayer:get_flags(), 4) == 4 then
                        local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "Ducking")

                        renderer.rectangle(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                        renderer.text(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "Ducking")

                        i_esp_draw_strOffset = i_esp_draw_strOffset - 1
                    end
                    --
                    --
                    --  Is In Water
                    --
                    --
                    if bit.band(obj_serverEntCCSPlayer:get_flags(), 10) == 10 then
                        local i_esp_draw_state_strSizeX, i_esp_draw_state_strSizeY = renderer.measure_text("b", "In Water")

                        renderer.rectangle(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, i_esp_draw_state_strSizeX + 8, i_esp_draw_state_strSizeY, 0, 0, 0, 127)

                        renderer.text(i_serverEntCCSPlayer_ScreenPosTop.x - i_esp_draw_state_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosTop.y + i_esp_draw_state_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "In Water")

                        i_esp_draw_strOffset = i_esp_draw_strOffset - 1
                    end
                end
            end

            --Bottom
            do
                local i_esp_draw_strOffset = 1

                --
                --
                --  Distance
                --
                --
                if ui.get(str_esp_draw_distance) ~= "Off" then
                    local i_localEntCCSPlayer_WorldPos = obj_localEntCCSPlayer:get_vec_origin()

                    local value = math.sqrt((i_serverEntCCSPlayer_WorldPos.x - i_localEntCCSPlayer_WorldPos.x) ^ 2 + (i_serverEntCCSPlayer_WorldPos.y - i_localEntCCSPlayer_WorldPos.y) ^ 2 + (i_serverEntCCSPlayer_WorldPos.z - i_localEntCCSPlayer_WorldPos.z) ^ 2)
                    local valueUnit = " u."

                    if ui.get(str_esp_draw_distance) == "Metric" then
                        value = value * 0.01905
                        valueUnit = " m."
                    end

                    if ui.get(str_esp_draw_distance) == "Imperial" then
                        value = value * 0.075
                        valueUnit = " ft."
                    end

                    local i_esp_draw_distance_strSizeX, i_esp_draw_distance_strSizeY = renderer.measure_text("b", "Distance: " .. string.format("%d", value) .. valueUnit)

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosBottom.x - i_esp_draw_distance_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosBottom.y + i_esp_draw_distance_strSizeY * i_esp_draw_strOffset, i_esp_draw_distance_strSizeX + 8, i_esp_draw_distance_strSizeY, 0, 0, 0, 127)

                    renderer.text(i_serverEntCCSPlayer_ScreenPosBottom.x - i_esp_draw_distance_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosBottom.y + i_esp_draw_distance_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "Distance: " .. string.format("%d", value) .. valueUnit)

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end

                --
                --
                --  Weapons
                --
                --
                if ui.get(b_esp_draw_weapons) then
                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1

                    local arr_esp_draw_weapons = obj_serverEntCCSPlayer:get_all_weapons()
                    for i = 1, #arr_esp_draw_weapons do
                        local ent_esp_draw_weapon = arr_esp_draw_weapons[i]

                        local str_esp_draw_weapon = ""

                        if ui.get(b_esp_draw_ammo) and not(ent_esp_draw_weapon:is_knife()) and ent_esp_draw_weapon:get_current_ammo() ~= nil and ent_esp_draw_weapon:get_max_ammo() ~= nil then
                            str_esp_draw_weapon = ent_esp_draw_weapon:get_name() .. " (" .. ent_esp_draw_weapon:get_current_ammo() .. "/" .. ent_esp_draw_weapon:get_max_ammo() .. ")"
                        else
                            str_esp_draw_weapon = ent_esp_draw_weapon:get_name()
                        end

                        local i_esp_draw_weapon_strSizeX, i_esp_draw_weapon_strSizeY = renderer.measure_text("b", str_esp_draw_weapon)

                        renderer.rectangle(i_serverEntCCSPlayer_ScreenPosBottom.x - i_esp_draw_weapon_strSizeX / 2 - 4, i_serverEntCCSPlayer_ScreenPosBottom.y + i_esp_draw_weapon_strSizeY * i_esp_draw_strOffset, i_esp_draw_weapon_strSizeX + 8, i_esp_draw_weapon_strSizeY, 0, 0, 0, 127)

                        if ent_esp_draw_weapon:get_index() == obj_serverEntCCSPlayer:get_active_weapon():get_index() then
                            renderer.text(i_serverEntCCSPlayer_ScreenPosBottom.x - i_esp_draw_weapon_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosBottom.y + i_esp_draw_weapon_strSizeY * i_esp_draw_strOffset, 255, 255, 0, 255, "b", 0, str_esp_draw_weapon)
                        else
                            renderer.text(i_serverEntCCSPlayer_ScreenPosBottom.x - i_esp_draw_weapon_strSizeX / 2, i_serverEntCCSPlayer_ScreenPosBottom.y + i_esp_draw_weapon_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, str_esp_draw_weapon)
                        end

                        i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                    end
                end
            end

            --Side Left
            do
                local i_esp_draw_strOffset = 0

                --
                --
                --  Health
                --
                --
                if ui.get(b_esp_draw_health) then
                    local i_esp_draw_health_strSizeX, i_esp_draw_health_strSizeY = renderer.measure_text("b", "HP: " .. obj_serverEntCCSPlayer:get_health() .. "%")

                    
                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosSideLeft.x - 4, i_serverEntCCSPlayer_ScreenPosSideLeft.y, 6, i_serverEntCCSPlayer_ScreenBoundingBox.height + 1, 0, 0, 0, 127)
                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosSideLeft.x - 3, i_serverEntCCSPlayer_ScreenPosSideLeft.y + 1 + (i_serverEntCCSPlayer_ScreenBoundingBox.height - math.floor(i_serverEntCCSPlayer_ScreenBoundingBox.height * obj_serverEntCCSPlayer:get_health() / 100)), 4, math.floor(i_serverEntCCSPlayer_ScreenBoundingBox.height * obj_serverEntCCSPlayer:get_health() / 100) - 1, 255 - 255 * obj_serverEntCCSPlayer:get_health() / 100, 255 * obj_serverEntCCSPlayer:get_health() / 100, 0, 255)
                    
                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosSideLeft.x - i_esp_draw_health_strSizeX - 12, i_serverEntCCSPlayer_ScreenPosSideLeft.y + i_esp_draw_health_strSizeY * i_esp_draw_strOffset + (i_serverEntCCSPlayer_ScreenBoundingBox.height - math.floor(i_serverEntCCSPlayer_ScreenBoundingBox.height * obj_serverEntCCSPlayer:get_health() / 100)), i_esp_draw_health_strSizeX + 8, i_esp_draw_health_strSizeY, 0, 0, 0, 127)
                    renderer.text(i_serverEntCCSPlayer_ScreenPosSideLeft.x - 8, i_serverEntCCSPlayer_ScreenPosSideLeft.y + i_esp_draw_health_strSizeY * i_esp_draw_strOffset + (i_serverEntCCSPlayer_ScreenBoundingBox.height - math.floor(i_serverEntCCSPlayer_ScreenBoundingBox.height * obj_serverEntCCSPlayer:get_health() / 100)), 255 - 255 * obj_serverEntCCSPlayer:get_health() / 100, 255 * obj_serverEntCCSPlayer:get_health() / 100, 0, 255, "br", 0, "HP: " .. obj_serverEntCCSPlayer:get_health() .. "%")

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end
                --
                --
                --  Armor
                --
                --
                if ui.get(b_esp_draw_armor) then
                    if obj_serverEntCCSPlayer:playerresource():get_armor() > 0 then
                        local i_esp_draw_armor_strSizeX, i_esp_draw_armor_strSizeY = renderer.measure_text("b", "Armor: " .. obj_serverEntCCSPlayer:playerresource():get_armor() .. "%")

                        renderer.rectangle(i_serverEntCCSPlayer_ScreenPosSideLeft.x - i_esp_draw_armor_strSizeX - 12, i_serverEntCCSPlayer_ScreenPosSideLeft.y + i_esp_draw_armor_strSizeY * i_esp_draw_strOffset + (i_serverEntCCSPlayer_ScreenBoundingBox.height - math.floor(i_serverEntCCSPlayer_ScreenBoundingBox.height * obj_serverEntCCSPlayer:get_health() / 100)), i_esp_draw_armor_strSizeX + 8, i_esp_draw_armor_strSizeY, 0, 0, 0, 127)

                        renderer.text(i_serverEntCCSPlayer_ScreenPosSideLeft.x - 8, i_serverEntCCSPlayer_ScreenPosSideLeft.y + i_esp_draw_armor_strSizeY * i_esp_draw_strOffset + (i_serverEntCCSPlayer_ScreenBoundingBox.height - math.floor(i_serverEntCCSPlayer_ScreenBoundingBox.height * obj_serverEntCCSPlayer:get_health() / 100)), 127 + 127 * obj_serverEntCCSPlayer:playerresource():get_armor() / 100, 127 + 127 * obj_serverEntCCSPlayer:playerresource():get_armor() / 100, 127 + 127 * obj_serverEntCCSPlayer:playerresource():get_armor() / 100, 255, "br", 0, "Armor: " .. obj_serverEntCCSPlayer:playerresource():get_armor() .. "%")

                        i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                    end
                end
            end

            --Side Right
            do
                local i_esp_draw_strOffset = 0

                --
                --
                --  NAV Location
                --
                --
                if ui.get(b_esp_draw_navlocation) then
                    local str_esp_draw_navlocation = entity.get_prop(entIndex_serverEntCCSPlayer, "m_szLastPlaceName", array_index)

                    local i_esp_draw_navlocation_strSizeX, i_esp_draw_navlocation_strSizeY = renderer.measure_text("b", "Location: " .. str_esp_draw_navlocation)

                    renderer.rectangle(i_serverEntCCSPlayer_ScreenPosSideRight.x, i_serverEntCCSPlayer_ScreenPosSideRight.y + i_esp_draw_navlocation_strSizeY * i_esp_draw_strOffset, i_esp_draw_navlocation_strSizeX + 8, i_esp_draw_navlocation_strSizeY, 0, 0, 0, 127)

                    renderer.text(i_serverEntCCSPlayer_ScreenPosSideRight.x + 4, i_serverEntCCSPlayer_ScreenPosSideRight.y + i_esp_draw_navlocation_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "Location: " .. str_esp_draw_navlocation)

                    i_esp_draw_strOffset = i_esp_draw_strOffset + 1
                end
            end
        end
    end
end

function func_esp_drawWeaponInfo(entIndex_serverEntCWeaponCSBase, accentColor01, accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
    local obj_serverEntCWeaponCSBase = Entity(entIndex_serverEntCWeaponCSBase)
    local obj_localEntCCSPlayer = Player(entIndex_localEntCCSPlayer)

    local i_serverEntCWeaponCSBase_WorldPos = obj_serverEntCWeaponCSBase:get_vec_origin()

    local i_serverEntCWeaponCSBase_ScreenPosX, i_serverEntCWeaponCSBase_ScreenPosY = renderer.world_to_screen(i_serverEntCWeaponCSBase_WorldPos.x, i_serverEntCWeaponCSBase_WorldPos.y, i_serverEntCWeaponCSBase_WorldPos.z)

    obj_serverEntCWeaponCSBase = Weapon(entIndex_serverEntCWeaponCSBase)

    if i_serverEntCWeaponCSBase_ScreenPosX ~= nil and i_serverEntCWeaponCSBase_ScreenPosY ~= nil then
        i_serverEntCWeaponCSBase_ScreenPosX, i_serverEntCWeaponCSBase_ScreenPosY = func_esp_clamptoscreen(i_esp_drawScreenWidth, i_esp_drawScreenHeight, i_esp_anchorPosX, i_esp_anchorPosY, i_serverEntCWeaponCSBase_ScreenPosX, i_serverEntCWeaponCSBase_ScreenPosY, ui.get(i_esp_paddingScreenXY))

        local i_esp_draw_strOffset = 1
        --
        --
        --  Name
        --
        --
        if ui.get(b_esp_draw_name) then
            local str_esp_draw_weapon = ""

            if ui.get(b_esp_draw_ammo) then
                if entity.get_classname(entIndex_serverEntCWeaponCSBase) ~= "CWeaponTaser" then
                    str_esp_draw_weapon = obj_serverEntCWeaponCSBase:get_name() .. " (" .. obj_serverEntCWeaponCSBase:get_current_ammo() .. "/" .. obj_serverEntCWeaponCSBase:get_max_ammo() .. ")"
                else
                    if entity.get_prop(entIndex_serverEntCWeaponCSBase, "m_iClip1", array_index) > 0 then
                        str_esp_draw_weapon = obj_serverEntCWeaponCSBase:get_name() .. " (" .. "Charged" .. ")"
                    else
                        str_esp_draw_weapon = obj_serverEntCWeaponCSBase:get_name() .. " (" .. "Empty" .. ")"
                    end
                end
            else
                str_esp_draw_weapon = obj_serverEntCWeaponCSBase:get_name()
            end
            local i_esp_draw_name_strSizeX, i_esp_draw_name_strSizeY = renderer.measure_text("b", str_esp_draw_weapon)

            renderer.rectangle(i_serverEntCWeaponCSBase_ScreenPosX - i_esp_draw_name_strSizeX / 2 - 4, i_serverEntCWeaponCSBase_ScreenPosY + i_esp_draw_name_strSizeY * i_esp_draw_strOffset, i_esp_draw_name_strSizeX + 8, i_esp_draw_name_strSizeY, 0, 0, 0, 127)

            renderer.text(i_serverEntCWeaponCSBase_ScreenPosX - i_esp_draw_name_strSizeX / 2, i_serverEntCWeaponCSBase_ScreenPosY + i_esp_draw_name_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, str_esp_draw_weapon)

            i_esp_draw_strOffset = i_esp_draw_strOffset + 1
        end
        --
        --
        --  Distance
        --
        --
        if ui.get(str_esp_draw_distance) ~= "Off" then
            local i_localEntCCSPlayer_WorldPos = obj_localEntCCSPlayer:get_vec_origin()

            local value = math.sqrt((i_serverEntCWeaponCSBase_WorldPos.x - i_localEntCCSPlayer_WorldPos.x) ^ 2 + (i_serverEntCWeaponCSBase_WorldPos.y - i_localEntCCSPlayer_WorldPos.y) ^ 2 + (i_serverEntCWeaponCSBase_WorldPos.z - i_localEntCCSPlayer_WorldPos.z) ^ 2)
            local valueUnit = " u."

            if ui.get(str_esp_draw_distance) == "Metric" then
                value = value * 0.01905
                valueUnit = " m."
            end

            if ui.get(str_esp_draw_distance) == "Imperial" then
                value = value * 0.075
                valueUnit = " ft."
            end

            local i_esp_draw_distance_strSizeX, i_esp_draw_distance_strSizeY = renderer.measure_text("b", "Distance: " .. string.format("%d", value) .. valueUnit)

            renderer.rectangle(i_serverEntCWeaponCSBase_ScreenPosX - i_esp_draw_distance_strSizeX / 2 - 4, i_serverEntCWeaponCSBase_ScreenPosY + i_esp_draw_distance_strSizeY * i_esp_draw_strOffset, i_esp_draw_distance_strSizeX + 8, i_esp_draw_distance_strSizeY, 0, 0, 0, 127)

            renderer.text(i_serverEntCWeaponCSBase_ScreenPosX - i_esp_draw_distance_strSizeX / 2, i_serverEntCWeaponCSBase_ScreenPosY + i_esp_draw_distance_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "Distance: " .. string.format("%d", value) .. valueUnit)

            i_esp_draw_strOffset = i_esp_draw_strOffset + 1
        end
    end
end

function func_esp_drawEntityInfo(entIndex_serverEntCAny, accentColor01, accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
    local obj_serverEntCAny = Entity(entIndex_serverEntCAny)
    local obj_localEntCCSPlayer = Player(entIndex_localEntCCSPlayer)

    local i_serverEntCAny_WorldPos = obj_serverEntCAny:get_vec_origin()

    local i_serverEntCAny_ScreenPosX, i_serverEntCAny_ScreenPosY = renderer.world_to_screen(i_serverEntCAny_WorldPos.x, i_serverEntCAny_WorldPos.y, i_serverEntCAny_WorldPos.z)

    if i_serverEntCAny_ScreenPosX ~= nil and i_serverEntCAny_ScreenPosY ~= nil then
        i_serverEntCAny_ScreenPosX, i_serverEntCAny_ScreenPosY = func_esp_clamptoscreen(i_esp_drawScreenWidth, i_esp_drawScreenHeight, i_esp_anchorPosX, i_esp_anchorPosY, i_serverEntCAny_ScreenPosX, i_serverEntCAny_ScreenPosY, ui.get(i_esp_paddingScreenXY))

        local i_esp_draw_strOffset = 1
        --
        --
        --  Name
        --
        --
        if ui.get(b_esp_draw_name) then
            local str_esp_draw_name = ""

            local i_esp_draw_name_strSizeX, i_esp_draw_name_strSizeY

            if entity.get_classname(entIndex_serverEntCAny) == "CC4" then
                str_esp_draw_name = "C4"
            elseif entity.get_classname(entIndex_serverEntCAny) == "CPlantedC4" then
                -- TODO: Add timer
                str_esp_draw_name = "C4 (Planted)"
            elseif entity.get_classname(entIndex_serverEntCAny) == "CHostage" then
                str_esp_draw_name = "Hostage"
            elseif entity.get_classname(entIndex_serverEntCAny) == "CEconEntity" then
                str_esp_draw_name = "Kit"
            else
                str_esp_draw_name = obj_serverEntCAny:get_classname()
            end

            i_esp_draw_name_strSizeX, i_esp_draw_name_strSizeY = renderer.measure_text("b", str_esp_draw_name)

            renderer.rectangle(i_serverEntCAny_ScreenPosX - i_esp_draw_name_strSizeX / 2 - 4, i_serverEntCAny_ScreenPosY + i_esp_draw_name_strSizeY * i_esp_draw_strOffset, i_esp_draw_name_strSizeX + 8, i_esp_draw_name_strSizeY, 0, 0, 0, 127)

            renderer.text(i_serverEntCAny_ScreenPosX - i_esp_draw_name_strSizeX / 2, i_serverEntCAny_ScreenPosY + i_esp_draw_name_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, str_esp_draw_name)

            i_esp_draw_strOffset = i_esp_draw_strOffset + 1
        end
        --
        --
        --  Distance
        --
        --
        if ui.get(str_esp_draw_distance) ~= "Off" then
            local i_localEntCCSPlayer_WorldPos = obj_localEntCCSPlayer:get_vec_origin()

            local value = math.sqrt((i_serverEntCAny_WorldPos.x - i_localEntCCSPlayer_WorldPos.x) ^ 2 + (i_serverEntCAny_WorldPos.y - i_localEntCCSPlayer_WorldPos.y) ^ 2 + (i_serverEntCAny_WorldPos.z - i_localEntCCSPlayer_WorldPos.z) ^ 2)
            local valueUnit = " u."

            if ui.get(str_esp_draw_distance) == "Metric" then
                value = value * 0.01905
                valueUnit = " m."
            end

            if ui.get(str_esp_draw_distance) == "Imperial" then
                value = value * 0.075
                valueUnit = " ft."
            end

            local i_esp_draw_distance_strSizeX, i_esp_draw_distance_strSizeY = renderer.measure_text("b", "Distance: " .. string.format("%d", value) .. valueUnit)

            renderer.rectangle(i_serverEntCAny_ScreenPosX - i_esp_draw_distance_strSizeX / 2 - 4, i_serverEntCAny_ScreenPosY + i_esp_draw_distance_strSizeY * i_esp_draw_strOffset, i_esp_draw_distance_strSizeX + 8, i_esp_draw_distance_strSizeY, 0, 0, 0, 127)

            renderer.text(i_serverEntCAny_ScreenPosX - i_esp_draw_distance_strSizeX / 2, i_serverEntCAny_ScreenPosY + i_esp_draw_distance_strSizeY * i_esp_draw_strOffset, 255, 255, 255, 255, "b", 0, "Distance: " .. string.format("%d", value) .. valueUnit)

            i_esp_draw_strOffset = i_esp_draw_strOffset + 1
        end
    end
end

function func_esp_draw(ctx)
    local arr = ui.get(str_esp_filter_playerType);
    
    if not ui.get(b_esp_enable) then
        return
    end

    local i_esp_anchorPosX = math.floor(i_esp_drawScreenWidth * (ui.get(f_esp_anchorScreenX) / 100))
    local i_esp_anchorPosY = math.floor(i_esp_drawScreenHeight * (ui.get(f_esp_anchorScreenY) / 100))

    i_esp_anchorPosX = math.min(i_esp_drawScreenWidth - ui.get(i_esp_paddingScreenXY), math.max(ui.get(i_esp_paddingScreenXY), i_esp_anchorPosX))

    i_esp_anchorPosY = math.min(i_esp_drawScreenHeight - ui.get(i_esp_paddingScreenXY), math.max(ui.get(i_esp_paddingScreenXY), i_esp_anchorPosY))

    local f_esp_globalRealtime = globals.realtime()

    entIndex_localEntCCSPlayer = entity.get_local_player();
    entIndex_localEntCCSPlayer_kTeamid = entity.get_prop(entIndex_localEntCCSPlayer, "m_iTeamNum", array_index)

    b_esp_filter_mapObjective_accentColor01 = func_esp_rainbowize(4, 255, 1, 0, 255, f_esp_globalRealtime, 0, 127)
    b_esp_filter_mapObjective_accentColor02 = func_esp_rainbowize(4, 255, 1, 0, 255, f_esp_globalRealtime, 0, 255)

    b_esp_filter_mapObjective_accentColor01[4] = 255
    b_esp_filter_mapObjective_accentColor02[4] = 255

    if ui.get(str_esp_filter_player) ~= nil then
        local arr_entIndex_serverEntCCSPlayer = entity.get_players(false)
        if ui.get(str_esp_filter_player) == "On (Ally/Enemy)" then --Differentiate by relationship
            for i = 1, #arr_entIndex_serverEntCCSPlayer do
                local entIndex_serverEntCCSPlayer = arr_entIndex_serverEntCCSPlayer[i]
                local obj_serverEntCCSPlayer = Player(entIndex_serverEntCCSPlayer)

                if obj_serverEntCCSPlayer:is_alive() then
                    local i_serverEntCCSPlayer_kTeamid = obj_serverEntCCSPlayer:get_teamnum()

                    if table_contains_str(ui.get(str_esp_filter_playerType), "Enemy") then
                        if entIndex_serverEntCCSPlayer ~= entIndex_localEntCCSPlayer and i_serverEntCCSPlayer_kTeamid ~= entIndex_localEntCCSPlayer_kTeamid then
                            func_esp_drawSnapLine(entIndex_serverEntCCSPlayer, b_esp_filter_playerEnemy_accentColor01, b_esp_filter_playerEnemy_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
                            func_esp_drawBoxStatic(entIndex_serverEntCCSPlayer, b_esp_filter_playerEnemy_accentColor01, b_esp_filter_playerEnemy_accentColor02)
                            func_esp_drawPlayerInfo(entIndex_serverEntCCSPlayer, b_esp_filter_playerEnemy_accentColor01, b_esp_filter_playerEnemy_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
                        end
                    end

                    if table_contains_str(ui.get(str_esp_filter_playerType), "Ally") then
                        if entIndex_serverEntCCSPlayer ~= entIndex_localEntCCSPlayer and i_serverEntCCSPlayer_kTeamid == entIndex_localEntCCSPlayer_kTeamid then
                            func_esp_drawSnapLine(entIndex_serverEntCCSPlayer, b_esp_filter_playerAlly_accentColor01, b_esp_filter_playerAlly_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
                            func_esp_drawBoxStatic(entIndex_serverEntCCSPlayer, b_esp_filter_playerAlly_accentColor01, b_esp_filter_playerAlly_accentColor02)
                            func_esp_drawPlayerInfo(entIndex_serverEntCCSPlayer, b_esp_filter_playerAlly_accentColor01, b_esp_filter_playerAlly_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
                        end
                    end
                end
            end
        end
        if ui.get(str_esp_filter_player) == "On (CT/T)" then --Differentiate by team
            for i = 1, #arr_entIndex_serverEntCCSPlayer do
                local entIndex_serverEntCCSPlayer = arr_entIndex_serverEntCCSPlayer[i]
                local obj_serverEntCCSPlayer = Player(entIndex_serverEntCCSPlayer)

                if obj_serverEntCCSPlayer:is_alive() then
                    local i_serverEntCCSPlayer_kTeamid = obj_serverEntCCSPlayer:get_teamnum()

                    if table_contains_str(ui.get(str_esp_filter_playerType), "T") then
                        if entIndex_serverEntCCSPlayer ~= entIndex_localEntCCSPlayer and i_serverEntCCSPlayer_kTeamid == 2 then
                            func_esp_drawSnapLine(entIndex_serverEntCCSPlayer, b_esp_filter_playerT_accentColor01, b_esp_filter_playerT_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
                            func_esp_drawBoxStatic(entIndex_serverEntCCSPlayer, b_esp_filter_playerT_accentColor01, b_esp_filter_playerT_accentColor02)
                            func_esp_drawPlayerInfo(entIndex_serverEntCCSPlayer, b_esp_filter_playerT_accentColor01, b_esp_filter_playerT_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
                        end
                    end

                    if table_contains_str(ui.get(str_esp_filter_playerType), "CT") then
                        if entIndex_serverEntCCSPlayer ~= entIndex_localEntCCSPlayer and i_serverEntCCSPlayer_kTeamid == 3 then
                            func_esp_drawSnapLine(entIndex_serverEntCCSPlayer, b_esp_filter_playerCT_accentColor01, b_esp_filter_playerCT_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
                            func_esp_drawBoxStatic(entIndex_serverEntCCSPlayer, b_esp_filter_playerCT_accentColor01, b_esp_filter_playerCT_accentColor02)
                            func_esp_drawPlayerInfo(entIndex_serverEntCCSPlayer, b_esp_filter_playerCT_accentColor01, b_esp_filter_playerCT_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
                        end
                    end
                end
            end
        end
    end

    if ui.get(b_esp_filter_weapon) then
        local arr_entIndex_serverEntCWeaponCSBase = entity.get_all()
        for i = 1, #arr_entIndex_serverEntCWeaponCSBase do
            local entIndex_serverEntCWeaponCSBase = arr_entIndex_serverEntCWeaponCSBase[i]

            local obj_serverEntCWeaponCSBase = Entity(entIndex_serverEntCWeaponCSBase)

            if (string.find(entity.get_classname(entIndex_serverEntCWeaponCSBase), "CWeapon") ~= nil or 
                string.find(entity.get_classname(entIndex_serverEntCWeaponCSBase), "CDEagle") ~= nil or 
                string.find(entity.get_classname(entIndex_serverEntCWeaponCSBase), "CAK47") ~= nil) and entity.get_prop(entIndex_serverEntCWeaponCSBase, "m_hOwner", array_index) == nil then
                func_esp_drawSnapLine(entIndex_serverEntCWeaponCSBase, b_esp_filter_weapons_accentColor01, b_esp_filter_weapons_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
                func_esp_drawBoxStatic(entIndex_serverEntCWeaponCSBase, b_esp_filter_weapons_accentColor01, b_esp_filter_weapons_accentColor02)
                func_esp_drawWeaponInfo(entIndex_serverEntCWeaponCSBase, b_esp_filter_weapons_accentColor01, b_esp_filter_weapons_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
            end
        end
    end

    if ui.get(b_esp_filter_mapObjective) then
        local arr_entIndex_serverEntCAny = entity.get_all()
        for i = 1, #arr_entIndex_serverEntCAny do
            local entIndex_serverEntCAny = arr_entIndex_serverEntCAny[i]

            if ((string.find(entity.get_classname(entIndex_serverEntCAny), "CC4") ~= nil and entity.get_prop(entIndex_serverEntCAny, "m_hOwner", array_index) == nil) or 
                (string.find(entity.get_classname(entIndex_serverEntCAny), "CHostage") ~= nil and string.find(entity.get_classname(entIndex_serverEntCAny), "CHostageCarriableProp") == nil) or
                (string.find(entity.get_classname(entIndex_serverEntCAny), "CEconEntity") ~= nil and entIndex_localEntCCSPlayer_kTeamid ~= 2) or
                string.find(entity.get_classname(entIndex_serverEntCAny), "CPlantedC4") ~= nil) then
                func_esp_drawSnapLine(entIndex_serverEntCAny, b_esp_filter_mapObjective_accentColor01, b_esp_filter_mapObjective_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
                func_esp_drawBoxStatic(entIndex_serverEntCAny, b_esp_filter_mapObjective_accentColor01, b_esp_filter_mapObjective_accentColor02)
                func_esp_drawEntityInfo(entIndex_serverEntCAny, b_esp_filter_mapObjective_accentColor01, b_esp_filter_mapObjective_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
            end
        end
    end

    if ui.get(b_esp_filter_other) then
        local arr_entIndex_serverEntCAny = entity.get_all()
        for i = 1, #arr_entIndex_serverEntCAny do
            local entIndex_serverEntCAny = arr_entIndex_serverEntCAny[i]

            if (string.find(entity.get_classname(entIndex_serverEntCAny), "CWeapon") == nil and
                string.find(entity.get_classname(entIndex_serverEntCAny), "CDEagle") == nil and
                string.find(entity.get_classname(entIndex_serverEntCAny), "CAK47") == nil and
                string.find(entity.get_classname(entIndex_serverEntCAny), "CCSPlayer") == nil and
                string.find(entity.get_classname(entIndex_serverEntCAny), "CCSTeam") == nil and
                string.find(entity.get_classname(entIndex_serverEntCAny), "CC4") == nil and
                string.find(entity.get_classname(entIndex_serverEntCAny), "CHostage") == nil and
                string.find(entity.get_classname(entIndex_serverEntCAny), "CEconEntity") == nil and
                string.find(entity.get_classname(entIndex_serverEntCAny), "CPlantedC4") == nil and
                string.find(entity.get_classname(entIndex_serverEntCAny), "CCSGameRulesProxy") == nil) then             -- entity which does not have origin
                func_esp_drawSnapLine(entIndex_serverEntCAny, b_esp_filter_other_accentColor01, b_esp_filter_other_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
                func_esp_drawBoxStatic(entIndex_serverEntCAny, b_esp_filter_other_accentColor01, b_esp_filter_other_accentColor02)
                func_esp_drawEntityInfo(entIndex_serverEntCAny, b_esp_filter_other_accentColor01, b_esp_filter_other_accentColor02, i_esp_anchorPosX, i_esp_anchorPosY)
            end
        end
    end
end

client.set_event_callback("paint", func_esp_draw)

-- [End of file] -----------------------------------------------------------------------------------------------------------------------------------------------