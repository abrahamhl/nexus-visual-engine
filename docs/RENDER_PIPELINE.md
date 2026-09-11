# Nexus Visual Engine: Render Pipeline

## Current Truth
Nexus Visual Engine implements an extreme-performance WebGL pipeline using custom shaders in Three.js, completely bypassing standard geometry processing to achieve consistent 60+ FPS in browsers.

## 1. Frame Processing
The pipeline relies primarily on `THREE.ShaderMaterial` attached to flat `PlaneGeometry` covering the camera view. Instead of calculating thousands of individual object meshes on the CPU, we push a single polygon and execute all math in the Fragment Shader (GLSL).
- The FPS and active draw calls are now instrumented via the Developer HUD (`Shift+D`).
- A deterministic audio Test Signal (`Shift+T`) can be toggled to verify audio-reactive pathways without relying on live microphone input or MP3 playback.

## 2. Adaptive Quality
To maintain stability, the engine actively profiles framerate (`_fps`). If the FPS drops below 30 consistently, the `autoQuality` function automatically down-samples the `pixelRatio`, trading sharpness for frame stability.

## 3. Audio-Reactive Integration
Instead of reading audio arrays frame-by-frame on the CPU and sending uniforms (which can cause IPC bottlenecks), we extract abstract features (`AudioFeatures.bass`, `AudioFeatures.energy`, `phase`) in a lightweight JavaScript loop and pass those aggregated scalars to the GLSL programs.

## 4. Draw Call Economy
Standard scene graphs loop through objects, triggering individual draw calls per mesh. The Nexus pipeline coalesces visual complexity into procedural raymarching and domain warping. As a result, the `Draw Calls` metric remains between 1 and 3, even when rendering scenes that appear to have millions of particles or complex SDFs (Signed Distance Fields).
