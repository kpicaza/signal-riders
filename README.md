# 🎸 Signal Rider

Rhythm-ish 2D game made for **GitHub Game Off** (theme: **“Waves”**).

Premise: a heavy guitarist fires a sound wave that **travels across the screen**. You control the **signal** riding that wave and you must **stay inside the channel**. Later, that same signal will have to **hit buttons in time**.

> Minimal, two-tone, wave-based, made in Godot.

---

## Gameplay (so far)

1. The wave is born at the same Y position every time and grows smoothly.
2. The player signal is locked on X (hit line) and moves only on Y.
3. Each frame we check:
   - if the signal is **inside** the band → draw it **white**
   - if the signal is **outside** → draw it **red** and apply damage
4. When signal reaches 0 → **GAME OVER** → everything freezes.
5. On session start we **recenter** the signal on the wave so the player is not punished.

Even in this early state, the “stay-on-the-wave” loop already feels pretty addictive.

---

## Controls

- `Up / Down` → move the signal along the wave
- `Enter` / `Space` → start the run (from READY)
- (later) note buttons, tied to symbols on the wave

---

## Tech

- **Engine:** Godot 4.x
- **Tests:** GUT
- **Language:** GDScript
- **Target:** desktop / HTML5 (if time allows)

---

## How to run

```bash
git clone https://github.com/your-user/signal-rider.git
cd signal-rider
# open in Godot 4 and run Game.tscn
```

---

## How to run tests

1. Open the GUT test runner scene.
2. Run all tests.

Current tests cover:

- wave math (y at x)
- wave points generation
- wave band (top/center/bottom)
- progressive spawn (shape + thickness)
- player movement by input
- player inside/outside band
- clamp to band
- session lifecycle

---

## Jam goals

1. **Ship**.
2. Small, complete, closed loop.
3. **Original** take on “waves” (not tower defense, not “just audio visualizer”).
4. **Learn** (TDD in Godot, wave - gameplay, input vs. game state).

---

## Visual style

- Background: **black**
- Wave + signal: **white**
- Fail: **red**
- One guitarist on the side (later), strong silhouettes, maybe glow
- Everything should feel like an **oscilloscope for metal**

---

## License

MIT (tentative, for the jam)

---

## Credits

- Concept / code / tests: **Kpicaza**
- Made with love, step-by-step, TDD-first, for the GitHub Game Off
