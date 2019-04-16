-- scaffold geniefile for glm

glm_script = path.getabsolute(path.getdirectory(_SCRIPT))
glm_root = path.join(glm_script, "glm")

glm_includedirs = {
	path.join(glm_script, "config"),
	glm_root,
}

glm_libdirs = {}
glm_links = {}
glm_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { glm_includedirs }
	end,

	_add_defines = function()
		defines { glm_defines }
	end,

	_add_libdirs = function()
		libdirs { glm_libdirs }
	end,

	_add_external_links = function()
		links { glm_links }
	end,

	_add_self_links = function()
		links { "glm" }
	end,

	_create_projects = function()

project "glm"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		glm_includedirs,
	}

	defines {}

	files {
		path.join(glm_script, "config", "**.h"),
		path.join(glm_root, "**.h"),
		path.join(glm_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
