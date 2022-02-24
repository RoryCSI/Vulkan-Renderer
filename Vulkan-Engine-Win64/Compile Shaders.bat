for %%I in (Shaders/*.vert) do C:\VulkanSDK\1.3.204.0\Bin\glslc.exe Shaders\%%~nxI -o Shaders\spv\%%~nI.spv

for %%I in (Shaders/*.frag) do C:\VulkanSDK\1.3.204.0\Bin\glslc.exe Shaders\%%~nxI -o Shaders\spv\%%~nI.spv