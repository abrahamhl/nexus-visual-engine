# NEXUS VISUAL ENGINE

**Reactive Simulators Gallery — 30 motores visuales WebGL audio‑reactivos** para DJ sets, instalaciones inmersivas, exposiciones y performance en directo.

Un único archivo (`index.html`), sin frameworks de build, sin backend: Three.js + Web Audio API + GLSL puro. Todo el audio se procesa **localmente en tu navegador** — nada se sube a ningún servidor.

> Demo local en 5 segundos: haz doble clic en `index.html`.

---

## ✨ Qué incluye

- **30 motores visuales** organizados por categoría: Audio Reactive, Raymarching (SDF), Particle Systems, Mathematical (Chladni, Lissajous, phyllotaxis, reacción‑difusión), Museum Installation y VJ Performance.
- **Audio reactivo real**: análisis FFT multi‑banda (sub/bass/mid/high + RMS + detección de beat), micrófono en vivo o archivo MP3/WAV, y un **sintetizador Acid Techno generativo** integrado (130 BPM, kick + bassline 303 + hats) para demo instantánea sin cargar música.
- **Galería tipo museo**: tarjetas con metadatos (complejidad, coste GPU, banda recomendada, uso en set), búsqueda, filtros, favoritos y **preview en vivo al pasar el ratón**.
- **Modo Curator**: ficha museística por motor — intención artística, fundamento matemático, qué reacciona al sonido, al ratón y al clic.
- **Modo Performance**: UI ocultable, hotkeys, Auto‑VJ con caos paramétrico, blackout, captura PNG.
- **Presets**: guardar/cargar por motor (localStorage), export/import JSON, Looks rápidos (Mínimo / Suave / Intenso / Caos).
- **Rendimiento**: niveles de calidad (Eco→Ultra), pixel‑ratio adaptativo, auto‑downgrade si FPS < 30, controles táctiles y layout responsive para móvil.
- **Seguridad**: aviso de fotosensibilidad, modo "Reduce flashes", blackout de emergencia (tecla B o clic).

## ⌨ Atajos

| Tecla | Acción | Tecla | Acción |
|---|---|---|---|
| `Espacio` | Auto‑VJ on/off | `B` | Blackout (clic o B para salir) |
| `F` | Pantalla completa | `S` | Captura PNG |
| `H` | Ocultar/mostrar UI | `I` | Ficha curator |
| `G` | Galería | `R` | Randomize |
| `1–9` | Cambiar motor | `↑/↓` | Sensibilidad audio |

## 🚀 Ejecutar en local

- **Rápido:** doble clic en `index.html` (todo funciona salvo el micrófono).
- **Completo (con micrófono):** doble clic en `start.bat` (Windows) o `node server.mjs` → abre `http://localhost:5544`. El micrófono requiere HTTPS o `localhost` (regla del navegador).

## 🌐 Despliegue

Es 100 % estático: sirve `index.html` desde cualquier hosting (GitHub Pages, Netlify, Vercel, Cloudflare Pages). Con HTTPS el micrófono funciona también en el móvil.

## 📱 Móvil

Arranca en calidad Eco con panel colapsado; gestos táctiles: arrastrar = rotar/campo de fuerza, tocar = onda expansiva. Para usarlo con micrófono en el teléfono, sírvelo por HTTPS (GitHub Pages ya lo da).

## 🧠 Arquitectura (resumen técnico)

- `AudioFeatures`: FFT 512 → 6 bandas + RMS + beat envelope; alias retro‑compatible para los 30 shaders.
- Cada motor = `fxData[id]` (parámetros UI) + `engineMeta[id]` (ficha galería/curator) + `effects[id]()` (escena Three.js / shader). Sistema de `dispose` robusto al cambiar de motor (sin fugas GPU).
- Uniforms globales compartidos: `uTime, uBeat, uBass, uMid, uHigh, uRMS, uMouse, uMouseWorld, uClickPos, uClickPulse…`

## 🖋 Autoría y licencia

**© 2026 Abraham · AnomalIA OS · NEXUS Lab. Todos los derechos reservados.**
Código y dirección artística originales. Este repositorio se publica como pieza de portfolio; para uso comercial, licencias o colaboraciones (agencias, salas, festivales): contacto directo.

*Aviso: contiene efectos de luz intermitente. Incluye modo de reducción de flashes.*
