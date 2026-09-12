# Performance & Systems Audit

## Perspective: Performance Engineer
**Focus:** FPS stability, GPU memory, garbage collection.

### Findings
1. **Garbage Collection:** Rapid effect switching previously leaked ShaderMaterials because .dispose() was not systematically called.
2. **Adaptive Quality:** The stepDownQuality function actively protects the main thread if FPS dips < 30.

### Action Items
- [x] Monitored via the Developer HUD (Shift+D).
