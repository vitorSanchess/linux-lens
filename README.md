# Linux Lens 🔍

A blazingly fast, lightweight screen-to-translate pipeline for Linux desktop on Wayland (Niri, Hyprland, Sway).

## Features

- **Universal Auto-Detection**:
  - Automatically recognizes **Japanese (Kanji, Hiragana, Katakana)** alongside **all Latin-script languages** (English, Spanish, Portuguese, French, German, Italian, etc.) without requiring any flags.
  - Also supports vertical Japanese text (e.g. Manga, novels) via automatic fallback or `-l vert`.
- **Smart Bilingual Auto-Detection**:
  - Select English text ➔ Automatically translates to **Brazilian Portuguese (`pt-BR`)**.
  - Select Japanese / Spanish / Portuguese / foreign text ➔ Automatically translates to **English (`en`)**.
- **Paragraph Unwrapping & CJK Cleanup**:
  - Automatically strips artificial OCR spaces between Japanese characters and unwraps multi-line sentences so words aren't chopped mid-line before translation.
- **No Hallucinations on Blank Areas**: Uses confidence score validation (TSV) and seamless background-sampled borders to discard noise, blank backgrounds, and wallpapers cleanly.
- **Multi-Tier Translation Engine**:
  - **Keyless Default Chain**: Google Android NMT (`client=at&dj=1` neural model) ➔ Chromium Dict endpoint ➔ MyMemory Neural MT.
  - **Optional Pro Tier**: Set `GEMINI_API_KEY` (Gemini 2.5 Flash) or `DEEPL_API_KEY` (DeepL Free/Pro) for context-aware translations.
- **Lossless & Crisp Capture**: Captures at **2x native scale** (`-s 2`) with **zero compression** (`-l 0`) straight from the compositor framebuffer for maximum OCR accuracy.
- **Direct Clipboard & Notification**: Automatically copies the translation to your Wayland clipboard (`wl-copy`) and displays a desktop notification (`notify-send`).

---

## Usage

```bash
# 1. Universal Smart Auto-Mode (No flags needed!)
# - English text -> Translated to Brazilian Portuguese (pt-BR)
# - Japanese / Spanish / foreign text -> Translated to English (en)
lens-translate

# 2. Force target language to Brazilian Portuguese
lens-translate -t pt-BR

# 3. Vertical Japanese text (e.g. Manga)
lens-translate -l vert

# 4. Extract raw text only (OCR without translation)
lens-translate -o
```

### Optional: Higher-Quality AI / DeepL Translation (OS Keyring)

While the default pipeline requires **no API keys**, you can securely store a free Gemini or DeepL API key in your encrypted Linux OS keyring (`secret-tool` / `libsecret`):

```bash
# Option A: Save a free Google AI Studio key (Gemini Flash - best for Japanese/slang/context)
lens-translate --set-gemini-key

# Option B: Save a DeepL Free/Pro API key (500,000 chars/month free)
lens-translate --set-deepl-key
```
*(It will prompt you to paste your API key with hidden input so it never appears in your terminal history, and no plaintext config files are left on disk!)*

---

## Niri Hotkey Setup

In `~/.config/niri/cfg/keybinds.kdl`:

```kdl
// Universal auto-translate selection to clipboard
Mod+Shift+T { spawn "lens-translate"; }

// Extract raw text only (OCR) to clipboard
Mod+Shift+O { spawn "lens-translate" "-o"; }
```
