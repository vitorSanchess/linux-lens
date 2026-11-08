# Linux Lens 🔍

A blazingly fast, lightweight screen-to-translate pipeline for Linux desktop on Wayland (Niri, Hyprland, Sway).

## Features

- **Universal Auto-Detection**:
  - Automatically recognizes **Japanese (Kanji, Hiragana, Katakana)** alongside **all Latin-script languages** (English, Spanish, Portuguese, French, German, Italian, etc.) without requiring any flags.
  - Also supports vertical Japanese text (e.g. Manga, novels) via automatic fallback or `-l vert`.
- **Smart Bilingual Auto-Detection**:
  - Select English text ➔ Automatically translates to **Portuguese (`pt-BR`)**.
  - Select Japanese / Spanish / Portuguese / foreign text ➔ Automatically translates to **English (`en`)**.
- **No Hallucinations on Blank Areas**: Uses confidence score validation (TSV) and seamless background-sampled borders to discard noise, blank backgrounds, and wallpapers cleanly.
- **Unthrottled Translation**: Powered by the reliable Chrome translation API with automatic MyMemory fallback.
- **Friendly Language Codes**: Accepts standard 2-letter codes (`-l ja`, `-l es`, `-l pt`, `-l vert`) and automatically maps them.
- **Lossless & Crisp Capture**: Captures at **2x native scale** (`-s 2`) with **zero compression** (`-l 0`) straight from the compositor framebuffer for maximum OCR accuracy.
- **Direct Clipboard & Notification**: Automatically copies the translation to your Wayland clipboard (`wl-copy`) and displays a desktop notification (`notify-send`).

---

## Usage

```bash
# 1. Universal Smart Auto-Mode (No flags needed!)
# - English text -> Translated to Portuguese (pt-BR)
# - Japanese / Spanish / foreign text -> Translated to English (en)
lens-translate

# 2. Force target language to Portuguese
lens-translate -t pt

# 3. Vertical Japanese text (e.g. Manga)
lens-translate -l vert

# 4. Extract raw text only (OCR without translation)
lens-translate -o
```

---

## Niri Hotkey Setup

In `~/.config/niri/cfg/keybinds.kdl`:

```kdl
// Universal auto-translate selection to clipboard
Mod+Shift+T { spawn "lens-translate"; }

// Extract raw text only (OCR) to clipboard
Mod+Shift+O { spawn "lens-translate" "-o"; }
```
